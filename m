Return-Path: <Haiqing.Bai@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E683961035
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2020 06:25:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0246P59Y012579
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 3 Mar 2020 22:25:15 -0800
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.487.0;
	Tue, 3 Mar 2020 22:24:43 -0800
From: Haiqing Bai <Haiqing.Bai@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <haiqing.bai@windriver.com>
Date: Wed, 4 Mar 2020 14:24:13 +0800
Message-ID: <1583303054-235689-1-git-send-email-Haiqing.Bai@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [V2][master][zeus][PATCH] gd: fix CVE-2017-6363
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
X-List-Received-Date: Wed, 04 Mar 2020 06:25:25 -0000
Content-Type: text/plain

Backport the CVE patch from the upstream to fix the heap-based buffer
over-read in tiffWriter.

Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
---
 meta-oe/recipes-support/gd/gd/CVE-2017-6363.patch | 35 +++++++++++++++++++++++
 meta-oe/recipes-support/gd/gd_2.2.5.bb            |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-support/gd/gd/CVE-2017-6363.patch

diff --git a/meta-oe/recipes-support/gd/gd/CVE-2017-6363.patch b/meta-oe/recipes-support/gd/gd/CVE-2017-6363.patch
new file mode 100644
index 0000000..25b5880
--- /dev/null
+++ b/meta-oe/recipes-support/gd/gd/CVE-2017-6363.patch
@@ -0,0 +1,35 @@
+From 8f7b60ea7db87de5df76169e3f3918e401ef8bf7 Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@gentoo.org>
+Date: Wed, 31 Jan 2018 14:50:16 -0500
+Subject: [PATCH] gd/gd2: make sure transparent palette index is within bounds
+ #383
+
+The gd image formats allow for a palette of 256 colors,
+so if the transparent index is out of range, disable it.
+
+Upstream-Status: Backport
+[https://github.com/libgd/libgd.git commit:0be86e1926939a98afbd2f3a23c673dfc4df2a7c]
+CVE-2017-6363
+
+Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
+---
+ src/gd_gd.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/gd_gd.c b/src/gd_gd.c
+index f8d39cb..5a86fc3 100644
+--- a/src/gd_gd.c
++++ b/src/gd_gd.c
+@@ -54,7 +54,8 @@ _gdGetColors (gdIOCtx * in, gdImagePtr im, int gd2xFlag)
+ 		if (!gdGetWord (&im->transparent, in)) {
+ 			goto fail1;
+ 		}
+-		if (im->transparent == 257) {
++		/* Make sure transparent index is within bounds of the palette. */
++		if (im->transparent >= 256 || im->transparent < 0) {
+ 			im->transparent = (-1);
+ 		}
+ 	}
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-support/gd/gd_2.2.5.bb b/meta-oe/recipes-support/gd/gd_2.2.5.bb
index 35f9bb2..dda2e67 100644
--- a/meta-oe/recipes-support/gd/gd_2.2.5.bb
+++ b/meta-oe/recipes-support/gd/gd_2.2.5.bb
@@ -17,6 +17,7 @@ SRC_URI = "git://github.com/libgd/libgd.git;branch=GD-2.2 \
            file://0001-annotate.c-gdft.c-Replace-strncpy-with-memccpy-to-fi.patch \
            file://CVE-2018-1000222.patch \
            file://CVE-2019-6978.patch \
+           file://CVE-2017-6363.patch \
           "
 
 SRCREV = "8255231b68889597d04d451a72438ab92a405aba"
-- 
1.9.1


