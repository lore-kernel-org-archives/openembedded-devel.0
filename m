Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7C3056D1F6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2013 15:09:31 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id f4so3968425wiw.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2013 07:09:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=KHlwFP/Ty+IHIAAo/1cT2RLoZUOrmwihM2mXbyczhYU=;
	b=HviIr9DXG3MibWZOiE9fCRT3Aww9qhnwoq9rL5Mcnrage1e4A+xG5gj5WC9JbW0l9L
	uPpLqOgX8a1Pebglx71xCl6Nxhsxm0ElbdMeJDmpFRnR2LxJzbbuMyWxCWgQ5d6QiHj8
	y0MXD9496sMc+iLoNU+ky8rp0ab10ioeHa+jatQZgacKKl26CuWlZZ6eZUHcohD6zapU
	56EZMZBcb5XB4pf8/vvhnCda94C32+mC9djXZWUdqd0Ah7iYQ95qxatwB9WDVD/oILY7
	qm42peHc++JrGjcXOfnppyQGXKWOhYxzjVABvOV++CE4yBVc6JE5JHedzxsuTTj/lmvk
	njVg==
X-Gm-Message-State: ALoCoQkBHwu2+06xLw7ioHPkgguCYF75SaNT0mqsdojUGYRPxx4LD+jpnbTMalJrAOvIRHVLM49r
X-Received: by 10.194.176.163 with SMTP id cj3mr17216069wjc.8.1384787372829;
	Mon, 18 Nov 2013 07:09:32 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id dj8sm24978412wid.2.2013.11.18.07.09.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Nov 2013 07:09:32 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Nov 2013 15:09:27 +0000
Message-Id: <1384787367-7837-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH] piglit: add OpenGL driver test suite
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
X-List-Received-Date: Mon, 18 Nov 2013 15:09:32 -0000

Piglit is an OpenGL driver test suite that can automatically stress GL hardware
and generate machine- or human-readable reports.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/recipes-graphics/piglit/piglit_git.bb |   44 +++++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/piglit/piglit_git.bb

diff --git a/meta-oe/recipes-graphics/piglit/piglit_git.bb b/meta-oe/recipes-graphics/piglit/piglit_git.bb
new file mode 100644
index 0000000..7c4f9a0
--- /dev/null
+++ b/meta-oe/recipes-graphics/piglit/piglit_git.bb
@@ -0,0 +1,44 @@
+SUMMARY = "OpenGL driver testing framework"
+LICENSE = "MIT & LGPLv2+ & GPLv3 & GPLv2+ & BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b2beded7103a3d8a442a2a0391d607b0"
+
+SRC_URI = "git://anongit.freedesktop.org/piglit"
+
+# From 2012/12/30.
+SRCREV = "bbeff5d21b06d37338ad28e42d88f499bef13268"
+# (when PV goes above 1.0 remove the trailing r)
+PV = "1.0+gitr${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "virtual/libx11 waffle virtual/libgl libglu python-mako-native python-numpy-native"
+
+inherit cmake pythonnative
+
+# CMake sets the rpath at build time with the source tree, and will reset it at
+# install time. As we don't install this doesn't happen, so force the rpath to
+# what we need.
+EXTRA_OECMAKE = "-DCMAKE_BUILD_WITH_INSTALL_RPATH=1 -DCMAKE_INSTALL_RPATH=${libdir}/piglit/lib"
+
+do_install() {
+	install -d ${D}${bindir}
+        install -m 0755 piglit-*.py ${D}${bindir}
+
+        install -d ${D}${libdir}/piglit/
+
+        install -d ${D}${libdir}/piglit/bin
+        install -m 755 ${S}/bin/* ${D}${libdir}/piglit/bin
+
+        cp -a lib/ ${D}${libdir}/piglit/
+        cp -a framework/ ${D}${libdir}/piglit/
+        cp -a generated_tests/ ${D}${libdir}/piglit/
+        cp -a tests/ ${D}${libdir}/piglit/
+        cp -a templates/ ${D}${libdir}/piglit/
+
+        sed -i -e 's|sys.path.append(.*)|sys.path.append("${libdir}/piglit")|' ${D}${bindir}/piglit-*.py
+        sed -i -e 's|^templatedir = .*$|templatedir = "${libdir}/piglit/templates"|' ${D}${bindir}/piglit-summary-html.py
+}
+
+FILES_${PN}-dbg += "${libdir}/piglit/*/.debug/"
+
+RDEPENDS_${PN} = "python waffle python-json python-subprocess python-multiprocessing python-textutils python-netserver python-shell mesa-demos"
-- 
1.7.10.4


