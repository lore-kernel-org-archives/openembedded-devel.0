Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 68DC76AC24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2015 08:45:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3N8jBIk025887
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 23 Apr 2015 01:45:11 -0700 (PDT)
Received: from lirq-OptiPlex-780.wrs.com (128.224.162.139) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Thu, 23 Apr 2015 01:45:10 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <joe_macdonald@mentor.com>
Date: Thu, 23 Apr 2015 16:45:09 +0800
Message-ID: <1429778709-4188-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH][meta-networking] strongswan: upgrade to 5.3.0
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
X-List-Received-Date: Thu, 23 Apr 2015 08:45:13 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../strongswan/{strongswan_5.2.1.bb => strongswan_5.3.0.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/strongswan/{strongswan_5.2.1.bb => strongswan_5.3.0.bb} (92%)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.2.1.bb b/meta-networking/recipes-support/strongswan/strongswan_5.3.0.bb
similarity index 92%
rename from meta-networking/recipes-support/strongswan/strongswan_5.2.1.bb
rename to meta-networking/recipes-support/strongswan/strongswan_5.3.0.bb
index 6b91319..0b45ab6 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.2.1.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.3.0.bb
@@ -11,8 +11,8 @@ SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
         file://fix-funtion-parameter.patch \
 "
 
-SRC_URI[md5sum] = "dd3717c0aa59ab4591ca1812941ebb82"
-SRC_URI[sha256sum] = "ea51ab33b5bb39fecaf10668833a9936583b42145948ae9da1ab98f74e939215"
+SRC_URI[md5sum] = "c52d4228231c2025d9c320d0e9990327"
+SRC_URI[sha256sum] = "824da31a1ff89ac2500d56705e6f9ce06fe5260f9caaeb1da35ea13a8691d284"
 
 EXTRA_OECONF = "--enable-gmp \
         --enable-openssl \
-- 
2.1.0


