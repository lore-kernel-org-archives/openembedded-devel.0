Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id A12A560782
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 20:32:54 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id hz1so4353289pad.21
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 13:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1YeHXrGIbgndBxGx/atvj2Hj56GSTx+Q3aandluLSU8=;
	b=yR51os041cCzBWl2JpWE2MpyPhUlVXSmAokhRIV5YjjgixP2VH8i5wciLvAQz2CI+3
	JJWOLq0pt4xeswyTDQFc93Buk5DYseQcPGfQluzuKPIGIcwZFCFzDf3LWq4c2rPfK+Y6
	yyQ0KoFUrnxHV+zh8FCo6e7PO7fsOfXW/Otp9EJOw9u86pWnRxhgG3Hhp2LOLVJBukeL
	FNzn+tWhWHG3BkylpFTvitg9iL7I9iYre5loc3zpqyvB/LOBQ9I2l/ssYjj31w1peta9
	2dxQHQ4u2uYlp9h6cUy0P08SLl+241KjiH4nnklFUJ6kLEXqH6WKDhwT+DOQEHynXoF7
	6+fQ==
X-Received: by 10.66.161.231 with SMTP id xv7mr15787000pab.7.1398544375423;
	Sat, 26 Apr 2014 13:32:55 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	ci4sm24455471pbb.50.2014.04.26.13.32.54 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Apr 2014 13:32:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Apr 2014 13:34:39 -0700
Message-Id: <1398544484-27299-16-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1398544484-27299-1-git-send-email-raj.khem@gmail.com>
References: <1398544484-27299-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 16/21] nautilus: Fix build when S != B
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
X-List-Received-Date: Sat, 26 Apr 2014 20:32:54 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb
index 0714815..4be3f08 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb
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
1.7.10.4


