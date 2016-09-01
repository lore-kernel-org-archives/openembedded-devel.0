Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id DCC436AC4B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Sep 2016 08:05:59 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10503172"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Sep 2016 16:05:52 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 3DA42401E88D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Sep 2016 16:05:51 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Thu, 1 Sep 2016 16:05:50 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 1 Sep 2016 04:05:46 -0400
Message-ID: <1472717146-2176-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: 3DA42401E88D.A5D50
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] strongswan: 5.3.2 -> 5.5.0
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
X-List-Received-Date: Thu, 01 Sep 2016 08:06:01 -0000
Content-Type: text/plain

Upgrade strongswan from 5.3.2 to 5.5.0.

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 .../strongswan/{strongswan_5.3.2.bb => strongswan_5.5.0.bb}         | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-support/strongswan/{strongswan_5.3.2.bb => strongswan_5.5.0.bb} (90%)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.3.2.bb b/meta-networking/recipes-support/strongswan/strongswan_5.5.0.bb
similarity index 90%
rename from meta-networking/recipes-support/strongswan/strongswan_5.3.2.bb
rename to meta-networking/recipes-support/strongswan/strongswan_5.5.0.bb
index 9dc4878..8941cf6 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.3.2.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.5.0.bb
@@ -9,12 +9,10 @@ DEPENDS = "gmp openssl flex-native flex bison-native"
 
 SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
         file://fix-funtion-parameter.patch \
-        file://support-newer-systemd.patch \
-        file://install-strongswan-swanctl-service.patch \
 "
 
-SRC_URI[md5sum] = "fab014be1477ef4ebf9a765e10f8802c"
-SRC_URI[sha256sum] = "a4a9bc8c4e42bdc4366a87a05a02bf9f425169a7ab0c6f4482d347e44acbf225"
+SRC_URI[md5sum] = "a96fa7eb6c62b40143dadb064b6bd586"
+SRC_URI[sha256sum] = "58463998ac6725eac3687e8a20c1f69803c3772657076d06c43386a24b4c8454"
 
 EXTRA_OECONF = " \
         --without-lib-prefix \
-- 
2.7.4




