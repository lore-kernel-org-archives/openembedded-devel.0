Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id EB6746057B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jun 2016 14:30:59 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id m124so18328919wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jun 2016 07:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GNrEmIncYSZr98giNx/3aEAkQskLlKPZtdOwntmzUR0=;
	b=UvjTVdOOR5mAbMk1tCyhNsAY7b2i6xJ9vYHBsIpNX9WRSwsx+NqtHmkk1bIQOv54L3
	lRSIEhCiwp5iGO2R25wMfmPK0CCGVEru5BdkxtMjST/XQmY07Bu+2BlLE4Xhe0KZlkaL
	vSrb7mQ/bryOjhQYO3ZnjprBisfS1KI5Ev1eiHj+p4ooj14eVbJRX0aLJgGLXO8Jj8k7
	1IKZ2aly4D2Ld5PI47jFYd0uoXCi0/bK0AIz2XqwHatA/BGHOJsAqVha0BkgkTJ2Klx6
	3oosft/es5H7R+0i/eGCI3egPY1OSRmi/73BVG/qlSCXwOmE4afZcASa3wi6jM9HezcY
	PZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=GNrEmIncYSZr98giNx/3aEAkQskLlKPZtdOwntmzUR0=;
	b=QTvDF5KN+MOAFv6E5G07acANYPAM423FH212AXVRcvmOcyiUlcE5jmo89P9qS9ZaaQ
	FGCpuPN3G1Z6Tb/mn/Rv/zP/X1zZse9YBqYZHw1LPBsO+tsA53MNn2IfhtHcoeCLE/3r
	sV91mp2SCjfNwOou941ipd5NEknLqpnE/S61cZ9B4fs27bACE4CXlQnQP63KgHfIRfpY
	F2I8kLKZZoBZLm3LF5TV7fJNvHRsJc+BBzcuwAIqHxg9A5cznmNp0Wn63vSXpKW98JS4
	u1142BeKb8nfILLajrh0qF0gZrabOLWHNRnxZSRuiFQeJuToBtuXUR/gexoSl4kj8abN
	+2gw==
X-Gm-Message-State: ALyK8tJHQSL9ZeonniXqwkI4cA6SJgrIdnG7piBDtrW8eTiuJaSCiDHERNJWTuHwE9T+wQ==
X-Received: by 10.194.79.198 with SMTP id l6mr2525877wjx.27.1465569059745;
	Fri, 10 Jun 2016 07:30:59 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	v70sm5858625wmf.18.2016.06.10.07.30.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Jun 2016 07:30:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Jun 2016 16:31:30 +0200
Message-Id: <20160610143131.22311-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <c34b9a92-71a6-fdf8-2a27-b92fc7c9cb86@linux.intel.com>
References: <c34b9a92-71a6-fdf8-2a27-b92fc7c9cb86@linux.intel.com>
Subject: [PATCH 1/2] python-pygobject, python-cloudeebus, python-dbusmock: Blacklist because of python-pygobject is broken
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
X-List-Received-Date: Fri, 10 Jun 2016 14:31:02 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb             | 5 ++++-
 meta-oe/recipes-devtools/python/python-pygobject_3.18.2.bb     | 2 ++
 meta-python/recipes-devtools/python/python-cloudeebus_0.6.0.bb | 3 +++
 meta-python/recipes-devtools/python/python-dbusmock_0.10.1.bb  | 3 +++
 4 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb b/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb
index d6d16c0..05e3daf 100644
--- a/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb
+++ b/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb
@@ -27,7 +27,10 @@ do_install_append() {
 }
 
 RDEPENDS_${PN}-dev = "bluez-hcidump"
-RDEPENDS_${PN}-testtools += "python python-dbus python-pygobject"
+RDEPENDS_${PN}-testtools += "python python-dbus"
+
+# http://lists.openembedded.org/pipermail/openembedded-devel/2016-June/107798.html
+# RDEPENDS_${PN}-testtools += "python-pygobject"
 
 ALLOW_EMPTY_libasound-module-bluez = "1"
 PACKAGES =+ "libasound-module-bluez ${PN}-testtools"
diff --git a/meta-oe/recipes-devtools/python/python-pygobject_3.18.2.bb b/meta-oe/recipes-devtools/python/python-pygobject_3.18.2.bb
index e4eeafb..1c78e26 100644
--- a/meta-oe/recipes-devtools/python/python-pygobject_3.18.2.bb
+++ b/meta-oe/recipes-devtools/python/python-pygobject_3.18.2.bb
@@ -29,3 +29,5 @@ do_install_append() {
     rm ${D}${includedir}/pygobject-3.0/pygobject.h ${D}${libdir}/pkgconfig/pygobject-3.0.pc
 }
 
+# http://lists.openembedded.org/pipermail/openembedded-devel/2016-June/107798.html
+PNBLACKLIST[python-pygobject] ?= "BROKEN: fails to build since it was moved to meta-oe"
diff --git a/meta-python/recipes-devtools/python/python-cloudeebus_0.6.0.bb b/meta-python/recipes-devtools/python/python-cloudeebus_0.6.0.bb
index 120a8a7..d067358 100644
--- a/meta-python/recipes-devtools/python/python-cloudeebus_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python-cloudeebus_0.6.0.bb
@@ -14,6 +14,9 @@ inherit distutils
 DEPENDS_${PN} = "python python-distribute"
 RDEPENDS_${PN} = "python python-dbus python-json python-argparse python-pygobject python-autobahn python-twisted python-subprocess"
 
+# http://lists.openembedded.org/pipermail/openembedded-devel/2016-June/107798.html
+PNBLACKLIST[python-cloudeebus] ?= "Rdepends on broken python-pygobject"
+
 do_install_prepend() {
   install -d ${D}${PYTHON_SITEPACKAGES_DIR}/${PN}
 }
diff --git a/meta-python/recipes-devtools/python/python-dbusmock_0.10.1.bb b/meta-python/recipes-devtools/python/python-dbusmock_0.10.1.bb
index 2520bfc..244e59f 100644
--- a/meta-python/recipes-devtools/python/python-dbusmock_0.10.1.bb
+++ b/meta-python/recipes-devtools/python/python-dbusmock_0.10.1.bb
@@ -9,6 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
 DEPENDS += "python-pygobject python-dbus"
 
+# http://lists.openembedded.org/pipermail/openembedded-devel/2016-June/107798.html
+PNBLACKLIST[python-dbusmock] ?= "Depends on broken python-pygobject"
+
 SRC_URI = "https://launchpad.net/${BPN}/trunk/${PV}/+download/${BP}.tar.gz"
 SRC_URI[md5sum] = "7370d325c4a75494dd71885ca65b79e8"
 SRC_URI[sha256sum] = "03aadc93bdc26ea18d4d78fcff7b6cb34f4e18623bc5cc41cf9539d663cee11e"
-- 
2.8.4


