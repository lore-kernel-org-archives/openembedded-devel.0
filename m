Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T3ZDN-0006ex-Tx
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Aug 2012 23:08:49 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so4416325wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2012 13:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=vWWAu3RgzlT+vhQOd+3/rhkNDMYTPhXEHvFyqIhqFf8=;
	b=fa0oihbJ5HgSK23L5A4OS17Ln77evjdvIAPE6r5psnjuGpf8/i3Yb0g7Qz21GxuYZB
	eOySO8WWDjWIHb6Vrv5x0I0dPiCy5PD6kLCQlsp2bfeGynMh6U0QlBCxZdAC0itMyEQz
	WGoL2DTHPqnXMYWZpCV93rmL6w6MyI2/X+nsfj27lYa6RYe1x+9pw4dui9uUB4TTieLq
	O4uUmVPoBdkG+AKS7Ngz5FvaVSoJjkDKEAbbRKyPIVKpxRwozh/avBA499t77LhXY1hy
	5r4Su412QmYKuV5QtitNxttPThevbNwU9b8E6JGQrXETuinqoYNWqmWKI2EfDPVwVuY8
	R+0g==
Received: by 10.216.68.2 with SMTP id k2mr7718079wed.69.1345496209384;
	Mon, 20 Aug 2012 13:56:49 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id h9sm29945096wiz.1.2012.08.20.13.56.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 13:56:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Aug 2012 22:56:29 +0200
Message-Id: <72f8ed45570c55c7dc293996ef793253ab8510a8.1345496053.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1345496053.git.Martin.Jansa@gmail.com>
References: <cover.1345496053.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1345496053.git.Martin.Jansa@gmail.com>
References: <cover.1345496053.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/8] pango: remove and use oe-core version 1.30
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
X-List-Received-Date: Mon, 20 Aug 2012 21:08:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@googlemail.com>

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../pango/pango-1.29.4/no-tests.patch              |   11 -----------
 meta-oe/recipes-graphics/pango/pango_1.29.4.bb     |   10 ----------
 2 files changed, 0 insertions(+), 21 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/pango/pango-1.29.4/no-tests.patch
 delete mode 100644 meta-oe/recipes-graphics/pango/pango_1.29.4.bb

diff --git a/meta-oe/recipes-graphics/pango/pango-1.29.4/no-tests.patch b/meta-oe/recipes-graphics/pango/pango-1.29.4/no-tests.patch
deleted file mode 100644
index ce64db1..0000000
--- a/meta-oe/recipes-graphics/pango/pango-1.29.4/no-tests.patch
+++ /dev/null
@@ -1,11 +0,0 @@
-diff -uNr pango-1.29.4.orig/Makefile.am pango-1.29.4/Makefile.am
---- pango-1.29.4.orig/Makefile.am	2011-08-16 03:11:08.000000000 +0200
-+++ pango-1.29.4/Makefile.am	2011-09-30 16:11:53.792567952 +0200
-@@ -1,6 +1,6 @@
- ## Process this file with automake to create Makefile.in.
- 
--SUBDIRS= pango modules pango-view examples docs tools tests build
-+SUBDIRS= pango modules pango-view examples docs tools build
- 
- EXTRA_DIST = 			\
- 	autogen.sh		\
diff --git a/meta-oe/recipes-graphics/pango/pango_1.29.4.bb b/meta-oe/recipes-graphics/pango/pango_1.29.4.bb
deleted file mode 100644
index ea79a63..0000000
--- a/meta-oe/recipes-graphics/pango/pango_1.29.4.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require recipes-graphics/pango/pango.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
-
-SRC_URI[archive.md5sum] = "a5ee785f4f31d6bdd8625a09ea3f8b4b"
-SRC_URI[archive.sha256sum] = "f15deecaecf1e9dcb7db0e4947d12b5bcff112586434f8d30a5afd750747ff2b"
-
-SRC_URI += "file://no-tests.patch"
-
-PR = "r4"
-- 
1.7.8.6



