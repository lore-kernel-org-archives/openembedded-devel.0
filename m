Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8AA4170281
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Sep 2014 07:35:57 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id g10so7883857pdj.35
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Sep 2014 00:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+ZdFrWiamObGzs8CwHgL9EvJPN+rx+HY6KC2Yg3zSHg=;
	b=Bcy3C/kuzxLqN0QQJU8CTJQNTohksXnxhpXrzm9j0MHtKeih24jgzvMututGfG4R8B
	sbX35c6BYayoOEJ8vhCsMCwUc7a9WxVxMvO+J96vdOfYDtaBWJJiYDp9cKO2A1/6MZQU
	Whn6vK0a0ZHchjOJ7RW4zP1RuWK5yzxYj6crFNM7PwIyD00Fpi9fUpJ83toEAP+4J6VR
	BbcZA9yIsG19R7zJuCIsbdqhiJ+d+XKJjANBKeVA2qebmQ1VElT9FwRGhVDPjlLHlipv
	uZHkW/96SRi1VviBLTlIjcpsVabbKaMjKXUr8BcTid82Bt1HyHXQrVkPjwURs+hqqNdD
	7RIw==
X-Received: by 10.66.155.2 with SMTP id vs2mr44736736pab.60.1409643356663;
	Tue, 02 Sep 2014 00:35:56 -0700 (PDT)
Received: from haswell.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218])
	by mx.google.com with ESMTPSA id q1sm4253564pdq.67.2014.09.02.00.35.55
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Sep 2014 00:35:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Sep 2014 00:39:35 -0700
Message-Id: <1409643577-4088-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1409643577-4088-1-git-send-email-raj.khem@gmail.com>
References: <1409643577-4088-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 2/5] nautilus: Drop using autotools-brokensep
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
X-List-Received-Date: Tue, 02 Sep 2014 07:35:57 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb
index 58a45b1..4be3f08 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb
@@ -11,7 +11,7 @@ PR = "r6"
 DEPENDS = "gdk-pixbuf gtk+ libunique gvfs librsvg libexif esound gnome-desktop orbit2-native"
 # optional: tracker
 
-inherit gnome autotools-brokensep
+inherit gnome
 
 SRC_URI[archive.md5sum] = "51565aa10d1625dff56e381228346911"
 SRC_URI[archive.sha256sum] = "2d4ff28c7a7aa5d40eb2468149954a564c257a305183773057584d22d15347a2"
@@ -26,10 +26,10 @@ EXTRA_OECONF = " --disable-gtk-doc  --disable-update-mimedb "
 export SYSROOT = "${STAGING_DIR_HOST}"
 
 do_configure() {
-    sed -i -e /docs/d Makefile.am
+    sed -i -e /docs/d ${S}/Makefile.am
     autotools_do_configure
     # We need native orbit-idl with target idl files. No way to say it in a clean way:
-    find -name Makefile -exec sed -i '/\/usr\/bin\/orbit-idl-2/{s:/usr/bin:${STAGING_BINDIR_NATIVE}:;s:/usr/share:${STAGING_DATADIR}:g}' {} \;
+    find ${B} -name Makefile -exec sed -i '/\/usr\/bin\/orbit-idl-2/{s:/usr/bin:${STAGING_BINDIR_NATIVE}:;s:/usr/share:${STAGING_DATADIR}:g}' {} \;
 }
 
 RDEPENDS_${PN} = "gvfs gvfsd-ftp gvfsd-sftp gvfsd-trash glib-networking"
-- 
2.1.0


