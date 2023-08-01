Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E9F5C04E69
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:42:18 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.7609.1690875735070554660
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:42:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="126613522"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="126613522"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:42:13 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id CDD7DDE63E
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:10 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 078CFBF4A0
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:10 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8ECFC10211;
	Tue,  1 Aug 2023 16:42:09 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libqb: upgrade 2.0.7 -> 2.0.8
Date: Tue,  1 Aug 2023 15:41:29 +0800
Message-Id: <1690875717-21608-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
References: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27786.005
X-TMASE-Result: 10-2.243400-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4Bchr4pBLGIvAH8UzOewTxw+z9
	H+EUMUMlIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZlXePXNM4FjMNVHotTvuv6wIZ++dWnH7bnpt
	r8PnHpyni8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFMSr0Eq/2wYtTjjz3j+hTHpZPv
	EvCVZ6NUkVV28Ae02LSuzinA0jdXzLUTdfI6FUvI879+LQLemZKYcRM1nSiLGRcg16K5VmF+x9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Aug 2023 07:42:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104171

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/libqb/{libqb_2.0.7.bb => libqb_2.0.8.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libqb/{libqb_2.0.7.bb => libqb_2.0.8.bb} (93%)

diff --git a/meta-oe/recipes-extended/libqb/libqb_2.0.7.bb b/meta-oe/recipes-extended/libqb/libqb_2.0.8.bb
similarity index 93%
rename from meta-oe/recipes-extended/libqb/libqb_2.0.7.bb
rename to meta-oe/recipes-extended/libqb/libqb_2.0.8.bb
index 9123e0a4cd..3db9e2e66f 100644
--- a/meta-oe/recipes-extended/libqb/libqb_2.0.7.bb
+++ b/meta-oe/recipes-extended/libqb/libqb_2.0.8.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=321bf41f280cf805086dd5a720b37785"
 
 inherit autotools pkgconfig
 
-SRCREV = "06c8641de2e1fef1fc6026709fb2109fbbb79d79"
+SRCREV = "002171bbcf4bc4728da56c1538afd9e9d814ecaf"
 SRC_URI = "git://github.com/ClusterLabs/${BPN}.git;branch=main;protocol=https \
           "
 S = "${WORKDIR}/git"
-- 
2.34.1


