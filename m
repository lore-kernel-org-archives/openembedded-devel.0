Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9FD097632C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jul 2015 09:54:33 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99027310"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Jul 2015 17:58:07 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6T9qeCK016475
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jul 2015 17:52:41 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 29 Jul 2015 17:54:31 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 29 Jul 2015 17:54:10 +0800
Message-ID: <1438163651-3294-3-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1438163651-3294-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1438163651-3294-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-networking][PATCH 3/4] stunnel: upgrade 5.17 -> 5.21
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
X-List-Received-Date: Wed, 29 Jul 2015 09:54:34 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../recipes-support/stunnel/{stunnel_5.17.bb => stunnel_5.21.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/stunnel/{stunnel_5.17.bb => stunnel_5.21.bb} (82%)

diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.17.bb b/meta-networking/recipes-support/stunnel/stunnel_5.21.bb
similarity index 82%
rename from meta-networking/recipes-support/stunnel/stunnel_5.17.bb
rename to meta-networking/recipes-support/stunnel/stunnel_5.21.bb
index 4cf529a..88e357a 100644
--- a/meta-networking/recipes-support/stunnel/stunnel_5.17.bb
+++ b/meta-networking/recipes-support/stunnel/stunnel_5.21.bb
@@ -9,8 +9,8 @@ RDEPENDS_${PN} += "perl"
 
 SRC_URI = "ftp://ftp.stunnel.org/stunnel/archive/5.x/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "e70f001ee190105c5a10a74f4bd54901"
-SRC_URI[sha256sum] = "c3e79e582621a0827125e35e1c00450190104fc02dc3c5274cb02b05859fd472"
+SRC_URI[md5sum] = "3d0a932ea650c0fa0da1e45547afdbb8"
+SRC_URI[sha256sum] = "2aef568b1955f5e233f6a8e17ebce3d30755f1be44c813f5a48e621f785596e3"
 
 inherit autotools
 
-- 
1.8.4.2


