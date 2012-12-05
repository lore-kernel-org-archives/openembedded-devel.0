Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TgJy7-000058-Fz
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Dec 2012 19:45:15 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so3067419eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Dec 2012 10:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=qhBAEPWhZ4n4wbeWoWDseyFzMiCHHMn9OIv2uPCZnFQ=;
	b=Y+SNLzJtF+keoaxKQFIdkoX+in2Dywr2OiPwDdWz82iSzeg3zamxNJuXjVoIOTGpLF
	lv6DvxiigkaaiZDzxH/2xh/mDmgX8s3cr8IFUJQYa+HFBXestSa7bfYFikVQYs27+LJ1
	4ZhAsiI+QkD76lp0jk782QnqzYYHKgJyH9O4uvA4XebbQa1wfuhrwpLfIJ95kh3ypyt7
	IM0KhmbbVA8X3y7Lq+y45n+ANNKPLFXoCIAzgrG54rUuFueacouNjcfr6f3Tz3zmWfz4
	vhKRu0ZSbaWdnGKwqI1cREJ7d2y9TBFneA/hA7rqoCmFfeZLY3GIF50FXt2/+pKlQffe
	4Whw==
Received: by 10.14.184.131 with SMTP id s3mr63151542eem.38.1354732253598;
	Wed, 05 Dec 2012 10:30:53 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r1sm10709299eeo.2.2012.12.05.10.30.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 10:30:52 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Dec 2012 19:30:25 +0100
Message-Id: <3b5c0e895fd0b5b8d8b04e55411c2826699190a4.1354731625.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <bef5b1c61f91ea5f2b28a981c69a9ed35cf27d74.1354731625.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
	<bef5b1c61f91ea5f2b28a981c69a9ed35cf27d74.1354731625.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354731625.git.Martin.Jansa@gmail.com>
References: <cover.1354731625.git.Martin.Jansa@gmail.com>
Subject: [PATCH 67/77] desktop-file-utils: don't build /usr/share/emacs/site-lisp/desktop-entry-mode.el
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
X-List-Received-Date: Wed, 05 Dec 2012 18:45:18 -0000

* fixes:
desktop-file-utils-0.18: desktop-file-utils: Files/directories were installed but not shipped
  /usr/share/emacs
  /usr/share/emacs/site-lisp
  /usr/share/emacs/site-lisp/desktop-entry-mode.el
  /usr/share/emacs/site-lisp/desktop-entry-mode.elc
  when emacs is available

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-gnome/desktop-file-utils/desktop-file-utils_0.18.bb       | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-gnome/recipes-gnome/desktop-file-utils/desktop-file-utils_0.18.bb b/meta-gnome/recipes-gnome/desktop-file-utils/desktop-file-utils_0.18.bb
index 14af764..ddd388c 100644
--- a/meta-gnome/recipes-gnome/desktop-file-utils/desktop-file-utils_0.18.bb
+++ b/meta-gnome/recipes-gnome/desktop-file-utils/desktop-file-utils_0.18.bb
@@ -5,10 +5,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "glib-2.0"
 
+PR = "r1"
+
 SRC_URI = "http://www.freedesktop.org/software/desktop-file-utils/releases/desktop-file-utils-${PV}.tar.bz2"
 SRC_URI[md5sum] = "d966b743eb394650f98d5dd56b9aece1"
 SRC_URI[sha256sum] = "d9449956c1c8caa75281a3322b2bb433db42610942f0ceeaa65ccd9636c04231"
 
 inherit autotools
 
+CACHED_CONFIGUREVARS += "ac_cv_prog_EMACS=no"
+
 BBCLASSEXTEND = "native"
-- 
1.8.0



