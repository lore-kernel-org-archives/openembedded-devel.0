Return-Path: <Catalin.Enache@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6A84977A87
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Apr 2017 11:09:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v36B9dNa015928
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 6 Apr 2017 04:09:39 -0700 (PDT)
Received: from no3.corp.ad.wrs.com (128.224.125.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Thu, 6 Apr 2017 04:09:38 -0700
From: Catalin Enache <catalin.enache@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 6 Apr 2017 14:08:36 +0300
Message-ID: <1491476916-25507-1-git-send-email-catalin.enache@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] gd : CVE-2016-10166
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
X-List-Received-Date: Thu, 06 Apr 2017 11:09:42 -0000
Content-Type: text/plain

Integer underflow in the _gdContributionsAlloc function in gd_interpolation.c
in the GD Graphics Library (aka libgd) before 2.2.4 allows remote attackers
to have unspecified impact via vectors related to decrementing the u variable.

Reference:
http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-10166

Upstream patch:
https://github.com/libgd/libgd/commit/60bfb401ad5a4a8ae995dcd36372fe15c71e1a35

Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
---
 meta-oe/recipes-support/gd/gd/CVE-2016-10166.patch | 60 ++++++++++++++++++++++
 meta-oe/recipes-support/gd/gd_2.2.3.bb             |  3 +-
 2 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/gd/gd/CVE-2016-10166.patch

diff --git a/meta-oe/recipes-support/gd/gd/CVE-2016-10166.patch b/meta-oe/recipes-support/gd/gd/CVE-2016-10166.patch
new file mode 100644
index 0000000..7ccfbea
--- /dev/null
+++ b/meta-oe/recipes-support/gd/gd/CVE-2016-10166.patch
@@ -0,0 +1,60 @@
+From c92240c1670c20c2f854761d3a89ab61dd158c91 Mon Sep 17 00:00:00 2001
+From: "Christoph M. Becker" <cmbecker69@gmx.de>
+Date: Sat, 6 Aug 2016 10:08:53 +0200
+Subject: [PATCH] Fix potential unsigned underflow
+
+No need to decrease `u`, so we don't do it. While we're at it, we also factor
+out the overflow check of the loop, what improves performance and readability.
+
+This issue has been reported by Stefan Esser to security@libgd.org.
+
+Upstream-Status: Backport
+CVE: CVE-2016-10166
+
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+---
+ src/gd_interpolation.c | 19 ++++++++++---------
+ 1 file changed, 10 insertions(+), 9 deletions(-)
+
+diff --git a/src/gd_interpolation.c b/src/gd_interpolation.c
+index 7e7943d..9944349 100644
+--- a/src/gd_interpolation.c
++++ b/src/gd_interpolation.c
+@@ -829,8 +829,13 @@ static inline LineContribType * _gdContributionsAlloc(unsigned int line_length,
+ {
+ 	unsigned int u = 0;
+ 	LineContribType *res;
+-	int overflow_error = 0;
++	size_t weights_size;
+ 
++	if (overflow2(windows_size, sizeof(double))) {
++		return NULL;
++	} else {
++		weights_size = windows_size * sizeof(double);
++	}
+ 	res = (LineContribType *) gdMalloc(sizeof(LineContribType));
+ 	if (!res) {
+ 		return NULL;
+@@ -847,15 +852,11 @@ static inline LineContribType * _gdContributionsAlloc(unsigned int line_length,
+ 		return NULL;
+ 	}
+ 	for (u = 0 ; u < line_length ; u++) {
+-		if (overflow2(windows_size, sizeof(double))) {
+-			overflow_error = 1;
+-		} else {
+-			res->ContribRow[u].Weights = (double *) gdMalloc(windows_size * sizeof(double));
+-		}
+-		if (overflow_error == 1 || res->ContribRow[u].Weights == NULL) {
++		res->ContribRow[u].Weights = (double *) gdMalloc(weights_size);
++		if (res->ContribRow[u].Weights == NULL) {
+ 			unsigned int i;
+-			u--;
+-			for (i=0;i<=u;i++) {
++
++			for (i=0;i<u;i++) {
+ 				gdFree(res->ContribRow[i].Weights);
+ 			}
+ 			gdFree(res->ContribRow);
+-- 
+2.10.2
+
diff --git a/meta-oe/recipes-support/gd/gd_2.2.3.bb b/meta-oe/recipes-support/gd/gd_2.2.3.bb
index c5aff66..4ff6b756 100644
--- a/meta-oe/recipes-support/gd/gd_2.2.3.bb
+++ b/meta-oe/recipes-support/gd/gd_2.2.3.bb
@@ -13,7 +13,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c97638cafd3581eb87abd37332137669"
 DEPENDS = "freetype libpng jpeg zlib tiff"
 
 SRC_URI = "git://github.com/libgd/libgd.git;branch=GD-2.2 \
-           file://fix-gcc-unused-functions.patch"
+           file://fix-gcc-unused-functions.patch \
+           file://CVE-2016-10166.patch"
 
 SRCREV = "46ceef5970bf3a847ff61d1bdde7501d66c11d0c"
 
-- 
2.10.2


