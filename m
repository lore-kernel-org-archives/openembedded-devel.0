Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 06EC872FCC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 23:38:01 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id s186so2703418qkb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 15:38:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CQ/5GOsQ3NBCdo1Lf46mNqYfg6kNO19Gu/ZRSwMEDDQ=;
	b=EXJEIvxyhG/GggOGWHTxKdy/IRVTl1RHcXizHPPDXmNgunys4IBsR2GxVlVol+99Gv
	sDlrHuwHHLSaTtBRyKuP4zXs1u6Kkaqz9i9A44m/X6geMC4kxYPWGM6OYi1kaekqqeig
	KfMBYZFH+EjwDQOZ6pVyuQ0X6k/rI0vHqFmBWoo9d44ebU0W/impCAmJeLAWuHXFIDiY
	pGKhtVaBUczVfpaNhc20bCknO03ZAaK289nfSjwrKgfGzQY24b4iGCOt4lI4iwPRpsD3
	+0d9MUSuNIwz4gs2UdKoGsgwIujBsWRHkHKLA1k6BwjwFyViq3Sq1MprZhqFScC7iPq3
	pbmw==
X-Gm-Message-State: AMke39kA6ckf5XGntfiSb9/6+J3KA6GNrBPHK5Dw+M83bgFejwDXX4fN3inUa3HoCOVsOg==
X-Received: by 10.55.111.2 with SMTP id k2mr36929140qkc.138.1487806682897;
	Wed, 22 Feb 2017 15:38:02 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	o16sm1633646qkl.67.2017.02.22.15.38.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Feb 2017 15:38:02 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Feb 2017 18:37:53 -0500
Message-Id: <1487806673-24991-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-cloudeebus: remove obsolete recipe
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
X-List-Received-Date: Wed, 22 Feb 2017 23:38:02 -0000

The cloudeebus upstream project has not been active in 3.5 years and
the current APIs for most of the dependencies have changed enough to
not longer support the current implementation without pinning previous
versions.  Since this recipe has not functioned correctly for a while,
remove it from the layer.

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-cloudeebus_0.6.0.bb              | 35 ----------------------
 1 file changed, 35 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-cloudeebus_0.6.0.bb

diff --git a/meta-python/recipes-devtools/python/python-cloudeebus_0.6.0.bb b/meta-python/recipes-devtools/python/python-cloudeebus_0.6.0.bb
deleted file mode 100644
index 1490e22..0000000
--- a/meta-python/recipes-devtools/python/python-cloudeebus_0.6.0.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-DESCRIPTION = "A component which enables calling DBus methods and registering on DBus signals from Javascript"
-HOMEPAGE = "https://github.com/01org/cloudeebus"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
-
-SRC_URI = "git://github.com/01org/cloudeebus.git;protocol=http;branch=master "
-SRCREV = "b5cc957eeabfe98cb996baf8e5a0ac848993c3d4"
-
-S = "${WORKDIR}/git"
-
-inherit distutils setuptools
-
-DEPENDS_${PN} = "python python-distribute"
-RDEPENDS_${PN} = "python python-dbus python-json python-argparse python-pygobject python-autobahn python-twisted python-subprocess"
-
-do_install_prepend() {
-  install -d ${D}${PYTHON_SITEPACKAGES_DIR}/${PN}
-}
-
-DISTUTILS_INSTALL_ARGS = "--root=${D} \
-    --single-version-externally-managed \
-    --prefix=${prefix} \
-    --install-lib=${PYTHON_SITEPACKAGES_DIR} \
-    --install-data=${datadir}"
-
-do_install_append() {
-  distutils_do_install
-  install -d ${D}${datadir}/doc/${BPN}/
-  install -m 0644 ${S}/README.md ${D}${datadir}/doc/${BPN}/
-}
-
-FILES_${PN} += "${datadir}/cloudeebus"
-FILES_${PN} += "${sysconfdir}/dbus-1/system.d/org.cloudeebus.conf"
-
-- 
2.7.4


