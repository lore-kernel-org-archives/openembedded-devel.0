Return-Path: <fan.xin@jp.fujitsu.com>
X-Greylist: delayed 682 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 07 Jun 2017 03:20:09 UTC
Received: from mgwkm02.jp.fujitsu.com (mgwkm02.jp.fujitsu.com [202.219.69.169])
	by mail.openembedded.org (Postfix) with ESMTP id EA9B560765
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Jun 2017 03:20:09 +0000 (UTC)
Received: from kw-mxoi1.gw.nic.fujitsu.com (unknown [192.168.231.131]) by
	mgwkm02.jp.fujitsu.com with smtp
	id 16b8_8643_8b8f286c_449e_4888_a991_b398f0971264;
	Wed, 07 Jun 2017 12:08:40 +0900
Received: from g01jpfmpwkw01.exch.g01.fujitsu.local
	(g01jpfmpwkw01.exch.g01.fujitsu.local [10.0.193.38])
	by kw-mxoi1.gw.nic.fujitsu.com (Postfix) with ESMTP id 94523AC0088
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Jun 2017 12:08:40 +0900 (JST)
Received: from g01jpexchkw35.g01.fujitsu.local (unknown [10.0.193.4])
	by g01jpfmpwkw01.exch.g01.fujitsu.local (Postfix) with ESMTP id
	78AE6692303; Wed,  7 Jun 2017 12:08:39 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	g01jpexchkw35.g01.fujitsu.local (10.0.193.50) with Microsoft SMTP
	Server id 14.3.266.1; Wed, 7 Jun 2017 12:08:39 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 7 Jun 2017 12:09:57 +0900
Message-ID: <1496804997-23883-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Cc: akuster@mvista.com
Subject: [meta-networking][PATCH] wireshark: Upgrade to 2.2.7
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
X-List-Received-Date: Wed, 07 Jun 2017 03:20:10 -0000
Content-Type: text/plain

Upgrade wireshark from 2.2.6 to 2.2.7

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 .../wireshark/{wireshark_2.2.6.bb => wireshark_2.2.7.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.2.6.bb => wireshark_2.2.7.bb} (95%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.2.6.bb b/meta-networking/recipes-support/wireshark/wireshark_2.2.7.bb
similarity index 95%
rename from meta-networking/recipes-support/wireshark/wireshark_2.2.6.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.2.7.bb
index a0b6b8f..2f6f7b0 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.2.6.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.2.7.bb
@@ -10,8 +10,8 @@ SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
 
 PE = "1"
 
-SRC_URI[md5sum] = "2cd9a35c2df8c32668c1776784f074df"
-SRC_URI[sha256sum] = "f627d51eda85f5ae5f5c8c9fc1f6539ffc2a270dd7500dc7f67490a8534ca849"
+SRC_URI[md5sum] = "a4d880554c7f925dafef60fa313b580d"
+SRC_URI[sha256sum] = "689ddf62221b152779d8846ab5b2063cc7fd41ec1a9f04eefab09b5d5486dbb5"
 
 inherit autotools pkgconfig perlnative
 
-- 
1.9.1


