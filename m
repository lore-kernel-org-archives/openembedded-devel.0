Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C0DC47E085
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 11:55:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 450pYj6QFMzFr
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 13:55:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557489322;
	bh=/icBGNLFfgCZ2dwA0Zqhtd+Vg19GcTeZKNBHF1TUbC0=;
	h=From:To:Subject:Date:From;
	b=tTld5d1rcKt3i9Q2UFJnLJbn16EhiEvu6HAIevP79dZhKzimaXdc0/NItnQJn4OTH
	DhEUIAPPCkuof942BKccXYLVVhbxXNGJZMuPXZPaVhAgxUVKOR1pDuPXKS7Yrg5Qgf
	W8CSul1kqRIpiQQ0hVUu7hz2YMINg2dETNsNU6cVpnauWokExEk9ZM6nY6szPvkbRq
	BRV2twjinYtyhvxDmQPvNe8cRBW0DTUZ6/cqXUpnkjVJwUCM6qz42xOAy8sB5JiI2B
	stQpFesdcH8LUKbNWrepD8qc01AI/k+IZQ7hg+Xo3YWzS/saa0BdzR8XlhkU1mqtAO
	1qMsfOsSWE5M/Uf8HO35vTGqt/EonAm1+qt5N3yaOKeIWjwww4/+BW6g6N8YLnrgak
	X2pw3KA0S7pWuDFjDBs7N73tJt/H2yscFQA1LMcFzYlZCpLDfCGOMnOfuQgtDK5tM0
	Tp3D8loK7QBHqW3BzpkGVRMbyan65r6JIRma8Ucwo4cU14pyswqweWByUVJ1vgNFkA
	pYzli+eOLhqI6GD2iD1yXxl9VW/fT97LsQxXwToph7bEhF5UmOqakGoo/gbh3B7xGD
	cTO7xq2ZrXz2dryx8tKU1affBFvbD6Gmynyww+/kjd3JKeCpSekIaQOaXXQqCWxVKj
	IfsLphvgqCIHsAsVxCvfanGI=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 May 2019 14:55:14 +0300
Message-Id: <20190510115515.19491-18-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] rdfind: Upgrade 1.3.4 -> 1.4.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 May 2019 11:55:21 -0000

Remove patch for issue fixed upstream.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../rdfind/files/reproducible_build.patch     | 46 -------------------
 .../{rdfind_1.3.4.bb => rdfind_1.4.1.bb}      |  5 +-
 2 files changed, 2 insertions(+), 49 deletions(-)
 delete mode 100644 meta-oe/recipes-support/rdfind/files/reproducible_build.patch
 rename meta-oe/recipes-support/rdfind/{rdfind_1.3.4.bb => rdfind_1.4.1.bb} (62%)

diff --git a/meta-oe/recipes-support/rdfind/files/reproducible_build.patch b/meta-oe/recipes-support/rdfind/files/reproducible_build.patch
deleted file mode 100644
index 36728a788..000000000
--- a/meta-oe/recipes-support/rdfind/files/reproducible_build.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-Description: sort the filelist when it is complete to get reproducible behaviour
-Author: Reiner Herrmann <reiner@reiner-h.de>
-Bug-Debian: https://bugs.debian.org/795790
-
-Upstream-Status: Pending
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
-
-Index: rdfind-1.3.4/Fileinfo.hh
-===================================================================
---- rdfind-1.3.4.orig/Fileinfo.hh
-+++ rdfind-1.3.4/Fileinfo.hh
-@@ -189,6 +189,10 @@ public:
-   static bool compareondepth(const Fileinfo &a, const Fileinfo &b)
-   {return (a.depth() < b.depth());}
- 
-+  //returns true if a has lower filename than b)
-+  static bool compareonfilename(const Fileinfo &a, const Fileinfo &b)
-+  {return (a.name().compare(b.name()) < 0);}
-+
-   //fills with bytes from the file. if lasttype is supplied,
-   //it is used to see if the file needs to be read again - useful if
-   //file is shorter than the length of the bytes field.
-@@ -235,6 +239,10 @@ public:
-   static bool equaldepth(const Fileinfo &a, const Fileinfo &b)
-   {return (a.depth()==b.depth());}
- 
-+  //returns true if filenames are equal
-+  static bool equalfilename(const Fileinfo &a, const Fileinfo &b)
-+  {return (a.name()==b.name());}
-+
-   //returns true if file is a regular file. call readfileinfo first!
-   bool isRegularFile() {return m_info.is_file;}
- 
-Index: rdfind-1.3.4/rdfind.cc
-===================================================================
---- rdfind-1.3.4.orig/rdfind.cc
-+++ rdfind-1.3.4/rdfind.cc
-@@ -349,6 +349,7 @@ int main(int narg, char *argv[])
-   cout<<dryruntext<<"Now have "<<filelist1.size()<<" files in total."<<endl;
-   
-   
-+  gswd.sortlist(&Fileinfo::compareonfilename,&Fileinfo::equalfilename);
- 
-   //mark files with a unique number
-   gswd.markitems();
diff --git a/meta-oe/recipes-support/rdfind/rdfind_1.3.4.bb b/meta-oe/recipes-support/rdfind/rdfind_1.4.1.bb
similarity index 62%
rename from meta-oe/recipes-support/rdfind/rdfind_1.3.4.bb
rename to meta-oe/recipes-support/rdfind/rdfind_1.4.1.bb
index 4d984ee05..6eab78630 100644
--- a/meta-oe/recipes-support/rdfind/rdfind_1.3.4.bb
+++ b/meta-oe/recipes-support/rdfind/rdfind_1.4.1.bb
@@ -6,11 +6,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
 DEPENDS = "nettle"
 
 SRC_URI = "https://rdfind.pauldreik.se/${BP}.tar.gz \
-           file://reproducible_build.patch \
 "
 
-SRC_URI[md5sum] = "97c0cb35933588413583c61d3b5f9adf"
-SRC_URI[sha256sum] = "a5f0b3f72093d927b93898c993479b35682cccb47f7393fb72bd4803212fcc7d"
+SRC_URI[md5sum] = "180418c863b861d1df221bc486a07ce7"
+SRC_URI[sha256sum] = "30c613ec26eba48b188d2520cfbe64244f3b1a541e60909ce9ed2efb381f5e8c"
 
 inherit autotools
 
-- 
2.17.1


