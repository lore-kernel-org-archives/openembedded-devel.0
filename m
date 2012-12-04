Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi6y-00040y-F1
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:19:52 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1926936eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ZGHdfcwpUQopmkvKI9ABWKvcV+ByHmjSKvg4z/f3Bcc=;
	b=KU79WuZSVpBJhl7LjYYcZ9HON8B1KVw4wVliswiY8JAfNPdtBndyKY344cZgLdo5EM
	RBgtUs9fPDHa3RbJBJwRF3Vf3ckSd8a7pFBAm6ezDvHmq5B0tNgxTxaVHvcyvfa9S8/S
	YupDX/pxCuRAG8Lh7jwouvophYMBcUAEXpUTGM+ODDLYyVEksVWlQtk+Oh8wonciWjpJ
	t5VZjvpGSTTTa0CRnk7UKSoa5Ert0XgKFVCcotdEpiJNEjkLvjkgFDVarU+LmRkE7fLA
	C0H4hvrSKtfZrjfo97M6AiVmUfDKotDvboO8hvveT61IQLnbM1XR2rbR5ZA+FkQ0z8v8
	eCgg==
Received: by 10.14.0.3 with SMTP id 3mr42773059eea.16.1354586732777;
	Mon, 03 Dec 2012 18:05:32 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b2sm34810653eep.9.2012.12.03.18.05.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:05:32 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:59:16 +0100
Message-Id: <6bd81f8a98bd4e3ec30e042ff54ed2964581eb49.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 43/58] libgnomeui: fix QA warnings from packaging
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
X-List-Received-Date: Tue, 04 Dec 2012 02:19:53 -0000

* fixes:
libgnomeui-2.24.3: non -staticdev package contains static .a library:
libgnomeui-dev path
'/work/armv7a-vfp-neon-oe-linux-gnueabi/libgnomeui/2.24.3-r0/packages-split/libgnomeui-dev/usr/lib/libglade/2.0/libgnome.a'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/libgnome/libgnomeui.inc       | 3 ++-
 meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.3.bb | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomeui.inc b/meta-gnome/recipes-gnome/libgnome/libgnomeui.inc
index 5d0053b..bf9ae69 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnomeui.inc
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomeui.inc
@@ -10,7 +10,8 @@ inherit gnome
 FILES_${PN} += "${libdir}/gtk-2.0/*/filesystems/lib*.so \
                 ${libdir}/libglade/*/lib*.so \
                 ${datadir}/pixmaps/gnome-about-logo.png"
-FILES_${PN}-dev += "${libdir}/gtk-2.0/*/filesystems/*.la ${libdir}/gtk-2.0/*/filesystems/*.a ${libdir}/libglade/*/*.la ${libdir}/libglade/*/*.a"
+FILES_${PN}-dev += "${libdir}/gtk-2.0/*/filesystems/*.la ${libdir}/gtk-2.0/*/filesystems/*.a ${libdir}/libglade/*/*.la"
+FILES_${PN}-staticdev += "${libdir}/libglade/*/*.a"
 FILES_${PN}-dbg += "${libdir}/gtk-2.0/*/filesystems/.debug/ ${libdir}/libglade/*/.debug/"
 
 SRC_URI += "file://gnome-stock-pixbufs.h file://no-pixbuf-csource.patch"
diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.3.bb b/meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.3.bb
index 56f2840..597c2ff 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.3.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.3.bb
@@ -1,4 +1,6 @@
 require libgnomeui.inc
 
+PR = "r1"
+
 SRC_URI[archive.md5sum] = "ceab6f4370581d1a03c09f15cc103099"
 SRC_URI[archive.sha256sum] = "04c81f3bb5a337cdf3ed1230916f82d29857ee95eb884f58dd2f5c6860efe803"
-- 
1.8.0



