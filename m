Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9BFBC54745
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:08 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.2886.1722934020649367662
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:47:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fZKSPWzF;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934026; x=1754470026;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=maPCR8JWR2sR8A0/4sgAHGZbQgXrusDaPxtqKlKx4Fw=;
  b=fZKSPWzFxcuEd9OU6053CA+MciMhahKAIr1t90jX+kJbu3wNskxt3eKW
   sem19ZSK0jQO4Eb78i3aMEOyjxfArn7Lr4htjt29RNJSWEWgqItWwwC2q
   qjIN5J0pFs69HIet5nGJ0K8dzBcUzUqwB0bmraqNlAALmcMBZ/SM+aVLT
   MLDlNjEZeRmh0bC+N//HJIb48Rl2zNx1G0DGwC0tzGJW9wB2NMqotmW5D
   Ix0pp9xzv1lTMoxdDKoSsXBNB4eynSKgfzVi62fKIMuT98sy2TK9Psebl
   Xjr1xFTdKWYwPulFHmL/3J3V2yk/vwdlLCxB6hLtSiR/zVm4JyGoqiIVA
   g==;
X-CSE-ConnectionGUID: ZhuRELC6SaWd7K7XDgWQCg==
X-CSE-MsgGUID: cjf0espRQleH6dMkUbjXSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="148947973"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="148947973"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:47:05 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id D26C4D4256
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:03 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2CA58D753B
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:03 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 995A620076D12
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:02 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 601EC1A000C;
	Tue,  6 Aug 2024 16:47:02 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 59/60] wavemon: upgrade 0.9.5 -> 0.9.6
Date: Tue,  6 Aug 2024 16:46:33 +0800
Message-Id: <1722933994-32549-59-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10--2.140800-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmLHBvqhRdA8sv27vtwnQ39AGqSG/c50XgOycrvYxo9Kp3hPzhoND77Mo8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXJBlJf2am17zGJoWRNL6927bMgBe6JuIsuBdt
	LV3lVPnEtF80alFB7SERoF9CygHG8ZTCa8b6VQxLWn6bUIps4tG/VhNobSzAL+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111574

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../wavemon/{wavemon_0.9.5.bb => wavemon_0.9.6.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wavemon/{wavemon_0.9.5.bb => wavemon_0.9.6.bb} (94%)

diff --git a/meta-networking/recipes-support/wavemon/wavemon_0.9.5.bb b/meta-networking/recipes-support/wavemon/wavemon_0.9.6.bb
similarity index 94%
rename from meta-networking/recipes-support/wavemon/wavemon_0.9.5.bb
rename to meta-networking/recipes-support/wavemon/wavemon_0.9.6.bb
index 9da43cf9f..c3de38a6f 100644
--- a/meta-networking/recipes-support/wavemon/wavemon_0.9.5.bb
+++ b/meta-networking/recipes-support/wavemon/wavemon_0.9.6.bb
@@ -14,7 +14,7 @@ PACKAGECONFIG[cap] = "--with-libcap,--without-libcap,libcap"
 DEPENDS = "libnl ncurses"
 
 SRC_URI = "git://github.com/uoaerg/wavemon;branch=master;protocol=https"
-SRCREV = "a7c2f190e010db508ead31fa952478e2a1c13d64"
+SRCREV = "8ba6604027c0aa5131070e3fafdcda323d58a7ad"
 
 # Needs some help to find libnl3 headers.
 # Reorder -pthread flag on the command line.
-- 
2.34.1


