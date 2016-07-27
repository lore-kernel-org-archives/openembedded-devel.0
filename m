Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3F63B60721
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2016 08:18:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6R8IBYc028479
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2016 01:18:11 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 27 Jul 2016 01:18:10 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 27 Jul 2016 04:18:05 -0400
Message-ID: <9235e7c51373a612f86cf675602a3b0969030576.1469607093.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1469607093.git.jackie.huang@windriver.com>
References: <cover.1469607093.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] libssh2: upgrade to 1.7.0
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
X-List-Received-Date: Wed, 27 Jul 2016 08:18:12 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

This version includes fix for CVE-2016-0787
and other changes, for details please see:
https://www.libssh2.org/changes.html

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-support/libssh2/{libssh2_1.6.0.bb => libssh2_1.7.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libssh2/{libssh2_1.6.0.bb => libssh2_1.7.0.bb} (84%)

diff --git a/meta-oe/recipes-support/libssh2/libssh2_1.6.0.bb b/meta-oe/recipes-support/libssh2/libssh2_1.7.0.bb
similarity index 84%
rename from meta-oe/recipes-support/libssh2/libssh2_1.6.0.bb
rename to meta-oe/recipes-support/libssh2/libssh2_1.7.0.bb
index c43164e..9e7cd59 100644
--- a/meta-oe/recipes-support/libssh2/libssh2_1.6.0.bb
+++ b/meta-oe/recipes-support/libssh2/libssh2_1.7.0.bb
@@ -8,8 +8,8 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c5cf34fc0acb44b082ef50ef5e4354ca"
 
 SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz"
-SRC_URI[md5sum] = "00aabd6e714a5f42a4fb82ace20db1dd"
-SRC_URI[sha256sum] = "5a202943a34a1d82a1c31f74094f2453c207bf9936093867f41414968c8e8215"
+SRC_URI[md5sum] = "b01662a210e94cccf2f76094db7dac5c"
+SRC_URI[sha256sum] = "e4561fd43a50539a8c2ceb37841691baf03ecb7daf043766da1b112e4280d584"
 
 inherit autotools pkgconfig
 
-- 
2.8.1


