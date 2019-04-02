Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id BABFB60116
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Apr 2019 06:46:02 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id w15so2166175wmc.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Apr 2019 23:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7l+v6nJ+KPwFXiSY0PYa4K9cuq97UVS4bnNIjfmd/FA=;
	b=kFuD6l8pcqw5R7I1HI6op4xzETXFer9g83yRVpMfv2G7uHg7Lh9inPDJHMkhsrnA8B
	V25yQpB7djboKWQM8K9LAw4eGUt0zTINAxcO7XSgMLuSVMK6gAo1p5Phz/1hGNGD9K64
	V7I9HCJCrtUmKnWwmhjCx9gcKIEcEkzf21ImFjGvgaxueSEEcNLLRD+F9p6AXIP80VxK
	W/BuJxk43JlZHxObir6ZDGL5mwz8jkTsNpVmdgh90D1eCEeOMCWJ+OHDaZ5t08sZbSi4
	HOVMOZx8bMWZbaqo20AB5rS+jkAjpZ7fLSJq/mZEIJj5Zl/sDoVYcRgo183bMSbdOqkR
	nH0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7l+v6nJ+KPwFXiSY0PYa4K9cuq97UVS4bnNIjfmd/FA=;
	b=iX+accyYMBr6tsw2iWPqXU3d/Xf4k9nXugB/wsjfVoGYCZ8IEnG7PSxFm5zMwtnNPI
	yEiCdgHHxZDPVKyJI5tJxiOuFT9uDOLVVJ4wgi3Aa8/u/WlzjvMFzYJqdq3ApiM1U/rB
	j/UtgzDEffJPaoS6otWjuB6pKWMqRve06FnJLnpv6Rpm2X1P08FUHJFW6UFJQCgqraC8
	itZ870b/SDE65BAtzmvtR1RGL8O3Br+6aI/VHmmqAc5J0uMn5Pk1A8Cb2Z5+VjeoYGOC
	TmULPQq5nHqUQvnLbsE02mOclfLsBZU41KA6M4UYH0pYFVxbL2G/HwijFosozBFAtTBJ
	hORA==
X-Gm-Message-State: APjAAAWgl7V8u9KarUuQT4nPWNrJF448FdSQngmO3mviLa62u+RifDW4
	WyjBKg7MBK/pwP4kpXjsMAuxX/cn
X-Google-Smtp-Source: APXvYqy5LyT6SIk1nham7E3tdWNakX8qYBycvOYy3BAvHPnV0D4WhYX+7k7PoFogtdkty+jKBj7aKw==
X-Received: by 2002:a7b:c5d6:: with SMTP id n22mr2250767wmk.112.1554187563274; 
	Mon, 01 Apr 2019 23:46:03 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F2CB720F13E25CAD2D2B3C2.dip0.t-ipconnect.de.
	[2003:f0:7f2c:b720:f13e:25ca:d2d2:b3c2])
	by smtp.gmail.com with ESMTPSA id
	z84sm18540828wmg.24.2019.04.01.23.46.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 01 Apr 2019 23:46:02 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Apr 2019 08:45:54 +0200
Message-Id: <20190402064554.22908-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] gvfs: fix configure options and DDEPENDS
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
X-List-Received-Date: Tue, 02 Apr 2019 06:46:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Remove unknown configure options detected by [1]:
  | ERROR: QA Issue: gvfs: configure was passed unrecognised options: documentation gdu [unknown-configure-option]
* Remove intltool-native from DEPENDS - gnome uses gettext these days

[1] http://lists.openembedded.org/pipermail/openembedded-core/2019-April/280693.html

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb
index 7f239c413..7b9a16e9e 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=05df38dd77c35ec8431f212410a3329e"
 GNOMEBASEBUILDCLASS = "meson"
 inherit gnome bash-completion gettext upstream-version-is-even
 
-DEPENDS += "libsecret glib-2.0 gconf intltool-native libgudev udisks2 polkit shadow-native"
+DEPENDS += "libsecret glib-2.0 gconf libgudev udisks2 polkit shadow-native"
 
 SRC_URI = "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive"
 
@@ -15,12 +15,10 @@ SRC_URI[archive.sha256sum] = "3739d64b79c95a9f0f9faf2c5f9e5298b4b2ebdd6431435ce6
 
 EXTRA_OEMESON = " \
     -Dbluray=false \
-    -Dgdu=false \
     -Dgoa=false \
     -Dgoogle=false \
     -Dnfs=false \
     -Dudisks2=true \
-    -Ddocumentation=false \
 "
 
 PACKAGES =+ "gvfsd-ftp gvfsd-sftp gvfsd-trash"
-- 
2.20.1


