Return-Path: <daicy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id CEC9F731C8
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jan 2016 05:01:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2310431"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Jan 2016 13:01:17 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id D3937409255D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jan 2016 13:01:03 +0800 (CST)
Received: from localhost.localdomain (10.167.226.51) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 7 Jan 2016 13:01:03 +0800
From: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Jan 2016 21:00:33 -0800
Message-ID: <1452142833-800-1-git-send-email-daicy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.51]
X-yoursite-MailScanner-ID: D3937409255D.AC8BB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: daicy.fnst@cn.fujitsu.com
X-Spam-Status: No
Cc: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
Subject: [meta-networking][PATCH] rp-pppoe: 3.11 -> 3.12
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
X-List-Received-Date: Thu, 07 Jan 2016 05:01:25 -0000
Content-Type: text/plain

Upgrade rp-pppoe from 3.11 to 3.12.

Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
---
 .../{rp-pppoe-3.11 => rp-pppoe-3.12}/configure.in-Error-fix.patch     | 0
 .../rp-pppoe/{rp-pppoe-3.11 => rp-pppoe-3.12}/configure.patch         | 0
 .../{rp-pppoe-3.11 => rp-pppoe-3.12}/configure_in_cross.patch         | 0
 .../discard-use-of-dnl-in-Makefile.am.patch                           | 0
 .../{rp-pppoe-3.11 => rp-pppoe-3.12}/dont-swallow-errors.patch        | 0
 .../rp-pppoe/{rp-pppoe-3.11 => rp-pppoe-3.12}/pppoe-server.default    | 0
 .../rp-pppoe/{rp-pppoe-3.11 => rp-pppoe-3.12}/pppoe-server.init       | 0
 .../rp-pppoe/{rp-pppoe-3.11 => rp-pppoe-3.12}/pppoe-server.service    | 0
 .../{rp-pppoe-3.11 => rp-pppoe-3.12}/pppoe-src-restrictions.patch     | 0
 .../rp-pppoe/{rp-pppoe-3.11 => rp-pppoe-3.12}/top-autoconf.patch      | 0
 .../rp-pppoe/{rp-pppoe-3.11 => rp-pppoe-3.12}/update-config.patch     | 0
 .../recipes-protocols/rp-pppoe/{rp-pppoe_3.11.bb => rp-pppoe_3.12.bb} | 4 ++--
 12 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe-3.11 => rp-pppoe-3.12}/configure.in-Error-fix.patch (100%)
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe-3.11 => rp-pppoe-3.12}/configure.patch (100%)
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe-3.11 => rp-pppoe-3.12}/configure_in_cross.patch (100%)
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe-3.11 => rp-pppoe-3.12}/discard-use-of-dnl-in-Makefile.am.patch (100%)
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe-3.11 => rp-pppoe-3.12}/dont-swallow-errors.patch (100%)
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe-3.11 => rp-pppoe-3.12}/pppoe-server.default (100%)
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe-3.11 => rp-pppoe-3.12}/pppoe-server.init (100%)
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe-3.11 => rp-pppoe-3.12}/pppoe-server.service (100%)
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe-3.11 => rp-pppoe-3.12}/pppoe-src-restrictions.patch (100%)
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe-3.11 => rp-pppoe-3.12}/top-autoconf.patch (100%)
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe-3.11 => rp-pppoe-3.12}/update-config.patch (100%)
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe_3.11.bb => rp-pppoe_3.12.bb} (95%)

diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/configure.in-Error-fix.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/configure.in-Error-fix.patch
similarity index 100%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/configure.in-Error-fix.patch
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/configure.in-Error-fix.patch
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/configure.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/configure.patch
similarity index 100%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/configure.patch
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/configure.patch
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/configure_in_cross.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/configure_in_cross.patch
similarity index 100%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/configure_in_cross.patch
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/configure_in_cross.patch
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/discard-use-of-dnl-in-Makefile.am.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/discard-use-of-dnl-in-Makefile.am.patch
similarity index 100%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/discard-use-of-dnl-in-Makefile.am.patch
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/discard-use-of-dnl-in-Makefile.am.patch
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/dont-swallow-errors.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/dont-swallow-errors.patch
similarity index 100%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/dont-swallow-errors.patch
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/dont-swallow-errors.patch
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/pppoe-server.default b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/pppoe-server.default
similarity index 100%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/pppoe-server.default
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/pppoe-server.default
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/pppoe-server.init b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/pppoe-server.init
similarity index 100%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/pppoe-server.init
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/pppoe-server.init
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/pppoe-server.service b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/pppoe-server.service
similarity index 100%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/pppoe-server.service
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/pppoe-server.service
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/pppoe-src-restrictions.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/pppoe-src-restrictions.patch
similarity index 100%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/pppoe-src-restrictions.patch
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/pppoe-src-restrictions.patch
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/top-autoconf.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/top-autoconf.patch
similarity index 100%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/top-autoconf.patch
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/top-autoconf.patch
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/update-config.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/update-config.patch
similarity index 100%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/update-config.patch
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.12/update-config.patch
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.11.bb b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.12.bb
similarity index 95%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.11.bb
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.12.bb
index 4415c4b..d5f4a20 100644
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.11.bb
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.12.bb
@@ -19,8 +19,8 @@ SRC_URI = "http://www.roaringpenguin.com/files/download/${BP}.tar.gz \
            file://configure.in-Error-fix.patch \
            file://pppoe-server.service"
 
-SRC_URI[md5sum] = "13b5900c56bd602df6cc526e5e520722"
-SRC_URI[sha256sum] = "86a1a4d92fcea74fa6dd45516c5975933fa978b36fafe71f76ea70b4b4747720"
+SRC_URI[md5sum] = "216eb52b69062b92a64ee37fd71f4b66"
+SRC_URI[sha256sum] = "00794e04031546b0e9b8cf286f2a6d1ccfc4a621b2a3abb2d7ef2a7ab7cc86c2"
 
 inherit autotools-brokensep update-rc.d systemd
 
-- 
1.9.1




