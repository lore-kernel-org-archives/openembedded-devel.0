Return-Path: <mikko.rapeli@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1115BC433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 06:12:25 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web12.2724.1655100743412997181
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jun 2022 23:12:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25,
 mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([91.232.154.11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1o0dJE-00DMKF-Bw; Mon, 13 Jun 2022 09:12:20 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.92)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1o0dJD-0007nB-It; Mon, 13 Jun 2022 09:12:19 +0300
From: mikko.rapeli@bmw.de
To: openembedded-devel@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@bmw.de>
Subject: [meta-oe][PATCH] polkit: switch back to mozjs but leave duktape as
 PACKAGECONFIG option
Date: Mon, 13 Jun 2022 09:12:05 +0300
Message-Id: <20220613061205.27663-1-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.2 (-)
X-Rspam-Report: Action: no action
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: BAYES_HAM(-3.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: R_MISSING_CHARSET(0.50)
 Symbol: MIME_GOOD(-0.10)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: FROM_NO_DN(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: R_SPF_NA(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: R_DKIM_NA(0.00)
 Symbol: ASN(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20220613061205.27663-1-mikko.rapeli@bmw.de
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jun 2022 06:12:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97476

From: Mikko Rapeli <mikko.rapeli@bmw.de>

https://bugzilla.yoctoproject.org/show_bug.cgi?id=14829 reports
that duktape isn't fully compatible with mozjs as the supported
javascript features are different. duktape supports
ECMAScript standard version 5 while mozjs supports a lot more.
See https://kangax.github.io/compat-table/es5/ for the differences.
Thus the change from mozjs to duktape may break some rules
which rely on javascript features which duktape doesn't support,
for example array.includes() function,
https://kangax.github.io/compat-table/es6/
https://262.ecma-international.org/7.0/#sec-array.prototype.includes

For many embedded systems which care about fast boot times and smaller
rootfs using duktape is recommended but rules must be written in reduced
set of ECMA script language features. For array.includes() one alternative
is "array.indexOf(search) >= 0".

[YOCTO #14829]

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 .../0002-jsauthority-port-to-mozjs-91.patch   | 38 +++++++++++
 ...re-to-call-JS_Init-and-JS_ShutDown-e.patch | 63 +++++++++++++++++++
 .../recipes-extended/polkit/polkit_0.119.bb   | 19 +++++-
 3 files changed, 117 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-extended/polkit/polkit/0002-jsauthority-port-to-mozjs-91.patch
 create mode 100644 meta-oe/recipes-extended/polkit/polkit/0003-jsauthority-ensure-to-call-JS_Init-and-JS_ShutDown-e.patch

diff --git a/meta-oe/recipes-extended/polkit/polkit/0002-jsauthority-port-to-mozjs-91.patch b/meta-oe/recipes-extended/polkit/polkit/0002-jsauthority-port-to-mozjs-91.patch
new file mode 100644
index 000000000..5b3660da2
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/polkit/0002-jsauthority-port-to-mozjs-91.patch
@@ -0,0 +1,38 @@
+From 4ce27b66bb07b72cb96d3d43a75108a5a6e7e156 Mon Sep 17 00:00:00 2001
+From: Xi Ruoyao <xry111@mengyan1223.wang>
+Date: Tue, 10 Aug 2021 19:09:42 +0800
+Subject: [PATCH] jsauthority: port to mozjs-91
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/polkit/polkit/-/merge_requests/92]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ configure.ac | 2 +-
+ meson.build  | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index d807086..5a7fc11 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -80,7 +80,7 @@ PKG_CHECK_MODULES(GLIB, [gmodule-2.0 gio-unix-2.0 >= 2.30.0])
+ AC_SUBST(GLIB_CFLAGS)
+ AC_SUBST(GLIB_LIBS)
+ 
+-PKG_CHECK_MODULES(LIBJS, [mozjs-78])
++PKG_CHECK_MODULES(LIBJS, [mozjs-91])
+ 
+ AC_SUBST(LIBJS_CFLAGS)
+ AC_SUBST(LIBJS_CXXFLAGS)
+diff --git a/meson.build b/meson.build
+index b3702be..733bbff 100644
+--- a/meson.build
++++ b/meson.build
+@@ -126,7 +126,7 @@ expat_dep = dependency('expat')
+ assert(cc.has_header('expat.h', dependencies: expat_dep), 'Can\'t find expat.h. Please install expat.')
+ assert(cc.has_function('XML_ParserCreate', dependencies: expat_dep), 'Can\'t find expat library. Please install expat.')
+ 
+-mozjs_dep = dependency('mozjs-78')
++mozjs_dep = dependency('mozjs-91')
+ 
+ dbus_dep = dependency('dbus-1')
+ dbus_confdir = dbus_dep.get_pkgconfig_variable('datadir', define_variable: ['datadir', pk_prefix / pk_datadir])   #changed from sysconfdir with respect to commit#8eada3836465838
diff --git a/meta-oe/recipes-extended/polkit/polkit/0003-jsauthority-ensure-to-call-JS_Init-and-JS_ShutDown-e.patch b/meta-oe/recipes-extended/polkit/polkit/0003-jsauthority-ensure-to-call-JS_Init-and-JS_ShutDown-e.patch
new file mode 100644
index 000000000..9e9755e44
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/polkit/0003-jsauthority-ensure-to-call-JS_Init-and-JS_ShutDown-e.patch
@@ -0,0 +1,63 @@
+From 7799441b9aa55324160deefbc65f9d918b8c94c1 Mon Sep 17 00:00:00 2001
+From: Xi Ruoyao <xry111@mengyan1223.wang>
+Date: Tue, 10 Aug 2021 18:52:56 +0800
+Subject: [PATCH] jsauthority: ensure to call JS_Init() and JS_ShutDown()
+ exactly once
+
+Before this commit, we were calling JS_Init() in
+polkit_backend_js_authority_class_init and never called JS_ShutDown.
+This is actually a misusage of SpiderMonkey API.  Quote from a comment
+in js/Initialization.h (both mozjs-78 and mozjs-91):
+
+    It is currently not possible to initialize SpiderMonkey multiple
+    times (that is, calling JS_Init/JSAPI methods/JS_ShutDown in that
+    order, then doing so again).
+
+This misusage does not cause severe issues with mozjs-78.  However, when
+we eventually port jsauthority to use mozjs-91, bad thing will happen:
+see the test failure mentioned in #150.
+
+This commit is tested with both mozjs-78 and mozjs-91, all tests pass
+with it.
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/polkit/polkit/-/merge_requests/91]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ src/polkitbackend/polkitbackendjsauthority.cpp | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/src/polkitbackend/polkitbackendjsauthority.cpp b/src/polkitbackend/polkitbackendjsauthority.cpp
+index 41d8d5c..38dc001 100644
+--- a/src/polkitbackend/polkitbackendjsauthority.cpp
++++ b/src/polkitbackend/polkitbackendjsauthority.cpp
+@@ -75,6 +75,13 @@
+ 
+ /* ---------------------------------------------------------------------------------------------------- */
+ 
++static class JsInitHelperType
++{
++public:
++	JsInitHelperType() { JS_Init(); }
++	~JsInitHelperType() { JS_ShutDown(); }
++} JsInitHelper;
++
+ struct _PolkitBackendJsAuthorityPrivate
+ {
+   gchar **rules_dirs;
+@@ -589,7 +596,6 @@ polkit_backend_js_authority_finalize (GObject *object)
+   delete authority->priv->js_polkit;
+ 
+   JS_DestroyContext (authority->priv->cx);
+-  /* JS_ShutDown (); */
+ 
+   G_OBJECT_CLASS (polkit_backend_js_authority_parent_class)->finalize (object);
+ }
+@@ -665,8 +671,6 @@ polkit_backend_js_authority_class_init (PolkitBackendJsAuthorityClass *klass)
+ 
+ 
+   g_type_class_add_private (klass, sizeof (PolkitBackendJsAuthorityPrivate));
+-
+-  JS_Init ();
+ }
+ 
+ /* ---------------------------------------------------------------------------------------------------- */
diff --git a/meta-oe/recipes-extended/polkit/polkit_0.119.bb b/meta-oe/recipes-extended/polkit/polkit_0.119.bb
index 66bbf735f..bf160053d 100644
--- a/meta-oe/recipes-extended/polkit/polkit_0.119.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_0.119.bb
@@ -5,7 +5,7 @@ LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=155db86cdbafa7532b41f390409283eb \
                     file://src/polkit/polkit.h;beginline=1;endline=20;md5=0a8630b0133176d0504c87a0ded39db4"
 
-DEPENDS = "expat glib-2.0 intltool-native duktape"
+DEPENDS = "expat glib-2.0 intltool-native"
 
 inherit autotools gtk-doc pkgconfig useradd systemd gobject-introspection features_check
 
@@ -14,6 +14,7 @@ REQUIRED_DISTRO_FEATURES = "polkit"
 PACKAGECONFIG = "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
                  ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', \
                     bb.utils.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d), d)} \
+                 mozjs \
                 "
 
 PACKAGECONFIG[pam] = "--with-authfw=pam,--with-authfw=shadow,libpam,libpam"
@@ -21,20 +22,32 @@ PACKAGECONFIG[systemd] = "--enable-libsystemd-login=yes --with-systemdsystemunit
 # there is no --enable/--disable option for consolekit and it's not picked by shlibs, so add it to RDEPENDS
 PACKAGECONFIG[consolekit] = ",,,consolekit"
 
+# Default to mozjs javascript library
+PACKAGECONFIG[mozjs] = ",,mozjs-91,,,duktape"
+# duktape javascript engine is much smaller and faster but is not compatible with
+# same javascript standards as mozjs. For example array.includes() function is not
+# supported. Test rule compatibility when switching to duktape.
+PACKAGECONFIG[duktape] = "--with-duktape,,duktape,,,mozjs"
+
+MOZJS_PATCHES = "\
+    file://0002-jsauthority-port-to-mozjs-91.patch \
+    file://0003-jsauthority-ensure-to-call-JS_Init-and-JS_ShutDown-e.patch \
+"
+DUKTAPE_PATCHES = "file://0003-Added-support-for-duktape-as-JS-engine.patch"
 PAM_SRC_URI = "file://polkit-1_pam.patch"
 SRC_URI = "http://www.freedesktop.org/software/polkit/releases/polkit-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
+           ${@bb.utils.contains('PACKAGECONFIG', 'mozjs', '${MOZJS_PATCHES}', '', d)} \
+           ${@bb.utils.contains('PACKAGECONFIG', 'duktape', '${DUKTAPE_PATCHES}', '', d)} \
            file://0003-make-netgroup-support-optional.patch \
            file://0001-pkexec-local-privilege-escalation-CVE-2021-4034.patch \
            file://0002-CVE-2021-4115-GHSL-2021-077-fix.patch \
-           file://0003-Added-support-for-duktape-as-JS-engine.patch \
            "
 SRC_URI[sha256sum] = "c8579fdb86e94295404211285fee0722ad04893f0213e571bd75c00972fd1f5c"
 
 EXTRA_OECONF = "--with-os-type=moblin \
                 --disable-man-pages \
                 --disable-libelogind \
-                --with-duktape \
                "
 
 do_configure:prepend () {
-- 
2.20.1


