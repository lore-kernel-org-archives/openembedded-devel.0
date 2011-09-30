Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9fTD-0004M7-Oq
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Sep 2011 17:57:51 +0200
Received: by mail-fx0-f47.google.com with SMTP id 1so3210360fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Sep 2011 08:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Y7btcxzQx+UJDTVZQS6/oCLqjlUSAdKWnyd8FU6lLOc=;
	b=ulPZCH5I4aONSrx8QMuOhK5BcUTF2Cua3gTLCR9bHGxO4frCZgu69cuCdGe5L1SSnv
	/J6nIs0vaEv81CaT9wbwVa8163CLUtHpjIqlWLxqMnrcUY8o2hKLjlUnzdHIsZdA7Cvo
	5a3zn38z4U0tu0LFXuLtKUx7avjZgK3uusBhI=
Received: by 10.223.33.67 with SMTP id g3mr6039617fad.99.1317397942463;
	Fri, 30 Sep 2011 08:52:22 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id x22sm7225346faa.5.2011.09.30.08.52.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 08:52:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Sep 2011 17:52:01 +0200
Message-Id: <693bf233bfa29679ae342b8bcd7b018f3fb0a840.1317397769.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <d949b79e20616add7118dcc7cb4f5ee08b4fed3b.1317397769.git.Martin.Jansa@gmail.com>
References: <d949b79e20616add7118dcc7cb4f5ee08b4fed3b.1317397769.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317397769.git.Martin.Jansa@gmail.com>
References: <cover.1317397769.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/6] pango: upgrade to 1.29.4
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
X-List-Received-Date: Fri, 30 Sep 2011 15:57:51 -0000

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
1.7.6.1



