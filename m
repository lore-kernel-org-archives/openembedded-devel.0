Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAifB-0004rG-8M
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Oct 2011 15:34:33 +0200
Received: by gyg8 with SMTP id 8so3335196gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Oct 2011 06:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=a3az8OL/F7NWORgbxQY+ceP5qqrBJDr2lK7+ojaRbPo=;
	b=AVrvhF7HwzYEtAFT6ccdsJdLcM3YRgEx9xZ6niy2YuXJbOLIK24pOpSaWkDp2Z32/u
	gfBcYm1yoLV0wmfsknW01n9j3XADwKAsAoVNRGqyTPB2P15F657sNDEByZbk4odc3a7S
	IzbAGurg5XWNh6uv6PvGjnLaxQ7CnBo2vJ69E=
Received: by 10.223.18.203 with SMTP id x11mr202042faa.4.1317648537416;
	Mon, 03 Oct 2011 06:28:57 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a7sm21259520fam.22.2011.10.03.06.28.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 06:28:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Oct 2011 15:27:10 +0200
Message-Id: <35eb5f4d61bb50cce04d0e9b2352742e333a74be.1317648011.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <ebe115dd156cf69f5e7fb7076816c5faa3748ce6.1317648011.git.Martin.Jansa@gmail.com>
References: <ebe115dd156cf69f5e7fb7076816c5faa3748ce6.1317648011.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317648011.git.Martin.Jansa@gmail.com>
References: <cover.1317648011.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCHv2 12/25] pango: upgrade to 1.29.4
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
X-List-Received-Date: Mon, 03 Oct 2011 13:34:33 -0000

* pango older than 1.29.1 causes ie libglade build fail with
  /usr/include/pango-1.0/pango/pango-script.h:132:12: error: unknown type name 'G_CONST_RETURN'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../pango/pango-1.28.3/no-tests.patch              |   10 ----------
 .../pango/pango-1.29.4/no-tests.patch              |   11 +++++++++++
 meta-oe/recipes-graphics/pango/pango_1.28.3.bb     |    9 ---------
 meta-oe/recipes-graphics/pango/pango_1.29.4.bb     |    9 +++++++++
 4 files changed, 20 insertions(+), 19 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/pango/pango-1.28.3/no-tests.patch
 create mode 100644 meta-oe/recipes-graphics/pango/pango-1.29.4/no-tests.patch
 delete mode 100644 meta-oe/recipes-graphics/pango/pango_1.28.3.bb
 create mode 100644 meta-oe/recipes-graphics/pango/pango_1.29.4.bb

diff --git a/meta-oe/recipes-graphics/pango/pango-1.28.3/no-tests.patch b/meta-oe/recipes-graphics/pango/pango-1.28.3/no-tests.patch
deleted file mode 100644
index dafcb20..0000000
--- a/meta-oe/recipes-graphics/pango/pango-1.28.3/no-tests.patch
+++ /dev/null
@@ -1,10 +0,0 @@
---- /tmp/Makefile.am	2007-03-01 13:29:37.000000000 +0100
-+++ pango-1.16.0/Makefile.am	2007-03-01 13:29:52.545251000 +0100
-@@ -1,6 +1,6 @@
- ## Process this file with automake to create Makefile.in.
- 
--SUBDIRS= pango modules pango-view examples docs tools tests
-+SUBDIRS= pango modules pango-view examples docs tools 
- 
- EXTRA_DIST = 			\
- 	autogen.sh		\
diff --git a/meta-oe/recipes-graphics/pango/pango-1.29.4/no-tests.patch b/meta-oe/recipes-graphics/pango/pango-1.29.4/no-tests.patch
new file mode 100644
index 0000000..ce64db1
--- /dev/null
+++ b/meta-oe/recipes-graphics/pango/pango-1.29.4/no-tests.patch
@@ -0,0 +1,11 @@
+diff -uNr pango-1.29.4.orig/Makefile.am pango-1.29.4/Makefile.am
+--- pango-1.29.4.orig/Makefile.am	2011-08-16 03:11:08.000000000 +0200
++++ pango-1.29.4/Makefile.am	2011-09-30 16:11:53.792567952 +0200
+@@ -1,6 +1,6 @@
+ ## Process this file with automake to create Makefile.in.
+ 
+-SUBDIRS= pango modules pango-view examples docs tools tests build
++SUBDIRS= pango modules pango-view examples docs tools build
+ 
+ EXTRA_DIST = 			\
+ 	autogen.sh		\
diff --git a/meta-oe/recipes-graphics/pango/pango_1.28.3.bb b/meta-oe/recipes-graphics/pango/pango_1.28.3.bb
deleted file mode 100644
index 4c875bf..0000000
--- a/meta-oe/recipes-graphics/pango/pango_1.28.3.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require pango.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
-
-SRC_URI[archive.md5sum] = "caa74baea47e7e16bc73c89f9089d522"
-SRC_URI[archive.sha256sum] = "5e278bc9430cc7bb00270f183360d262c5006b51248e8b537ea904573f200632"
-
-PR = "${INC_PR}.0"
-
diff --git a/meta-oe/recipes-graphics/pango/pango_1.29.4.bb b/meta-oe/recipes-graphics/pango/pango_1.29.4.bb
new file mode 100644
index 0000000..0642bea
--- /dev/null
+++ b/meta-oe/recipes-graphics/pango/pango_1.29.4.bb
@@ -0,0 +1,9 @@
+require pango.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
+
+SRC_URI[archive.md5sum] = "a5ee785f4f31d6bdd8625a09ea3f8b4b"
+SRC_URI[archive.sha256sum] = "f15deecaecf1e9dcb7db0e4947d12b5bcff112586434f8d30a5afd750747ff2b"
+
+PR = "${INC_PR}.0"
+
-- 
1.7.7



