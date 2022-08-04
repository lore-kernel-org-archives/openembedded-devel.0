Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6443C19F2A
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 15:35:05 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.6276.1659627295674434421
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Aug 2022 08:34:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18,
 mailfrom: f_l_k@t-online.de)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout04.t-online.de (Postfix) with SMTP id 7E759373F
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  4 Aug 2022 17:34:53 +0200 (CEST)
Received: from flk-MS-7C91.. ([84.163.47.58]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oJcs7-3opVYX0; Thu, 4 Aug 2022 17:34:51 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH] spdlog: update to v1.10.0
Date: Thu,  4 Aug 2022 17:34:38 +0200
Message-Id: <20220804153438.10517-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1659627291-01453B16-F9804C7D/0/0 CLEAN NORMAL
X-TOI-MSGID: da2d26a0-aab3-46c8-ba23-81a3320632a6
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Aug 2022 15:35:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98132

Bump fmt to version 8.1.1.
Added file event handlers #2165, #2169 Thanks @seker.
You can get callbacks from spdlog before/after log file has been opened o=
r closed.
This is useful for cleanup procedures or for adding something to the star=
t/end of the log files. Example:
  void file_events_example()
  {
    // pass the spdlog::file_event_handlers to file sinks for open/close =
log file notifications
    spdlog::file_event_handlers handlers;
    handlers.before_open =3D [](spdlog::filename_t filename) { spdlog::in=
fo("Before opening {}", filename); };
    handlers.after_open =3D [](spdlog::filename_t filename, std::FILE *fs=
tream) { fputs("After opening\n", fstream); };
    handlers.before_close =3D [](spdlog::filename_t filename, std::FILE *=
fstream) { fputs("Before closing\n", fstream); };
    handlers.after_close =3D [](spdlog::filename_t filename) { spdlog::in=
fo("After closing {}", filename); };
    auto my_logger =3D spdlog::basic_logger_st("some_logger", "logs/event=
s-sample.txt", true, handlers);
  }
Fixed rotating file sink: when disk is full log rotation resulted zero si=
ze log files. #2261. (thanks @kishorekrd for reporting).
Added new udp_sink #2090. Thanks @CJLove
(Experimental) Option to depend on std::format instead of fmtlib (set SPD=
LOG_USE_STD_FORMAT and use C++20). #2170 Thanks @sylveon .
Improved file name for hourly file sink #2047. Thanks @seker .
Added code location information for error handler #2048. Thanks @D-r-P-3-=
p-p-3-r .
Fixed qt_sinks ctor #2056. Thanks @mguludag .
List Debian instructions in the README #2057. Thanks @mr-c ,
Updated to latest Travis CI Build Status #2094. Thanks @jspraul .
Fixed unhandled errors in udp sink. #2096. Thanks @mmarkeloff .
CMake improvement regarding cmake_minimum_required and policy. #2098. Tha=
nks @reddwarf69 .
Fixed mongo_sink compile in older gcc versions #2102 . Thanks @yzz-ihep .
Remove mutable keyword from mutex_ member in of sinks. #2140 . Thanks @su=
nlong169 .
Fix typos #2171. Thanks @rex4539 .
Fixed udp sink build on FreeBSD #2172. Thanks @keith-dev .
Avoid c-style casting in stdout sinks. #2179. Thanks @ibmibmibm .
Fixed tweakme.h compile error under msvcs when SPDLOG_FUNCTION is defined=
 #2182. Thanks @Light3039 .
Fixed compiling errors on AIX #2181. Thanks @lisr .
Fixed runtime when build with -fsanitize=3Dcfi #1972. Thanks @bansan85 .
Remove extraneous semicolon #2190. Thanks @sylveon.
Added example how to replace default logger. #2194. Thanks @rioki .
Fixed usage of ranges and to_hex in the same compile unit #2195. Thanks @=
patrickroocks .
Reduce warnings with pedantic compiler -Wuseless-cast #2216. Thanks @vnep=
ogodin .
Support using std::span in to_hex #2228. Thanks @timblechmann .
Reset current size if rotated files on open #2234. Thanks @SpriteOvO .
Allow forward-declaration of level_enum #2245. Thanks @daverigby .
Call localtime() only if pattern_formatter really needs it #2246. Thanks =
@doug1234 .
Removed unneeded spaces from code. #2249. Thanks @PixelParas .
Added a few missing files/directories to the gitignore #2255. Thanks @Leo=
nBrands .
Fixed issue #2201 (Pattern width is not applied for missing source inform=
ation). #2269. Thanks @kyuheon-kr .
Limit max number of rotating files to 200000. (Fixed #1905). Thanks @surf=
ycui (#2273)
pattern_formatter: fix reorder-ctor warning #2278. Thanks @adriweb .
Fixed spdlogConfig.cmake when built with SPDLOG_FMT_EXTERNAL_HO #2300. Th=
anks @adamcalhoon .
Fixed fopen_s(..) error handling when PREVENT_CHILD_FD is defined #2305. =
Thanks @nUl1.
Fixed compiler error when building on Windows with #define UNICODE #2317.=
 Thanks @risa2000 .
Added option to enable formatting of systemd sink #2324, #2320. Thanks @D=
elgan .
Added optional "ident" argument to systemd sink constructor #2328. Thanks=
 @Delgan .
Special thanks to @tt4g for his support in answering community questions =
and issues.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...1-Enable-use-of-external-fmt-library.patch | 68 -------------------
 .../{spdlog_1.9.2.bb =3D> spdlog_1.10.0.bb}     |  5 +-
 2 files changed, 2 insertions(+), 71 deletions(-)
 delete mode 100644 meta-oe/recipes-support/spdlog/files/0001-Enable-use-=
of-external-fmt-library.patch
 rename meta-oe/recipes-support/spdlog/{spdlog_1.9.2.bb =3D> spdlog_1.10.=
0.bb} (82%)

diff --git a/meta-oe/recipes-support/spdlog/files/0001-Enable-use-of-exte=
rnal-fmt-library.patch b/meta-oe/recipes-support/spdlog/files/0001-Enable=
-use-of-external-fmt-library.patch
deleted file mode 100644
index 98c342fec..000000000
--- a/meta-oe/recipes-support/spdlog/files/0001-Enable-use-of-external-fm=
t-library.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-Author: Nilesh Patra <npatra974@gmail.com>
-Description: Use external libfmt by default
-Last-Changed: Sun, May, 14 2020
-Forwarded: not-needed
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -87,7 +87,7 @@ option(SPDLOG_BUILD_WARNINGS "Enable com
-=20
- # install options
- option(SPDLOG_INSTALL "Generate the install target" ${SPDLOG_MASTER_PRO=
JECT})
--option(SPDLOG_FMT_EXTERNAL "Use external fmt library instead of bundled=
" OFF)
-+option(SPDLOG_FMT_EXTERNAL "Use external fmt library instead of bundled=
" ON)
- option(SPDLOG_FMT_EXTERNAL_HO "Use external fmt header-only library ins=
tead of bundled" OFF)
- option(SPDLOG_NO_EXCEPTIONS "Compile with -fno-exceptions. Call abort()=
 on any spdlog exceptions" OFF)
-=20
---- a/include/spdlog/tweakme.h
-+++ b/include/spdlog/tweakme.h
-@@ -71,7 +71,7 @@
- // In this case spdlog will try to include <fmt/format.h> so set your -=
I flag
- // accordingly.
- //
--// #define SPDLOG_FMT_EXTERNAL
-+#define SPDLOG_FMT_EXTERNAL 1
- ///////////////////////////////////////////////////////////////////////=
////////
-=20
- ///////////////////////////////////////////////////////////////////////=
////////
---- a/include/spdlog/fmt/bin_to_hex.h
-+++ b/include/spdlog/fmt/bin_to_hex.h
-@@ -5,6 +5,7 @@
-=20
- #pragma once
-=20
-+#include <spdlog/tweakme.h>
- #include <cctype>
- #include <spdlog/common.h>
-=20
---- a/include/spdlog/fmt/fmt.h
-+++ b/include/spdlog/fmt/fmt.h
-@@ -4,7 +4,7 @@
- //
-=20
- #pragma once
--
-+#include <spdlog/tweakme.h>
- //
- // Include a bundled header-only copy of fmtlib or an external one.
- // By default spdlog include its own copy.
---- a/include/spdlog/fmt/ostr.h
-+++ b/include/spdlog/fmt/ostr.h
-@@ -7,7 +7,7 @@
- //
- // include bundled or external copy of fmtlib's ostream support
- //
--
-+#include <spdlog/tweakme.h>
- #if !defined(SPDLOG_FMT_EXTERNAL)
- #    ifdef SPDLOG_HEADER_ONLY
- #        ifndef FMT_HEADER_ONLY
---- a/src/fmt.cpp
-+++ b/src/fmt.cpp
-@@ -6,6 +6,7 @@
- #    error Please define SPDLOG_COMPILED_LIB to compile this file.
- #endif
-=20
-+#include <spdlog/tweakme.h>
- #if !defined(SPDLOG_FMT_EXTERNAL)
- #    include <spdlog/fmt/bundled/format-inl.h>
-=20
diff --git a/meta-oe/recipes-support/spdlog/spdlog_1.9.2.bb b/meta-oe/rec=
ipes-support/spdlog/spdlog_1.10.0.bb
similarity index 82%
rename from meta-oe/recipes-support/spdlog/spdlog_1.9.2.bb
rename to meta-oe/recipes-support/spdlog/spdlog_1.10.0.bb
index d377241ad..d36cfcb84 100644
--- a/meta-oe/recipes-support/spdlog/spdlog_1.9.2.bb
+++ b/meta-oe/recipes-support/spdlog/spdlog_1.10.0.bb
@@ -3,9 +3,8 @@ HOMEPAGE =3D "https://github.com/gabime/spdlog/wiki"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/MIT;=
md5=3D0835ade698e0bcf8506ecda2f7b4f302"
=20
-SRCREV =3D "eb3220622e73a4889eee355ffa37972b3cac3df5"
-SRC_URI =3D "git://github.com/gabime/spdlog.git;protocol=3Dhttps;branch=3D=
v1.x; \
-           file://0001-Enable-use-of-external-fmt-library.patch"
+SRCREV =3D "76fb40d95455f249bd70824ecfcae7a8f0930fa3"
+SRC_URI =3D "git://github.com/gabime/spdlog.git;protocol=3Dhttps;branch=3D=
v1.x"
=20
 DEPENDS +=3D "fmt"
=20
--=20
2.34.1


