Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B250078088
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jun 2017 09:12:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v5T9CIAT016826
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jun 2017 02:12:18 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Thu, 29 Jun 2017 02:12:17 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 29 Jun 2017 17:05:03 +0800
Message-ID: <20170629090503.13157-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] gflags: update downloadfilename
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
X-List-Received-Date: Thu, 29 Jun 2017 09:12:17 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The downloadfilename of gflags is not proper for multilib recipe.
Replace it with ${BP}.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-support/gflags/gflags_2.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/gflags/gflags_2.2.0.bb b/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
index 5fc28f6..e2bac9a 100644
--- a/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
+++ b/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://github.com/gflags/gflags"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=c80d1a3b623f72bb85a4c75b556551df"
 
-SRC_URI = "https://github.com/gflags/gflags/archive/v${PV}.tar.gz;downloadfilename=${PN}-${PV}.tar.gz"
+SRC_URI = "https://github.com/gflags/gflags/archive/v${PV}.tar.gz;downloadfilename=${BP}.tar.gz"
 SRC_URI[md5sum] = "b99048d9ab82d8c56e876fb1456c285e"
 SRC_URI[sha256sum] = "466c36c6508a451734e4f4d76825cf9cd9b8716d2b70ef36479ae40f08271f88"
 
-- 
2.10.1


