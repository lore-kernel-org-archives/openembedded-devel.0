Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1E60B71DCE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 10:04:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v1DA4TCc001696
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Feb 2017 02:04:29 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 13 Feb 2017 02:04:29 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <martin.jansa@gmail.com>
Date: Mon, 13 Feb 2017 02:04:15 -0800
Message-ID: <eb1249782b6c1c54e841a9efa9f6c3cbbec519b1.1486980187.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1486980186.git.liezhi.yang@windriver.com>
References: <cover.1486980186.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 01/13] dibbler: fix SRC_URI from ${P} to ${BP}
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
X-List-Received-Date: Mon, 13 Feb 2017 10:04:32 -0000
Content-Type: text/plain

Otherwise it would fail when multilib.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-networking/recipes-connectivity/dibbler/dibbler_1.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/dibbler/dibbler_1.0.1.bb b/meta-networking/recipes-connectivity/dibbler/dibbler_1.0.1.bb
index a2d46db..1913d3a 100644
--- a/meta-networking/recipes-connectivity/dibbler/dibbler_1.0.1.bb
+++ b/meta-networking/recipes-connectivity/dibbler/dibbler_1.0.1.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://klub.com.pl/dhcpv6"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7236695bb6d4461c105d685a8b61c4e3"
 
-SRC_URI = "http://klub.com.pl/dhcpv6/${BPN}/${P}.tar.gz \
+SRC_URI = "http://klub.com.pl/dhcpv6/${BPN}/${BP}.tar.gz \
         file://dibbler_fix_getSize_crash.patch \
         file://types.patch \
 "
-- 
2.9.0


