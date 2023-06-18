Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9560BEB64D7
	for <webhook@archiver.kernel.org>; Sun, 18 Jun 2023 21:06:32 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.13529.1687122391751594223
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Jun 2023 14:06:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=kTaNIODN;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-54f85f8b961so2115336a12.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 Jun 2023 14:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687122391; x=1689714391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v1wNlA08Rrx/IGAT8yPPMFdzLlkGdci0ZpGRO8TQka4=;
        b=kTaNIODNIQ5CpDVXWsQkPDjZJ/IP38Xy5/eiKcAsUqzZCW20Xmam8A4nFrmVRq6ccF
         bgQ/pCY1EWEFtPJr4xsi1uGCw0/yd7Di/sayZ2VKAkkXV4chcYQcKG7MGvwHOmUoglUW
         T5rh+86io+0x8rVHN6rkQ/S3QT+2xBV6wdE5tZeGe6WVzE4iWimMtOwTn+IzDz6H8AP0
         Gu2tTcIkOk5u3BHndpgHYIFXRGWoVUphTsaYCrPBZsGxWP2sz6r9zdvaxeUHfR8lFoya
         WnH/Fxh3ImE/O0ztjlvMwefNRm/xyNnPRsXOB51o/hQmUfIuPnjnJminJzoEqnTOtCte
         sE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687122391; x=1689714391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v1wNlA08Rrx/IGAT8yPPMFdzLlkGdci0ZpGRO8TQka4=;
        b=hdbkgeQfFUk2qrHuIWv5dwhrSzD6LN8Xr3xCn12EwgEatrfPNB+dzxtWPNOExPxTEz
         phj0hTlHKDXiawUrIauiB4z+9f4VBAiEIpzqPnyypwPp1LFhngHK3zgz35Zj4KIAKFlx
         If7f9sMxBZ1dTCfzAh2KnTWiSfjmIGitnv7pJRS+Lqkesxb+XqkjFfboDdIgKbvPQSpD
         ppOti7c0GUPp7Qw888Q+yDWiAwU4lqkDqaDRHQl87BJwzQQP9m9GqkIfzAHCbOwe5jLi
         tbqi0GqasaIyfxEJ1nulAdbmgCgjgnE8Wfsk50IbnXXEE31SlZoDozWXNvcWNqJpaaHh
         cvCg==
X-Gm-Message-State: AC+VfDzA9K3y2ijCEenfu1MAZ/jW3UheOPcDIGXadhCGXYKsx3Qo5a+V
	3DfWpIdW38801EVbJ3YLCQF50R8H9pI=
X-Google-Smtp-Source: ACHHUZ6qBUek7JJW3pnHhNcM2kSytNB9/Jft8bFfJ9ToUdQH0ftB5ijFnPteVKS9BbrlvlSfWPbPug==
X-Received: by 2002:a17:90a:1cb:b0:25e:89ae:3092 with SMTP id 11-20020a17090a01cb00b0025e89ae3092mr8206020pjd.38.1687122390475;
        Sun, 18 Jun 2023 14:06:30 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::eb87])
        by smtp.gmail.com with ESMTPSA id f62-20020a17090a704400b0024749e7321bsm4791368pjk.6.2023.06.18.14.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jun 2023 14:06:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Alexander Kanavin <alex@linutronix.de>
Subject: [meta-gnome][PATCH] geary: Fix build with vala >= 0.56.8
Date: Sun, 18 Jun 2023 14:06:27 -0700
Message-ID: <20230618210627.582337-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 Jun 2023 21:06:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103355

Backport two patches from main branch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>
---
 ...ng-type-arguments-for-interfaces-to-.patch |  59 +++++++
 ...t-Fix-non-null-build-with-newer-vala.patch | 156 ++++++++++++++++++
 .../recipes-connectivity/geary/geary_43.0.bb  |   2 +
 3 files changed, 217 insertions(+)
 create mode 100644 meta-gnome/recipes-connectivity/geary/geary/0001-client-Add-missing-type-arguments-for-interfaces-to-.patch
 create mode 100644 meta-gnome/recipes-connectivity/geary/geary/0001-vala-unit-Fix-non-null-build-with-newer-vala.patch

diff --git a/meta-gnome/recipes-connectivity/geary/geary/0001-client-Add-missing-type-arguments-for-interfaces-to-.patch b/meta-gnome/recipes-connectivity/geary/geary/0001-client-Add-missing-type-arguments-for-interfaces-to-.patch
new file mode 100644
index 0000000000..e5f0cb434d
--- /dev/null
+++ b/meta-gnome/recipes-connectivity/geary/geary/0001-client-Add-missing-type-arguments-for-interfaces-to-.patch
@@ -0,0 +1,59 @@
+From 19dddc4b8acaeefc505e1b45f53048901839aede Mon Sep 17 00:00:00 2001
+From: Rico Tzschichholz <ricotz@ubuntu.com>
+Date: Sat, 8 Apr 2023 13:06:50 +0200
+Subject: [PATCH] client: Add missing type-arguments for interfaces to fix build with newer vala
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/geary/-/commit/4a7ca820b1d3d6130fedf254dc5b4cd7efb58f2c]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/client/accounts/accounts-editor-row.vala          | 2 +-
+ src/client/accounts/accounts-editor-servers-pane.vala | 6 +++---
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/client/accounts/accounts-editor-row.vala b/src/client/accounts/accounts-editor-row.vala
+index 6e7ac2ab..70223d71 100644
+--- a/src/client/accounts/accounts-editor-row.vala
++++ b/src/client/accounts/accounts-editor-row.vala
+@@ -386,7 +386,7 @@ private abstract class Accounts.ServiceRow<PaneType,V> : AccountRow<PaneType,V>
+ 
+ 
+ /** Interface for rows that use a validator for editable values. */
+-internal interface Accounts.ValidatingRow : EditorRow {
++internal interface Accounts.ValidatingRow<PaneType> : EditorRow<PaneType> {
+ 
+ 
+     /** The row's validator */
+diff --git a/src/client/accounts/accounts-editor-servers-pane.vala b/src/client/accounts/accounts-editor-servers-pane.vala
+index 8bd9bde1..982acd5c 100644
+--- a/src/client/accounts/accounts-editor-servers-pane.vala
++++ b/src/client/accounts/accounts-editor-servers-pane.vala
+@@ -694,7 +694,7 @@ private class Accounts.SaveSentRow :
+ 
+ 
+ private class Accounts.ServiceHostRow :
+-    ServiceRow<EditorServersPane,Gtk.Entry>, ValidatingRow {
++    ServiceRow<EditorServersPane,Gtk.Entry>, ValidatingRow<EditorServersPane> {
+ 
+ 
+     public Components.Validator validator {
+@@ -848,7 +848,7 @@ private class Accounts.ServiceSecurityRow :
+ 
+ 
+ private class Accounts.ServiceLoginRow :
+-    ServiceRow<EditorServersPane,Gtk.Entry>, ValidatingRow {
++    ServiceRow<EditorServersPane,Gtk.Entry>, ValidatingRow<EditorServersPane> {
+ 
+ 
+     public Components.Validator validator {
+@@ -972,7 +972,7 @@ private class Accounts.ServiceLoginRow :
+ 
+ 
+ private class Accounts.ServicePasswordRow :
+-    ServiceRow<EditorServersPane,Gtk.Entry>, ValidatingRow {
++    ServiceRow<EditorServersPane,Gtk.Entry>, ValidatingRow<EditorServersPane> {
+ 
+ 
+     public Components.Validator validator {
+-- 
+2.41.0
+
diff --git a/meta-gnome/recipes-connectivity/geary/geary/0001-vala-unit-Fix-non-null-build-with-newer-vala.patch b/meta-gnome/recipes-connectivity/geary/geary/0001-vala-unit-Fix-non-null-build-with-newer-vala.patch
new file mode 100644
index 0000000000..11ed6ae3a5
--- /dev/null
+++ b/meta-gnome/recipes-connectivity/geary/geary/0001-vala-unit-Fix-non-null-build-with-newer-vala.patch
@@ -0,0 +1,156 @@
+From 116aead44e01e046f83931574980991df66f69c3 Mon Sep 17 00:00:00 2001
+From: Rico Tzschichholz <ricotz@ubuntu.com>
+Date: Fri, 14 Apr 2023 09:42:23 +0200
+Subject: [PATCH] vala-unit: Fix non-null build with newer vala
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/geary/-/commit/10f9c133a2ad515127d65f3bba13a0d91b75f4af]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../vala-unit/src/collection-assertions.vala   | 12 ++++++------
+ subprojects/vala-unit/src/mock-object.vala     |  6 +++---
+ subprojects/vala-unit/src/test-assertions.vala | 18 +++++++++---------
+ 3 files changed, 18 insertions(+), 18 deletions(-)
+
+diff --git a/subprojects/vala-unit/src/collection-assertions.vala b/subprojects/vala-unit/src/collection-assertions.vala
+index 3b34acda..29223a0d 100644
+--- a/subprojects/vala-unit/src/collection-assertions.vala
++++ b/subprojects/vala-unit/src/collection-assertions.vala
+@@ -256,7 +256,7 @@ internal class ValaUnit.ArrayCollectionAssertion<E> : GLib.Object,
+ 
+     public CollectionAssertions<E> contains(E expected)
+         throws GLib.Error {
+-        E boxed_expected = box_value(expected);
++        E? boxed_expected = box_value(expected);
+         bool found = false;
+         for (int i = 0; i < this.actual.length; i++) {
+             try {
+@@ -281,7 +281,7 @@ internal class ValaUnit.ArrayCollectionAssertion<E> : GLib.Object,
+ 
+     public CollectionAssertions<E> not_contains(E expected)
+         throws GLib.Error {
+-        E boxed_expected = box_value(expected);
++        E? boxed_expected = box_value(expected);
+         for (int i = 0; i < this.actual.length; i++) {
+             try {
+                 assert_equal(box_value(this.actual[i]), boxed_expected);
+@@ -312,8 +312,8 @@ internal class ValaUnit.ArrayCollectionAssertion<E> : GLib.Object,
+                 this.context
+             );
+         }
+-        E boxed_actual = box_value(this.actual[index]);
+-        E boxed_expected = box_value(expected);
++        E? boxed_actual = box_value(this.actual[index]);
++        E? boxed_expected = box_value(expected);
+         try {
+             assert_equal(boxed_actual, boxed_expected);
+         } catch (TestError.FAILED err) {
+@@ -453,8 +453,8 @@ internal class ValaUnit.GeeCollectionAssertion<E> :
+         for (int i = 0; i <= index; i++) {
+             iterator.next();
+         }
+-        E boxed_actual = box_value(iterator.get());
+-        E boxed_expected = box_value(expected);
++        E? boxed_actual = box_value(iterator.get());
++        E? boxed_expected = box_value(expected);
+         try {
+             assert_equal(boxed_actual, boxed_expected);
+         } catch (TestError.FAILED err) {
+diff --git a/subprojects/vala-unit/src/mock-object.vala b/subprojects/vala-unit/src/mock-object.vala
+index 766777a4..eb086e10 100644
+--- a/subprojects/vala-unit/src/mock-object.vala
++++ b/subprojects/vala-unit/src/mock-object.vala
+@@ -138,7 +138,7 @@ public interface ValaUnit.MockObject : GLib.Object, TestAssertions {
+         throws GLib.Error {
+         assert_false(this.expected.is_empty, "Unexpected call: %s".printf(name));
+ 
+-        ExpectedCall expected = this.expected.poll();
++        ExpectedCall expected = (!) this.expected.poll();
+         assert_equal(name, expected.name, "Unexpected call");
+         if (expected.expected_args != null) {
+             assert_args(args, expected.expected_args, "Call %s".printf(name));
+@@ -229,7 +229,7 @@ public interface ValaUnit.MockObject : GLib.Object, TestAssertions {
+                                           R default_return)
+         throws GLib.Error {
+         check_for_exception(expected);
+-        R? return_object = default_return;
++        R return_object = default_return;
+         if (expected.return_object != null) {
+             return_object = (R) expected.return_object;
+         }
+@@ -243,7 +243,7 @@ public interface ValaUnit.MockObject : GLib.Object, TestAssertions {
+         if (expected.return_object == null) {
+             throw default_error;
+         }
+-        return expected.return_object;
++        return (!) expected.return_object;
+     }
+ 
+     private inline void check_for_exception(ExpectedCall expected)
+diff --git a/subprojects/vala-unit/src/test-assertions.vala b/subprojects/vala-unit/src/test-assertions.vala
+index 784dd9fd..e61fdf82 100644
+--- a/subprojects/vala-unit/src/test-assertions.vala
++++ b/subprojects/vala-unit/src/test-assertions.vala
+@@ -21,8 +21,8 @@ namespace ValaUnit {
+ 
+     }
+ 
+-    internal inline void assert_equal<T>(T actual,
+-                                         T expected,
++    internal inline void assert_equal<T>(T? actual,
++                                         T? expected,
+                                          string? context = null)
+         throws TestError {
+         if ((actual == null && expected != null) ||
+@@ -107,9 +107,9 @@ namespace ValaUnit {
+      *
+      * This will only work when the values are not already boxed.
+      */
+-    internal T box_value<T>(T value) {
++    internal T? box_value<T>(T value) {
+         var type = typeof(T);
+-        T boxed = value;
++        T? boxed = value;
+ 
+         if (type == typeof(int) || type.is_enum()) {
+             int actual = (int) value;
+@@ -133,7 +133,7 @@ namespace ValaUnit {
+         return boxed;
+     }
+ 
+-    internal string to_display_string<T>(T value) {
++    internal string to_display_string<T>(T? value) {
+         var type = typeof(T);
+         var display = "";
+ 
+@@ -191,8 +191,8 @@ namespace ValaUnit {
+         );
+     }
+ 
+-    private void assert_equal_enum<T>(T actual,
+-                                      T expected,
++    private void assert_equal_enum<T>(T? actual,
++                                      T? expected,
+                                       string? context)
+         throws TestError {
+         int actual_val = (int) ((int?) actual);
+@@ -342,7 +342,7 @@ public interface ValaUnit.TestAssertions : GLib.Object {
+ 
+ 
+     /** Asserts a value is null */
+-    public void assert_non_null<T>(T actual, string? context = null)
++    public void assert_non_null<T>(T? actual, string? context = null)
+         throws TestError {
+         if (actual == null) {
+             ValaUnit.assert(
+@@ -353,7 +353,7 @@ public interface ValaUnit.TestAssertions : GLib.Object {
+     }
+ 
+     /** Asserts a value is null */
+-    public void assert_is_null<T>(T actual, string? context = null)
++    public void assert_is_null<T>(T? actual, string? context = null)
+         throws TestError {
+         if (actual != null) {
+             ValaUnit.assert(
+-- 
+2.41.0
+
diff --git a/meta-gnome/recipes-connectivity/geary/geary_43.0.bb b/meta-gnome/recipes-connectivity/geary/geary_43.0.bb
index ff7a9ee694..6085d94fdc 100644
--- a/meta-gnome/recipes-connectivity/geary/geary_43.0.bb
+++ b/meta-gnome/recipes-connectivity/geary/geary_43.0.bb
@@ -36,6 +36,8 @@ inherit meson pkgconfig mime-xdg gtk-icon-cache gobject-introspection vala featu
 SRC_URI = " \
 	git://github.com/GNOME/geary.git;nobranch=1;protocol=https \
 	file://0001-meson-Use-PKG_CONFIG_SYSROOT_DIR-when-using-pkg-conf.patch \
+	file://0001-client-Add-missing-type-arguments-for-interfaces-to-.patch \
+	file://0001-vala-unit-Fix-non-null-build-with-newer-vala.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.41.0


