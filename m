Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8169A60043
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2015 06:33:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t7I6X8LI020129
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2015 23:33:08 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Mon, 17 Aug 2015 23:33:07 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 18 Aug 2015 14:29:22 +0800
Message-ID: <1439879362-27029-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-oe] cryptsetup: upgrade 1.6.6 -> 1.6.7
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
X-List-Received-Date: Tue, 18 Aug 2015 06:33:15 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

1.6.7 is a bugfix release.

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../cryptsetup/{cryptsetup_1.6.6.bb => cryptsetup_1.6.7.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/cryptsetup/{cryptsetup_1.6.6.bb => cryptsetup_1.6.7.bb} (89%)

diff --git a/meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.6.bb b/meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.7.bb
similarity index 89%
rename from meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.6.bb
rename to meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.7.bb
index d84ad2f..939ee35 100644
--- a/meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.6.bb
+++ b/meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.7.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=32107dd283b1dfeb66c9b3e6be312326"
 DEPENDS = "util-linux lvm2 popt libgcrypt"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v1.6/${BP}.tar.xz"
-SRC_URI[md5sum] = "179c0781de59838a4e39f61b2df5ea48"
-SRC_URI[sha256sum] = "2d2ce28e4e1137dd599d87884b62ef6dbf14fd7848b2a2bf7d61cf125fbd8e6f"
+SRC_URI[md5sum] = "918406eb5d2e2f5a7348c432ea9b1473"
+SRC_URI[sha256sum] = "c23c24c8d662032da8650c1c84985221be8bbedf4737c1540bba7e4517dfe820"
 
 inherit autotools gettext pkgconfig
 
-- 
1.9.1


