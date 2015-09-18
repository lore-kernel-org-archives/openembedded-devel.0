Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4BEBD77041
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Sep 2015 13:14:33 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so30572887wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Sep 2015 06:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UCiLT5X22rqb8hLigPGsAci/0j35Z/CVSpdXoex+sHk=;
	b=qwgRHiqd5FJw06MCJOXgIj5B7z+FcEzIIbEn46KMHcRjtbJP/Zxh7mFswJbVgcDsrn
	mudWv99Q8DHAovAf6/uNLZ4x7myTJe55kmlvZWxnofnfwiKlKWSYX/RzatmwSUkR9JXW
	h/mT30yJJTVQ0Yfi+JiQ4DeBWWXaH4o/e5Kn0e8naXrYgWoSbyyHC+IRI0Wk16p0M6b+
	izYfoSVYoJ8cIrb6k3UIWRYMGDtH+c05z60unBKGrX2IMqXdbckQ90tfQLlVufb9ZXKn
	XKwRNsZYnsgdPrDjidy9bvZDskCH9ElaR3DcQLdzJoCtIMTZZOdDGmwITBQhW8J2eK/I
	MPCA==
X-Received: by 10.194.234.40 with SMTP id ub8mr6889864wjc.95.1442582073396;
	Fri, 18 Sep 2015 06:14:33 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	x7sm15553543wia.10.2015.09.18.06.14.30
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Sep 2015 06:14:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Sep 2015 15:14:49 +0200
Message-Id: <1442582089-12197-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <20150918124547.GC11095@jama>
References: <20150918124547.GC11095@jama>
Subject: [PATCH][meta-gnome] gnome-themes: drop localedir override from configure to fix locale installation
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
X-List-Received-Date: Fri, 18 Sep 2015 13:14:33 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../gnome-themes/drop-localedir-override.patch     | 22 ++++++++++++++++++++++
 .../recipes-gnome/themes/gnome-themes_2.32.1.bb    |  4 +++-
 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/themes/gnome-themes/drop-localedir-override.patch

diff --git a/meta-gnome/recipes-gnome/themes/gnome-themes/drop-localedir-override.patch b/meta-gnome/recipes-gnome/themes/gnome-themes/drop-localedir-override.patch
new file mode 100644
index 0000000..e37482b
--- /dev/null
+++ b/meta-gnome/recipes-gnome/themes/gnome-themes/drop-localedir-override.patch
@@ -0,0 +1,22 @@
+Causes locale file to be installed in /usr/locale instead of /usr/share/locale
+
+Apply the same fix as in evolution-data-server:
+https://git.gnome.org/browse/evolution-data-server/commit/configure.ac?id=ec46c763e9342f604b7228c660623d271dfeb101
+
+Upstream-Status: Pending
+
+diff -uNr gnome-themes-2.32.1.orig/configure.in gnome-themes-2.32.1/configure.in
+--- gnome-themes-2.32.1.orig/configure.in	2015-09-18 15:01:25.152055729 +0200
++++ gnome-themes-2.32.1/configure.in	2015-09-18 15:09:03.312072156 +0200
+@@ -19,11 +19,6 @@
+ 
+ AM_GLIB_GNU_GETTEXT
+ 
+-# AM_GLIB_GNU_GETTEXT above subst. $DATADIRNAME
+-# this is the directory where the *.{mo,gmo} files are installed
+-localedir='${prefix}/${DATADIRNAME}/locale'
+-AC_SUBST(localedir)
+-
+ # Workaround to make aclocal get the right flags
+ AC_SUBST(ACLOCAL_AMFLAGS, "\${ACLOCAL_FLAGS}")
+ 
diff --git a/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb b/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
index 2da92b6..e9e1b50 100644
--- a/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
@@ -25,7 +25,9 @@ FILES_gnome-theme-mist = "${datadir}/themes/Mist ${datadir}/icons/Mist"
 
 FILES_${PN} += "${datadir}/themes ${datadir}/icons"
 
-SRC_URI += "file://iconpath-option.patch" 
+SRC_URI += "file://iconpath-option.patch \
+    file://drop-localedir-override.patch \
+" 
 SRC_URI[archive.md5sum] = "41db9e3cb25d35af2675c599e67944d1"
 SRC_URI[archive.sha256sum] = "8601ee24c2e096593221cbd6ebdb6686042225a03c02a01c0d67c163f9febd1a"
 GNOME_COMPRESS_TYPE="bz2"
-- 
2.5.1


