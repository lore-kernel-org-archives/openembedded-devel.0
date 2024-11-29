Return-Path: <patrick.wicki@subset.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81C6ED6EC15
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 21:39:17 +0000 (UTC)
Received: from qs51p00im-qukt01072701.me.com (qs51p00im-qukt01072701.me.com [17.57.155.16])
 by mx.groups.io with SMTP id smtpd.web10.123491.1732916354036682655
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Nov 2024 13:39:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@subset.ch header.s=sig1 header.b=PnvtYXrH;
 spf=pass (domain: subset.ch, ip: 17.57.155.16, mailfrom: patrick@subset.ch)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=subset.ch; s=sig1;
	t=1732916352; bh=9lC6eYnJrInxtK7BPID57Yy9VRByPkCmsUxVShgck98=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme;
	b=PnvtYXrHBSQRqmXJFFoMYTl/Sl6iCX2nEwJM6eOAC2Hy+iuq9kQyVM8taPJsJ+rwR
	 2nG4rQ6ox9n+LeX2YydxmoOqvqsEXfMoHR2JCnV/arHrEhTMzD0RR9MMcUvxENBY5V
	 7V0L432ud/EiJFRrEDL7vJhXkf49+xndqNLTYwgjCd2WiA0uv47PaJARYX+vWN9JG2
	 QMHtXTxo+UXJ6djs4QffgM6FrqK6iifwafkd4c6PWilir+EL/COwVinkn2grAMIshg
	 Cs8mUvABO7fQ/cz0QcoWcV1t15j8MdlBdwGkKNxYURM3CQipLyM2xdcVimLldjQaoL
	 HToo4xxiGoB4A==
Received: from localhost.localdomain (qs51p00im-dlb-asmtp-mailmevip.me.com [17.57.155.28])
	by qs51p00im-qukt01072701.me.com (Postfix) with ESMTPSA id E295E15C00F1;
	Fri, 29 Nov 2024 21:39:11 +0000 (UTC)
From: patrick@subset.ch
To: openembedded-devel@lists.openembedded.org
Cc: Patrick Wicki <patrick.wicki@siemens.com>
Subject: [meta-oe][PATCH 1/2] fluentbit: upgrade to v3.2.1
Date: Fri, 29 Nov 2024 22:38:36 +0100
Message-ID: <20241129213837.523955-1-patrick@subset.ch>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Proofpoint-GUID: z8bgpPtvBpvZZ-BxQOaYTkaG2yF9qXmB
X-Proofpoint-ORIG-GUID: z8bgpPtvBpvZZ-BxQOaYTkaG2yF9qXmB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-29_18,2024-11-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0
 clxscore=1030 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2308100000 definitions=main-2411290174
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Nov 2024 21:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114122

From: Patrick Wicki <patrick.wicki@siemens.com>

Changelogs since v3.1.9:

- https://fluentbit.io/announcements/v3.1.10/
- https://fluentbit.io/announcements/v3.2.0/
- https://fluentbit.io/announcements/v3.2.1/

Also add pending patch for a cprofiles bug.

Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
---
 ...rivate-makefile-targets-in-CMakelist.patch | 17 +++---
 ...-not-hardcode-compilation-directorie.patch |  4 +-
 ...ts.txt-Revise-init-manager-deduction.patch | 11 ++--
 ...nkio-Link-with-fts-library-with-musl.patch |  8 +--
 ...d-cmake-try_run-when-cross-compiling.patch |  2 +-
 .../0005-Use-posix-strerror_r-with-musl.patch |  9 ++-
 ..._text.c-fix-wrong-pointer-assignment.patch | 56 +++++++++++++++++++
 ...{fluentbit_3.1.9.bb =3D> fluentbit_3.2.1.bb} |  5 +-
 8 files changed, 82 insertions(+), 30 deletions(-)
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0005-cpr=
of_encode_text.c-fix-wrong-pointer-assignment.patch
 rename meta-oe/recipes-extended/fluentbit/{fluentbit_3.1.9.bb =3D> fluen=
tbit_3.2.1.bb} (96%)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-lib-Do-not=
-use-private-makefile-targets-in-CMakelist.patch b/meta-oe/recipes-extend=
ed/fluentbit/fluentbit/0001-lib-Do-not-use-private-makefile-targets-in-CM=
akelist.patch
index 233e8c4e3..642a73dac 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-lib-Do-not-use-pr=
ivate-makefile-targets-in-CMakelist.patch
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-lib-Do-not-use-pr=
ivate-makefile-targets-in-CMakelist.patch
@@ -1,4 +1,4 @@
-From 940a4e270bb8879a78c0eac4daf997cb77e25b4b Mon Sep 17 00:00:00 2001
+From 7e6295f14ea057562a235fbf6762d867e739a181 Mon Sep 17 00:00:00 2001
 From: Niko Mauno <niko.mauno@vaisala.com>
 Date: Sun, 29 Sep 2024 12:00:00 +0000
 Subject: [PATCH] lib: Do not use private makefile targets in CMakelists.=
txt
@@ -25,8 +25,8 @@ Upstream-Status: Submitted [https://github.com/fluent/f=
luent-bit/pull/9450]
  lib/cfl/CMakeLists.txt      | 8 ++------
  lib/cmetrics/CMakeLists.txt | 8 ++------
  lib/ctraces/CMakeLists.txt  | 8 ++------
- lib/monkey/CMakeLists.txt   | 4 ----
- 4 files changed, 6 insertions(+), 22 deletions(-)
+ lib/monkey/CMakeLists.txt   | 4 +---
+ 4 files changed, 7 insertions(+), 21 deletions(-)
=20
 diff --git a/lib/cfl/CMakeLists.txt b/lib/cfl/CMakeLists.txt
 index 2193cb29c..e2a5cba37 100644
@@ -48,7 +48,7 @@ index 2193cb29c..e2a5cba37 100644
 =20
 =20
 diff --git a/lib/cmetrics/CMakeLists.txt b/lib/cmetrics/CMakeLists.txt
-index 4f2989106..9c40dadf4 100644
+index 18582997d..8f7176dd6 100644
 --- a/lib/cmetrics/CMakeLists.txt
 +++ b/lib/cmetrics/CMakeLists.txt
 @@ -60,12 +60,8 @@ if(NOT MSVC)
@@ -67,11 +67,11 @@ index 4f2989106..9c40dadf4 100644
  # Configuration options
  option(CMT_DEV                       "Enable development mode"         =
          No)
 diff --git a/lib/ctraces/CMakeLists.txt b/lib/ctraces/CMakeLists.txt
-index e92834e06..5cebb3b73 100644
+index e47ba022d..0ddfd5f97 100644
 --- a/lib/ctraces/CMakeLists.txt
 +++ b/lib/ctraces/CMakeLists.txt
 @@ -30,12 +30,8 @@ set(CTR_VERSION_MINOR  5)
- set(CTR_VERSION_PATCH  6)
+ set(CTR_VERSION_PATCH  7)
  set(CTR_VERSION_STR "${CTR_VERSION_MAJOR}.${CTR_VERSION_MINOR}.${CTR_VE=
RSION_PATCH}")
 =20
 -# Define __FILENAME__ consistently across Operating Systems
@@ -86,7 +86,7 @@ index e92834e06..5cebb3b73 100644
  # Configuration options
  option(CTR_DEV             "Enable development mode"                   =
No)
 diff --git a/lib/monkey/CMakeLists.txt b/lib/monkey/CMakeLists.txt
-index 95d8cc1e6..8c66887da 100644
+index 028240bcc..b386cb726 100644
 --- a/lib/monkey/CMakeLists.txt
 +++ b/lib/monkey/CMakeLists.txt
 @@ -15,10 +15,8 @@ include(GNUInstallDirs)
@@ -101,6 +101,3 @@ index 95d8cc1e6..8c66887da 100644
 =20
  # Monkey Version
  set(MK_VERSION_MAJOR  1)
---=20
-2.39.2
-
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-flb_info.h=
.in-Do-not-hardcode-compilation-directorie.patch b/meta-oe/recipes-extend=
ed/fluentbit/fluentbit/0002-flb_info.h.in-Do-not-hardcode-compilation-dir=
ectorie.patch
index 425b838b7..01a11e3be 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-flb_info.h.in-Do-=
not-hardcode-compilation-directorie.patch
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0002-flb_info.h.in-Do-=
not-hardcode-compilation-directorie.patch
@@ -1,4 +1,4 @@
-From 71dab751a27a2e582b711de22873065dd28f4b65 Mon Sep 17 00:00:00 2001
+From c8c9dd3aeb49ab2ec94c3ab081e2368736a5da20 Mon Sep 17 00:00:00 2001
 From: Paulo Neves <ptsneves@gmail.com>
 Date: Thu, 28 Jul 2022 11:42:31 +0200
 Subject: [PATCH] flb_info.h.in: Do not hardcode compilation directories
@@ -14,7 +14,7 @@ Upstream-Status: Pending
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/include/fluent-bit/flb_info.h.in b/include/fluent-bit/flb_i=
nfo.h.in
-index a89485c..2579afc 100644
+index 3a08f8051..aa6a48f29 100644
 --- a/include/fluent-bit/flb_info.h.in
 +++ b/include/fluent-bit/flb_info.h.in
 @@ -23,7 +23,7 @@
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-CMakeLists=
.txt-Revise-init-manager-deduction.patch b/meta-oe/recipes-extended/fluen=
tbit/fluentbit/0003-CMakeLists.txt-Revise-init-manager-deduction.patch
index 5105444dc..4da1650bc 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-CMakeLists.txt-Re=
vise-init-manager-deduction.patch
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0003-CMakeLists.txt-Re=
vise-init-manager-deduction.patch
@@ -1,4 +1,4 @@
-From c9969cc46e5e4d58db28c89b22bebe42d9f96962 Mon Sep 17 00:00:00 2001
+From bf4e832544e8aa5866ef57859f95b71bd8811154 Mon Sep 17 00:00:00 2001
 From: Niko Mauno <niko.mauno@vaisala.com>
 Date: Mon, 21 Oct 2024 16:02:46 +0000
 Subject: [PATCH] CMakeLists.txt: Revise init manager deduction
@@ -15,10 +15,10 @@ Upstream-Status: Inappropriate [configuration]
  1 file changed, 2 insertions(+), 2 deletions(-)
=20
 diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index 084f2c57d..f0f35f00b 100644
+index 8404b65c1..0c7876058 100644
 --- a/src/CMakeLists.txt
 +++ b/src/CMakeLists.txt
-@@ -532,7 +532,7 @@ if(FLB_BINARY)
+@@ -540,7 +540,7 @@ if(FLB_BINARY)
      set(SYSTEMD_UNITDIR  /lib/systemd/system)
    endif()
 =20
@@ -27,7 +27,7 @@ index 084f2c57d..f0f35f00b 100644
      set(FLB_SYSTEMD_SCRIPT "${PROJECT_SOURCE_DIR}/init/${FLB_OUT_NAME}.=
service")
      configure_file(
        "${PROJECT_SOURCE_DIR}/init/systemd.in"
-@@ -540,7 +540,7 @@ if(FLB_BINARY)
+@@ -548,7 +548,7 @@ if(FLB_BINARY)
        )
      install(FILES ${FLB_SYSTEMD_SCRIPT} COMPONENT binary DESTINATION ${=
SYSTEMD_UNITDIR})
      install(DIRECTORY DESTINATION ${FLB_INSTALL_CONFDIR} COMPONENT bina=
ry)
@@ -36,6 +36,3 @@ index 084f2c57d..f0f35f00b 100644
      set(FLB_UPSTART_SCRIPT "${PROJECT_SOURCE_DIR}/init/${FLB_OUT_NAME}.=
conf")
      configure_file(
        "${PROJECT_SOURCE_DIR}/init/upstart.in"
---=20
-2.39.2
-
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0004-chunkio-Li=
nk-with-fts-library-with-musl.patch b/meta-oe/recipes-extended/fluentbit/=
fluentbit/0004-chunkio-Link-with-fts-library-with-musl.patch
index d1c39d89c..c34a0ba71 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0004-chunkio-Link-with=
-fts-library-with-musl.patch
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0004-chunkio-Link-with=
-fts-library-with-musl.patch
@@ -1,4 +1,4 @@
-From 63dbbad5978e5f5b0e7d42614999cb6b4ebcce10 Mon Sep 17 00:00:00 2001
+From a07df56092e529627db0946c025cb4964567280c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 10 Aug 2022 01:27:16 -0700
 Subject: [PATCH] chunkio: Link with fts library with musl
@@ -14,10 +14,10 @@ Upstream-Status: Pending
  1 file changed, 1 insertion(+)
=20
 diff --git a/lib/chunkio/src/CMakeLists.txt b/lib/chunkio/src/CMakeLists=
.txt
-index a4fc2d3..4244eb8 100644
+index bb52273d4..524500919 100644
 --- a/lib/chunkio/src/CMakeLists.txt
 +++ b/lib/chunkio/src/CMakeLists.txt
-@@ -13,6 +13,7 @@ set(src
+@@ -14,6 +14,7 @@ set(src
    )
 =20
  set(libs cio-crc32)
@@ -25,5 +25,3 @@ index a4fc2d3..4244eb8 100644
 =20
  if(${CMAKE_SYSTEM_NAME} MATCHES "Windows")
    set(src
---=20
-2.37.1
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0004-wasm-avoid=
-cmake-try_run-when-cross-compiling.patch b/meta-oe/recipes-extended/flue=
ntbit/fluentbit/0004-wasm-avoid-cmake-try_run-when-cross-compiling.patch
index 419e85903..b711b413b 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0004-wasm-avoid-cmake-=
try_run-when-cross-compiling.patch
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0004-wasm-avoid-cmake-=
try_run-when-cross-compiling.patch
@@ -1,4 +1,4 @@
-From 5b6d274664f92a6c6083f4d27a1b1604a326f22c Mon Sep 17 00:00:00 2001
+From 5f3bfd51851c6700b4dfd2ac25e83e5306b923f8 Mon Sep 17 00:00:00 2001
 From: Patrick Wicki <patrick.wicki@siemens.com>
 Date: Sat, 5 Oct 2024 21:36:12 +0200
 Subject: [PATCH] wasm: avoid cmake try_run when cross-compiling for x86
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0005-Use-posix-=
strerror_r-with-musl.patch b/meta-oe/recipes-extended/fluentbit/fluentbit=
/0005-Use-posix-strerror_r-with-musl.patch
index bcce32803..281bf66fb 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0005-Use-posix-strerro=
r_r-with-musl.patch
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0005-Use-posix-strerro=
r_r-with-musl.patch
@@ -1,4 +1,4 @@
-From f645128082117a0152a95b3dccd869a184b7513f Mon Sep 17 00:00:00 2001
+From 0c4310483875509f464883fa345f54e0d3ae25a5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 10 Aug 2022 01:23:48 -0700
 Subject: [PATCH] Use posix strerror_r with musl
@@ -12,12 +12,15 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Resolved conflicts while upgrading recipe from v1.9.9 to v3.1.9.
=20
 Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
+---
+ src/flb_network.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/src/flb_network.c b/src/flb_network.c
-index d183209fd..41e0281b5 100644
+index 8f8ca33f6..dd098a2ea 100644
 --- a/src/flb_network.c
 +++ b/src/flb_network.c
-@@ -553,7 +553,7 @@ static int net_connect_async(int fd,
+@@ -605,7 +605,7 @@ static int net_connect_async(int fd,
              /* Connection is broken, not much to do here */
  #if ((defined(_POSIX_C_SOURCE) && _POSIX_C_SOURCE >=3D 200112L) ||    \
       (defined(_XOPEN_SOURCE) || _XOPEN_SOURCE - 0L >=3D 600L)) &&     \
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0005-cprof_enco=
de_text.c-fix-wrong-pointer-assignment.patch b/meta-oe/recipes-extended/f=
luentbit/fluentbit/0005-cprof_encode_text.c-fix-wrong-pointer-assignment.=
patch
new file mode 100644
index 000000000..1d2513aef
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0005-cprof_encode_text=
.c-fix-wrong-pointer-assignment.patch
@@ -0,0 +1,56 @@
+From 2e39a3cea7d03721298e90fad70560c541b092a5 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Sat, 16 Nov 2024 20:55:37 +0100
+Subject: [PATCH] cprof_encode_text.c: fix wrong pointer assignment
+
+Fix cprofiles build.
+
+Upstream-Status: Submitted [https://github.com/fluent/cprofiles/pull/3]
+
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
+---
+ lib/cprofiles/src/cprof_encode_text.c | 6 +++---
+ lib/cprofiles/src/cprof_profile.c     | 2 +-
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/lib/cprofiles/src/cprof_encode_text.c b/lib/cprofiles/src/c=
prof_encode_text.c
+index 218a72b5b..ab2d6247d 100644
+--- a/lib/cprofiles/src/cprof_encode_text.c
++++ b/lib/cprofiles/src/cprof_encode_text.c
+@@ -1909,7 +1909,7 @@ static int encode_cprof_resource_profiles(
+                 struct cprof_resource_profiles *instance) {
+     int result;
+     struct cfl_list             *iterator;
+-    struct cprof_scope_profile *scope_profile;
++    struct cprof_scope_profiles *scope_profiles;
+=20
+     result =3D encode_string(context,
+                             CFL_TRUE,
+@@ -1958,11 +1958,11 @@ static int encode_cprof_resource_profiles(
+=20
+         cfl_list_foreach(iterator,
+                          &instance->scope_profiles) {
+-            scope_profile =3D cfl_list_entry(
++            scope_profiles =3D cfl_list_entry(
+                                 iterator,
+                                 struct cprof_scope_profiles, _head);
+=20
+-            result =3D encode_cprof_scope_profiles(context, scope_profi=
le);
++            result =3D encode_cprof_scope_profiles(context, scope_profi=
les);
+=20
+             if (result !=3D CPROF_ENCODE_TEXT_SUCCESS) {
+                 return result;
+diff --git a/lib/cprofiles/src/cprof_profile.c b/lib/cprofiles/src/cprof=
_profile.c
+index 66d62b361..d059d0376 100644
+--- a/lib/cprofiles/src/cprof_profile.c
++++ b/lib/cprofiles/src/cprof_profile.c
+@@ -98,7 +98,7 @@ void cprof_profile_destroy(struct cprof_profile *insta=
nce)
+     struct cfl_list             *iterator_backup;
+     struct cprof_attribute_unit *attribute_unit;
+     struct cprof_value_type     *value_type;
+-    struct cprof_mapping        *location;
++    struct cprof_location        *location;
+     struct cprof_function       *function;
+     struct cfl_list             *iterator;
+     struct cprof_mapping        *mapping;
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_3.1.9.bb b/meta=
-oe/recipes-extended/fluentbit/fluentbit_3.2.1.bb
similarity index 96%
rename from meta-oe/recipes-extended/fluentbit/fluentbit_3.1.9.bb
rename to meta-oe/recipes-extended/fluentbit/fluentbit_3.2.1.bb
index 9eea8d6da..54fa9b277 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_3.1.9.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_3.2.1.bb
@@ -17,13 +17,14 @@ DEPENDS =3D "\
 "
 DEPENDS:append:libc-musl =3D " fts"
=20
-SRCREV =3D "431fa79ae27edaef8d050a7af6f038f4400193a1"
+SRCREV =3D "600b5a955b5ef7b9d025e0c128432260d0c6a5f1"
 SRC_URI =3D "\
-    git://github.com/fluent/fluent-bit.git;branch=3D3.1;protocol=3Dhttps=
 \
+    git://github.com/fluent/fluent-bit.git;branch=3Dmaster;protocol=3Dht=
tps \
     file://0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.pat=
ch \
     file://0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.pat=
ch \
     file://0003-CMakeLists.txt-Revise-init-manager-deduction.patch \
     file://0004-wasm-avoid-cmake-try_run-when-cross-compiling.patch \
+    file://0005-cprof_encode_text.c-fix-wrong-pointer-assignment.patch \
 "
 SRC_URI:append:libc-musl =3D "\
     file://0004-chunkio-Link-with-fts-library-with-musl.patch \
--=20
2.47.1


