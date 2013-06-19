Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id CFB636AD4E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 17:29:52 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id e49so3358521eek.34
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 10:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=BS4SFdNNuFuM25qK01f10qowyAjw5bnKdVtyipfCAQA=;
	b=If8S6hplKhsCiZxZqwv9zb52cEMmO4GXpzpOemuTzY5lf/xqwjXDSDjpkrYSrs/Dfy
	NsSPOB0YqRBMlZoRtmL9uUUW5wZJwJVkaYRYsw4HmWxpfWX2h7XN2LyX5vHnnIw7iIaC
	QsD6n5mE/3T/r2D4KYDZUPMRvC1tY36xz2gw7DUNWCqGPYkmvR2FXfdq80HpPFlUbGsi
	/ddhrudyOjJSyz/f1+8IwtJTkhLJiMhakLt4rUe4VgfbjgeWLVuKvradi0LuvTmt4Ny4
	CItPeRDhQLfYp1PEqaGNV9Z0s9HLnvU/XYFqBPwyQ8IjJMMk9jB9erv0ONdrJ8xzMjyN
	djAw==
X-Received: by 10.15.51.202 with SMTP id n50mr3592389eew.39.1371662993560;
	Wed, 19 Jun 2013 10:29:53 -0700 (PDT)
Received: from localhost.localdomain (p5B0A06AC.dip0.t-ipconnect.de.
	[91.10.6.172]) by mx.google.com with ESMTPSA id
	n42sm38290045eeh.15.2013.06.19.10.29.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 19 Jun 2013 10:29:52 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Jun 2013 19:29:16 +0200
Message-Id: <1371662967-31734-10-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1371662967-31734-1-git-send-email-schnitzeltony@googlemail.com>
References: <1371662967-31734-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome/meta-oe/meta-xfce/V2 09/20] mozjs: initial add 17.0.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Jun 2013 17:29:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

later versions of polkit will need it

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...-not-include-RequiredDefines.h-for-depend.patch |   35 ++++++++++++++++++++
 meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb     |   35 ++++++++++++++++++++
 2 files changed, 70 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs/0001-js.pc.in-do-not-include-RequiredDefines.h-for-depend.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb

diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0001-js.pc.in-do-not-include-RequiredDefines.h-for-depend.patch b/meta-oe/recipes-extended/mozjs/mozjs/0001-js.pc.in-do-not-include-RequiredDefines.h-for-depend.patch
new file mode 100644
index 0000000..bc141d9
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs/0001-js.pc.in-do-not-include-RequiredDefines.h-for-depend.patch
@@ -0,0 +1,35 @@
+From 0a61b0b98c152f10404ccbdeeac583a486638a7a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Thu, 6 Jun 2013 18:36:01 +0200
+Subject: [PATCH] js.pc.in: do not include RequiredDefines.h for depending
+ packages
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+in our cross environment the would fail with:
+
+| cc1: fatal error: /usr/include/js-17.0/js/RequiredDefines.h: No such file or directory
+
+and currently it only defines __STDC_LIMIT_MACROS
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ js.pc.in |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/js.pc.in b/js.pc.in
+index 13d761d..a95a7bd 100644
+--- a/js.pc.in
++++ b/js.pc.in
+@@ -8,4 +8,4 @@ Description: The Mozilla library for JavaScript
+ Version: @MOZILLA_VERSION@
+ Requires.private: @NSPR_PKGCONF_CHECK@
+ Libs: -L${libdir} -l@LIBRARY_NAME@
+-Cflags: -include ${includedir}/@MODULE@/js/RequiredDefines.h -I${includedir}/@MODULE@
++Cflags: -I${includedir}/@MODULE@
+-- 
+1.7.6.5
+
diff --git a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
new file mode 100644
index 0000000..311372f
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
@@ -0,0 +1,35 @@
+SUMMARY = "SpiderMonkey is Mozilla's JavaScript engine written in C/C++"
+LICENSE = "MPL-2.0"
+LIC_FILES_CHKSUM = "file://../../LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
+
+SRC_URI = " \
+    http://ftp.mozilla.org/pub/mozilla.org/js/${PN}${PV}.tar.gz \
+    file://0001-js.pc.in-do-not-include-RequiredDefines.h-for-depend.patch \
+"
+SRC_URI[md5sum] = "20b6f8f1140ef6e47daa3b16965c9202"
+SRC_URI[sha256sum] = "321e964fe9386785d3bf80870640f2fa1c683e32fe988eeb201b04471c172fba"
+
+S = "${WORKDIR}/${PN}${PV}/js/src"
+
+inherit autotools pkgconfig perlnative
+
+DEPENDS += "nspr"
+
+# nspr's package-config is ignored so set libs manually
+EXTRA_OECONF = " \
+    --target=${TARGET_SYS} \
+    --host=${BUILD_SYS} \
+    --build=${BUILD_SYS} \
+    --prefix=${prefix} \
+    --with-nspr-libs='-lplds4 -lplc4 -lnspr4' \
+    --enable-threadsafe \
+"
+
+# mozjs requires autoreconf 2.13
+do_configure() {
+    ./configure ${EXTRA_OECONF}
+}
+
+PACKAGES =+ "lib${PN}"
+FILES_lib${PN} += "${libdir}/lib*.so"
+FILES_${PN}-dev += "${bindir}/js17-config"
-- 
1.7.4.4


