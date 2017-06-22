Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwkm02.jp.fujitsu.com (mgwkm02.jp.fujitsu.com [202.219.69.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8698971A1A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jun 2017 02:02:14 +0000 (UTC)
Received: from kw-mxoi1.gw.nic.fujitsu.com (unknown [192.168.231.131]) by
	mgwkm02.jp.fujitsu.com with smtp
	id 6684_f2b1_a7ed95c0_65d2_4eb0_b80f_a9dc74ed227d;
	Thu, 22 Jun 2017 11:02:13 +0900
Received: from g01jpfmpwkw03.exch.g01.fujitsu.local
	(g01jpfmpwkw03.exch.g01.fujitsu.local [10.0.193.57])
	by kw-mxoi1.gw.nic.fujitsu.com (Postfix) with ESMTP id D06F7AC00DA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jun 2017 11:02:12 +0900 (JST)
Received: from G01JPEXCHKW16.g01.fujitsu.local
	(G01JPEXCHKW16.g01.fujitsu.local [10.0.194.55])
	by g01jpfmpwkw03.exch.g01.fujitsu.local (Postfix) with ESMTP id
	C7B06BD6785 for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jun 2017 11:02:11 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	G01JPEXCHKW16.g01.fujitsu.local (10.0.194.55) with Microsoft SMTP
	Server id 14.3.266.1; Thu, 22 Jun 2017 11:02:12 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 22 Jun 2017 11:03:39 +0900
Message-ID: <1498097019-6628-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] strongswan: 5.5.1 -> 5.5.3
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
X-List-Received-Date: Thu, 22 Jun 2017 02:02:16 -0000
Content-Type: text/plain

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 .../strongswan/{strongswan_5.5.1.bb => strongswan_5.5.3.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/strongswan/{strongswan_5.5.1.bb => strongswan_5.5.3.bb} (97%)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.5.1.bb b/meta-networking/recipes-support/strongswan/strongswan_5.5.3.bb
similarity index 97%
rename from meta-networking/recipes-support/strongswan/strongswan_5.5.1.bb
rename to meta-networking/recipes-support/strongswan/strongswan_5.5.3.bb
index d63214b..9215233 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.5.1.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.5.3.bb
@@ -11,8 +11,8 @@ SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
         file://fix-funtion-parameter.patch \
 "
 
-SRC_URI[md5sum] = "4eba9474f7dc6c8c8d7037261358e68d"
-SRC_URI[sha256sum] = "720b301991f77bdedd8d551a956f52e2d11686a0ec18e832094f86cf2b842ab7"
+SRC_URI[md5sum] = "4afffe3c219bb2e04f09510905af836b"
+SRC_URI[sha256sum] = "c5ea54b199174708de11af9b8f4ecf28b5b0743d4bc0e380e741f25b28c0f8d4"
 
 EXTRA_OECONF = " \
         --without-lib-prefix \
-- 
2.7.4


