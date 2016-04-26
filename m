Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 96267607A5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2016 16:56:59 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id n3so6766100wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2016 09:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=U5vHkBJyvsrv9OJNW9VpK9xsBV0WUR906+moq2ucbMQ=;
	b=uJu480rvwxUzf3KkbJ/8PRamBrqnkd5eFtOXsE+hKqMyh4tIxM7OccpBwLFttsDMyZ
	LI2hGPiuvIzPAKokGM5R+bxBiL9n4JJZQdd2x3hKh/674CBSoL7wUFyOKvq0WfpRP9C/
	0AwPLrJn0uWPWNsTLVKjiz1v5YuUyuGxMMNt/nswI/3SQyzANfSR8cQD1G2qvN/lUE8K
	1OfIcRpb0h97wqp/5fziEqb8E8sRVfr22YQ5FAUciHQ9EyMSTE5JvVO6Tk1cfd10m6ZC
	UiI2taM6c9QasbFlHYtj/v8glnnmr3BH4P6lS9iE2Ut3bV0eTyivVXu31CF+jUx6HHjM
	IfGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=U5vHkBJyvsrv9OJNW9VpK9xsBV0WUR906+moq2ucbMQ=;
	b=S4SRcG8M4D7RpUErhFoHhLQKHpn48NpH0ExvJej95+BpIKLG6z0e1YRqNqI+MwgolR
	Gox0O+gjwkGcFhpJL2eLSQDimhtyBwo//ZLS32rLgn08nncd+Jhxa/m+/gRVms8Vz0rm
	YZ61mHkEOyYqrDcfEnXw84qnype3wbKgiLiJqqAjwNDuHpR1G2qlRn3CdRWqpsthRQ7f
	SQ82ID7I9lgWoEvcPE7jV61fNljqFejkbNJeH2U/3tRQ97KrRmpd6hajwbS6N5/JnOCJ
	FAM51niFwbo62Pip5j68Pkf4Y7J1N4atF2KkVcqvQh/m9kIXLn1vvsSCmh7ZuY8jI15O
	ooeQ==
X-Gm-Message-State: AOPr4FVOGPAUWAH2+Hl1yOumf4+FagdNsRnWxNzhwfrnwbfE+i//OAxk0OY+pmOczDpFAQ==
X-Received: by 10.28.133.129 with SMTP id h123mr19690821wmd.33.1461689820185; 
	Tue, 26 Apr 2016 09:57:00 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id n66sm1515524wmf.6.2016.04.26.09.56.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Apr 2016 09:56:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Apr 2016 18:57:10 +0200
Message-Id: <1461689830-8750-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1461689830-8750-1-git-send-email-Martin.Jansa@gmail.com>
References: <1461689830-8750-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-qt5 4/4] qtwebkit: add PACKAGECONFIGs for libxcomposite, libxrender, fontconfig
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
X-List-Received-Date: Tue, 26 Apr 2016 16:57:00 -0000

* fixes following QA:
  WARNING: qtwebkit-5.6.99+5.7.0-alpha+gitAUTOINC+e9b369b16f-r0 do_package_qa: QA Issue: qtwebkit rdepends on libxcomposite, but it isn't a build dependency? [build-deps]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtwebkit_git.bb | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index 22efe82..b84671b 100644
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
     export QMAKE_CACHE_EVAL="CONFIG+=${PACKAGECONFIG_CONFARGS}"
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
2.8.1


