Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4F7CA731E3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 May 2016 21:19:37 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id 62so1702911pfd.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 May 2016 14:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=DqwkeEq1q7cBpAPOX+XHukQ43kJt09bgAby7v6MQyaI=;
	b=RbJRZ+GSM0dSvG+lYAPyxnjzHk7Pz/kJszglvDU4ODTwWWh+vtTq5UWsESYLe7UZ+v
	42anHhCoZixr+10LNRIw3HhXux9F3UDbUqujr0EIVmQnDD5XroSX+RLM8/Cp3/zDGmM8
	W8q3+aQHgOfxyAJpf1UUBxHhOJFkfop8yqXfPsi8NZYMKBlyitCDqYFpZ992uLd7ZGpN
	Hz8sLXYvOtq47nqyKgxtVpFJPLS521v3hB6c9qXfiXlT7UKgXkqXlcuCm/sw5XFxVaAP
	PUF8dNExj5WrmZIHAFSdLv4pSkXnhQl5dc5pb1MQilPumI+xin9JYnuxSw8O/eVC79rH
	IwOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=DqwkeEq1q7cBpAPOX+XHukQ43kJt09bgAby7v6MQyaI=;
	b=CfB9oYKDy8+Fg5TGLCDLJSUgX5AwLoggGVbi9Sf+j1LPpn/FJHG25y3hZ5fvJ2HULw
	PcTWx/XvZQbKZbE3dqsqTt93blaVKemF+5YM4zCNjmSdn2PpUzTqeOEf8YutY67xn61s
	/7qVItDywCvLZYRCqoopFFsyiSASRT2xaq4DnHuA61ExK+rzyAI2uRPlDxZBKgP/MqgY
	mu9PS+zaT9SFSl+72oKKWWxoJ+Bzigzh74OPKn9H6OqSxKml/YAnqSmnIWAdF7WbPIJH
	AomSZIwObY8iQEj11sdVLCsVBYvBqVekLNNmVKSiATjSU4xk6QUuKL7ykbIqnG/UAfho
	9hZA==
X-Gm-Message-State: ALyK8tKZqqhyOtH+SQGaqGRDrWvaXbovir4lm+UXW3xrB5jNP0OaYCbfyFpQM/cYZF///A==
X-Received: by 10.98.27.216 with SMTP id b207mr24846462pfb.111.1464383978595; 
	Fri, 27 May 2016 14:19:38 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	ut1sm30316176pac.46.2016.05.27.14.19.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 May 2016 14:19:37 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 May 2016 14:19:35 -0700
Message-Id: <1464383975-25421-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-gnome][master][krogoth][PATCH] gnome-menus: Fix QA warnings.
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
X-List-Received-Date: Fri, 27 May 2016 21:19:39 -0000

WARNING: gnome-menus-2.30.5-r1 do_configure: Missing DEPENDS on intltool-native
WARNING: gnome-menus-2.30.5-r1 do_package_qa: QA Issue: non -staticdev package contains static .a library: gnome-menus-python path 'work/i586-oe-linux/gnome-menus/2.30.5-r1/packages-split/gnome-menus-python/usr/lib/python2.7/site-packages/gmenu.a' [staticdev]
WARNING: gnome-menus-2.30.5-r1 do_package_qa: QA Issue: /usr/bin/gmenu-simple-editor contained in package gnome-menus requires /home/akuster/oss/maint/mylayers/openembedded-core/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/python-native/python, but no providers found in RDEPENDS_gnome-menus? [file-rdeps]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb       | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb
index 1b84a54..1e31b56 100644
--- a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb
+++ b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LIB;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 PR = "r1"
 
-DEPENDS = "python libxml2 gconf popt gtk+"
+DEPENDS = "python libxml2 gconf popt gtk+ intltool-native"
 
 inherit gnomebase pkgconfig python-dir pythonnative gobject-introspection
 
@@ -13,10 +13,15 @@ SRC_URI[archive.md5sum] = "caa6772e63ed5870cf43dc3d354e0624"
 SRC_URI[archive.sha256sum] = "6dcc565006d6e8c2025ae83ab1f82edf6bd04d61c804c0dc9bf5ea50629c4caa"
 GNOME_COMPRESS_TYPE="bz2"
 
-PACKAGES += "${PN}-python"
+do_configure_append () {
+
+    # this expands to native-pthon which we don't want.
+    sed -i 's:\@PYTHON\@:/usr/bin/env python:' ${S}/simple-editor/gmenu-simple-editor.in
+
+}
+PACKAGES += "${PN}-python ${PN}-python-staticdev"
 FILES_${PN} += "${datadir}/desktop-directories/"
-FILES_${PN}-python = "${libdir}/python*"
+FILES_${PN}-python-staticdev = "${PYTHON_SITEPACKAGES_DIR}/gmenu.a ${PYTHON_SITEPACKAGES_DIR}/gmenu.la"
+FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}/gmenu.so ${PYTHON_SITEPACKAGES_DIR}/GMenuSimpleEditor "
 FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/*/.debug \
                     ${PYTHON_SITEPACKAGES_DIR}/.debug"
-
-
-- 
2.3.5


