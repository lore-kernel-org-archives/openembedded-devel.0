Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id CDDAC6B4F7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 10:47:42 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id t60so1551993wes.23
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 02:47:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=9ZF1Z1a/fRofvuNHtLaO61TiNF0B2e4jUs41gUi4mw8=;
	b=KD/AqiI2yr+XU0EDLVYVlHtqMWN7NXlrMHJestCRyRpwI3wU+Akt/G3HmeDkecmh4N
	jQwV+oA5CC7bAPykxvkMl+PQgsf1TOScmoVeVP51av1XGLPZV1Cvw0tTN9ROt035vWs5
	eUIspnurpddaDxym8PoJJy2B8UJ0heEEvBb04ZjPwpkbJ4QR5B9Y8gqKr6xYj02IVuyT
	elvts0sRtonI0mspksN7TqjmliQPTYEWYqFQVYjfB7f29UoqIJwJh1QaNOW0mc0FS3JD
	y7x7T2Elm7L8OMXJqbKscQD1EuWX6DlzOuDrMtv2Qc/g3u7v5i7lEy67qwCE3kR4yoW+
	lWhg==
X-Gm-Message-State: ALoCoQniN2LTNOhx6Del7o8RnOvhfo6ctGHrYSYr2XYb/DuVYITjyeWuGgG4OD+lyyEpr7RQrE9E
X-Received: by 10.180.221.38 with SMTP id qb6mr1547160wic.26.1389782863002;
	Wed, 15 Jan 2014 02:47:43 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id j3sm6016854wiy.3.2014.01.15.02.47.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Jan 2014 02:47:41 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jan 2014 10:47:30 +0000
Message-Id: <1389782854-14355-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH][meta-oe 1/5] piglit: remove, migrated to oe-core
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
X-List-Received-Date: Wed, 15 Jan 2014 10:47:44 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/recipes-graphics/piglit/piglit_git.bb |   44 -------------------------
 1 file changed, 44 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/piglit/piglit_git.bb

diff --git a/meta-oe/recipes-graphics/piglit/piglit_git.bb b/meta-oe/recipes-graphics/piglit/piglit_git.bb
deleted file mode 100644
index 7c4f9a0..0000000
--- a/meta-oe/recipes-graphics/piglit/piglit_git.bb
+++ /dev/null
@@ -1,44 +0,0 @@
-SUMMARY = "OpenGL driver testing framework"
-LICENSE = "MIT & LGPLv2+ & GPLv3 & GPLv2+ & BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b2beded7103a3d8a442a2a0391d607b0"
-
-SRC_URI = "git://anongit.freedesktop.org/piglit"
-
-# From 2012/12/30.
-SRCREV = "bbeff5d21b06d37338ad28e42d88f499bef13268"
-# (when PV goes above 1.0 remove the trailing r)
-PV = "1.0+gitr${SRCPV}"
-
-S = "${WORKDIR}/git"
-
-DEPENDS = "virtual/libx11 waffle virtual/libgl libglu python-mako-native python-numpy-native"
-
-inherit cmake pythonnative
-
-# CMake sets the rpath at build time with the source tree, and will reset it at
-# install time. As we don't install this doesn't happen, so force the rpath to
-# what we need.
-EXTRA_OECMAKE = "-DCMAKE_BUILD_WITH_INSTALL_RPATH=1 -DCMAKE_INSTALL_RPATH=${libdir}/piglit/lib"
-
-do_install() {
-	install -d ${D}${bindir}
-        install -m 0755 piglit-*.py ${D}${bindir}
-
-        install -d ${D}${libdir}/piglit/
-
-        install -d ${D}${libdir}/piglit/bin
-        install -m 755 ${S}/bin/* ${D}${libdir}/piglit/bin
-
-        cp -a lib/ ${D}${libdir}/piglit/
-        cp -a framework/ ${D}${libdir}/piglit/
-        cp -a generated_tests/ ${D}${libdir}/piglit/
-        cp -a tests/ ${D}${libdir}/piglit/
-        cp -a templates/ ${D}${libdir}/piglit/
-
-        sed -i -e 's|sys.path.append(.*)|sys.path.append("${libdir}/piglit")|' ${D}${bindir}/piglit-*.py
-        sed -i -e 's|^templatedir = .*$|templatedir = "${libdir}/piglit/templates"|' ${D}${bindir}/piglit-summary-html.py
-}
-
-FILES_${PN}-dbg += "${libdir}/piglit/*/.debug/"
-
-RDEPENDS_${PN} = "python waffle python-json python-subprocess python-multiprocessing python-textutils python-netserver python-shell mesa-demos"
-- 
1.7.10.4


