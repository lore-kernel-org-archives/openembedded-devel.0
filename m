Return-Path: <brendank310@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id C3371791FA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 16:41:43 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id l9-v6so9956680qtj.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 09:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TwhNEkOWah1YrrksFsxnZreSh8VxO0mJudeWXCuC7Fw=;
	b=ndc8itZxSN2TGqNzw/QuCSAOkgD3HBZPpRIiKosj2wByGmecnN0JkpfUWtNArYxzxf
	f+kxcM4k9rGIGMhRBpPhslW7h3Cw1ec1VlPnXLmV5WMVi6gQGv+Slbeez8H1K0hFdsxK
	jelQ7zyW9uW/pylEc5kYxcQYxOApwO8Dx1pn07l1HzlMLiRNjasjuQqNTuALJfGnmtDg
	7+0ipwJzWpmaUg5YZGVZqLGPj9p/e6NvJOLnAOvzFxuTf9ofmURa/MGAgCdOquPdvriI
	MRITwmvxTbEph6gran+1If8uRzrwAdHeni3QyEnE7CNPK7ylk6O747EuwxgvHfsHS2ZE
	hPKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TwhNEkOWah1YrrksFsxnZreSh8VxO0mJudeWXCuC7Fw=;
	b=Ultmd+aKjINIidA5v2+hbQPwuEqPbJEAVSjzsaXGngxkZeQgIo4ZPrDJQixVvzO/XB
	OIsMCT+yACZCGngJQ/ahbk+NmQLluc2/lzgTJ2iM+bP4H/QXzVlfPMu7UnYDDL9lrBag
	Rrr/O7ssNQulenNPB1ObBS1UGDSNrcf0gMNBsT0WXxLlmzD6alXJF+u27kuG/N0RcF5R
	N3TWveNg11jPpNafNO1XowWPrFNNEpI+Sg0Atxe+VYzQ54zCZNRKdOrx9ZiwRI7CJaTt
	eGVMNtCay6H/9242xJid7RFENWSXznFgV54PyM3gaGUJwwre4BJVcQC3gyox4qa/FEHK
	ZvGg==
X-Gm-Message-State: AGRZ1gJTbGaNNSpA8Gb6ygvEeWfjtDTGJ/GJJCUi84XR7TNg3sNITDRI
	KEmCyUo+/ayCITHLTxKEL7GO+5kx
X-Google-Smtp-Source: AJdET5cRoF4kpBsvoPyUwMI+qLltZjdDV9obJI5mGGt2LcVHvq9H6pYHtFrNWDspXCGLMA5JrxNRAw==
X-Received: by 2002:a0c:a425:: with SMTP id w34mr13823635qvw.160.1540831304230;
	Mon, 29 Oct 2018 09:41:44 -0700 (PDT)
Received: from localhost.localdomain (209-217-208-226.northland.net.
	[209.217.208.226]) by smtp.gmail.com with ESMTPSA id
	i2-v6sm13471476qkf.42.2018.10.29.09.41.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Oct 2018 09:41:43 -0700 (PDT)
From: brendank310 <brendank310@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Oct 2018 12:41:00 -0400
Message-Id: <b40eac3600551dd8e597cbf1cbdec7b78c038711.1540830650.git.brendank310@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1540830650.git.brendank310@gmail.com>
References: <cover.1540830650.git.brendank310@gmail.com>
Cc: schnitzeltony@googlemail.com
Subject: [RFC meta-gnome][PATCH 03/16] gjs: add a recipe for gjs (Gnome JavaScript engine)
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
X-List-Received-Date: Mon, 29 Oct 2018 16:41:44 -0000

From: Brendan Kerrigan <kerriganb@ainfosec.com>

Currently this hacks up gjs a little bit and relies on a
specific SRCREV to sidestep the need for mozjs60 support
(use mozjs52 instead).

Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
---
 .../gnome3/gjs/0001-fix-override-allow.patch  | 75 +++++++++++++++++++
 meta-gnome/recipes-gnome/gnome3/gjs_git.bb    | 30 ++++++++
 2 files changed, 105 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome3/gjs/0001-fix-override-allow.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome3/gjs_git.bb

diff --git a/meta-gnome/recipes-gnome/gnome3/gjs/0001-fix-override-allow.patch b/meta-gnome/recipes-gnome/gnome3/gjs/0001-fix-override-allow.patch
new file mode 100644
index 000000000..fc152db1d
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome3/gjs/0001-fix-override-allow.patch
@@ -0,0 +1,75 @@
+gjs: Fix broken override GInterface properties
+
+  [gjs Ticket #186] -- https://gitlab.gnome.org/GNOME/gjs/issues/186
+ 
+  Overriding introspected GObjectInterface properties 
+  
+  Signed-off-by: Philip Chimento <philip.chimento@gmail.com>
+  
+  The patch was imported from the gjs git server
+  (git://gitlab.gnome.org/GNOME/gjs) with a commit id of
+  322ffab6b0b24ab0ce36079642021d969b081730.
+
+  Upstream-status: Backport
+  
+  This recipe can move to tracking a more appropriate revision
+  once a recipe for building mozjs60 is created, and then this
+  patch can be dropped.
+
+  Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
+diff --git a/gi/object.cpp b/gi/object.cpp
+index 2b2265da..70032736 100644
+--- a/gi/object.cpp
++++ b/gi/object.cpp
+@@ -717,7 +717,11 @@ bool ObjectPrototype::lazy_define_gobject_property(JSContext* cx,
+     JS::RootedValue private_id(cx, JS::StringValue(JSID_TO_STRING(id)));
+     if (!gjs_define_property_dynamic(
+             cx, obj, name, "gobject_prop", &ObjectBase::prop_getter,
+-            &ObjectBase::prop_setter, private_id, GJS_MODULE_PROP_FLAGS))
++            &ObjectBase::prop_setter, private_id,
++            // Make property configurable so that interface properties can be
++            // overridden by GObject.ParamSpec.override in the class that
++            // implements them
++            GJS_MODULE_PROP_FLAGS & ~JSPROP_PERMANENT))
+         return false;
+ 
+     *resolved = true;
+diff --git a/installed-tests/js/testGObjectInterface.js b/installed-tests/js/testGObjectInterface.js
+index 9eab9746..daefb683 100644
+--- a/installed-tests/js/testGObjectInterface.js
++++ b/installed-tests/js/testGObjectInterface.js
+@@ -84,6 +84,22 @@ const ImplementationOfTwoInterfaces = GObject.registerClass({
+     }
+ });
+ 
++const ImplementationOfIntrospectedInterface = GObject.registerClass({
++    Implements: [Gio.Action],
++    Properties: {
++        'enabled': GObject.ParamSpec.override('enabled', Gio.Action),
++        'name': GObject.ParamSpec.override('name', Gio.Action),
++        'state': GObject.ParamSpec.override('state', Gio.Action),
++        'state-type': GObject.ParamSpec.override('state-type', Gio.Action),
++        'parameter-type': GObject.ParamSpec.override('parameter-type',
++            Gio.Action)
++    }
++}, class ImplementationOfIntrospectedInterface extends GObject.Object {
++    get name() {
++        return 'inaction';
++    }
++});
++
+ describe('GObject interface', function () {
+     it('cannot be instantiated', function () {
+         expect(() => new AGObjectInterface()).toThrow();
+@@ -247,6 +263,11 @@ describe('GObject interface', function () {
+             253, 'testGObjectMustOverrideInterfaceProperties');
+     });
+ 
++    it('can have introspected properties overriden', function() {
++        let obj = new ImplementationOfIntrospectedInterface();
++        expect(obj.name).toEqual('inaction');
++    });
++
+     it('can be implemented by a class as well as its parent class', function () {
+         const SubObject = GObject.registerClass(
+             class SubObject extends GObjectImplementingGObjectInterface {});
diff --git a/meta-gnome/recipes-gnome/gnome3/gjs_git.bb b/meta-gnome/recipes-gnome/gnome3/gjs_git.bb
new file mode 100644
index 000000000..db62f507f
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome3/gjs_git.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "GNOME JavaScript engine"
+LICENSE = "MIT|LGPLv2+"
+DEPENDS = " \
+            glib-2.0 \
+            gsettings-desktop-schemas \
+            mozjs \
+            cairo \
+          "
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=beb29cf17fabe736f0639b09ee6e76fa"
+
+SRC_URI = "git://gitlab.gnome.org/GNOME/gjs.git;protocol=http;branch=master \
+           file://0001-fix-override-allow.patch \
+           "
+
+# Last pre-mozjs60 merge commit. Once mozjs is upreved from 52->60,
+# we can select a more sane version.
+SRCREV="f2a8ca3dcfee06e03ae344932537951bc4d7739c"
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig gobject-introspection
+EXTRA_OECONF += " --without-dbus-tests "
+
+FILES_${PN} += "${datadir}"
+
+do_configure_prepend() {
+	export GI_DATADIR="${RECIPE_SYSROOT_NATIVE}${datadir}/gobject-introspection-1.0"
+	sed -i 's#mozjs-17#mozjs-52#g' ${S}/configure.ac
+}
+
-- 
2.17.1


