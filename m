Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 7672F7E09C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 May 2019 21:09:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 451fpc0tjvz5l
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 May 2019 23:09:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557608968;
	bh=cDRb48LyvZfN8TAVN5D1To3VVqLZVyoLaTMww4FyFxQ=;
	h=From:To:Subject:Date:From;
	b=OpPSC9fayoYxK/Bb4uWnxCMxOzAmc6sJZ0Bp/BXwWRMyeC6spSkBySfKlhXpLOpWz
	gFdEfp6ddwSrwIDLLlx7juDgzoUwyWypdjx6ETldMSgPkk4OfLQIDDTeabOzgyLcYP
	S3/usx1huKYyxjpOL2HN2aOjjykq7/z6IIQlVxmiVwXcPEY69RJ07kpEPgyH+VzunC
	91O87j2PPsw5kIuYvStVfjcudpmlesdl7+HdG4C1lbJvLqORN31Kw+IUweiQ7XGmr3
	s++p0SCR5PLoEoMqTvfyjCXe/r5fg596ShfUdC2M5LwJQyFXa9roi+aZ/0iJcqQb48
	MhhKlw6iJcEKZ0WSn20hMOJUvomqX6FT/Jvlpdi1cSfh8tgHJQgd58EhcMwXTelWIH
	Py+mv8E2B+OoPgcGy3c/50oRxUTtK4mSKTGU1bypJ2FYKPVCr5KvFWr5AXJUh69+qd
	Lohd9miQCGhPo0UqKWS2HfYgPInDUK0sIhoc/gQujOg4fKYE/j7x54NjU0ViwoycEi
	qQAyHNVr2sy7gHmp3InI7SnWd95l+ZguwWR/XJHjWGpFEO3We3K2eFlhOg5B2uPGfF
	mnmgWJziBf1Busw/VRLt3/vYAS1hxG29mFzqwoVYerbrZRhgfPaCZ8ZLjsX2XhxLdj
	sWWzqB2HEjcEsqux42AcmCxs=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 May 2019 00:09:27 +0300
Message-Id: <20190511210927.16928-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH v2] rdfind: Upgrade 1.3.4 -> 1.4.1
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
X-List-Received-Date: Sat, 11 May 2019 21:09:27 -0000

Remove patch for issue fixed upstream.
The change in COPYING is due to updated FSF postal address.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../rdfind/files/reproducible_build.patch     | 46 -------------------
 .../recipes-support/rdfind/rdfind_1.3.4.bb    | 17 -------
 .../recipes-support/rdfind/rdfind_1.4.1.bb    | 16 +++++++
 3 files changed, 16 insertions(+), 63 deletions(-)
 delete mode 100644 meta-oe/recipes-support/rdfind/files/reproducible_build.patch
 delete mode 100644 meta-oe/recipes-support/rdfind/rdfind_1.3.4.bb
 create mode 100644 meta-oe/recipes-support/rdfind/rdfind_1.4.1.bb

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
diff --git a/meta-oe/recipes-support/rdfind/rdfind_1.3.4.bb b/meta-oe/recipes-support/rdfind/rdfind_1.3.4.bb
deleted file mode 100644
index 4d984ee05..000000000
--- a/meta-oe/recipes-support/rdfind/rdfind_1.3.4.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "Rdfind is a program that finds duplicate files"
-HOMEPAGE = "https://rdfind.pauldreik.se/"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
-
-DEPENDS = "nettle"
-
-SRC_URI = "https://rdfind.pauldreik.se/${BP}.tar.gz \
-           file://reproducible_build.patch \
-"
-
-SRC_URI[md5sum] = "97c0cb35933588413583c61d3b5f9adf"
-SRC_URI[sha256sum] = "a5f0b3f72093d927b93898c993479b35682cccb47f7393fb72bd4803212fcc7d"
-
-inherit autotools
-
-BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-support/rdfind/rdfind_1.4.1.bb b/meta-oe/recipes-support/rdfind/rdfind_1.4.1.bb
new file mode 100644
index 000000000..42f2064fd
--- /dev/null
+++ b/meta-oe/recipes-support/rdfind/rdfind_1.4.1.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Rdfind is a program that finds duplicate files"
+HOMEPAGE = "https://rdfind.pauldreik.se/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fa22e16ebbe6638b2bd253338fbded9f"
+
+DEPENDS = "nettle autoconf-archive"
+
+SRC_URI = "https://rdfind.pauldreik.se/${BP}.tar.gz \
+"
+
+SRC_URI[md5sum] = "180418c863b861d1df221bc486a07ce7"
+SRC_URI[sha256sum] = "30c613ec26eba48b188d2520cfbe64244f3b1a541e60909ce9ed2efb381f5e8c"
+
+inherit autotools
+
+BBCLASSEXTEND = "native"
-- 
2.17.1


