Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UaaDr-0000ja-Kf
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 May 2013 01:26:16 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r49K0EWF012015
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 9 May 2013 13:00:14 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Thu, 9 May 2013 13:00:13 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 9 May 2013 15:03:25 -0500
Message-ID: <1368129805-5889-3-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1368129805-5889-1-git-send-email-mark.hatle@windriver.com>
References: <1368129805-5889-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Cc: Joe.MacDonald@windriver.com
Subject: [PATCH 3/3] crda: Fix multilib SRC_URI reference
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 May 2013 23:26:41 -0000
Content-Type: text/plain

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 recipes-connectivity/crda/crda_1.1.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-connectivity/crda/crda_1.1.3.bb b/recipes-connectivity/crda/crda_1.1.3.bb
index dc1fc21..3ef9210 100644
--- a/recipes-connectivity/crda/crda_1.1.3.bb
+++ b/recipes-connectivity/crda/crda_1.1.3.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 DEPENDS = "python-m2crypto-native python-native libgcrypt libnl"
 
-SRC_URI = "http://wireless.kernel.org/download/crda/${P}.tar.bz2;name=crda \
+SRC_URI = "http://wireless.kernel.org/download/crda/${BP}.tar.bz2;name=crda \
            http://wireless.kernel.org/download/wireless-regdb/regulatory.bins/2013.01.11-regulatory.bin;name=bin \
 "
 SRC_URI[crda.md5sum] = "29579185e06a75675507527243d28e5c"
-- 
1.8.3.rc1.25.g423ecb0



