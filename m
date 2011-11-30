Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVfT7-0008LO-CG
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Nov 2011 09:24:41 +0100
Received: by mail-ey0-f175.google.com with SMTP id d13so325412eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2011 00:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=17l6AuKnFF6Lbf6Gc4Jl2HFxNrt6NWx8Kh9UgW82bNU=;
	b=sW2JST1cGvGlG/HAt25K6KXpiWG+R5ykQ4/QwczRDq0myXWSkNV3izG6LHRqEcCoKz
	ERVZ5mFDu9jtSG0x0Ixv1ykwlQe6a3R2jBPqB6uzflT+B4LXKKFBd99uSDHegqIph+7q
	bRZHO0xtm/jp+34chJzNaPH3VSVSY/MNYlP0o=
Received: by 10.213.101.17 with SMTP id a17mr286000ebo.78.1322641083406;
	Wed, 30 Nov 2011 00:18:03 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 8sm3648489eei.8.2011.11.30.00.18.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Nov 2011 00:18:02 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2011 09:16:53 +0100
Message-Id: <b5553359bee6bbe98a3df12f02698cdd4fdbe771.1322640506.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <55137a5d61c11567ab74d1c1382e04da35cecd5f.1322640506.git.Martin.Jansa@gmail.com>
References: <a>
	<55137a5d61c11567ab74d1c1382e04da35cecd5f.1322640506.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1322640506.git.Martin.Jansa@gmail.com>
References: <cover.1322640506.git.Martin.Jansa@gmail.com>
Subject: [meta-efl 06/11] epdf: drop upstream applied patch and ewl is gone too
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
X-List-Received-Date: Wed, 30 Nov 2011 08:24:41 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../efl/epdf/epdf.poppler-0.16.api.change.patch    |   11 -----------
 meta-efl/recipes-efl/efl/epdf_svn.bb               |    2 --
 2 files changed, 0 insertions(+), 13 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/efl/epdf/epdf.poppler-0.16.api.change.patch

diff --git a/meta-efl/recipes-efl/efl/epdf/epdf.poppler-0.16.api.change.patch b/meta-efl/recipes-efl/efl/epdf/epdf.poppler-0.16.api.change.patch
deleted file mode 100644
index 7c0ae65..0000000
--- a/meta-efl/recipes-efl/efl/epdf/epdf.poppler-0.16.api.change.patch
+++ /dev/null
@@ -1,11 +0,0 @@
-diff -uNr epdf.orig/src/lib/poppler/epdf_poppler_postscript.cpp epdf/src/lib/poppler/epdf_poppler_postscript.cpp
---- epdf.orig/src/lib/poppler/epdf_poppler_postscript.cpp	2011-09-30 20:50:03.580218578 +0200
-+++ epdf/src/lib/poppler/epdf_poppler_postscript.cpp	2011-09-30 20:49:11.573219667 +0200
-@@ -84,6 +84,7 @@
- 
-   // FIXME: fix postscript title
-   ps_dev = new PSOutputDev (postscript->filename,
-+                            postscript->pdfdoc,
-                             postscript->pdfdoc->getXRef(),
-                             postscript->pdfdoc->getCatalog(),
- 			    "PS title",
diff --git a/meta-efl/recipes-efl/efl/epdf_svn.bb b/meta-efl/recipes-efl/efl/epdf_svn.bb
index d479da6..28da32b 100644
--- a/meta-efl/recipes-efl/efl/epdf_svn.bb
+++ b/meta-efl/recipes-efl/efl/epdf_svn.bb
@@ -13,13 +13,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
 "
 
 SRC_URI = "${E_SVN}/trunk/PROTO;module=${SRCNAME};proto=http;scmdata=keep \
-           file://epdf.poppler-0.16.api.change.patch \
 "
 S = "${WORKDIR}/${SRCNAME}"
 
 EXTRA_OECONF = "\
     --enable-poppler \
-    --disable-ewl \
     --disable-mupdf \
 "
 
-- 
1.7.8.rc4



