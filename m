Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T2HN0-0004st-Mt
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Aug 2012 09:53:26 +0200
Received: by wgbdr1 with SMTP id dr1so2768235wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Aug 2012 00:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=nOJbZPHJvQiLDS/umKXcjz1aTLr1VZvW5k0vvMaR1xE=;
	b=hBzZQjtif7+QG4tCjXbiVj4st3tLYykkXch+ZcYZLfxVXPBBpKxc3zt4vZ9Gl/hJLB
	0WJGcy5T6mfgNTMrPHFy4gyUHs2wugNPuAaeQ+ZXN8RAity3antwvBGPwvT0updnF2Hi
	qF56AabCBsSlZYN7p9C8fTNmCU9nGuMG4LsZGCKt0FEG5hCoOjov/M0s/208S98YA+io
	L+239wmrzY3H2aObKMYFpZ7/gyQNaa1T1fElmQ201ZDiE639pnrCyg+ucawdKvnQM/NE
	B7ld+NcjO52yXO+7Ok3bt3wo0jIUSz2/XlkJ4bSI3bxnLYQhoqMfkm/dTfRAVhbac64H
	CHvw==
Received: by 10.180.106.97 with SMTP id gt1mr2790698wib.5.1345189288425;
	Fri, 17 Aug 2012 00:41:28 -0700 (PDT)
Received: from localhost.localdomain (p4FDF1574.dip.t-dialin.net.
	[79.223.21.116])
	by mx.google.com with ESMTPS id cl8sm8281791wib.10.2012.08.17.00.41.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Aug 2012 00:41:27 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Aug 2012 09:48:19 +0200
Message-Id: <1345189700-26130-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-oe] pango: remove and use oe-core version 1.30
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
X-List-Received-Date: Fri, 17 Aug 2012 07:53:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
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
1.7.4.4



