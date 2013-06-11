Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 200A36A9DE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 05:37:26 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id g15so5810802eak.18
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jun 2013 22:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=NrbprkHl+a64rft5z6tmS9/1viGGEW7WOlwsEzsyKhI=;
	b=pXc2FuE/l4YJr6ssD0lGQy4OnvoytUk5ilh+jIRE+TfO7w4GUD7E3XaElE7E70NoXQ
	e/WykXIr4EehyKfd1dzgS89BnKeee+ALCf6UW1SiH3ffb4mlZXdA7XwgLjHHAd/9l8zP
	uvDTUOPUVVXFnF0ZKYJgG9MiDYugSkpNpz7yjT+T0wwHxWJRgw26bs/7NrK1n8Z9oUvZ
	5/sJI+ZMRo48cVHTNQrrTr+BP3BJC7OX1eaPN2GwwaqykvltIj0XCQ1s445ZeOMPVQqP
	A2MWZn9/Qb43auLPglpJ7Kx2icqOK61LslCX9a3qfgPHUaBLR4Adr0tk0kiW6oQDaqKr
	4lAg==
X-Received: by 10.15.23.73 with SMTP id g49mr14771770eeu.8.1370929047882;
	Mon, 10 Jun 2013 22:37:27 -0700 (PDT)
Received: from localhost.localdomain (ip-178-202-232-2.unitymediagroup.de.
	[178.202.232.2])
	by mx.google.com with ESMTPSA id y10sm28009517eev.3.2013.06.10.22.37.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 22:37:27 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jun 2013 07:34:30 +0200
Message-Id: <1370928876-14423-10-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1370928876-14423-1-git-send-email-schnitzeltony@googlemail.com>
References: <1370928876-14423-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome/meta-oe/meta-xfce 09/15] mozjs: initial add 17.0.0
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
X-List-Received-Date: Tue, 11 Jun 2013 05:37:27 -0000
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
1.7.6.5


