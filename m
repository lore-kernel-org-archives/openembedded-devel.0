Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7B86A77B95
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Sep 2017 19:29:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v86JTWdO022110
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 6 Sep 2017 12:29:33 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 6 Sep 2017 12:29:32 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Sep 2017 14:23:00 -0500
Message-ID: <1504725809-12825-3-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
References: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 02/31] libml: Move to oe-core
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
X-List-Received-Date: Wed, 06 Sep 2017 19:29:32 -0000
Content-Type: text/plain

Moved to oe-core, remove this version.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta-networking/recipes-filter/libmnl/libmnl_1.0.4.bb | 13 -------------
 1 file changed, 13 deletions(-)
 delete mode 100644 meta-networking/recipes-filter/libmnl/libmnl_1.0.4.bb

diff --git a/meta-networking/recipes-filter/libmnl/libmnl_1.0.4.bb b/meta-networking/recipes-filter/libmnl/libmnl_1.0.4.bb
deleted file mode 100644
index b458799..0000000
--- a/meta-networking/recipes-filter/libmnl/libmnl_1.0.4.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = "Minimalistic user-space Netlink utility library"
-DESCRIPTION = "Minimalistic user-space library oriented to Netlink developers, providing \
-    functions for common tasks in parsing, validating, and constructing both the Netlink header and TLVs."
-HOMEPAGE = "http://www.netfilter.org/projects/libmnl/index.html"
-SECTION = "libs"
-LICENSE = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
-
-SRC_URI = "http://www.netfilter.org/projects/libmnl/files/libmnl-${PV}.tar.bz2;name=tar"
-SRC_URI[tar.md5sum] = "be9b4b5328c6da1bda565ac5dffadb2d"
-SRC_URI[tar.sha256sum] = "171f89699f286a5854b72b91d06e8f8e3683064c5901fb09d954a9ab6f551f81"
-
-inherit autotools pkgconfig
-- 
1.8.3.1


