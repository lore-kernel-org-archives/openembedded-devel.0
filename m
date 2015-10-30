Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 80BA277122
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 12:14:21 +0000 (UTC)
Received: by wmeg8 with SMTP id g8so10457732wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 05:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=8KltQJntnD1Y4uFttCNgd2NXJywThLZkbwdHrad1bo4=;
	b=itN/ogmMX7RWVjkFzQw6wIQMcAe+z4rt9pTlJQpiNQh52f2R6crFEmPwivSMZ1AYzq
	1cm3pVGpdT8iPjPxtXG3wgmizkIIdGKJcoEZqji7XOlcU+JUJmrOwqk4tw/ufw9CPCH1
	X2IXSrUFFURpMIdhRWCDvVIsXKD+wYKjqn9iArJH9V1eJTB5NMwJO8jRdkXm1VTMLmS6
	V4qedYCLWHMdTu19AIC1YtG5qlmMYQi70uwBRRtwBx8WBr0tqfLELCiZtfLP2uRklpoR
	3s2X0OfOVG9qfeDPIr0WZgftTr0cnxBa+K7VaLrmTlkcGU0JZEpQja70vVIvbxaRCw6q
	6exw==
X-Received: by 10.28.21.17 with SMTP id 17mr3146124wmv.82.1446207261392;
	Fri, 30 Oct 2015 05:14:21 -0700 (PDT)
Received: from localhost.localdomain
	(ip-95-222-156-185.hsi15.unitymediagroup.de. [95.222.156.185])
	by smtp.googlemail.com with ESMTPSA id
	184sm2636122wmk.10.2015.10.30.05.14.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Oct 2015 05:14:20 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Oct 2015 13:13:38 +0100
Message-Id: <1446207225-15386-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1446207225-15386-1-git-send-email-schnitzeltony@googlemail.com>
References: <1446207225-15386-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 06/13] gparted: add polkit support
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
X-List-Received-Date: Fri, 30 Oct 2015 12:14:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* This was missing for me and is a good test case for xfce-polkit asking for
  root's password.
* Decision to use polkit (installed?) is made at runtime. Unfortunately this
  cool solution was not my idea but stolen from [1]

[1] http://pkgs.fedoraproject.org/cgit/gparted.git

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-extended/gparted/files/gparted_polkit  | 10 +++++++++
 .../org.yoctoproject.pkexec.run-gparted.policy     | 20 ++++++++++++++++++
 .../recipes-extended/gparted/gparted_0.24.0.bb     | 24 ++++++++++++++++++++--
 3 files changed, 52 insertions(+), 2 deletions(-)
 create mode 100644 meta-gnome/recipes-extended/gparted/files/gparted_polkit
 create mode 100644 meta-gnome/recipes-extended/gparted/files/org.yoctoproject.pkexec.run-gparted.policy

diff --git a/meta-gnome/recipes-extended/gparted/files/gparted_polkit b/meta-gnome/recipes-extended/gparted/files/gparted_polkit
new file mode 100644
index 0000000..feabd0e
--- /dev/null
+++ b/meta-gnome/recipes-extended/gparted/files/gparted_polkit
@@ -0,0 +1,10 @@
+#!/bin/sh
+
+# polkit installed?
+if [ $(which pkexec) ]; then
+	pkexec --disable-internal-agent "%sbindir%/gparted" "$@"
+else
+	%sbindir%/gparted "$@"
+fi
+
+
diff --git a/meta-gnome/recipes-extended/gparted/files/org.yoctoproject.pkexec.run-gparted.policy b/meta-gnome/recipes-extended/gparted/files/org.yoctoproject.pkexec.run-gparted.policy
new file mode 100644
index 0000000..77a9192
--- /dev/null
+++ b/meta-gnome/recipes-extended/gparted/files/org.yoctoproject.pkexec.run-gparted.policy
@@ -0,0 +1,20 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<!DOCTYPE policyconfig PUBLIC
+ "-//freedesktop//DTD PolicyKit Policy Configuration 1.0//EN"
+ "http://www.freedesktop.org/standards/PolicyKit/1/policyconfig.dtd">
+<policyconfig>
+
+  <action id="org.yoctoproject.pkexec.run-gparted">
+    <description>Run the GParted program</description>
+    <message>Authentication is required to run the GParted Partition Editor</message>
+    <icon_name>gparted</icon_name>
+    <defaults>
+      <allow_any>auth_admin</allow_any>
+      <allow_inactive>auth_admin</allow_inactive>
+      <allow_active>auth_admin</allow_active>
+    </defaults>
+    <annotate key="org.freedesktop.policykit.exec.path">/usr/sbin/gparted</annotate>
+    <annotate key="org.freedesktop.policykit.exec.allow_gui">true</annotate>
+  </action>
+
+</policyconfig>
diff --git a/meta-gnome/recipes-extended/gparted/gparted_0.24.0.bb b/meta-gnome/recipes-extended/gparted/gparted_0.24.0.bb
index 0fe95a0..2f38977 100644
--- a/meta-gnome/recipes-extended/gparted/gparted_0.24.0.bb
+++ b/meta-gnome/recipes-extended/gparted/gparted_0.24.0.bb
@@ -5,14 +5,34 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 inherit autotools pkgconfig gtk-icon-cache
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${BPN}-${PV}/${BPN}-${PV}.tar.bz2"
+SRC_URI = " \
+    ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${BPN}-${PV}/${BPN}-${PV}.tar.bz2 \
+    file://org.yoctoproject.pkexec.run-gparted.policy \
+    file://gparted_polkit \
+"
 SRC_URI[md5sum] = "b8480274c68876acff5965d4346710e7"
 SRC_URI[sha256sum] = "02398ab33894a59b0bd8707e598c46d8bb56f1413cd54de48eed61e2920ecd60"
 
 DEPENDS = "glib-2.0 gtkmm parted gnome-doc-utils-native"
 
+do_install_append() {
+    # Add a script which checks if polkit is installed.
+    # If yes: a policy is requested from polkit / otherwise start as usual
+    install ${WORKDIR}/gparted_polkit ${D}${sbindir}
+    sed -i 's:%sbindir%:${sbindir}:g' ${D}${sbindir}/gparted_polkit
+    # relink menu entry to use our script
+    sed -i 's:${sbindir}/gparted:${sbindir}/gparted_polkit:g' ${D}${datadir}/applications/gparted.desktop
+
+    install -d ${D}${datadir}/polkit-1/actions
+    install ${WORKDIR}/org.yoctoproject.pkexec.run-gparted.policy ${D}${datadir}/polkit-1/actions/org.yoctoproject.pkexec.run-gparted.policy
+}
+
 EXTRA_OECONF = "--disable-scrollkeeper --disable-doc"
 
-FILES_${PN} += "${datadir}/icons ${datadir}/appdata"
+FILES_${PN} += " \
+    ${datadir}/appdata \
+    ${datadir}/icons \
+    ${datadir}/polkit-1 \
+"
 
 RDEPENDS_${PN} = "dosfstools mtools e2fsprogs"
-- 
2.1.0


