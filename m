Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 34B336FEFA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 13:15:09 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id g62so75602017wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 05:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Z5V3N9FUscqKf+m8TOAOT6cSl+HR7oePtDVGKBWzzRY=;
	b=xrNnhxdYSo0at3VnbwtMgN1NM+KawNriMp5SfEzaxYprkQ3tSTEyzwHIO9wQRAAHk6
	UqT/4Q6IwrFXrxF96w6lVXJJhVbk+5LzbYvV8xInk8zU07MSofWtwFJNCDSEDyzV29hR
	EHQYXBE8Zt8MRTGsN5Q2dpMS5okOtNv6l6+gyEimXRAeJLJ/SE7HmeWE4av26+F4qlNd
	sbYw3Al6cf7m06STzP9SDPAXFSgfoz+85XQ0szTIIPaydWGBKlnUP2aYl+kdjzXDmbWt
	KXzvr1YJWAwR18xRlf+w8TPJNGRltbCurneyk47zl1+4XF7cNx1qpXs0kw7fe5k0ETe0
	B8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Z5V3N9FUscqKf+m8TOAOT6cSl+HR7oePtDVGKBWzzRY=;
	b=CpA+8+LQADfeB4alrmqhAViTUnuKI4J5+gzDHcgUnThfkLku6wJ9TvxqM1f34C5hdU
	iRvV+R7Y5qZtzi5oKrMljO1Tr3oyMZxITulQAENsNVLlmK4XshtcU4JUWlgFAuo2y7nr
	PqRwOS0diOGGqCBhh90IRwly34iMmOtyWG1cHfl9PcQuUxwIVF5Nq28fvfmFVzQfWiG3
	5IOj6bjFSuV8Lv2lb6Te/T8HcQyEOBqqc+0ezLV7mwNQMrXR5QuVRj4Zb6TNewFcZckD
	eFbXCMx1YzEORO1wLyaPUvi5AvWENWpb/oMoTjhcNWyBaooJQB2oCLapQBLzx2lTmMsJ
	0uOA==
X-Gm-Message-State: AG10YOSM3EpASJ6FsHVZBVqbHdQmFyKUIoPPiMBiDKxIVKsYU8pqPyPuvxyca/5HILVx2g==
X-Received: by 10.28.211.1 with SMTP id k1mr9884638wmg.93.1455887709701;
	Fri, 19 Feb 2016 05:15:09 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	gg7sm11224453wjd.10.2016.02.19.05.15.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Feb 2016 05:15:05 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Feb 2016 14:15:34 +0100
Message-Id: <1455887735-6148-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCH][WIP-for-5.7][meta-qt5 1/2] qtwebkit: add PACKAGECONFIGs for libxcomposite, libxrender, fontconfig
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
X-List-Received-Date: Fri, 19 Feb 2016 13:15:10 -0000

* fixes following QA:
  WARNING: qtwebkit-5.6.99+5.7.0-alpha+gitAUTOINC+e9b369b16f-r0 do_package_qa: QA Issue: qtwebkit rdepends on libxcomposite, but it isn't a build dependency? [build-deps]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtwebkit_git.bb | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index 79b06a2..09d4814 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -24,7 +24,10 @@ SRC_URI += "\
     file://0003-Exclude-backtrace-API-for-non-glibc-libraries.patch \
 "
 
-PACKAGECONFIG ??= "gstreamer qtlocation qtmultimedia qtsensors qtwebchannel"
+PACKAGECONFIG ??= "gstreamer qtlocation qtmultimedia qtsensors qtwebchannel \
+    ${@base_contains('DISTRO_FEATURES', 'x11', 'libxcomposite libxrender', '', d)} \
+    fontconfig \
+"
 PACKAGECONFIG[gstreamer] = "OE_GSTREAMER_ENABLED,,gstreamer1.0 gstreamer1.0-plugins-base"
 PACKAGECONFIG[gstreamer010] = "OE_GSTREAMER010_ENABLED,,gstreamer gst-plugins-base"
 PACKAGECONFIG[qtlocation] = "OE_QTLOCATION_ENABLED,,qtlocation"
@@ -32,6 +35,9 @@ PACKAGECONFIG[qtmultimedia] = "OE_QTMULTIMEDIA_ENABLED,,qtmultimedia"
 PACKAGECONFIG[qtsensors] = "OE_QTSENSORS_ENABLED,,qtsensors"
 PACKAGECONFIG[qtwebchannel] = "OE_QTWEBCHANNEL_ENABLED,,qtwebchannel"
 PACKAGECONFIG[libwebp] = "OE_LIBWEBP_ENABLED,,libwebp"
+PACKAGECONFIG[libxcomposite] = "OE_LIBXCOMPOSITE_ENABLED,,libxcomposite"
+PACKAGECONFIG[libxrender] = "OE_LIBXRENDER_ENABLED,,libxrender"
+PACKAGECONFIG[fontconfig] = "OE_FONTCONFIG_ENABLED,,fontconfig"
 
 do_configure_prepend() {
     export QMAKE_CACHE_EVAL="CONFIG+=${EXTRA_OECONF}"
@@ -50,6 +56,12 @@ do_configure_prepend() {
     sed -e 's/\s\(qtHaveModule(webchannel)\)/ OE_QTWEBCHANNEL_ENABLED:\1/' -i ${S}/Source/WebKit2/WebKit2.pri
     # disable libwebp test if it isn't enabled by PACKAGECONFIG
     sed -e 's/\s\(config_libwebp: \)/ OE_LIBWEBP_ENABLED:\1/' -i ${S}/Tools/qmake/mkspecs/features/features.prf
+    # disable libxcomposite test if it isn't enabled by PACKAGECONFIG
+    sed -e 's/\s\(config_libXcomposite: \)/ OE_LIBXCOMPOSITE_ENABLED:\1/' -i ${S}/Tools/qmake/mkspecs/features/features.prf
+    # disable libxrender test if it isn't enabled by PACKAGECONFIG
+    sed -e 's/\s\(config_libXrender: \)/ OE_LIBXRENDER_ENABLED:\1/' -i ${S}/Tools/qmake/mkspecs/features/features.prf
+    # disable fontconfig test if it isn't enabled by PACKAGECONFIG
+    sed -e 's/\s\(config_fontconfig: \)/ OE_FONTCONFIG_ENABLED:\1/' -i ${S}/Tools/qmake/mkspecs/features/features.prf
 }
 
 # qtwebkit gets terribly big when linking with all debug info, disable by default
-- 
2.7.1


