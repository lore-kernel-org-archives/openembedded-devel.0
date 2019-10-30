Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id EC2A47F793
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2019 13:08:44 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,247,1569254400"; d="scan'208";a="77688165"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 Oct 2019 21:08:45 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id A45224B6AE15
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2019 21:00:43 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 30 Oct 2019 21:08:41 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 31 Oct 2019 05:03:08 +0800
Message-ID: <1572469388-37042-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: A45224B6AE15.A517F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH v2] mtr: upgrade 0.92 -> 0.93
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
X-List-Received-Date: Wed, 30 Oct 2019 13:08:45 -0000
Content-Type: text/plain

1) Update LIC_FILES_CHKSUM as adress has been updated.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta-networking/recipes-support/mtr/{mtr_0.92.bb => mtr_0.93.bb} | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-support/mtr/{mtr_0.92.bb => mtr_0.93.bb} (80%)

diff --git a/meta-networking/recipes-support/mtr/mtr_0.92.bb b/meta-networking/recipes-support/mtr/mtr_0.93.bb
similarity index 80%
rename from meta-networking/recipes-support/mtr/mtr_0.92.bb
rename to meta-networking/recipes-support/mtr/mtr_0.93.bb
index 2bc7d97..dd15070 100644
--- a/meta-networking/recipes-support/mtr/mtr_0.92.bb
+++ b/meta-networking/recipes-support/mtr/mtr_0.93.bb
@@ -6,11 +6,9 @@ DEPENDS = "ncurses"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://ui/mtr.c;beginline=5;endline=16;md5=af1fafbbfa1bfd48af839f4bb3221106"
+                    file://ui/mtr.c;beginline=5;endline=16;md5=00a894a39d53726a27386534d1c4e468"
 
-PV .= "+git${SRCPV}"
-
-SRCREV = "6cddfc6e8f0e20af4af218b545f83d43b3f9a387"
+SRCREV = "304349bad86229aedbc62c07d5e98a8292967991"
 SRC_URI = "git://github.com/traviscross/mtr"
 
 S = "${WORKDIR}/git"
-- 
2.7.4




