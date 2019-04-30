Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 086697D697
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2019 08:44:11 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id b10so2815972wmj.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2019 01:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Gk9JsqP09458ALiX/8gnoKh7qIeUHj2b7jkAvTEm3C8=;
	b=cZxmvSMN6ux1TtUZ/KKD2UJJ/CFcaOmejY36FR3IxB5nzCWmLUWBnfTCm6G47PHWiq
	jtiCFXubLotprYjmINa5AL5IvBpIQw67VJUBmT+o1xvrWT5mqNYeOpLWwTwm2g464jiX
	jeMSXAP7arzgQ1vWv/v1Htaf+j1jPdESjKZKwjrCHlqWPBpL4lzkbZAwR9kYSSDyIkiT
	tMLKS9CHr6yyKW+NqW/WGzQ0I/ItG+B3nnFoKJXXC8p6Qc9wDyjeKe4xoH1dRUyQryIs
	8O7eVD2iwlkLvL2PQrHQdCH3DZR4FZKSuFrC0VpFmpG60Ix0iSFqY5bvJwlVYSAW4jWs
	9NDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Gk9JsqP09458ALiX/8gnoKh7qIeUHj2b7jkAvTEm3C8=;
	b=Npp+4gVnt4L+qTKWZf79USGimNiWm0Kky5L/My8NcLpvNGxMhD/QkG49O+dVjZIQBF
	y2sJlQyO6LgF2Z4b5JH0C+JDpg1bI97Z1I9c3thjQ0ao+BVkN7vum1iww3Qz1RUEm7nv
	5SNM0QLb83FqP5HHh5D7XmIPAj4HRscoa6WSk1aRR3UXNDJnTLWL23RFTY0hKOoKnDIs
	YrsbTAHcfbnm/SlNr7UfGbjkHlMkNKHJNXgI8hEASS7Dmgs5LRBoRo4M+hFrfdkin6xv
	CwmlYwMo3yLx7bwEEePL7UMGRc4KTU4xxmgQLKJ/W8PJy1tcVY4JmgYb1FUkAqzVJAol
	hSOQ==
X-Gm-Message-State: APjAAAXSAj8JbqmLeofNRXBJR8q2VVPne1s3itGUeg+fckDcf3ie2fFV
	LquU6JMWYnjHRzCdZyRQlc0br9qe
X-Google-Smtp-Source: APXvYqwFrbIzJLt7Mre+8iEK9H4p/4KT/FZS4NRkKrhimFues2IH0rLS7C+/A6f9BOQ8UlEh/RHAlw==
X-Received: by 2002:a7b:cb16:: with SMTP id u22mr2291301wmj.60.1556613852438; 
	Tue, 30 Apr 2019 01:44:12 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	b12sm13133064wrf.21.2019.04.30.01.44.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 30 Apr 2019 01:44:11 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Apr 2019 10:43:59 +0200
Message-Id: <20190430084400.4135-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] xfce4-vala: auto-detect vala api version
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
X-List-Received-Date: Tue, 30 Apr 2019 08:44:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Get rid of tedious maintenance burden

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...Detect-vapidir-if-not-set-explicitly.patch | 31 +++++++++++++++++++
 .../vala/xfce4-vala_4.10.3.bb                 |  7 +++--
 2 files changed, 35 insertions(+), 3 deletions(-)
 create mode 100644 meta-xfce/recipes-bindings/vala/xfce4-vala/0001-configure.ac-Detect-vapidir-if-not-set-explicitly.patch

diff --git a/meta-xfce/recipes-bindings/vala/xfce4-vala/0001-configure.ac-Detect-vapidir-if-not-set-explicitly.patch b/meta-xfce/recipes-bindings/vala/xfce4-vala/0001-configure.ac-Detect-vapidir-if-not-set-explicitly.patch
new file mode 100644
index 000000000..a3a9330ef
--- /dev/null
+++ b/meta-xfce/recipes-bindings/vala/xfce4-vala/0001-configure.ac-Detect-vapidir-if-not-set-explicitly.patch
@@ -0,0 +1,31 @@
+From 35267d995a81263b98f0ad56399ac3e30f9cf152 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Tue, 30 Apr 2019 09:48:08 +0200
+Subject: [PATCH] configure.ac: Detect vala-api version if not set explicitly
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 9bf4230..c489385 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -38,7 +38,7 @@ AC_ARG_WITH([vala-api],
+ 		AC_HELP_STRING([--with-vala-api=VERSION],
+ 				[Use Vala API version VERSION]),
+ 		[vala_api=$withval],
+-		[vala_api='0.16'])
++		[vala_api=`$PKG_CONFIG --variable=vapidir_versioned vapigen | sed -e 's:.*vala-::' -e s:/vapi::`])
+ M8T_CHECK_VALA([$vala_api])
+ AC_ARG_WITH([default-vapidir],
+ 		AC_HELP_STRING([--with-default-vapidir],
+-- 
+2.20.1
+
diff --git a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb b/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
index 97007bec4..68dbc69af 100644
--- a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
+++ b/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
@@ -7,12 +7,13 @@ inherit xfce pkgconfig distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "http://archive.xfce.org/src/bindings/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.bz2"
+SRC_URI = " \
+    http://archive.xfce.org/src/bindings/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.bz2 \
+    file://0001-configure.ac-Detect-vapidir-if-not-set-explicitly.patch \
+"
 SRC_URI[md5sum] = "0bbb1d6e473e0fe9b335b7b1b49d8a71"
 SRC_URI[sha256sum] = "07a8f2b7c09fcdd3d86e0c52adea3c58ca011d0142a93997a01b4af77260ae7b"
 
-EXTRA_OECONF = "-with-vala-api=0.42"
-
 FILES_${PN} += "${datadir}/vala-*/vapi"
 
 RDEPENDS_${PN} = "vala"
-- 
2.20.1


