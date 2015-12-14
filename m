Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym03.jp.fujitsu.com (mgwym03.jp.fujitsu.com [211.128.242.42])
	by mail.openembedded.org (Postfix) with ESMTP id 2914C6FF64
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 05:22:56 +0000 (UTC)
Received: from yt-mxq.gw.nic.fujitsu.com (unknown [192.168.229.66]) by
	mgwym03.jp.fujitsu.com with smtp
	id 588b_7a37_596c0ede_e96a_47f2_9244_e4c3d796d4c7;
	Mon, 14 Dec 2015 14:22:52 +0900
Received: from g01jpfmpwyt01.exch.g01.fujitsu.local
	(g01jpfmpwyt01.exch.g01.fujitsu.local [10.128.193.38])
	by yt-mxq.gw.nic.fujitsu.com (Postfix) with ESMTP id 7C0CAAC0211
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 14:22:51 +0900 (JST)
Received: from g01jpexchyt36.g01.fujitsu.local (unknown [10.128.193.4])
	by g01jpfmpwyt01.exch.g01.fujitsu.local (Postfix) with ESMTP id
	C93466D657A for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 14:22:50 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	g01jpexchyt36.g01.fujitsu.local (10.128.193.54) with Microsoft SMTP
	Server id 14.3.266.1; Mon, 14 Dec 2015 14:22:51 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 Dec 2015 14:23:57 +0900
Message-ID: <1450070637-18179-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-MML: disable
Cc: Fan Xin <fan.xin@jp.fujitsu.com>
Subject: [PATCH] php: Upgrade 5.5.26 -> 5.5.30
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
X-List-Received-Date: Mon, 14 Dec 2015 05:22:57 -0000
Content-Type: text/plain

Fix CVE-2015-7803, CVE-2015-7804 and other bugs
http://php.net/ChangeLog-5.php

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 meta-oe/recipes-devtools/php/{php_5.5.26.bb => php_5.5.30.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/php/{php_5.5.26.bb => php_5.5.30.bb} (10%)

diff --git a/meta-oe/recipes-devtools/php/php_5.5.26.bb b/meta-oe/recipes-devtools/php/php_5.5.30.bb
similarity index 10%
rename from meta-oe/recipes-devtools/php/php_5.5.26.bb
rename to meta-oe/recipes-devtools/php/php_5.5.30.bb
index deaf145..2bfadc1 100644
--- a/meta-oe/recipes-devtools/php/php_5.5.26.bb
+++ b/meta-oe/recipes-devtools/php/php_5.5.30.bb
@@ -1,4 +1,4 @@
 require php.inc
 
-SRC_URI[md5sum] = "383a4b35327809afd2822e1e5efc8ee1"
-SRC_URI[sha256sum] = "816afffdb03ff4c542bc172a2f77f9c69b817df82d60cce05c1b4f578c2c926e"
+SRC_URI[md5sum] = "181d153c9fba7ff46534df1bdab4d853"
+SRC_URI[sha256sum] = "e7332a713cecdd1cb44a1b1336739885c9789f633f0f51236b25e48ab03c3b29"
-- 
1.8.4.2


