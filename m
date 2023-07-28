Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 022A7C001DF
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 12:25:57 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.30960.1690547154827360805
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jul 2023 05:25:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout02.t-online.de (Postfix) with SMTP id D9E70CB82
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Jul 2023 14:25:52 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.41.87]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qPMXU-0Ukj7h0; Fri, 28 Jul 2023 14:25:48 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] geary: update 43.0 -> 44.0
Date: Fri, 28 Jul 2023 14:25:26 +0200
Message-Id: <20230728122526.248712-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1690547148-737FD980-179CAB08/0/0 CLEAN NORMAL
X-TOI-MSGID: 8abba6eb-090c-4aa2-8c6a-195cc64e7499
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jul 2023 12:25:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104071

- remove unneeded patches
---
 ...ng-type-arguments-for-interfaces-to-.patch |  59 -------
 ...t-Fix-non-null-build-with-newer-vala.patch | 156 ------------------
 .../geary/{geary_43.0.bb =3D> geary_44.0.bb}    |   4 +-
 3 files changed, 1 insertion(+), 218 deletions(-)
 delete mode 100644 meta-gnome/recipes-connectivity/geary/geary/0001-clie=
nt-Add-missing-type-arguments-for-interfaces-to-.patch
 delete mode 100644 meta-gnome/recipes-connectivity/geary/geary/0001-vala=
-unit-Fix-non-null-build-with-newer-vala.patch
 rename meta-gnome/recipes-connectivity/geary/{geary_43.0.bb =3D> geary_4=
4.0.bb} (89%)

diff --git a/meta-gnome/recipes-connectivity/geary/geary/0001-client-Add-=
missing-type-arguments-for-interfaces-to-.patch b/meta-gnome/recipes-conn=
ectivity/geary/geary/0001-client-Add-missing-type-arguments-for-interface=
s-to-.patch
deleted file mode 100644
index e5f0cb434d..0000000000
--- a/meta-gnome/recipes-connectivity/geary/geary/0001-client-Add-missing=
-type-arguments-for-interfaces-to-.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 19dddc4b8acaeefc505e1b45f53048901839aede Mon Sep 17 00:00:00 2001
-From: Rico Tzschichholz <ricotz@ubuntu.com>
-Date: Sat, 8 Apr 2023 13:06:50 +0200
-Subject: [PATCH] client: Add missing type-arguments for interfaces to fi=
x build with newer vala
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/geary/-/commit=
/4a7ca820b1d3d6130fedf254dc5b4cd7efb58f2c]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/client/accounts/accounts-editor-row.vala          | 2 +-
- src/client/accounts/accounts-editor-servers-pane.vala | 6 +++---
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/client/accounts/accounts-editor-row.vala b/src/client/a=
ccounts/accounts-editor-row.vala
-index 6e7ac2ab..70223d71 100644
---- a/src/client/accounts/accounts-editor-row.vala
-+++ b/src/client/accounts/accounts-editor-row.vala
-@@ -386,7 +386,7 @@ private abstract class Accounts.ServiceRow<PaneType,=
V> : AccountRow<PaneType,V>
-=20
-=20
- /** Interface for rows that use a validator for editable values. */
--internal interface Accounts.ValidatingRow : EditorRow {
-+internal interface Accounts.ValidatingRow<PaneType> : EditorRow<PaneTyp=
e> {
-=20
-=20
-     /** The row's validator */
-diff --git a/src/client/accounts/accounts-editor-servers-pane.vala b/src=
/client/accounts/accounts-editor-servers-pane.vala
-index 8bd9bde1..982acd5c 100644
---- a/src/client/accounts/accounts-editor-servers-pane.vala
-+++ b/src/client/accounts/accounts-editor-servers-pane.vala
-@@ -694,7 +694,7 @@ private class Accounts.SaveSentRow :
-=20
-=20
- private class Accounts.ServiceHostRow :
--    ServiceRow<EditorServersPane,Gtk.Entry>, ValidatingRow {
-+    ServiceRow<EditorServersPane,Gtk.Entry>, ValidatingRow<EditorServer=
sPane> {
-=20
-=20
-     public Components.Validator validator {
-@@ -848,7 +848,7 @@ private class Accounts.ServiceSecurityRow :
-=20
-=20
- private class Accounts.ServiceLoginRow :
--    ServiceRow<EditorServersPane,Gtk.Entry>, ValidatingRow {
-+    ServiceRow<EditorServersPane,Gtk.Entry>, ValidatingRow<EditorServer=
sPane> {
-=20
-=20
-     public Components.Validator validator {
-@@ -972,7 +972,7 @@ private class Accounts.ServiceLoginRow :
-=20
-=20
- private class Accounts.ServicePasswordRow :
--    ServiceRow<EditorServersPane,Gtk.Entry>, ValidatingRow {
-+    ServiceRow<EditorServersPane,Gtk.Entry>, ValidatingRow<EditorServer=
sPane> {
-=20
-=20
-     public Components.Validator validator {
---=20
-2.41.0
-
diff --git a/meta-gnome/recipes-connectivity/geary/geary/0001-vala-unit-F=
ix-non-null-build-with-newer-vala.patch b/meta-gnome/recipes-connectivity=
/geary/geary/0001-vala-unit-Fix-non-null-build-with-newer-vala.patch
deleted file mode 100644
index 11ed6ae3a5..0000000000
--- a/meta-gnome/recipes-connectivity/geary/geary/0001-vala-unit-Fix-non-=
null-build-with-newer-vala.patch
+++ /dev/null
@@ -1,156 +0,0 @@
-From 116aead44e01e046f83931574980991df66f69c3 Mon Sep 17 00:00:00 2001
-From: Rico Tzschichholz <ricotz@ubuntu.com>
-Date: Fri, 14 Apr 2023 09:42:23 +0200
-Subject: [PATCH] vala-unit: Fix non-null build with newer vala
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/geary/-/commit=
/10f9c133a2ad515127d65f3bba13a0d91b75f4af]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- .../vala-unit/src/collection-assertions.vala   | 12 ++++++------
- subprojects/vala-unit/src/mock-object.vala     |  6 +++---
- subprojects/vala-unit/src/test-assertions.vala | 18 +++++++++---------
- 3 files changed, 18 insertions(+), 18 deletions(-)
-
-diff --git a/subprojects/vala-unit/src/collection-assertions.vala b/subp=
rojects/vala-unit/src/collection-assertions.vala
-index 3b34acda..29223a0d 100644
---- a/subprojects/vala-unit/src/collection-assertions.vala
-+++ b/subprojects/vala-unit/src/collection-assertions.vala
-@@ -256,7 +256,7 @@ internal class ValaUnit.ArrayCollectionAssertion<E> =
: GLib.Object,
-=20
-     public CollectionAssertions<E> contains(E expected)
-         throws GLib.Error {
--        E boxed_expected =3D box_value(expected);
-+        E? boxed_expected =3D box_value(expected);
-         bool found =3D false;
-         for (int i =3D 0; i < this.actual.length; i++) {
-             try {
-@@ -281,7 +281,7 @@ internal class ValaUnit.ArrayCollectionAssertion<E> =
: GLib.Object,
-=20
-     public CollectionAssertions<E> not_contains(E expected)
-         throws GLib.Error {
--        E boxed_expected =3D box_value(expected);
-+        E? boxed_expected =3D box_value(expected);
-         for (int i =3D 0; i < this.actual.length; i++) {
-             try {
-                 assert_equal(box_value(this.actual[i]), boxed_expected)=
;
-@@ -312,8 +312,8 @@ internal class ValaUnit.ArrayCollectionAssertion<E> =
: GLib.Object,
-                 this.context
-             );
-         }
--        E boxed_actual =3D box_value(this.actual[index]);
--        E boxed_expected =3D box_value(expected);
-+        E? boxed_actual =3D box_value(this.actual[index]);
-+        E? boxed_expected =3D box_value(expected);
-         try {
-             assert_equal(boxed_actual, boxed_expected);
-         } catch (TestError.FAILED err) {
-@@ -453,8 +453,8 @@ internal class ValaUnit.GeeCollectionAssertion<E> :
-         for (int i =3D 0; i <=3D index; i++) {
-             iterator.next();
-         }
--        E boxed_actual =3D box_value(iterator.get());
--        E boxed_expected =3D box_value(expected);
-+        E? boxed_actual =3D box_value(iterator.get());
-+        E? boxed_expected =3D box_value(expected);
-         try {
-             assert_equal(boxed_actual, boxed_expected);
-         } catch (TestError.FAILED err) {
-diff --git a/subprojects/vala-unit/src/mock-object.vala b/subprojects/va=
la-unit/src/mock-object.vala
-index 766777a4..eb086e10 100644
---- a/subprojects/vala-unit/src/mock-object.vala
-+++ b/subprojects/vala-unit/src/mock-object.vala
-@@ -138,7 +138,7 @@ public interface ValaUnit.MockObject : GLib.Object, =
TestAssertions {
-         throws GLib.Error {
-         assert_false(this.expected.is_empty, "Unexpected call: %s".prin=
tf(name));
-=20
--        ExpectedCall expected =3D this.expected.poll();
-+        ExpectedCall expected =3D (!) this.expected.poll();
-         assert_equal(name, expected.name, "Unexpected call");
-         if (expected.expected_args !=3D null) {
-             assert_args(args, expected.expected_args, "Call %s".printf(=
name));
-@@ -229,7 +229,7 @@ public interface ValaUnit.MockObject : GLib.Object, =
TestAssertions {
-                                           R default_return)
-         throws GLib.Error {
-         check_for_exception(expected);
--        R? return_object =3D default_return;
-+        R return_object =3D default_return;
-         if (expected.return_object !=3D null) {
-             return_object =3D (R) expected.return_object;
-         }
-@@ -243,7 +243,7 @@ public interface ValaUnit.MockObject : GLib.Object, =
TestAssertions {
-         if (expected.return_object =3D=3D null) {
-             throw default_error;
-         }
--        return expected.return_object;
-+        return (!) expected.return_object;
-     }
-=20
-     private inline void check_for_exception(ExpectedCall expected)
-diff --git a/subprojects/vala-unit/src/test-assertions.vala b/subproject=
s/vala-unit/src/test-assertions.vala
-index 784dd9fd..e61fdf82 100644
---- a/subprojects/vala-unit/src/test-assertions.vala
-+++ b/subprojects/vala-unit/src/test-assertions.vala
-@@ -21,8 +21,8 @@ namespace ValaUnit {
-=20
-     }
-=20
--    internal inline void assert_equal<T>(T actual,
--                                         T expected,
-+    internal inline void assert_equal<T>(T? actual,
-+                                         T? expected,
-                                          string? context =3D null)
-         throws TestError {
-         if ((actual =3D=3D null && expected !=3D null) ||
-@@ -107,9 +107,9 @@ namespace ValaUnit {
-      *
-      * This will only work when the values are not already boxed.
-      */
--    internal T box_value<T>(T value) {
-+    internal T? box_value<T>(T value) {
-         var type =3D typeof(T);
--        T boxed =3D value;
-+        T? boxed =3D value;
-=20
-         if (type =3D=3D typeof(int) || type.is_enum()) {
-             int actual =3D (int) value;
-@@ -133,7 +133,7 @@ namespace ValaUnit {
-         return boxed;
-     }
-=20
--    internal string to_display_string<T>(T value) {
-+    internal string to_display_string<T>(T? value) {
-         var type =3D typeof(T);
-         var display =3D "";
-=20
-@@ -191,8 +191,8 @@ namespace ValaUnit {
-         );
-     }
-=20
--    private void assert_equal_enum<T>(T actual,
--                                      T expected,
-+    private void assert_equal_enum<T>(T? actual,
-+                                      T? expected,
-                                       string? context)
-         throws TestError {
-         int actual_val =3D (int) ((int?) actual);
-@@ -342,7 +342,7 @@ public interface ValaUnit.TestAssertions : GLib.Obje=
ct {
-=20
-=20
-     /** Asserts a value is null */
--    public void assert_non_null<T>(T actual, string? context =3D null)
-+    public void assert_non_null<T>(T? actual, string? context =3D null)
-         throws TestError {
-         if (actual =3D=3D null) {
-             ValaUnit.assert(
-@@ -353,7 +353,7 @@ public interface ValaUnit.TestAssertions : GLib.Obje=
ct {
-     }
-=20
-     /** Asserts a value is null */
--    public void assert_is_null<T>(T actual, string? context =3D null)
-+    public void assert_is_null<T>(T? actual, string? context =3D null)
-         throws TestError {
-         if (actual !=3D null) {
-             ValaUnit.assert(
---=20
-2.41.0
-
diff --git a/meta-gnome/recipes-connectivity/geary/geary_43.0.bb b/meta-g=
nome/recipes-connectivity/geary/geary_44.0.bb
similarity index 89%
rename from meta-gnome/recipes-connectivity/geary/geary_43.0.bb
rename to meta-gnome/recipes-connectivity/geary/geary_44.0.bb
index bab4f909e0..a585929092 100644
--- a/meta-gnome/recipes-connectivity/geary/geary_43.0.bb
+++ b/meta-gnome/recipes-connectivity/geary/geary_44.0.bb
@@ -36,12 +36,10 @@ inherit meson pkgconfig mime-xdg gtk-icon-cache gobje=
ct-introspection vala featu
 SRC_URI =3D " \
 	git://github.com/GNOME/geary.git;nobranch=3D1;protocol=3Dhttps \
 	file://0001-meson-Use-PKG_CONFIG_SYSROOT_DIR-when-using-pkg-conf.patch =
\
-	file://0001-client-Add-missing-type-arguments-for-interfaces-to-.patch =
\
-	file://0001-vala-unit-Fix-non-null-build-with-newer-vala.patch \
 "
=20
 S =3D "${WORKDIR}/git"
-SRCREV =3D "94d6bec861daffb27efea85a296f347db7a5af6d"
+SRCREV =3D "b72db2a5e87f2269e6359af434a4fc02fca9e9df"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data opengl"
--=20
2.39.3


