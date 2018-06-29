Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 505A2744B1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 06:20:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5T6KpFL020419
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jun 2018 23:20:51 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Thu, 28 Jun 2018 23:20:44 -0700
From: Changqing Li <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 29 Jun 2018 14:20:42 +0800
Message-ID: <1530253243-32383-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH][meta-networking] corosync: upgrade 2.4.3 -> 2.4.4
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
X-List-Received-Date: Fri, 29 Jun 2018 06:20:50 -0000
Content-Type: text/plain

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../corosync/{corosync_2.4.3.bb => corosync_2.4.4.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-extended/corosync/{corosync_2.4.3.bb => corosync_2.4.4.bb} (95%)

diff --git a/meta-networking/recipes-extended/corosync/corosync_2.4.3.bb b/meta-networking/recipes-extended/corosync/corosync_2.4.4.bb
similarity index 95%
rename from meta-networking/recipes-extended/corosync/corosync_2.4.3.bb
rename to meta-networking/recipes-extended/corosync/corosync_2.4.4.bb
index dc2f01b0f..b760c117c 100644
--- a/meta-networking/recipes-extended/corosync/corosync_2.4.3.bb
+++ b/meta-networking/recipes-extended/corosync/corosync_2.4.4.bb
@@ -9,8 +9,8 @@ inherit autotools pkgconfig systemd useradd
 
 SRC_URI = "http://build.clusterlabs.org/corosync/releases/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "bf0ede13018aadc8a046183bc593b0e0"
-SRC_URI[sha256sum] = "b1e7e422e8d2f7af8e5315fa329b1dbd1175fff32efaa55e8054584c80a2c597"
+SRC_URI[md5sum] = "69db29ff4bc035936946be44fc8be5cd"
+SRC_URI[sha256sum] = "9bd4707bb271df16f8d543ec782eb4c35ec0330b7be696b797da4bd8f058a25d"
 
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+\.(?!99)\d+(\.\d+)+)"
 
-- 
2.13.0


