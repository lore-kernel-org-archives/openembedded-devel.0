Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C38D4C54E49
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 08:43:47 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.7724.1709714626254505295
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 00:43:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Vcfn7Goh;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709714626; x=1741250626;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=X0UMuRY98si9sgHTwjqxLO9CB2P4o+aBpeNOiuku6iE=;
  b=Vcfn7GohyQ7k+lSMTNODoI7Wgf4VeSQUgQOQpOSw/a08XDj0vhdq85Ol
   lE6w9M6WuFZQazSsEgYEa4D8sZZ5h5zeUEYG2NjeybAt+mYFk9K2nU+lv
   70lUpvxzmHJbt3HDVrKDetZkSsp2+o5P3V1V6n3Wdkdd0fs4N5K1v6iuT
   rFRc7kjtI3d8jVVJ7y6B2dpebHf1AwpDpQqwj3FKuv94xU6adwYQThaYJ
   zKzvcBJ97JmR+vnyeNJ8dSgqznKwFBDPDaduf/PwnOzmVSs+R15pdpHeY
   4PJyG01daJhdLSYINqVt2MDljVmMGeUwGraBNlr+4mY5ZrQk9QhFEPaco
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="151429208"
X-IronPort-AV: E=Sophos;i="6.06,207,1705330800"; 
   d="scan'208";a="151429208"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 17:43:44 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E1CD5EB463
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:43:41 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 21C03106035
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:43:41 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B06582008FF86
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:43:40 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 65F091A006A;
	Wed,  6 Mar 2024 16:43:40 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/26] c-ares: upgrade 1.26.0 -> 1.27.0
Date: Wed,  6 Mar 2024 16:43:05 +0800
Message-Id: <1709714608-19296-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
References: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28234.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28234.006
X-TMASE-Result: 10--0.626900-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZnVTWWiNp+v/TlIO7ZQZ978wHSQ+yXjTDl5W
	06Bs6gNyxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzTYb6eFWMXyaKQ9
	+Liy8fvzrgd+yoFsWgLMR772vFqnvHgJ6LzJx882VYOHd/9kBiJgOSpoOfBgu+ML7ItsVqn5YEA
	SUQ57poiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 08:43:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109143

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../c-ares/{c-ares_1.26.0.bb => c-ares_1.27.0.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/c-ares/{c-ares_1.26.0.bb => c-ares_1.27.0.bb} (91%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.26.0.bb b/meta-oe/recipes-support/c-ares/c-ares_1.27.0.bb
similarity index 91%
rename from meta-oe/recipes-support/c-ares/c-ares_1.26.0.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.27.0.bb
index 450d466f4..2d91ac173 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.26.0.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.27.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fdbc58a6da11a9f68aa73c453818decc"
 
 SRC_URI = "https://c-ares.org/download/${BPN}-${PV}.tar.gz \
            file://run-ptest"
-SRC_URI[sha256sum] = "bed58c4f02b009080ebda6c2467ba469722ac6aebbf4497dc44a83d8c6194e50"
+SRC_URI[sha256sum] = "0a72be66959955c43e2af2fbd03418e82a2bd5464604ec9a62147e37aceb420b"
 
 PACKAGECONFIG ?= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[manpages] = ""
-- 
2.34.1


