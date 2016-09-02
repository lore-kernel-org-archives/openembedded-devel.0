Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id A3B7676E5E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Sep 2016 02:03:29 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id a143so1833210pfa.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Sep 2016 19:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=xQF8cVO7ouMWOqNlHPPKhBy6gnlb/YzmskvJ0M8KNkk=;
	b=GbidWr92b8EEclo9dH4yCp7QIjtsCwaXl4agEjfLlYgC7v3W4cv6WFOTMYYcwNmNcm
	zi8ec/pti4uLKjCLC0EAXOC5+gLMqH38N87O27obJlB+hGNxTpepN3YTs/CBISBajm3j
	+4wWz7oXJIWQLqLqmzxHOkGzsUSitgZTgr7zy4o/ki4MfaEphUVkIKLsSBQEywDP0xoq
	bDTDMtQetf0EpXKA1UsQs7JwPGQ4fUy3SCcpujxcQ5U6dA/6f4cGEm6LGzUxTskvoQLP
	1b4imWzKxyO9EaqgjqIuz74x8YTpZIEmhSVd+Yiqw5Gc0Y+gmx9C+UnSsq1e1IbAArgG
	dGkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xQF8cVO7ouMWOqNlHPPKhBy6gnlb/YzmskvJ0M8KNkk=;
	b=mljI3DvPgalkEIZeRybnXuWmKg6uA9g2mpXN6LrBOrv4IyUI8yu82hQKu7uzdZn2Dl
	+Mp5TTN+c4vIQyFsre/iSpEVxZ6WQgeTOG4jykDy55dRF/zbBjYivmza0dZGXFtrEczw
	S0hcUtHofQ1f4HkbMOORYa7p2FMsrAp0m9d4+lzSX8CaLpsnb5XrsHFlZnWiqPnXKYJb
	dRqnImMRXOloEbUk0xfhJZ2fA67FqkXcDHnwzqQpZJfPLNEvuhs4JRYtataRIMRa7enp
	7PH9Cog3B2UBASoUHw3L6KBmYBTOILqaFbDKBoHfbSFsbapJXxSvpP99KmU107M2YKVH
	dY7A==
X-Gm-Message-State: AE9vXwPiUNbOAdJ/8EkdAZt4+Nscws88w+nhc0JnIW1mKHm5iCd0zfxsRTgnFY7uUk0KBg==
X-Received: by 10.98.82.130 with SMTP id g124mr16738772pfb.157.1472781810017; 
	Thu, 01 Sep 2016 19:03:30 -0700 (PDT)
Received: from e6520.adbgroup.pl
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	a5sm10347024pfc.89.2016.09.01.19.03.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 01 Sep 2016 19:03:28 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Sep 2016 19:03:18 -0700
Message-Id: <1472781798-24946-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] rdfind: add initial recipe, rdfind 1.3.4
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
X-List-Received-Date: Fri, 02 Sep 2016 02:03:30 -0000

  https://rdfind.pauldreik.se/

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../rdfind/files/reproducible_build.patch          | 46 ++++++++++++++++++++++
 meta-oe/recipes-support/rdfind/rdfind_1.3.4.bb     | 17 ++++++++
 2 files changed, 63 insertions(+)
 create mode 100644 meta-oe/recipes-support/rdfind/files/reproducible_build.patch
 create mode 100644 meta-oe/recipes-support/rdfind/rdfind_1.3.4.bb

diff --git a/meta-oe/recipes-support/rdfind/files/reproducible_build.patch b/meta-oe/recipes-support/rdfind/files/reproducible_build.patch
new file mode 100644
index 0000000..36728a7
--- /dev/null
+++ b/meta-oe/recipes-support/rdfind/files/reproducible_build.patch
@@ -0,0 +1,46 @@
+Description: sort the filelist when it is complete to get reproducible behaviour
+Author: Reiner Herrmann <reiner@reiner-h.de>
+Bug-Debian: https://bugs.debian.org/795790
+
+Upstream-Status: Pending
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+
+Index: rdfind-1.3.4/Fileinfo.hh
+===================================================================
+--- rdfind-1.3.4.orig/Fileinfo.hh
++++ rdfind-1.3.4/Fileinfo.hh
+@@ -189,6 +189,10 @@ public:
+   static bool compareondepth(const Fileinfo &a, const Fileinfo &b)
+   {return (a.depth() < b.depth());}
+ 
++  //returns true if a has lower filename than b)
++  static bool compareonfilename(const Fileinfo &a, const Fileinfo &b)
++  {return (a.name().compare(b.name()) < 0);}
++
+   //fills with bytes from the file. if lasttype is supplied,
+   //it is used to see if the file needs to be read again - useful if
+   //file is shorter than the length of the bytes field.
+@@ -235,6 +239,10 @@ public:
+   static bool equaldepth(const Fileinfo &a, const Fileinfo &b)
+   {return (a.depth()==b.depth());}
+ 
++  //returns true if filenames are equal
++  static bool equalfilename(const Fileinfo &a, const Fileinfo &b)
++  {return (a.name()==b.name());}
++
+   //returns true if file is a regular file. call readfileinfo first!
+   bool isRegularFile() {return m_info.is_file;}
+ 
+Index: rdfind-1.3.4/rdfind.cc
+===================================================================
+--- rdfind-1.3.4.orig/rdfind.cc
++++ rdfind-1.3.4/rdfind.cc
+@@ -349,6 +349,7 @@ int main(int narg, char *argv[])
+   cout<<dryruntext<<"Now have "<<filelist1.size()<<" files in total."<<endl;
+   
+   
++  gswd.sortlist(&Fileinfo::compareonfilename,&Fileinfo::equalfilename);
+ 
+   //mark files with a unique number
+   gswd.markitems();
diff --git a/meta-oe/recipes-support/rdfind/rdfind_1.3.4.bb b/meta-oe/recipes-support/rdfind/rdfind_1.3.4.bb
new file mode 100644
index 0000000..4d984ee
--- /dev/null
+++ b/meta-oe/recipes-support/rdfind/rdfind_1.3.4.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Rdfind is a program that finds duplicate files"
+HOMEPAGE = "https://rdfind.pauldreik.se/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
+
+DEPENDS = "nettle"
+
+SRC_URI = "https://rdfind.pauldreik.se/${BP}.tar.gz \
+           file://reproducible_build.patch \
+"
+
+SRC_URI[md5sum] = "97c0cb35933588413583c61d3b5f9adf"
+SRC_URI[sha256sum] = "a5f0b3f72093d927b93898c993479b35682cccb47f7393fb72bd4803212fcc7d"
+
+inherit autotools
+
+BBCLASSEXTEND = "native"
-- 
1.9.1


