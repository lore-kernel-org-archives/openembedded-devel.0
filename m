Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TgN7C-0000Ec-9H
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Dec 2012 23:06:52 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so2191970eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Dec 2012 13:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=aghlfiHQk3LciSU4oXiLJp+0SSum1VZ6+kgmWxzY/s8=;
	b=h2cJIB54Ne9YG4Bsz9VPK2TEBsT3bnmQEcM/Vhyi/RPIJME/uNP4APJ3E156LRAdql
	G1nsS99+ouleJ+WMbEl112Me+G0q8Qwq3Aq3d7pw9cHp5enKkkAUYjngFKgzynVKOamu
	SD/KwHE87Z7riIkyjXYf41QVuaBtT1j/rLlpuaS5nm5nSZAVrzm8jORNncfxR22GX6d7
	bOnkHEJ4K00/0iXDg41DFcZIKS8G8nKvnztOpzSe4BOgJ0l4S/5TTFHPa7Pwx7YGC9g0
	h0D8OEXFVKtb1ltb+o55FRJt4X2xdhb3WQ2bVU+B4cERxTCxZVsulY7pAN1ttHw4M5vX
	I3ZQ==
Received: by 10.14.178.196 with SMTP id f44mr65281505eem.14.1354744346074;
	Wed, 05 Dec 2012 13:52:26 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 44sm11793556eek.0.2012.12.05.13.52.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 13:52:25 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Dec 2012 22:52:00 +0100
Message-Id: <8ee5d5346f5b17204d40a7a5940141aab4a1fd2a.1354743849.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1c92baa825d740b9c4e053de8b275e3f653395b3.1354743849.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
	<1c92baa825d740b9c4e053de8b275e3f653395b3.1354743849.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354743849.git.Martin.Jansa@gmail.com>
References: <cover.1354743849.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 75/85] gdm: disable failing docs generation
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
X-List-Received-Date: Wed, 05 Dec 2012 22:06:53 -0000

* xmlto does not work correctly
  https://bugzilla.yoctoproject.org/show_bug.cgi?id=2416

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
index bdf249e..863db2e 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "xinput gnome-panel tcp-wrappers libcanberra libxklavier grep consolekit libpam gnome-doc-utils gtk+ xrdb"
 
-PR = "r9"
+PR = "r10"
 
 inherit gnome update-rc.d
 
@@ -25,7 +25,11 @@ SRC_URI[archive.sha256sum] = "034d23af0ea18d86e5543e707212d9297ec7d83f221808968a
 EXTRA_OECONF = " --enable-authentication-scheme=shadow \
                  --enable-debug=yes \
                  --with-console-kit \
-                 --disable-scrollkeeper "
+                 --disable-scrollkeeper"
+
+do_configure_prepend() {
+	sed -i -e "s:\bdocs::g" ${S}/Makefile.am
+}
 
 do_install_prepend() {
 	mkdir -p ${D}/var/lib/gdm/.gconf.mandatory
-- 
1.8.0



