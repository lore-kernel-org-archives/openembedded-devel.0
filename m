Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D09957723C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Feb 2016 05:37:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u115b1Sm010687
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Jan 2016 21:37:01 -0800
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 31 Jan 2016 21:37:00 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 31 Jan 2016 21:37:00 -0800
Message-ID: <1454305020-22585-1-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-oe] [PATCH] scsirastools: remove inherit autotools_stage
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
X-List-Received-Date: Mon, 01 Feb 2016 05:37:02 -0000
Content-Type: text/plain

The autotools can instead of it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../scsirastools/scsirastools_1.6.4.bb             |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.4.bb b/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.4.bb
index 8e34104..13f93cc 100644
--- a/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.4.bb
+++ b/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.4.bb
@@ -14,7 +14,7 @@ SRC_URI = "http://prdownloads.sourceforge.net/scsirastools/scsirastools-${PV}.ta
 SRC_URI[md5sum] = "2d775111b62e2dfc1960a722f5fda211"
 SRC_URI[sha256sum] = "38d2c6c9b04a2c594e528927b950754f94c0522718d17c78e6589ba778339bf8"
 
-inherit autotools autotools_stage update-rc.d
+inherit autotools update-rc.d
 
 # mdadm Makefile has CC set to gcc, hence override CC to ${CC}
 EXTRA_OEMAKE += "CC='${CC}'"
-- 
1.7.9.5


