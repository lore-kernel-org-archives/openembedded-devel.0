Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UaaDS-0000ja-Rg
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 May 2013 01:25:50 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r49K0D5s012012
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 9 May 2013 13:00:13 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Thu, 9 May 2013 13:00:12 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 9 May 2013 15:03:24 -0500
Message-ID: <1368129805-5889-2-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1368129805-5889-1-git-send-email-mark.hatle@windriver.com>
References: <1368129805-5889-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Cc: Joe.MacDonald@windriver.com
Subject: [PATCH 2/3] rp-pppoe: fix multilib SRC_URI reference
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
X-List-Received-Date: Thu, 09 May 2013 23:26:03 -0000
X-List-Received-Date: Thu, 09 May 2013 23:26:03 -0000
Content-Type: text/plain

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 recipes-protocols/rp-pppoe/rp-pppoe_3.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-protocols/rp-pppoe/rp-pppoe_3.8.bb b/recipes-protocols/rp-pppoe/rp-pppoe_3.8.bb
index d4cc664..d62c5e9 100644
--- a/recipes-protocols/rp-pppoe/rp-pppoe_3.8.bb
+++ b/recipes-protocols/rp-pppoe/rp-pppoe_3.8.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=a194eaefae2be54ee3221339b10d0581"
 
 PR = "r9"
 
-SRC_URI = "http://www.roaringpenguin.com/files/download/${P}.tar.gz \
+SRC_URI = "http://www.roaringpenguin.com/files/download/${BP}.tar.gz \
            file://top-autoconf.patch \
            file://configure_in_cross.patch \
            file://pppoe-src-restrictions.patch \
-- 
1.8.3.rc1.25.g423ecb0



