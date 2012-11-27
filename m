Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TdObS-0005KC-D6
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 18:05:46 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so4828389eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2012 08:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Oh1d+SdCvemIrbKt78Genv9JBEBc262x/vJ1hdVrTJ4=;
	b=hfYplMeTFvnTNQ175mXrE8tmnWWgvlcp5uSZ7LodcTOQiWYItybtKZT7ExlnrhY+SH
	88E+A4DtPFlrN7MYLPHX9ZYNSik01XH+PRZ9twpSGnyX6OUsTEgj07AYvjDbLkenFS2s
	19/QkzFXRk2XsVUWLAEfXghbEm8l79VXpnoJouXnMQe5zP6Hrg8e3esTZc5g+gPO41iF
	Ey2zbk94ThkgO5li+08/ZCuITTGe0nWyS8niIdBrvqmLFtE3nwIgNKEupkN4/TUKoAT+
	fRIrpY85GuTMxtO7Sqh+xb7jfiIJk8fJuho6Gcmh/NsB/F0Hx1Pt3jeCqXtBVje6rDVD
	rDKw==
Received: by 10.14.216.70 with SMTP id f46mr60105785eep.12.1354035095449;
	Tue, 27 Nov 2012 08:51:35 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q2sm41681706eem.13.2012.11.27.08.51.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Nov 2012 08:51:34 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Nov 2012 17:51:12 +0100
Message-Id: <60bbaa00f9e6a439cb9a180f272543bd73189138.1354034673.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354034673.git.Martin.Jansa@gmail.com>
References: <cover.1354034673.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354034673.git.Martin.Jansa@gmail.com>
References: <cover.1354034673.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/5] samba: update waf-as-source.patch to apply
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
X-List-Received-Date: Tue, 27 Nov 2012 17:05:46 -0000

* and Applying patch waf-as-source.patch
  ...
  File buildtools/bin/waf-svn is not empty after patch; not deleting
  ...
  Patch waf-as-source.patch does not apply (enforce with -f)
  I've dropped this chunk and now it builds

* there is also WARNING about unpackaged but empty base_sbindir
  WARNING: QA Issue: samba: Files/directories were installed but not
  shipped
    /sbin
  created by do_install in samba.inc but used only when cifs is built,
  maybe we should remove it from samba.inc now

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/samba/samba-3.6.8/waf-as-source.patch | 4 ----
 meta-oe/recipes-connectivity/samba/samba_3.6.8.bb                  | 2 +-
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-oe/recipes-connectivity/samba/samba-3.6.8/waf-as-source.patch b/meta-oe/recipes-connectivity/samba/samba-3.6.8/waf-as-source.patch
index 3ba7d23..985ed5a 100644
--- a/meta-oe/recipes-connectivity/samba/samba-3.6.8/waf-as-source.patch
+++ b/meta-oe/recipes-connectivity/samba/samba-3.6.8/waf-as-source.patch
@@ -44,10 +44,6 @@ index 9ef8a1f..0000000
 -You can get a svn copy of the upstream source with:
 -
 -  svn checkout http://waf.googlecode.com/svn/trunk/ waf-read-only
-diff --git a/buildtools/bin/waf-svn b/buildtools/bin/waf-svn
-deleted file mode 100755
-index 6d54d5f..0000000
-Binary files a/buildtools/bin/waf-svn and /dev/null differ
 diff --git a/buildtools/update-waf.sh b/buildtools/update-waf.sh
 new file mode 100755
 index 0000000..bb3a4bf
diff --git a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
index cc09a48..7c54dae 100644
--- a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
+++ b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
@@ -3,7 +3,7 @@ require samba-basic.inc
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI += "\
     file://config-h.patch \
-- 
1.8.0



