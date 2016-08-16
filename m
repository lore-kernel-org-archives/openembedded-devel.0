Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id CAEA6770E3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2016 03:15:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="9956015"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Aug 2016 11:15:04 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id CAB5242BC503
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2016 11:15:04 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Tue, 16 Aug 2016 11:15:03 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Aug 2016 23:15:01 -0400
Message-ID: <1471317301-1605-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: CAB5242BC503.A50EA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] geoip: 1.6.6 -> 1.6.9
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
X-List-Received-Date: Tue, 16 Aug 2016 03:15:05 -0000
Content-Type: text/plain

Upgrade geoip from 1.6.6 to 1.6.9.

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 .../recipes-support/geoip/{geoip_1.6.6.bb => geoip_1.6.9.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/geoip/{geoip_1.6.6.bb => geoip_1.6.9.bb} (98%)

diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.6.bb b/meta-networking/recipes-support/geoip/geoip_1.6.9.bb
similarity index 98%
rename from meta-networking/recipes-support/geoip/geoip_1.6.6.bb
rename to meta-networking/recipes-support/geoip/geoip_1.6.9.bb
index 0605154..f46b3eb 100644
--- a/meta-networking/recipes-support/geoip/geoip_1.6.6.bb
+++ b/meta-networking/recipes-support/geoip/geoip_1.6.9.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://github.com/maxmind/geoip-api-c.git \
            http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/GeoLiteCityv6.dat.gz;apply=no;name=GeoLiteCityv6-dat \
            file://run-ptest \
 "
-SRCREV = "ed3f3e2b87fba05a8f2a5b9b1328e7d55be8bf30"
+SRCREV = "4f487bf95532e0bba7783d591faff178ab0aa462"
 
 SRC_URI[GeoIP-dat.md5sum] = "37c84ead332dda0362a5ac7b049b72d4"
 SRC_URI[GeoIP-dat.sha256sum] = "79ff1099e96c2dc1c2539c9a18aaa13a9afd085cae477df60d95f1644d42bc07"
-- 
2.7.4




