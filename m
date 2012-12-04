Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi6S-0002oS-UM
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:19:20 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1377891eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=AMyl4rEy7sCLGapMgi2c8qmtQ4TVEcc3+5SwnryO+4k=;
	b=BGkqAbmQyyUBuN5rA6NS/a9aHIy2cZIlHT55Chbb+o9W7GScrjyPBM88NYtzF5ZoJ8
	yp6CsDgwR/ZRGi8zdkX5xwGJCntEikZ6VQSVhDp4QdDd7tZObSbYN4HceT0NaPgl3JjH
	KdFna6Tysg3t27Lq4bQC1wcMlvV+cdv6G36zrZw0KxD4SXXR0gssMEeUfpfLVw6djow4
	AhwZS6FbnOpyyM+QAKYv/cQZarLbhx49JINHRJ8x3KIvefq68vHuFsQ/pMEjL1O+alBz
	uhpMIuxJWGAS3Q0zLoAXUaPZeOKNSu+NVz/IXmvtq93BNUsEVhY29/dTO06BO1g8w8ob
	Knag==
Received: by 10.14.176.66 with SMTP id a42mr42779743eem.34.1354586701349;
	Mon, 03 Dec 2012 18:05:01 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z8sm34806196eeo.11.2012.12.03.18.05.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:05:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:59:12 +0100
Message-Id: <9874c8a987f2802b5de78cfd69b096126f5c1d85.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 39/58] gnome/libgnomecanvas: delete, there is newer version in libgnome/libgnomecanvas
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
X-List-Received-Date: Tue, 04 Dec 2012 02:39:11 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gnome/libgnomecanvas_2.20.0.bb | 14 --------------
 1 file changed, 14 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome/libgnomecanvas_2.20.0.bb

diff --git a/meta-gnome/recipes-gnome/gnome/libgnomecanvas_2.20.0.bb b/meta-gnome/recipes-gnome/gnome/libgnomecanvas_2.20.0.bb
deleted file mode 100644
index 9562956..0000000
--- a/meta-gnome/recipes-gnome/gnome/libgnomecanvas_2.20.0.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-LICENSE = "GPL"
-SECTION = "x11/gnome/libs"
-DESCRIPTION = "A powerful object-oriented display"
-PR = "r2"
-
-inherit gnome
-
-DEPENDS = "gtk+ libglade libart-lgpl"
-
-EXTRA_OECONF = "--disable-gtk-doc"
-
-FILES_${PN} += "${libdir}/libglade/*/libcanvas.so"
-FILES_${PN}-dbg += "${libdir}/libglade/*/.debug/"
-FILES_${PN}-dev += "${libdir}/libglade/*/libcanvas.*a"
-- 
1.8.0



