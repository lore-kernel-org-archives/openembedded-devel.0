Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0A5C87874E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Jul 2018 07:21:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w637LS1j027578
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 3 Jul 2018 00:21:29 -0700
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Tue, 3 Jul 2018 00:21:28 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 3 Jul 2018 15:21:19 +0800
Message-ID: <1530602486-4522-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-networking][PATCH 1/8] strongswan: upgrade 5.6.2 -> 5.6.3
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
X-List-Received-Date: Tue, 03 Jul 2018 07:21:29 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-support/strongswan/files/fix-funtion-parameter.patch      | 2 +-
 .../strongswan/{strongswan_5.6.2.bb => strongswan_5.6.3.bb}           | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/strongswan/{strongswan_5.6.2.bb => strongswan_5.6.3.bb} (97%)

diff --git a/meta-networking/recipes-support/strongswan/files/fix-funtion-parameter.patch b/meta-networking/recipes-support/strongswan/files/fix-funtion-parameter.patch
index be660d1..5945507 100644
--- a/meta-networking/recipes-support/strongswan/files/fix-funtion-parameter.patch
+++ b/meta-networking/recipes-support/strongswan/files/fix-funtion-parameter.patch
@@ -3,7 +3,7 @@ From: "Roy.Li" <rongqing.li@windriver.com>
 Date: Tue, 4 Mar 2014 14:38:42 +0800
 Subject: [PATCH] fix the function parameter
 
-Upstream-Status: pending
+Upstream-Status: Pending
 
 Original openssl_diffie_hellman_create has three parameters, but
 it is reassigned a function pointer which has one parameter, and
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.6.2.bb b/meta-networking/recipes-support/strongswan/strongswan_5.6.3.bb
similarity index 97%
rename from meta-networking/recipes-support/strongswan/strongswan_5.6.2.bb
rename to meta-networking/recipes-support/strongswan/strongswan_5.6.3.bb
index 6570dbe..297f0e7 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.6.2.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.6.3.bb
@@ -12,8 +12,8 @@ SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://0001-memory.h-Include-stdint.h-for-uintptr_t.patch \
            "
 
-SRC_URI[md5sum] = "46aa3aa18fbc4bd528f9a0345ce79913"
-SRC_URI[sha256sum] = "e0a60a30ebf3c534c223559e1686497a21ded709a5d605c5123c2f52bcc22e92"
+SRC_URI[md5sum] = "a6a28eeb22aa58080a7581771a5b63f9"
+SRC_URI[sha256sum] = "c3c7dc8201f40625bba92ffd32eb602a8909210d8b3fac4d214c737ce079bf24"
 
 UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.7.4


