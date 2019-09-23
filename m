Return-Path: <Peiran.Hong@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3227E7DDCC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2019 17:53:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8NHqdDk003909
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 23 Sep 2019 10:53:00 -0700
Received: from [128.224.141.35] (128.224.141.35) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Mon, 23 Sep 2019 10:52:58 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20190923135727.11931-1-peiran.hong@windriver.com>
	<CAMKF1spyAAWTzE_ncPo2QEbYKdG3aHjwe8uAm8jae-EB_pxbkA@mail.gmail.com>
	<65fcc417-02d7-49e3-28e1-1748a3ec80a5@windriver.com>
	<CAMKF1sqy2q5qUnDR-JhvUdW==C3KUNvah8qBYCw2i8XsFznsRA@mail.gmail.com>
From: Peiran Hong <Peiran.Hong@windriver.com>
Message-ID: <9aa72021-e7ab-a255-0349-f7fae23bf0fc@windriver.com>
Date: Mon, 23 Sep 2019 13:52:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqy2q5qUnDR-JhvUdW==C3KUNvah8qBYCw2i8XsFznsRA@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] nmap: Update to 7.80
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Sep 2019 17:53:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

I double checked and the license file only had a date bump, the content 
of it did not change. I will email the commit with an edited commit message.

Thank you,

Peiran

On 2019-09-23 12:24 p.m., Khem Raj wrote:
>
>
> On Mon, Sep 23, 2019 at 8:59 AM Peiran Hong <Peiran.Hong@windriver.com 
> <mailto:Peiran.Hong@windriver.com>> wrote:
>
>     nmap 7.80 still cannot be compiled using clang tool-chain and the
>     original patch does not apply cleanly, so I created a new patch
>     that contains the following changes compared to the original patch:
>
>      1. nmap_error.cc: add line "#include <time.h>" => delete "#if
>         TIME_WITH_SYS_TIME...#endif" and add line"#include <time.h>".
>      2. nping/EchoServer.cc: add line "#include <time.h>" (same as
>         original patch).
>      3. osscan.cc: add line "#include <time.h>" => remove change since
>         this line is added in 7.80
>      4. osscan2.cc: add line "#include <time.h>" (same as original patch)
>      5. service_scan.cc: add line "#include <time.h>" (same as
>         original patch)
>
>
>
> Thanks that was not the question though it was mainly about license 
> checksum change it would be good to add a line or two in commit about 
> that
>
>     1.
>
>
>     Peiran
>
>     On 2019-09-23 11:18 a.m., Khem Raj wrote:
>>     On Mon, Sep 23, 2019 at 6:59 AM Peiran Hong<peiran.hong@windriver.com>  <mailto:peiran.hong@windriver.com>  wrote:
>>>     Updates nmap to v7.80, this solves the following CVEs:
>>>              - CVE-2017-18594
>>>              - CVE-2018-15173
>>>     and addressed numerous bugs as well.
>>>     The patch '0001-include-time.h-for-time-structure-definition.patch'
>>>     is modified to be applicable to the new version while serving for
>>>     the same purpose.
>>>
>>>     Signed-off-by: Peiran Hong<peiran.hong@windriver.com>  <mailto:peiran.hong@windriver.com>
>>>     ---
>>>       ....h-header-to-pass-clang-compilation.patch} | 59 +++++++++----------
>>>       .../nmap/{nmap_7.70.bb  <http://nmap_7.70.bb>  =>nmap_7.80.bb  <http://nmap_7.80.bb>}       |  8 +--
>>>       2 files changed, 31 insertions(+), 36 deletions(-)
>>>       rename meta-oe/recipes-security/nmap/files/{0001-include-time.h-for-time-structure-definition.patch => 0001-Include-time.h-header-to-pass-clang-compilation.patch} (52%)
>>>       rename meta-oe/recipes-security/nmap/{nmap_7.70.bb  <http://nmap_7.70.bb>  =>nmap_7.80.bb  <http://nmap_7.80.bb>} (85%)
>>>
>>>     diff --git a/meta-oe/recipes-security/nmap/files/0001-include-time.h-for-time-structure-definition.patch b/meta-oe/recipes-security/nmap/files/0001-Include-time.h-header-to-pass-clang-compilation.patch
>>>     similarity index 52%
>>>     rename from meta-oe/recipes-security/nmap/files/0001-include-time.h-for-time-structure-definition.patch
>>>     rename to meta-oe/recipes-security/nmap/files/0001-Include-time.h-header-to-pass-clang-compilation.patch
>>>     index 561c8c82c..f93af2d79 100644
>>>     --- a/meta-oe/recipes-security/nmap/files/0001-include-time.h-for-time-structure-definition.patch
>>>     +++ b/meta-oe/recipes-security/nmap/files/0001-Include-time.h-header-to-pass-clang-compilation.patch
>>>     @@ -1,35 +1,39 @@
>>>     -From c774f2b129fd5acd5647d92c57a2079ae638a62b Mon Sep 17 00:00:00 2001
>>>     -From: Khem Raj<raj.khem@gmail.com>  <mailto:raj.khem@gmail.com>
>>>     -Date: Sun, 20 Jan 2019 23:07:39 -0800
>>>     -Subject: [PATCH] include time.h for time structure definition
>>>     +From a068952a20880fc864e8cb8b49f8a6b143a5ac30 Mon Sep 17 00:00:00 2001
>>>     +From: Peiran Hong<peiran.hong@windriver.com>  <mailto:peiran.hong@windriver.com>
>>>     +Date: Fri, 20 Sep 2019 15:02:45 -0400
>>>     +Subject: [PATCH] Include time.h header to pass clang compilation
>>>
>>>     -Exposed by musl/clang
>>>     -
>>>     -Upstream-Status: Pending
>>>     -
>>>     -Signed-off-by: Khem Raj<raj.khem@gmail.com>  <mailto:raj.khem@gmail.com>
>>>       ---
>>>     - nmap_error.cc       | 1 +
>>>     - nping/EchoServer.cc | 1 +
>>>     - osscan.cc           | 1 +
>>>     - osscan2.cc          | 1 +
>>>     - service_scan.cc     | 1 +
>>>     - 5 files changed, 5 insertions(+)
>>>     + nmap_error.cc       | 11 +----------
>>>     + nping/EchoServer.cc |  1 +
>>>     + osscan2.cc          |  1 +
>>>     + service_scan.cc     |  1 +
>>>     + 4 files changed, 4 insertions(+), 10 deletions(-)
>>>
>>>       diff --git a/nmap_error.cc b/nmap_error.cc
>>>     -index 19beafb..ea14e08 100644
>>>     +index 588b13c33..254107ff5 100644
>>>       --- a/nmap_error.cc
>>>       +++ b/nmap_error.cc
>>>     -@@ -135,6 +135,7 @@
>>>     +@@ -135,16 +135,7 @@
>>>        #include "xml.h"
>>>
>>>        #include <errno.h>
>>>     +-#if TIME_WITH_SYS_TIME
>>>     +-# include <sys/time.h>
>>>     +-# include <time.h>
>>>     +-#else
>>>     +-# if HAVE_SYS_TIME_H
>>>     +-#  include <sys/time.h>
>>>     +-# else
>>>     +-#  include <time.h>
>>>     +-# endif
>>>     +-#endif
>>>       +#include <time.h>
>>>
>>>        extern NmapOps o;
>>>
>>>       diff --git a/nping/EchoServer.cc b/nping/EchoServer.cc
>>>     -index 70f39b0..40cd4d6 100644
>>>     +index ccdcf9c2d..c403aeda5 100644
>>>       --- a/nping/EchoServer.cc
>>>       +++ b/nping/EchoServer.cc
>>>       @@ -137,6 +137,7 @@
>>>     @@ -40,20 +44,8 @@ index 70f39b0..40cd4d6 100644
>>>
>>>        extern NpingOps o;
>>>        extern EchoServer es;
>>>     -diff --git a/osscan.cc b/osscan.cc
>>>     -index f851f60..6ae0c83 100644
>>>     ---- a/osscan.cc
>>>     -+++ b/osscan.cc
>>>     -@@ -149,6 +149,7 @@
>>>     - #  include <time.h>
>>>     - # endif
>>>     - #endif
>>>     -+#include <time.h>
>>>     -
>>>     - #include <algorithm>
>>>     - #include <list>
>>>       diff --git a/osscan2.cc b/osscan2.cc
>>>     -index e341947..887fbd2 100644
>>>     +index aa31feb12..89673e108 100644
>>>       --- a/osscan2.cc
>>>       +++ b/osscan2.cc
>>>       @@ -147,6 +147,7 @@
>>>     @@ -65,7 +57,7 @@ index e341947..887fbd2 100644
>>>        extern NmapOps o;
>>>        #ifdef WIN32
>>>       diff --git a/service_scan.cc b/service_scan.cc
>>>     -index 9780ae3..e07b940 100644
>>>     +index 57a92ed28..ef277bb1f 100644
>>>       --- a/service_scan.cc
>>>       +++ b/service_scan.cc
>>>       @@ -145,6 +145,7 @@
>>>     @@ -76,3 +68,6 @@ index 9780ae3..e07b940 100644
>>>
>>>        #if HAVE_OPENSSL
>>>        /* OpenSSL 1.0.0 needs _WINSOCKAPI_ to be defined, otherwise it loads
>>>     +--
>>>     +2.21.0
>>>     +
>>>     diff --git a/meta-oe/recipes-security/nmap/nmap_7.70.bb  <http://nmap_7.70.bb>  b/meta-oe/recipes-security/nmap/nmap_7.80.bb  <http://nmap_7.80.bb>
>>>     similarity index 85%
>>>     rename from meta-oe/recipes-security/nmap/nmap_7.70.bb  <http://nmap_7.70.bb>
>>>     rename to meta-oe/recipes-security/nmap/nmap_7.80.bb  <http://nmap_7.80.bb>
>>>     index b1b150a7d..f24194da7 100644
>>>     --- a/meta-oe/recipes-security/nmap/nmap_7.70.bb  <http://nmap_7.70.bb>
>>>     +++ b/meta-oe/recipes-security/nmap/nmap_7.80.bb  <http://nmap_7.80.bb>
>>>     @@ -3,17 +3,17 @@ DESCRIPTION = "Nmap ("Network Mapper") is a free and open source (license) utili
>>>       SECTION = "security"
>>>       LICENSE = "GPL-2.0"
>>>
>>>     -LIC_FILES_CHKSUM ="file://COPYING;beginline=7;endline=12;md5=1489288f46af415fadc4e8b6345ab9f4"
>>>     +LIC_FILES_CHKSUM ="file://COPYING;beginline=7;endline=12;md5=66938a7e5b4c118eda78271de14874c2"
>>>
>>     what changed here?
>>
>>>       SRC_URI ="http://nmap.org/dist/${BP}.tar.bz2 \
>>>     file://nmap-redefine-the-python-library-dir.patch \
>>>     file://nmap-replace-shtool-mkdir-with-coreutils-mkdir-command.patch
>>>     \ -
>>>     file://0001-include-time.h-for-time-structure-definition.patch \
>>>     +
>>>     file://0001-Include-time.h-header-to-pass-clang-compilation.patch
>>>     \ file://0002-Fix-building-with-libc.patch \ "  <http://nmap.org/dist/$%7BBP%7D.tar.bz2%5Cfile://nmap-redefine-the-python-library-dir.patch%5Cfile://nmap-replace-shtool-mkdir-with-coreutils-mkdir-command.patch%5C-file://0001-include-time.h-for-time-structure-definition.patch%5C+file://0001-Include-time.h-header-to-pass-clang-compilation.patch%5Cfile://0002-Fix-building-with-libc.patch%5C>
>>>
>>>     -SRC_URI[md5sum] = "84eb6fbe788e0d4918c2b1e39421bf79"
>>>     -SRC_URI[sha256sum] = "847b068955f792f4cc247593aca6dc3dc4aae12976169873247488de147a6e18"
>>>     +SRC_URI[md5sum] = "d37b75b06d1d40f27b76d60db420a1f5"
>>>     +SRC_URI[sha256sum] = "fcfa5a0e42099e12e4bf7a68ebe6fde05553383a682e816a7ec9256ab4773faa"
>>>
>>>       inherit autotools-brokensep pkgconfig pythonnative
>>>
>>>     --
>>>     2.21.0
>>>

