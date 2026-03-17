Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5679BFED9EF
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 16:57:22 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.80835.1773766638158997293
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Mar 2026 09:57:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=XQaLPWBy;
 spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout07.t-online.de (Postfix) with SMTP id EFC7FEA34
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 17:57:15 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.160.82]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1w2XjE-41bjST0; Tue, 17 Mar 2026 17:57:12 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gimp: update 3.0.8 -> 3.2.0
Date: Tue, 17 Mar 2026 17:56:53 +0100
Message-ID: <20260317165701.643532-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1773766632-58FF6842-A3014913/0/0 CLEAN NORMAL
X-TOI-MSGID: ad5a36c6-f128-473f-950e-00c4e4be52bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1773766635; i=f_l_k@t-online.de;
	bh=Pmel9kEiSGHK8Pv6w1KnOAqWHV36n/zBIO24ogMaQEU=;
	h=From:To:Subject:Date;
	b=XQaLPWByNPtyLaU0NSTyrFGy86WCyoN8vqtFOqLZ1sIgXDfc7c4NtTvgNOdmQVDLO
	 76JE5lDlE3aUDEDIWJC0KrIz7o69jweJ8H6F9v1gKaPVxa81x3oc/wD/xpH6z444Un
	 Bt5S+3bF9dvaSSrDo7TNYfpnq3IW3AK6/quGRxVUN81vn6VMWdnCoYRNbM2UrkXgsD
	 nz8EOVISqus+4Hw4tYsvxQ/YJbtjXR8t2HJ8/lbCitNaANlPrEYiMSXNd6ToKkm4wA
	 UhCBC33DnPR5J6OrHL2pwznKjP1CSnhbHD+Hu/KY+CnPnQ+Rb8zN6ACW5aF/q7KEjv
	 CPgJ41XdXxz+Q==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 16:57:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125321

- remove a backport patch
- rework the fix for host systems that dont provide iso-codes
- update mypaint-brushes dependency to 2.x

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...ind-header-detection-on-non-macOS-pl.patch | 51 -------------------
 ...meson.build-require-iso-codes-native.patch | 35 -------------
 ...relative-path-for-ISO_CODES_LOCATION.patch | 51 +++++++++++++++++++
 ...003-meson.build-reproducibility-fix.patch} |  0
 .../gimp/{gimp_3.0.8.bb =3D> gimp_3.2.0.bb}     | 15 +++---
 5 files changed, 58 insertions(+), 94 deletions(-)
 delete mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-meson-Fix-libu=
nwind-header-detection-on-non-macOS-pl.patch
 delete mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-meson.build-re=
quire-iso-codes-native.patch
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0002-meson.build-us=
e-relative-path-for-ISO_CODES_LOCATION.patch
 rename meta-gnome/recipes-gimp/gimp/gimp/{0002-meson.build-reproducibili=
ty-fix.patch =3D> 0003-meson.build-reproducibility-fix.patch} (100%)
 rename meta-gnome/recipes-gimp/gimp/{gimp_3.0.8.bb =3D> gimp_3.2.0.bb} (=
91%)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-meson-Fix-libunwind-h=
eader-detection-on-non-macOS-pl.patch b/meta-gnome/recipes-gimp/gimp/gimp=
/0001-meson-Fix-libunwind-header-detection-on-non-macOS-pl.patch
deleted file mode 100644
index 879529b80e..0000000000
--- a/meta-gnome/recipes-gimp/gimp/gimp/0001-meson-Fix-libunwind-header-d=
etection-on-non-macOS-pl.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 8862f36fcec74152afeee2a99c0e04b84b6cf5b3 Mon Sep 17 00:00:00 2001
-From: Bruno Lopes <brunvonlope@outlook.com>
-Date: Sun, 25 Jan 2026 11:11:48 -0300
-Subject: [PATCH] meson: Fix libunwind header detection on non-macOS plat=
forms
-
-Closes: #15750
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gimp/-/commit/=
1aa51ca0637db88a4ea958d03fa6692e6ac0289b]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- meson.build | 17 ++++++++++-------
- 1 file changed, 10 insertions(+), 7 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 2192968..cfa1f71 100644
---- a/meson.build
-+++ b/meson.build
-@@ -731,11 +731,14 @@ conf.set('HAVE_LIBBACKTRACE', libbacktrace.found()=
)
- ## Check for libunwind
- # In most platforms, unw_*() functions are in the libunwind library.
- # In macOS, it is on libSystem (there we only need the SDK header).
--libunwind =3D ( get_option('libunwind')
--  ? dependency('libunwind', version: '>=3D1.1.0', required: false)
--  : no_dep
--)
--have_unwind =3D libunwind.found() or cc.has_header('libunwind.h', requi=
red: false)
-+libunwind =3D no_dep
-+if get_option('libunwind')
-+  libunwind =3D dependency('libunwind', version: '>=3D1.1.0', required:=
 false)
-+  libunwind_h =3D platform_osx ? cc.has_header('libunwind.h', required:=
 false) : false
-+  have_unwind =3D libunwind.found() or libunwind_h
-+else
-+  have_unwind =3D false
-+endif
- conf.set('HAVE_LIBUNWIND', have_unwind ? 1 : false)
-=20
- ## Check for backtrace() API
-@@ -758,11 +761,11 @@ if platform_windows
- elif platform_linux
-   if not have_execinfo_h
-     dashboard_backtrace=3D'no (missing: execinfo.h)'
--  elif not libbacktrace.found() and not libunwind.found()
-+  elif not libbacktrace.found() and not have_unwind
-     dashboard_backtrace=3D'rough (missing: libbacktrace and libunwind)'
-   elif not libbacktrace.found()
-     dashboard_backtrace=3D'partially detailed (missing: libbacktrace)'
--  elif not libunwind.found()
-+  elif not have_unwind
-     dashboard_backtrace=3D'partially detailed (missing: libunwind)'
-   else
-     dashboard_backtrace=3D'detailed'
diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-meson.build-require-i=
so-codes-native.patch b/meta-gnome/recipes-gimp/gimp/gimp/0001-meson.buil=
d-require-iso-codes-native.patch
deleted file mode 100644
index ffb8ef29df..0000000000
--- a/meta-gnome/recipes-gimp/gimp/gimp/0001-meson.build-require-iso-code=
s-native.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 8ccd12d6ec3330e9646ae9db6fd491226d516dc3 Mon Sep 17 00:00:00 2001
-From: Markus Volk <f_l_k@t-online.de>
-Date: Fri, 28 Mar 2025 01:33:00 +0100
-Subject: [PATCH] meson.build: require iso-codes-native
-
-This fixes:
-FAILED: app/widgets/gimplanguagestore-data.h
-/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/gimp/3.0.2/buil=
d/tools/gen-languages
-gimp_language_store_parser_init: 0.006277 seconds
-ERROR: parse_iso_codes: error parsing '/usr/share/xml/iso-codes/iso_639_=
3.xml': No such file or directory
-
-Upstream-Status: Denied [https://gitlab.gnome.org/GNOME/gimp/-/merge_req=
uests/2185]
-Upstream argues that iso-codes locale (.mo files) are required on the ta=
rget
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index efbc2d8175..fd050f4d3c 100644
---- a/meson.build
-+++ b/meson.build
-@@ -1135,7 +1135,7 @@ endif
- #######################################################################=
#########
- # ISO codes
-=20
--isocodes =3D dependency('iso-codes', required: false)
-+isocodes =3D dependency('iso-codes', required: false, native: true)
- if isocodes.found()
-   isocodes_prefix =3D isocodes.get_variable(pkgconfig: 'prefix')
-   isocodes_location =3D isocodes_prefix / 'share' / 'xml' / 'iso-codes'
---=20
-2.49.0
-
diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0002-meson.build-use-relat=
ive-path-for-ISO_CODES_LOCATION.patch b/meta-gnome/recipes-gimp/gimp/gimp=
/0002-meson.build-use-relative-path-for-ISO_CODES_LOCATION.patch
new file mode 100644
index 0000000000..826d3394ad
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp/0002-meson.build-use-relative-pat=
h-for-ISO_CODES_LOCATION.patch
@@ -0,0 +1,51 @@
+From 8ccd12d6ec3330e9646ae9db6fd491226d516dc3 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Fri, 28 Mar 2025 01:33:00 +0100
+Subject: [PATCH] meson.build: use relative path for ISO_CODES_LOCATION
+
+If the host system does not provide iso-codes, the build fails with the =
following message:
+FAILED: app/widgets/gimplanguagestore-data.h
+/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/gimp/3.0.2/buil=
d/tools/gen-languages
+gimp_language_store_parser_init: 0.006277 seconds
+ERROR: parse_iso_codes: Error parsing =E2=80=98/usr/share/xml/iso-codes/=
iso_639_3.xml=E2=80=99: No such file or directory
+
+So far, we have worked around the problem by using the =E2=80=9Ciso-code=
s-native=E2=80=9D dependency, but the path
+for 'isocodes_prefix' is then generated from the native pkgconfig entry,=
 resulting in a hard-coded path to
+${STAGING_DATADIR_NATIVE}, which then leaks into the binaries of gimp an=
d gimp-console.
+
+Instead, use iso-codes for the target and adjust the path stored in ISO_=
CODES_LOCATION
+(which is used in tools/gen-languages.c) to a relative path so that the =
build system can find it.
+
+This allows us to depend on iso-codes for the target system, while still=
 working on host systems that
+do not provide iso-codes.
+
+It also fixes a reproducibility issue:
+ERROR: gimp-3.2.0-r0 do_package_qa: QA Issue: File /usr/bin/gimp-console=
-3.2 in package gimp contains reference to TMPDIR [buildpaths]
+ERROR: gimp-3.2.0-r0 do_package_qa: QA Issue: File /usr/bin/gimp-3.2 in =
package gimp contains reference to TMPDIR [buildpaths]
+ERROR: gimp-3.2.0-r0 do_package_qa: Fatal QA errors were found, failing =
task.
+ERROR: Logfile of failure stored in: /home/flk/bitbake-builds/poky/build=
/tmp/work/corei7-64-oe-linux/gimp/3.2.0/temp/log.do_package_qa.597065
+ERROR: Task (/home/flk/bitbake-builds/poky/layers/meta-openembedded/meta=
-gnome/recipes-gimp/gimp/gimp_3.2.0.bb:do_package_qa) failed with exit co=
de '1'
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index efbc2d8175..fd050f4d3c 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1184,7 +1184,7 @@
+   isocodes_prefix =3D isocodes.get_variable(pkgconfig: 'prefix')
+   isocodes_location =3D isocodes_prefix / 'share' / 'xml' / 'iso-codes'
+   isocodes_localedir=3D isocodes_prefix / 'share' / 'locale'
+-  conf.set_quoted('ISO_CODES_LOCATION',  isocodes_location)
++  conf.set_quoted('ISO_CODES_LOCATION',  '..' / 'recipe-sysroot' / 'usr=
' / 'share' / 'xml' / 'iso-codes')
+   conf.set_quoted('ISO_CODES_LOCALEDIR', isocodes_localedir)
+ endif
+ conf.set('HAVE_ISO_CODES', isocodes.found())
+--=20
+2.49.0
+
diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0002-meson.build-reproduci=
bility-fix.patch b/meta-gnome/recipes-gimp/gimp/gimp/0003-meson.build-rep=
roducibility-fix.patch
similarity index 100%
rename from meta-gnome/recipes-gimp/gimp/gimp/0002-meson.build-reproducib=
ility-fix.patch
rename to meta-gnome/recipes-gimp/gimp/gimp/0003-meson.build-reproducibil=
ity-fix.patch
diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb b/meta-gnome/reci=
pes-gimp/gimp/gimp_3.2.0.bb
similarity index 91%
rename from meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb
rename to meta-gnome/recipes-gimp/gimp/gimp_3.2.0.bb
index 1c7f634b65..d6928498ac 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_3.2.0.bb
@@ -20,7 +20,7 @@ DEPENDS =3D " \
     glib-2.0-native \
     gtk+3 \
     harfbuzz \
-    iso-codes-native \
+    iso-codes \
     jpeg \
     json-glib \
     lcms \
@@ -32,7 +32,7 @@ DEPENDS =3D " \
     librsvg-native \
     libxmu \
     libxslt-native \
-    mypaint-brushes-1.0 \
+    mypaint-brushes \
     pango \
     poppler \
     poppler-data \
@@ -58,13 +58,12 @@ GIDOCGEN_MESON_OPTION =3D "gi-docgen"
 GIDOCGEN_MESON_ENABLE_FLAG =3D "enabled"
 GIDOCGEN_MESON_DISABLE_FLAG =3D "disabled"
=20
-SRC_URI =3D "https://download.gimp.org/gimp/v3.0/${BP}.tar.xz \
-           file://0002-meson.build-reproducibility-fix.patch \
+SRC_URI =3D "https://download.gimp.org/gimp/v3.2/${BP}.tar.xz \
            file://0001-meson.build-dont-check-for-lgi.patch \
-           file://0001-meson.build-require-iso-codes-native.patch \
-           file://0001-meson-Fix-libunwind-header-detection-on-non-macOS=
-pl.patch \
-           "
-SRC_URI[sha256sum] =3D "feb498acc01b26827cff1ff95aa8fb82cdd6a60d7abf773c=
fcd19abeafca3386"
+           file://0002-meson.build-use-relative-path-for-ISO_CODES_LOCAT=
ION.patch \
+           file://0003-meson.build-reproducibility-fix.patch \
+"
+SRC_URI[sha256sum] =3D "2618391416e51be3c693df9ef90e3860ed72ab3d36363ea1=
f196e30b75b2e083"
=20
 PACKAGECONFIG[aa] =3D "-Daa=3Denabled,-Daa=3Ddisabled,aalib"
 PACKAGECONFIG[alsa] =3D "-Dalsa=3Denabled,-Dalsa=3Ddisabled,alsa-lib"
--=20
2.53.0


