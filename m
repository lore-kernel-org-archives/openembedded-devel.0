Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TgJz3-00009O-V0
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Dec 2012 19:46:15 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so3067516eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Dec 2012 10:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=/qnGqsWxM9yuuMLm2OEsYusIyOHJ9L0Z293KUWuTE8Y=;
	b=rBd++pylqNJMvXs6tFrlobamT+YjBjAQ+yokBzItFfQj6BxZR0kzHD0vsIQGJn7Dmj
	fAFtPi2QZ9T9V6/DFRf5HqJgwIj2WhQTYpi9r/eVPM3nqk8WWf7+u6mDfFVk0LPfmd5a
	6g0I4vGBFdipv4pkisRu5Xq1S3KgUg8zsrol0fRCztnhat1sUAvPi42AHyfkhqt4UTv3
	cc9vDWHWZXOeTa75ehX4MqSBfmAm4YDDqyMjK/yGUg0Ghmpg91XPspuBzzbF5nBuT3UF
	SHqFU8yYVFu+3vd25jYaSfYTvcaIgyutuAcJfeF60AKNhSyAV/IUotXThKnupeVe+G2r
	1zrg==
Received: by 10.14.215.194 with SMTP id e42mr63544233eep.32.1354732312060;
	Wed, 05 Dec 2012 10:31:52 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q44sm10703599eep.5.2012.12.05.10.31.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 10:31:51 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Dec 2012 19:30:33 +0100
Message-Id: <e6592b4ce4849c5e1872bfb3c1ba43ea000c2618.1354731625.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <bef5b1c61f91ea5f2b28a981c69a9ed35cf27d74.1354731625.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
	<bef5b1c61f91ea5f2b28a981c69a9ed35cf27d74.1354731625.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354731625.git.Martin.Jansa@gmail.com>
References: <cover.1354731625.git.Martin.Jansa@gmail.com>
Subject: [PATCH 75/77] gdm: disable failing docs generation
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
X-List-Received-Date: Wed, 05 Dec 2012 18:46:37 -0000

* xmlto does not work correctly
  https://bugzilla.yoctoproject.org/show_bug.cgi?id=2416

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
index bdf249e..c03bb61 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "xinput gnome-panel tcp-wrappers libcanberra libxklavier grep consolekit libpam gnome-doc-utils gtk+ xrdb"
 
-PR = "r9"
+PR = "r10"
 
 inherit gnome update-rc.d
 
@@ -25,7 +25,8 @@ SRC_URI[archive.sha256sum] = "034d23af0ea18d86e5543e707212d9297ec7d83f221808968a
 EXTRA_OECONF = " --enable-authentication-scheme=shadow \
                  --enable-debug=yes \
                  --with-console-kit \
-                 --disable-scrollkeeper "
+                 --disable-scrollkeeper \
+                 --disable-docbook-docs"
 
 do_install_prepend() {
 	mkdir -p ${D}/var/lib/gdm/.gconf.mandatory
-- 
1.8.0



