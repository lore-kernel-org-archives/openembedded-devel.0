Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TgJzN-0000Um-ED
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Dec 2012 19:46:38 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so3068080eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Dec 2012 10:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=GteWVuxPUs8PcZaXWFVh0krPFIK2jftbl7PQSAx5YS8=;
	b=q5Ek3LTkg7lZdcxW8N6Lvp6ofM0fhMtqzftl5tMfxh+w5lZVLJL8ZP172AAAiQlLLc
	wEjljukRnmRPlq7AlHLuRxtnHhB9qkxsHy0zU5luoBYmhS1TiMX/3ZIGBBSqEJC1LLUG
	QnxUAcn+RSo+Rg/ABf6hpsz8lOOxKSGNFTrfxIa7FqkEyB1t00cgJ+NUiGK9cnafNGVj
	eBSKYttgIaqV8Y462shpGX4x8DHQQ6m9qzHULcQ9lJZGAzoqp5kkB+03abKr0xHW5iat
	c1b7nZ1dTRc4NAMPWS0ecYr9e5qL7hgpTh2X6hQ5x9CthpbDW2TARktFm4roVHBrR/3e
	q7Cw==
Received: by 10.14.215.197 with SMTP id e45mr63729415eep.0.1354732325455;
	Wed, 05 Dec 2012 10:32:05 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y44sm10672533eel.14.2012.12.05.10.32.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 10:32:05 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Dec 2012 19:30:35 +0100
Message-Id: <bf28dc7842b11f2688cd0ad7b9a1dd8410e8274c.1354731625.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <bef5b1c61f91ea5f2b28a981c69a9ed35cf27d74.1354731625.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
	<bef5b1c61f91ea5f2b28a981c69a9ed35cf27d74.1354731625.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354731625.git.Martin.Jansa@gmail.com>
References: <cover.1354731625.git.Martin.Jansa@gmail.com>
Subject: [PATCH 77/77] gnome-themes: fix path to icon-name-mapping
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Dec 2012 18:46:43 -0000

* it was pointing to
  UTILS_PATH=/OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/gnome-themes
  after libexecdir change in oe-core

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb b/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
index 9cc091f..8c15754 100644
--- a/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "GNOME themes"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2b543dc97eb7594d026af39d9b54204b"
 
-PR = "r2"
+PR = "r3"
 
 SECTION = "x11/gnome"
 DEPENDS = "gtk-engines icon-naming-utils icon-naming-utils-native glib-2.0 intltool-native libxml-simple-perl-native"
@@ -13,7 +13,7 @@ EXTRA_OECONF += "--enable-all-themes --disable-hicolor-check"
 inherit gnome perlnative
 
 do_configure_prepend() {
-	sed -i -e 's:`$PKG_CONFIG --variable=program_path icon-naming-utils`:${STAGING_DIR_NATIVE}${libexecdir}:g' configure.in
+	sed -i -e 's:`$PKG_CONFIG --variable=program_path icon-naming-utils`:${STAGING_DIR_NATIVE}${libdir}/icon-naming-utils:g' configure.in
 }
 
 PACKAGES =+ " gnome-theme-crux gnome-theme-highcontrast gnome-theme-highcontrastinverse gnome-theme-highcontrastlargeprint gnome-theme-highcontrastlargeprintinverse gnome-theme-largeprint gnome-theme-mist"
-- 
1.8.0



