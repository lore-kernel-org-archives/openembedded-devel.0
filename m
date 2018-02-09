Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 295B2786B1
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Feb 2018 05:10:56 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="36947639"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Feb 2018 13:10:56 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id A46FA48AE761
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Feb 2018 13:10:53 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Fri, 9 Feb 2018 13:10:53 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 9 Feb 2018 13:10:53 +0800
Message-ID: <1518153053-13281-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: A46FA48AE761.A5DFF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] geoip: 1.6.9 -> 1.6.11
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
X-List-Received-Date: Fri, 09 Feb 2018 05:10:57 -0000
Content-Type: text/plain

Upgrade geoip from 1.6.9 to 1.6.11.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../recipes-support/geoip/{geoip_1.6.9.bb => geoip_1.6.11.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/geoip/{geoip_1.6.9.bb => geoip_1.6.11.bb} (98%)

diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.9.bb b/meta-networking/recipes-support/geoip/geoip_1.6.11.bb
similarity index 98%
rename from meta-networking/recipes-support/geoip/geoip_1.6.9.bb
rename to meta-networking/recipes-support/geoip/geoip_1.6.11.bb
index 9e8e071..3527d0c 100644
--- a/meta-networking/recipes-support/geoip/geoip_1.6.9.bb
+++ b/meta-networking/recipes-support/geoip/geoip_1.6.11.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://github.com/maxmind/geoip-api-c.git \
            http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/GeoLiteCityv6.dat.gz;apply=no;name=GeoLiteCityv6-dat \
            file://run-ptest \
 "
-SRCREV = "4f487bf95532e0bba7783d591faff178ab0aa462"
+SRCREV = "3169a8a88808c8df862e0b0355f99c738cce9f7e"
 
 SRC_URI[GeoIP-dat.md5sum] = "37c84ead332dda0362a5ac7b049b72d4"
 SRC_URI[GeoIP-dat.sha256sum] = "79ff1099e96c2dc1c2539c9a18aaa13a9afd085cae477df60d95f1644d42bc07"
-- 
2.7.4




