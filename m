Return-Path: <Zibo.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C581271545
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Sep 2014 23:37:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8NNbs3M010534
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Sep 2014 16:37:54 -0700 (PDT)
Received: from chinabull.wrs.com (128.224.56.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 23 Sep 2014 16:37:54 -0700
From: Zibo Zhao <zibo.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 23 Sep 2014 19:37:47 -0400
Message-ID: <1411515467-16344-2-git-send-email-zibo.zhao@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1411515467-16344-1-git-send-email-zibo.zhao@windriver.com>
References: <1411515467-16344-1-git-send-email-zibo.zhao@windriver.com>
MIME-Version: 1.0
Subject: [meta-java][PATCH 2/2] icedtea: CVE-2013-4160: integrate Non happy path fixes
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
X-List-Received-Date: Tue, 23 Sep 2014 23:37:54 -0000
Content-Type: text/plain

From: Michel Thebeau <michel.thebeau@windriver.com>

Little CMS (lcms2) before 2.5, as used in OpenJDK 7 and possibly
other products, allows remote attackers to cause a denial of
service(NULL ptr deref).

Adding NULL pointer checks fix the issue.

Signed-off-by: Michel Thebeau <michel.thebeau@windriver.com>
Signed-off-by: Zibo Zhao <zibo.zhao@windriver.com>
---
 ...cedtea-CVE-2013-4160-Non-happy-path-fixes.patch | 74 ++++++++++++++++++++++
 recipes-core/openjdk/openjdk-7-release-03b21.inc   |  2 +
 2 files changed, 76 insertions(+)
 create mode 100644 recipes-core/openjdk/openjdk-7-03b21/icedtea-CVE-2013-4160-Non-happy-path-fixes.patch

diff --git a/recipes-core/openjdk/openjdk-7-03b21/icedtea-CVE-2013-4160-Non-happy-path-fixes.patch b/recipes-core/openjdk/openjdk-7-03b21/icedtea-CVE-2013-4160-Non-happy-path-fixes.patch
new file mode 100644
index 0000000..75e11c4
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-7-03b21/icedtea-CVE-2013-4160-Non-happy-path-fixes.patch
@@ -0,0 +1,74 @@
+From 91c2db7f2559be504211b283bc3a2c631d6f06d9 Mon Sep 17 00:00:00 2001
+From: Marti Maria <info@littlecms.com>
+Date: Tue, 25 Jun 2013 16:09:16 +0200
+Subject: [PATCH] Non happy-path fixes
+
+commit 91c2db7f2559be504211b283bc3a2c631d6f06d9 from
+https://github.com/mm2/Little-CMS
+[modified for Little-CMS 2.0]
+
+Signed-off-by: Michel Thebeau <michel.thebeau@windriver.com>
+Signed-off-by: Zibo Zhao <Zibo.Zhao@windriver.com>
+---
+ src/cmsnamed.c | 12 +++++++----
+ src/cmsopt.c   | 10 ++++++++++
+ 2 files changed, 18 insertions(+), 4 deletions(-)
+
+diff --git openjdk/jdk/src/share/native/sun/java2d/cmm/lcms/cmsnamed.c openjdk/jdk/src/share/native/sun/java2d/cmm/lcms/cmsnamed.c
+index a916e17..acfd1c8 100644
+--- openjdk/jdk/src/share/native/sun/java2d/cmm/lcms/cmsnamed.c
++++ openjdk/jdk/src/share/native/sun/java2d/cmm/lcms/cmsnamed.c
+@@ -514,8 +514,8 @@ cmsNAMEDCOLORLIST* CMSEXPORT cmsAllocNamedColorList(cmsContext ContextID, cmsUIn
+     while (v -> Allocated < n)
+         GrowNamedColorList(v);
+ 
+-    strncpy(v ->Prefix, Prefix, sizeof(v ->Prefix));
+-    strncpy(v ->Suffix, Suffix, sizeof(v ->Suffix));
++    strncpy(v ->Prefix, Prefix, sizeof(v ->Prefix)-1);
++    strncpy(v ->Suffix, Suffix, sizeof(v ->Suffix)-1);
+     v -> ColorantCount = ColorantCount;
+ 
+     return v;
+@@ -571,6 +571,5 @@ cmsBool  CMSEXPORT cmsAppendNamedColor(cmsNAMEDCOLORLIST* NamedColorList,
+ 
+     if (Name != NULL)
+-        strncpy(NamedColorList ->List[NamedColorList ->nColors].Name, Name,
+-                    sizeof(NamedColorList ->List[NamedColorList ->nColors].Name));
++        strncpy(NamedColorList ->List[NamedColorList ->nColors].Name, Name, cmsMAX_PATH-1);
+    else
+        NamedColorList ->List[NamedColorList ->nColors].Name[0] = 0;
+@@ -735,6 +733,10 @@ cmsSEQ* CMSEXPORT cmsAllocProfileSequenceDescription(cmsContext ContextID, cmsUI
+     Seq -> seq      = (cmsPSEQDESC*) _cmsCalloc(ContextID, n, sizeof(cmsPSEQDESC));
+     Seq -> n        = n;
+ 
++    if (Seq -> seq == NULL) {
++        _cmsFree(ContextID, Seq);
++        return NULL;
++    }
+ 
+     for (i=0; i < n; i++) {
+         Seq -> seq[i].Manufacturer = NULL;
+diff --git openjdk/jdk/src/share/native/sun/java2d/cmm/lcms/cmsopt.c openjdk/jdk/src/share/native/sun/java2d/cmm/lcms/cmsopt.c
+index 7478e5e..4bdf0a7 100644
+--- openjdk/jdk/src/share/native/sun/java2d/cmm/lcms/cmsopt.c
++++ openjdk/jdk/src/share/native/sun/java2d/cmm/lcms/cmsopt.c
+@@ -1179,6 +1179,16 @@ Curves16Data* CurvesAlloc(cmsContext ContextID, int nCurves, int nElements, cmsT
+ 
+         c16->Curves[i] = _cmsCalloc(ContextID, nElements, sizeof(cmsUInt16Number));
+ 
++        if (c16->Curves[i] == NULL) {
++
++            for (j=0; j < i; j++) {
++                _cmsFree(ContextID, c16->Curves[j]);
++            }
++            _cmsFree(ContextID, c16->Curves);
++            _cmsFree(ContextID, c16);
++            return NULL;
++        }
++
+         if (nElements == 256) {
+ 
+             for (j=0; j < nElements; j++) {
+-- 
+1.9.1
+
diff --git a/recipes-core/openjdk/openjdk-7-release-03b21.inc b/recipes-core/openjdk/openjdk-7-release-03b21.inc
index 6f78d10..5b5caff 100644
--- a/recipes-core/openjdk/openjdk-7-release-03b21.inc
+++ b/recipes-core/openjdk/openjdk-7-release-03b21.inc
@@ -94,6 +94,7 @@ ICEDTEAPATCHES = "\
 	file://icedtea-corba-parallel-make.patch;apply=no \
         file://icedtea-zero-hotspotfix.patch;apply=no \
         file://icedtea-CVE-2014-1876-unpack.patch;apply=no \
+        file://icedtea-CVE-2013-4160-Non-happy-path-fixes.patch;apply=no \
 	"
 ICEDTEAPATCHES_append_powerpc = " \
 	file://icedtea-jdk-nio-use-host-cc.patch;apply=no \
@@ -127,6 +128,7 @@ DISTRIBUTION_PATCHES = "\
 	patches/icedtea-corba-parallel-make.patch \
         patches/icedtea-zero-hotspotfix.patch \
         patches/icedtea-CVE-2014-1876-unpack.patch \
+        patches/icedtea-CVE-2013-4160-Non-happy-path-fixes.patch \
 	"
 
 DISTRIBUTION_PATCHES_append_libc-uclibc = "\
-- 
1.9.1


