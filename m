Return-Path: <patrick.wicki@subset.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A62DBD116F6
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 20:50:51 +0000 (UTC)
Received: from outbound.ms.icloud.com (outbound.ms.icloud.com [57.103.72.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3701.1764363043870130094
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Nov 2025 12:50:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@subset.ch header.s=sig1 header.b=gqde2UVJ;
 spf=pass (domain: subset.ch, ip: 57.103.72.53, mailfrom: patrick@subset.ch)
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-10 (Postfix) with ESMTPS id 88A6B1800C10;
	Fri, 28 Nov 2025 20:50:41 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=subset.ch; s=sig1; bh=sesklxJwC+Fg2Iyc8J+i+B93TPNfLyP3uK6MIa/j19k=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=gqde2UVJmr6JR5B13HByZnWyXMI3NTf8V7rjSHBUlFqQmZ2psYl+Wle9/VUIX1ikkrDuADQAbiPhKRgKJwchuTza8Jlv0LyE6wAoizfDCrVzS0eWovaaomOep4QjfanEGTO9ayHDuQ7NMMw3zpweR8Hm89Zz52rybsadRagyn4qDWLDXZU+x420Nk5tbKqt0UDZbH6jgbx10ue81lDCOVxU3fZDmeyklwk547J005F3/RrAgwnptrIhjKNDb+o5xnzA+G7FtNvQyX3KhIq0R5Kazz8IveVdvakqiHUEIILr882kCKGEzofd7twN22B49ocrJfUmfVFU0VcjdYf1gFA==
mail-alias-created-date: 1663698038540
Received: from desk (unknown [17.57.154.37])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-10 (Postfix) with ESMTPSA id 51ECF180073F;
	Fri, 28 Nov 2025 20:50:40 +0000 (UTC)
From: patrick@subset.ch
To: openembedded-devel@lists.openembedded.org
Cc: Patrick Wicki <patrick.wicki@siemens.com>
Subject: [meta-oe][PATCH 1/2] fluentbit: upgrade 4.0.1 -> 4.2.0
Date: Fri, 28 Nov 2025 21:48:25 +0100
Message-ID: <20251128204827.3553598-1-patrick@subset.ch>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Proofpoint-GUID: cXgT5_Zks9DeSIzIju40HPqVxNOXrLyM
X-Authority-Info: v=2.4 cv=ZfgQ98VA c=1 sm=1 tr=0 ts=692a0b21 cx=c_apl:c_pps
 a=qkKslKyYc0ctBTeLUVfTFg==:117 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0Koq7nDUAAAA:8 a=NEAV23lmAAAA:8 a=a_U1oVfrAAAA:8 a=eWRtdWc1AAAA:8
 a=pGLkceISAAAA:8 a=sDQfg1BAaZ_RV_yEpr4A:9 a=QdywUjFo55fTaeivifS-:22
 a=fQEa9puXOWAy-YWvlEz7:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDE1NCBTYWx0ZWRfX35YjFBAGW4mM
 6CT8ijU6et0PgJBXpUTcvJYOyVGQ11om5/OPMi9X00KVBUVwIZqhBl2k0rca7ppT9+JNlAQaKpt
 uWrANyz6xARKPb8Kq1zbYINrSy1a0Y7uRB1mVSn6DWsxfJRBRjjyxkP+7b8dmbb4yPHq88NlICX
 J8k9/o2xRK280s90qdZheia2tFIE6Bi6/rcCZWXESJjBUTJWxKgPHMz8b1AO7gdio8iSm55Qbu0
 56yjPb+y1I7lck6xfu8BT4DhL6UNdkiq8SV3cQJzvQAzF0RyMVRztWJHyE8wrAIOsex2Ffx7N/J
 49oETGswFwzEsHpnhVQ
X-Proofpoint-ORIG-GUID: cXgT5_Zks9DeSIzIju40HPqVxNOXrLyM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 clxscore=1030 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511280154
X-JNJ: AAAAAAAB4mNDUsGxhphP3lOCZMbAtDIBCvKLygzNFGyX9OptD2ai4+U2vl6A28oKwj+US9xA6qMsbsicIhKT0dthYTeYlhTkaWYhpxsVoC7ZgASHUwtDf4ynMw00NrKxKvZ5UscJKGmJriyiWoOauVGbuMvLQpq6Ekyf5a9npuHiP6yR/uHa2J0cgmxHQ0nNSd7pkEv6QkbY22HJM4zi0tUaiDNdzulR2QYj8ikJG9ZHiY2RBX+quG13g4rmxoaHtVs4FyFA7RvqWwCgFwa9V7GQwQ2m/IDYezzFr1xWtlcW9T3sww+jnmsZ8DY4FjcL85XWzNBzlSi0LVVGqzfHK7UUPf1JVDJemxEMVSKATiq6OwVPWKTYQ34NxATzuyEpKLuvFq+M/7tdAV0HsfvloTAJW/fPhkVSJZgTMw5YYVSyNLn3v4fi6spcHIPfmiLdFmC6ISJM08w4C+htv2/vvRlZbOJRZeZILYnzmCTxD4/Wd1m4fle2GYV+gbjZq/mWNYJIw9ItRM9Iqjb59CpP7dXj67QlCtqK/OQOcYhd3Wc2cQ/RPVuj8lj0XDNiVAG6hShwSO6Q2P0P0cPFb6sNEmt/cs12BAsvrNVojhpZWtc7SEoe/vjjctM=
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 20:50:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122152

From: Patrick Wicki <patrick.wicki@siemens.com>

Refresh patches and drop one for musl which is no longer required.

Release notes:
- https://fluentbit.io/announcements/v4.1.0/
- https://fluentbit.io/announcements/v4.2.0/

This addresses CVE-2025-12977.

Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
---
 ...rivate-makefile-targets-in-CMakelist.patch | 14 +++++++--
 ...-not-hardcode-compilation-directorie.patch |  8 +++--
 ...ts.txt-Revise-init-manager-deduction.patch |  8 +++--
 ...nkio-Link-with-fts-library-with-musl.patch |  7 +++--
 .../0005-Use-posix-strerror_r-with-musl.patch | 31 -------------------
 ...{fluentbit_4.0.1.bb =3D> fluentbit_4.2.0.bb} |  3 +-
 6 files changed, 26 insertions(+), 45 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0005-Use=
-posix-strerror_r-with-musl.patch
 rename meta-oe/recipes-extended/fluentbit/{fluentbit_4.0.1.bb =3D> fluen=
tbit_4.2.0.bb} (98%)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-lib-Do-not=
-use-private-makefile-targets-in-CMakelist.patch b/meta-oe/recipes-extend=
ed/fluentbit/fluentbit/0001-lib-Do-not-use-private-makefile-targets-in-CM=
akelist.patch
index 32f4fdec51..1756d74560 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-lib-Do-not-use-pr=
ivate-makefile-targets-in-CMakelist.patch
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-lib-Do-not-use-pr=
ivate-makefile-targets-in-CMakelist.patch
@@ -1,4 +1,4 @@
-From 7e6295f14ea057562a235fbf6762d867e739a181 Mon Sep 17 00:00:00 2001
+From 4b47a8f0e3d1d429356cdda8efa7682ab88d344a Mon Sep 17 00:00:00 2001
 From: Niko Mauno <niko.mauno@vaisala.com>
 Date: Sun, 29 Sep 2024 12:00:00 +0000
 Subject: [PATCH] lib: Do not use private makefile targets in CMakelists.=
txt
@@ -28,6 +28,8 @@ Upstream-Status: Submitted [https://github.com/fluent/f=
luent-bit/pull/9450]
  lib/monkey/CMakeLists.txt   | 4 +---
  4 files changed, 7 insertions(+), 21 deletions(-)
=20
+diff --git a/lib/cfl/CMakeLists.txt b/lib/cfl/CMakeLists.txt
+index 489570026..06d99cbbe 100644
 --- a/lib/cfl/CMakeLists.txt
 +++ b/lib/cfl/CMakeLists.txt
 @@ -40,12 +40,8 @@ if(NOT MSVC)
@@ -45,6 +47,8 @@ Upstream-Status: Submitted [https://github.com/fluent/f=
luent-bit/pull/9450]
 =20
 =20
 =20
+diff --git a/lib/cmetrics/CMakeLists.txt b/lib/cmetrics/CMakeLists.txt
+index 5421f8c80..0dcf7645c 100644
 --- a/lib/cmetrics/CMakeLists.txt
 +++ b/lib/cmetrics/CMakeLists.txt
 @@ -60,12 +60,8 @@ if(NOT MSVC)
@@ -61,11 +65,13 @@ Upstream-Status: Submitted [https://github.com/fluent=
/fluent-bit/pull/9450]
 +set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__CMT_FILENAME__=3D__FILE__")
 =20
  # Configuration options
- option(CMT_DEV                       "Enable development mode"         =
          No)
+ option(CMT_DEV                       "Enable development mode"         =
           No)
+diff --git a/lib/ctraces/CMakeLists.txt b/lib/ctraces/CMakeLists.txt
+index 73723433d..9f60699d5 100644
 --- a/lib/ctraces/CMakeLists.txt
 +++ b/lib/ctraces/CMakeLists.txt
 @@ -30,12 +30,8 @@ set(CTR_VERSION_MINOR  6)
- set(CTR_VERSION_PATCH  4)
+ set(CTR_VERSION_PATCH  6)
  set(CTR_VERSION_STR "${CTR_VERSION_MAJOR}.${CTR_VERSION_MINOR}.${CTR_VE=
RSION_PATCH}")
 =20
 -# Define __FILENAME__ consistently across Operating Systems
@@ -79,6 +85,8 @@ Upstream-Status: Submitted [https://github.com/fluent/f=
luent-bit/pull/9450]
 =20
  # Configuration options
  option(CTR_DEV             "Enable development mode"                   =
No)
+diff --git a/lib/monkey/CMakeLists.txt b/lib/monkey/CMakeLists.txt
+index 3fbace595..1c6ad031c 100644
 --- a/lib/monkey/CMakeLists.txt
 +++ b/lib/monkey/CMakeLists.txt
 @@ -15,10 +15,8 @@ include(GNUInstallDirs)
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-flb_info.h=
.in-Do-not-hardcode-compilation-directorie.patch b/meta-oe/recipes-extend=
ed/fluentbit/fluentbit/0002-flb_info.h.in-Do-not-hardcode-compilation-dir=
ectorie.patch
index 025f8729ea..4c6cac0cbd 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-flb_info.h.in-Do-=
not-hardcode-compilation-directorie.patch
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0002-flb_info.h.in-Do-=
not-hardcode-compilation-directorie.patch
@@ -1,4 +1,4 @@
-From c8c9dd3aeb49ab2ec94c3ab081e2368736a5da20 Mon Sep 17 00:00:00 2001
+From 596a53c35166e6cc5c20fb1d28bb5c92a248f695 Mon Sep 17 00:00:00 2001
 From: Paulo Neves <ptsneves@gmail.com>
 Date: Thu, 28 Jul 2022 11:42:31 +0200
 Subject: [PATCH] flb_info.h.in: Do not hardcode compilation directories
@@ -7,12 +7,14 @@ Including the source dir in the header makes the header=
 not
 reproducible and contaminates it with host builder paths. Instead
 make it take CMAKE_DEBUG_SRCDIR that can be set to a known
 reproducible value
----
-Upstream-Status: Pending
=20
+Upstream-Status: Pending
+---
  include/fluent-bit/flb_info.h.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
+diff --git a/include/fluent-bit/flb_info.h.in b/include/fluent-bit/flb_i=
nfo.h.in
+index 3a08f8051..aa6a48f29 100644
 --- a/include/fluent-bit/flb_info.h.in
 +++ b/include/fluent-bit/flb_info.h.in
 @@ -23,7 +23,7 @@
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-CMakeLists=
.txt-Revise-init-manager-deduction.patch b/meta-oe/recipes-extended/fluen=
tbit/fluentbit/0003-CMakeLists.txt-Revise-init-manager-deduction.patch
index 909d1be28d..6bd4c6bbb6 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-CMakeLists.txt-Re=
vise-init-manager-deduction.patch
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0003-CMakeLists.txt-Re=
vise-init-manager-deduction.patch
@@ -1,4 +1,4 @@
-From bf4e832544e8aa5866ef57859f95b71bd8811154 Mon Sep 17 00:00:00 2001
+From 5cc79bdede89e75d713e23cf0fde26634320bc3e Mon Sep 17 00:00:00 2001
 From: Niko Mauno <niko.mauno@vaisala.com>
 Date: Mon, 21 Oct 2024 16:02:46 +0000
 Subject: [PATCH] CMakeLists.txt: Revise init manager deduction
@@ -14,9 +14,11 @@ Upstream-Status: Inappropriate [configuration]
  src/CMakeLists.txt | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
=20
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index ac5fe5ef8..f47a01b82 100644
 --- a/src/CMakeLists.txt
 +++ b/src/CMakeLists.txt
-@@ -569,7 +569,7 @@ if(FLB_BINARY)
+@@ -600,7 +600,7 @@ if(FLB_BINARY)
      set(SYSTEMD_UNITDIR  /lib/systemd/system)
    endif()
 =20
@@ -25,7 +27,7 @@ Upstream-Status: Inappropriate [configuration]
      if (FLB_AMAZON_LINUX2)
        set(FLB_SYSTEMD_SCRIPT "${PROJECT_SOURCE_DIR}/init/${FLB_OUT_NAME=
}.service")
        configure_file(
-@@ -594,7 +594,7 @@ if(FLB_BINARY)
+@@ -625,7 +625,7 @@ if(FLB_BINARY)
        install(FILES ${FLB_SYSTEMD_SCRIPT} COMPONENT binary DESTINATION =
${SYSTEMD_UNITDIR})
        install(DIRECTORY DESTINATION ${FLB_INSTALL_CONFDIR} COMPONENT bi=
nary)
      endif()
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0004-chunkio-Li=
nk-with-fts-library-with-musl.patch b/meta-oe/recipes-extended/fluentbit/=
fluentbit/0004-chunkio-Link-with-fts-library-with-musl.patch
index c34a0ba71d..6df53613c3 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0004-chunkio-Link-with=
-fts-library-with-musl.patch
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0004-chunkio-Link-with=
-fts-library-with-musl.patch
@@ -1,4 +1,4 @@
-From a07df56092e529627db0946c025cb4964567280c Mon Sep 17 00:00:00 2001
+From cc688b91c02df9a45ca8816a1d09649fadb9dc4a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 10 Aug 2022 01:27:16 -0700
 Subject: [PATCH] chunkio: Link with fts library with musl
@@ -7,14 +7,15 @@ Fixes
 cio_utils.c:(.text+0x64): undefined reference to `fts_read'
=20
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
+
 Upstream-Status: Pending
+---
=20
  lib/chunkio/src/CMakeLists.txt | 1 +
  1 file changed, 1 insertion(+)
=20
 diff --git a/lib/chunkio/src/CMakeLists.txt b/lib/chunkio/src/CMakeLists=
.txt
-index bb52273d4..524500919 100644
+index 3590143fd..b43f08928 100644
 --- a/lib/chunkio/src/CMakeLists.txt
 +++ b/lib/chunkio/src/CMakeLists.txt
 @@ -14,6 +14,7 @@ set(src
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0005-Use-posix-=
strerror_r-with-musl.patch b/meta-oe/recipes-extended/fluentbit/fluentbit=
/0005-Use-posix-strerror_r-with-musl.patch
deleted file mode 100644
index 281bf66fb9..0000000000
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0005-Use-posix-strerro=
r_r-with-musl.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 0c4310483875509f464883fa345f54e0d3ae25a5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 10 Aug 2022 01:23:48 -0700
-Subject: [PATCH] Use posix strerror_r with musl
-
-Default with glibc is GNU extention of strerror_r
-where as musl uses posix variant, call that out
-
-Upstream-Status: Inappropriate [Need wider porting beyond linux/musl/gli=
bc]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Resolved conflicts while upgrading recipe from v1.9.9 to v3.1.9.
-
-Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
----
- src/flb_network.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/flb_network.c b/src/flb_network.c
-index 8f8ca33f6..dd098a2ea 100644
---- a/src/flb_network.c
-+++ b/src/flb_network.c
-@@ -605,7 +605,7 @@ static int net_connect_async(int fd,
-             /* Connection is broken, not much to do here */
- #if ((defined(_POSIX_C_SOURCE) && _POSIX_C_SOURCE >=3D 200112L) ||    \
-      (defined(_XOPEN_SOURCE) || _XOPEN_SOURCE - 0L >=3D 600L)) &&     \
--  (!defined(_GNU_SOURCE))
-+  (!defined(_GNU_SOURCE)) || (!defined(__GLIBC__))
-             ret =3D strerror_r(error, so_error_buf, sizeof(so_error_buf=
));
-             if (ret =3D=3D 0) {
-                 str =3D so_error_buf;
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb b/meta=
-oe/recipes-extended/fluentbit/fluentbit_4.2.0.bb
similarity index 98%
rename from meta-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb
rename to meta-oe/recipes-extended/fluentbit/fluentbit_4.2.0.bb
index 05e4fd937f..279486eee3 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_4.2.0.bb
@@ -17,7 +17,7 @@ DEPENDS =3D "\
 "
 DEPENDS:append:libc-musl =3D " fts"
=20
-SRCREV =3D "b12e507090273576d1156342780c7c6d358fa579"
+SRCREV =3D "6bc014390c5485b96521c56b98369b44b9faa08b"
 SRC_URI =3D "\
     git://github.com/fluent/fluent-bit.git;branch=3Dmaster;protocol=3Dht=
tps \
     file://0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.pat=
ch \
@@ -26,7 +26,6 @@ SRC_URI =3D "\
 "
 SRC_URI:append:libc-musl =3D "\
     file://0004-chunkio-Link-with-fts-library-with-musl.patch \
-    file://0005-Use-posix-strerror_r-with-musl.patch \
 "
=20
 # prefix tag with "v" to avoid upgrade to random tags like "20220215"
--=20
2.52.0


