Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E5B4C54E69
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:46:57 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.8165.1710827215294182528
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=q2kDcmeT;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827216; x=1742363216;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=OIr6WgaQA0kIdctE9Gy77lIwdbEMNVzREteLSXvHWbw=;
  b=q2kDcmeT4onpbfiwH40ZhgGmzIChHwlOM8dZFpbwRvGj8AK8uSnNKitH
   z51v4ivRXArA7i+GNeNLKrTov0+/uOUiVE6x3XARZ6bkqUgeFz9rU+TbS
   AfbnESmnS7rcdiL+rn01SpW3BXfEO9bhB9bEAfgMlpWeXCwO47ouRC7lF
   iPaNPpWv29+bGJ5idH3WutHxNcek9NfY73/vf1gvNrVUXqop78mOaUBll
   Ij+5r4jm38y/vFtXVWiCdBSE3jh5Sp6FD2lPKVCFmrfw0Jk0+1G5erIH6
   DUw4ZQ3HDZtMch1t+jsGhl+K2FQrGzvMSoBWE3ykaWMWq36uxLhOAOdbW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="131999443"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="131999443"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:55 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3D692E95F5
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:53 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 72DBDD5E88
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0E8AB23EA7C
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:52 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AA7CB1A006B;
	Tue, 19 Mar 2024 13:46:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 47/50] tcsh: upgrade 6.24.10 -> 6.24.11
Date: Tue, 19 Mar 2024 13:45:36 +0800
Message-Id: <1710827139-30056-47-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10-2.962200-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrq/dCpI1TEq3fUZT83lbkEIIP
	FubbBVyA+7QcRaVoa8n/tdOuViNvuC/7QU2czuUNOjf3A4DTYuEXivwflisSrD2wpEqqHW/Enpt
	r8PnHpyni8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFLocD/5V4lHQA+OIt3QUGzvIGp
	GEJblx0C1l1hpcpfzldC/JpiZZUH5jwQfQyLkiS+JNgqpDclXYUfMSZQ0FacaDAG5QLMQBG+x9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:46:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109464

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Make nice priority incremental even with setpriority(2) to match how it worked with nice(3)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-shells/tcsh/{tcsh_6.24.10.bb => tcsh_6.24.11.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-shells/tcsh/{tcsh_6.24.10.bb => tcsh_6.24.11.bb} (94%)

diff --git a/meta-oe/recipes-shells/tcsh/tcsh_6.24.10.bb b/meta-oe/recipes-shells/tcsh/tcsh_6.24.11.bb
similarity index 94%
rename from meta-oe/recipes-shells/tcsh/tcsh_6.24.10.bb
rename to meta-oe/recipes-shells/tcsh/tcsh_6.24.11.bb
index abeb6e803..d04ba1611 100644
--- a/meta-oe/recipes-shells/tcsh/tcsh_6.24.10.bb
+++ b/meta-oe/recipes-shells/tcsh/tcsh_6.24.11.bb
@@ -13,7 +13,7 @@ SRC_URI = " \
     file://0001-Enable-system-malloc-on-all-linux.patch \
     file://0002-Add-debian-csh-scripts.patch \
 "
-SRC_URI[sha256sum] = "13475c0fbeb74139d33ed793bf00ffbbb2ac2dc9fb1d44467a410760aba36664"
+SRC_URI[sha256sum] = "b5a7b627abb3ef2e8d3a869bb675d0e927d850704447a1b2c77946c0d324799d"
 
 EXTRA_OEMAKE += "CC_FOR_GETHOST='${BUILD_CC}'"
 inherit autotools
-- 
2.34.1


