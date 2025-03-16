Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AD60C35FF1
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 22:55:15 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.39876.1742165706560558333
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Mar 2025 15:55:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=iCpV2LdL;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20250316225504f49f3594a06d025020-q4nq07@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20250316225504f49f3594a06d025020
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 16 Mar 2025 23:55:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=JJsiltVDdhG2/Zc0AzzXE2VloZ6NuUtl4a6tV0w+/ik=;
 b=iCpV2LdLK8pfHWCVdqT2eXCxYKgp4aEZjxieOMXwqZllfx6YMRRAEmvW8W9Auiz3tafn0y
 /JwBtpkm/W1boQNgAgkriXiqYoNPS9y9HazlEqn/bbXlR1aReFt/QFKVapkzGHXwppl+XaQL
 0eYORoGUxgtSFUwmBJH2Xn3Un7QtPpSEPuC/5hw7j76lVZncZ2A6oeURP7oEfm3i3I6QYE4G
 mul28o7uFO3qHsJ98mneFB858iFlOGp/UCGdmrrzLNPQc4spniu1jj0ZfoCGUYQcWi8WBpRV
 hAJv2GgXOrGaVKQ0b4Hw1j/uXXGaFpnvSqZ33U4aMZ6VqJhfD3TW4Neg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-multimedia][PATCH 03/12] sox: update to latest git hash
Date: Sun, 16 Mar 2025 23:53:49 +0100
Message-Id: <20250316225358.2816208-3-peter.marko@siemens.com>
In-Reply-To: <20250316225358.2816208-1-peter.marko@siemens.com>
References: <20250316225358.2816208-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Mar 2025 22:55:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116008

From: Peter Marko <peter.marko@siemens.com>

Resolve many CVEs and other bugs.

$ git describe --tags
sox-14.4.2-184-gf3094754
$ git log -1 HEAD | grep Date:
Date:   Thu May 30 14:46:01 2024 +0100

Recipe changes:
* removed 0001-Update-exported-symbol-list.patch
  this commit is included now
* refreshed 0001-remove-the-error-line-and-live-without-file-type-det.patch
* 0001-tests-Include-math.h-for-fabs-definition.patch
  affected file was deleted from sources
* added autoconf-archive-native dependency
  for newly used AX_APPEND_COMPILE_FLAGS macro
* changed some config options from with/without to enable/disable
  https://sourceforge.net/p/sox/code/ci/6ff0e9322f9891f5a6ac6c9b3bceffbfca16bec3/
* added +git to PV to indicate version not on hash

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../0001-Update-exported-symbol-list.patch    | 34 -------------------
 ...-line-and-live-without-file-type-det.patch |  2 +-
 ...s-Include-math.h-for-fabs-definition.patch | 33 ------------------
 .../recipes-multimedia/sox/sox_14.4.2.bb      | 26 +++++++-------
 4 files changed, 14 insertions(+), 81 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/sox/sox/0001-Update-exported-symbol-list.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/sox/sox/0001-tests-Include-math.h-for-fabs-definition.patch

diff --git a/meta-multimedia/recipes-multimedia/sox/sox/0001-Update-exported-symbol-list.patch b/meta-multimedia/recipes-multimedia/sox/sox/0001-Update-exported-symbol-list.patch
deleted file mode 100644
index 44c6b19be0..0000000000
--- a/meta-multimedia/recipes-multimedia/sox/sox/0001-Update-exported-symbol-list.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From b1809d82031aa7c5bcaad58bcb4b59e082e0446e Mon Sep 17 00:00:00 2001
-From: Mans Rullgard <mans@mansr.com>
-Date: Sun, 5 Nov 2017 15:40:16 +0000
-Subject: [PATCH] Update exported symbol list
-
-commit 5c58413544 ("Don't export (most) internal libsox symbols")
-breaks dynamic flac builds as flac.c references lsx.error, so add it
-to the list of exceptions.
-
-| .libs/flac.o: In function `decoder_read_callback':
-| /usr/src/debug/sox/14.4.2-r0/sox-14.4.2/src/flac.c:63: undefined reference to `lsx_error'
-
-Upstream-Status: Backport [https://bogomips.org/sox.git ("pu" branch)]
-
----
- src/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 7cceaafd..a3a04ed1 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -95,7 +95,7 @@ libsox_la_LIBADD += @GOMP_LIBS@
- 
- libsox_la_CFLAGS = @WARN_CFLAGS@
- libsox_la_LDFLAGS = @APP_LDFLAGS@ -version-info @SHLIB_VERSION@ \
--  -export-symbols-regex '^(sox_.*|lsx_(check_read_params|(close|open)_dllibrary|(debug(_more|_most)?|fail|report|warn)_impl|eof|fail_errno|filelength|find_(enum_(text|value)|file_extension)|getopt(_init)?|lpc10_(create_(de|en)coder_state|(de|en)code)|raw(read|write)|read(_b_buf|buf|chars)|realloc|rewind|seeki|sigfigs3p?|strcasecmp|tell|unreadb|write(b|_b_buf|buf|s)))$$'
-+  -export-symbols-regex '^(sox_.*|lsx_(([cm]|re)alloc|check_read_params|(close|open)_dllibrary|(debug(_more|_most)?|fail|report|warn)_impl|eof|error|fail_errno|filelength|find_(enum_(text|value)|file_extension)|flush|getopt(_init)?|id3_read_tag|lpc10_(create_(de|en)coder_state|(de|en)code)|raw(read|write)|read(_b_buf|buf|chars)|rewind|seeki|sigfigs3p?|strcasecmp|strdup|tell|unreadb|write(b|_b_buf|buf|s)))$$'
- 
- if HAVE_WIN32_LTDL
-   libsox_la_SOURCES += win32-ltdl.c win32-ltdl.h
--- 
-2.16.2
-
diff --git a/meta-multimedia/recipes-multimedia/sox/sox/0001-remove-the-error-line-and-live-without-file-type-det.patch b/meta-multimedia/recipes-multimedia/sox/sox/0001-remove-the-error-line-and-live-without-file-type-det.patch
index 3085bd495c..15c429e515 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox/0001-remove-the-error-line-and-live-without-file-type-det.patch
+++ b/meta-multimedia/recipes-multimedia/sox/sox/0001-remove-the-error-line-and-live-without-file-type-det.patch
@@ -15,7 +15,7 @@ diff --git a/src/formats.c b/src/formats.c
 index 724a4cda..f683a922 100644
 --- a/src/formats.c
 +++ b/src/formats.c
-@@ -422,7 +422,6 @@ static void UNUSED rewind_pipe(FILE * fp)
+@@ -477,7 +477,6 @@ static void UNUSED rewind_pipe(FILE * fp)
    /* To fix this #error, either simply remove the #error line and live without
     * file-type detection with pipes, or add support for your compiler in the
     * lines above.  Test with cat monkey.wav | ./sox --info - */
diff --git a/meta-multimedia/recipes-multimedia/sox/sox/0001-tests-Include-math.h-for-fabs-definition.patch b/meta-multimedia/recipes-multimedia/sox/sox/0001-tests-Include-math.h-for-fabs-definition.patch
deleted file mode 100644
index 5f9135a0ee..0000000000
--- a/meta-multimedia/recipes-multimedia/sox/sox/0001-tests-Include-math.h-for-fabs-definition.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From afe336ab63ff9b64ef759255de6b03b897dc4453 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 19 May 2024 09:09:46 -0700
-Subject: [PATCH] tests: Include math.h for fabs() definition
-
-Fixes build with gcc-14
-
-../../sox-14.4.2/src/sox_sample_test.h:190:3: error: implicit declaration of function 'fabs' [-Wimplicit-function-declaration]
-  190 |   assert(fabs(d - 1) < 1e-9 && clips == 0);
-      |   ^~~~~~
-      ../../sox-14.4.2/src/sox_sample_test.h:23:1: note: include '<math.h>' or provide a declaration of 'fabs'
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/sox_sample_test.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/sox_sample_test.h b/src/sox_sample_test.h
-index 62b55e4..17f0069 100644
---- a/src/sox_sample_test.h
-+++ b/src/sox_sample_test.h
-@@ -19,6 +19,7 @@
- #undef NDEBUG /* Must undef above assert.h or other that might include it. */
- #endif
- #include <assert.h>
-+#include <math.h>
- #include "sox.h"
- 
- #define TEST_UINT(bits) \
--- 
-2.45.1
-
diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
index 48dba45420..e3c228858c 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
@@ -4,24 +4,24 @@ and can apply different effects and filters to the audio data."
 HOMEPAGE = "http://sox.sourceforge.net"
 SECTION = "audio"
 
-DEPENDS = "libpng libsndfile1 libtool"
+DEPENDS = "autoconf-archive-native libpng libsndfile1 libtool"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'alsa pulseaudio', d)} \
                    magic \
 "
-PACKAGECONFIG[pulseaudio] = "--with-pulseaudio=dyn,--with-pulseaudio=no,pulseaudio,"
-PACKAGECONFIG[alsa] = "--with-alsa=dyn,--with-alsa=no,alsa-lib,"
-PACKAGECONFIG[wavpack] = "--with-wavpack=dyn,--with-wavpack=no,wavpack,"
-PACKAGECONFIG[flac] = "--with-flac=dyn,--with-flac=no,flac,"
-PACKAGECONFIG[amrwb] = "--with-amrwb=dyn,--with-amrwb=no,opencore-amr,"
-PACKAGECONFIG[amrnb] = "--with-amrnb=dyn,--with-amrnb=no,opencore-amr,"
-PACKAGECONFIG[oggvorbis] = "--with-oggvorbis=dyn,--with-oggvorbis=no,libvorbis"
-PACKAGECONFIG[opus] = "--with-opus=dyn,--with-opus=no,opusfile"
+PACKAGECONFIG[pulseaudio] = "--enable-pulseaudio=dyn,--disable-pulseaudio,pulseaudio,"
+PACKAGECONFIG[alsa] = "--enable-alsa=dyn,--disable-alsa,alsa-lib,"
+PACKAGECONFIG[wavpack] = "--enable-wavpack=dyn,--disable-wavpack,wavpack,"
+PACKAGECONFIG[flac] = "--enable-flac=dyn,--disable-flac,flac,"
+PACKAGECONFIG[amrwb] = "--enable-amrwb=dyn,--disable-amrwb,opencore-amr,"
+PACKAGECONFIG[amrnb] = "--enable-amrnb=dyn,--disable-amrnb,opencore-amr,"
+PACKAGECONFIG[oggvorbis] = "--enable-oggvorbis=dyn,--disable-oggvorbis,libvorbis"
+PACKAGECONFIG[opus] = "--enable-opus=dyn,--disable-opus,opusfile"
 PACKAGECONFIG[magic] = "--with-magic,--without-magic,file,"
 PACKAGECONFIG[mad] = "--with-mad,--without-mad,libmad,"
 PACKAGECONFIG[id3tag] = "--with-id3tag,--without-id3tag,libid3tag,"
 PACKAGECONFIG[lame] = "--with-lame,--without-lame,lame,"
-PACKAGECONFIG[ao] = "--with-ao,--without-ao,libao,"
+PACKAGECONFIG[ao] = "--enable-ao,--disable-ao,libao,"
 
 LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=751419260aa954499f7abaabaa882bbe \
@@ -29,11 +29,11 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=751419260aa954499f7abaabaa882bbe \
 
 SRC_URI = "git://git.code.sf.net/p/sox/code;protocol=https;branch=master \
            file://0001-remove-the-error-line-and-live-without-file-type-det.patch \
-           file://0001-Update-exported-symbol-list.patch \
-           file://0001-tests-Include-math.h-for-fabs-definition.patch \
            "
 
-SRCREV = "45b161d73ec087a8e003747b1aed07cd33589bca"
+# last release was in 2015, use latest hash from 2024-05-30
+PV .= "+git"
+SRCREV = "f3094754a7c2a7e55c35621d20fa9945736e72df"
 S = "${WORKDIR}/git"
 
 CVE_PRODUCT:append = " libsox_project:libsox sound_exchange_project:sound_exchange"

