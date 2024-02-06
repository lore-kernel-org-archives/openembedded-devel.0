Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BD38C4828D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 08:01:04 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.17054.1707206453877136553
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 00:00:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hqea0w7x;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1707206454; x=1738742454;
  h=from:to:cc:subject:date:message-id;
  bh=B05VkRU5JlEeEyLp+VN3Irh+BE2V3tTjNmxEnNoOpew=;
  b=hqea0w7xyG7LLfsiUKgaOwPR6ZesNf461ePNTzDQMaDcxEZU0AzMLYKb
   iQyjnQc9D0Po1ovJW3Emr0kj0akuwWA1pjF2zaTo2XK9mvGF8VsnLDYe8
   hcODRYV4MbB8XY6rRUqcHNP0OWuJJftDSBoPzrkwSu5ASQKSlrAwMzacm
   XQybarE5RlT1kcExkdXTvlZLkzfJykaYF/tFXRMqox06VaUk4hZ6ZQ4AT
   9tvfL3Lf7jxPWqxKhEnQ3S2t6gDHSthyK3hNu+8972WuobVt0qGRL5bJl
   L6OqU3wNWN2/QdAnJgTCtUmX/JbLaGjXMjkK64tiOsq9dcxPman11HLP1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="127319984"
X-IronPort-AV: E=Sophos;i="6.05,246,1701097200"; 
   d="scan'208";a="127319984"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 17:00:51 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2522527A8CD
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:00:49 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 596F3D5622
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:00:48 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D474C2009579E
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:00:47 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 824541A006A;
	Tue,  6 Feb 2024 16:00:47 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] ndisc6: upgrade 1.0.7 -> 1.0.8
Date: Tue,  6 Feb 2024 15:37:17 +0800
Message-Id: <1707205037-4906-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28170.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28170.005
X-TMASE-Result: 10-2.160300-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrYdBG+bhhiNTfUZT83lbkEIIP
	FubbBVyA+7QcRaVoa8n/tdOuViNvuC/7QU2czuUN71Wx2uUbPLfExmr5hqNL1vOpjN6KXqfseVs
	0skyEaS2BkESMI05d4qHvyg1ZsxTfaCD9GiI9WbY6N/cDgNNi4a4sbbURvhPzgW6bY8SOq3WjxY
	yRBa/qJXcsDK2xBHh7BLPx9cDMrKbdB/CxWTRRu+rAZ8KTspSz5PK0ZiFQ8St0dSC41OXJxn4fw
	0xEFuxgewatjv8UH0ZHJV8m05JbO/+gUnTBPCxN0u18ohW0WNwngwDa1N6cp36Wyj20gTc2iB6m
	lDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 08:01:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108601

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog
============
Fix potential garbage whilst prining an advertised prefix.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/ndisc6/{ndisc6_1.0.7.bb => ndisc6_1.0.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/ndisc6/{ndisc6_1.0.7.bb => ndisc6_1.0.8.bb} (98%)

diff --git a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.7.bb b/meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb
similarity index 98%
rename from meta-networking/recipes-support/ndisc6/ndisc6_1.0.7.bb
rename to meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb
index a5b9bd08b..a827e7f42 100644
--- a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.7.bb
+++ b/meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://www.remlab.net/ndisc6/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "c308ba5370d66acc44d411f12d59af61d522b91a"
+SRCREV = "92e5d1cf6547fe40316b2a6ca2f7b8195ae0cbe5"
 SRC_URI = "git://git.remlab.net/git/ndisc6.git;protocol=http;branch=master \
            file://0001-autogen-Do-not-symlink-gettext.h-from-build-host.patch \
            "
-- 
2.34.1


