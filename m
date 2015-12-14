Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym02.jp.fujitsu.com (mgwym02.jp.fujitsu.com [211.128.242.41])
	by mail.openembedded.org (Postfix) with ESMTP id 9C2EA6FFA4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 04:36:52 +0000 (UTC)
Received: from yt-mxq.gw.nic.fujitsu.com (unknown [192.168.229.66]) by
	mgwym02.jp.fujitsu.com with smtp
	id 48f9_308f_b7f84bfd_0cd3_4840_9a6d_5c0d3d3d6f8a;
	Mon, 14 Dec 2015 13:36:48 +0900
Received: from g01jpfmpwyt03.exch.g01.fujitsu.local
	(g01jpfmpwyt03.exch.g01.fujitsu.local [10.128.193.57])
	by yt-mxq.gw.nic.fujitsu.com (Postfix) with ESMTP id 6C605AC0236
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 13:36:47 +0900 (JST)
Received: from g01jpexchyt37.g01.fujitsu.local (unknown [10.128.193.4])
	by g01jpfmpwyt03.exch.g01.fujitsu.local (Postfix) with ESMTP id
	B4BB246E5B7 for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 13:36:46 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	g01jpexchyt37.g01.fujitsu.local (10.128.193.67) with Microsoft SMTP
	Server id 14.3.266.1; Mon, 14 Dec 2015 13:36:46 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 Dec 2015 13:37:53 +0900
Message-ID: <1450067873-17867-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-MML: disable
Cc: Fan Xin <fan.xin@jp.fujitsu.com>
Subject: [PATCH] php: Upgrade 5.6.12 -> 5.6.16
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
X-List-Received-Date: Mon, 14 Dec 2015 04:36:54 -0000
Content-Type: text/plain

Fix CVE-2015-7803, CVE-2015-7804 and other bugs
http://php.net/ChangeLog-5.php

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 .../{php-5.6.12 => php-5.6.16}/change-AC_TRY_RUN-to-AC_TRY_LINK.patch | 0
 meta-oe/recipes-devtools/php/{php_5.6.12.bb => php_5.6.16.bb}         | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/php/{php-5.6.12 => php-5.6.16}/change-AC_TRY_RUN-to-AC_TRY_LINK.patch (100%)
 rename meta-oe/recipes-devtools/php/{php_5.6.12.bb => php_5.6.16.bb} (35%)

diff --git a/meta-oe/recipes-devtools/php/php-5.6.12/change-AC_TRY_RUN-to-AC_TRY_LINK.patch b/meta-oe/recipes-devtools/php/php-5.6.16/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
similarity index 100%
rename from meta-oe/recipes-devtools/php/php-5.6.12/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
rename to meta-oe/recipes-devtools/php/php-5.6.16/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
diff --git a/meta-oe/recipes-devtools/php/php_5.6.12.bb b/meta-oe/recipes-devtools/php/php_5.6.16.bb
similarity index 35%
rename from meta-oe/recipes-devtools/php/php_5.6.12.bb
rename to meta-oe/recipes-devtools/php/php_5.6.16.bb
index ba78c32..822c090 100644
--- a/meta-oe/recipes-devtools/php/php_5.6.12.bb
+++ b/meta-oe/recipes-devtools/php/php_5.6.16.bb
@@ -1,5 +1,5 @@
 require php.inc
 
 SRC_URI += "file://change-AC_TRY_RUN-to-AC_TRY_LINK.patch"
-SRC_URI[md5sum] = "4578dee9d979114610a444bee263ed9b"
-SRC_URI[sha256sum] = "6f27104272af7b2a996f85e4100fac627630fbdaf39d7bd263f16cf529c8853a"
+SRC_URI[md5sum] = "765b164b89af1f03ae2fdf39a4e4e1df"
+SRC_URI[sha256sum] = "4fe6f40964c1bfaba05fc144ba20a2cdad33e11685f4f101ea5a48b98bbcd2ae"
-- 
1.8.4.2


