Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 530E7EDE9A6
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 09:03:32 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.18331.1725959004373178377
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 02:03:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CHLCU/9y;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725959005; x=1757495005;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=7grmnv8zhsb6svM1u27ZQwb1ccVOZUjifoYhR9ehdhs=;
  b=CHLCU/9ye81TqIxYj1rt2a9BwvoW8LxayxLvaGm6vdOkwqAGQfoioCB/
   lsheykSkBwoz2oMrhV2ngHE9BYzPz64iQGv1LfLNPcJFvQflsmDki7U9w
   bPUqlgQQSR7vjqNDUJ3EPRZ2nJUINQDSvDbcJrEeMXO1FU02FfQQQt7Mk
   GHL4+9KtQFy7oGVnpBsLlq0699YcT8JNITgBMStrQBSjbh1X5jWh2POgX
   Dxhh+YDKSN1c5vixQidherlejTIW/TqhsD4prK74VgXOwa5PLbiTjtS8i
   er5K7HZu2DAhFo1eUklgqCVLJABHpRzocHAWrgeotiWQ36cBKvudUJEPw
   Q==;
X-CSE-ConnectionGUID: PXvsa4IhRkqTgClPk7x3Ow==
X-CSE-MsgGUID: ilHXwWCCQ5Kmsewgsol4+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="173214170"
X-IronPort-AV: E=Sophos;i="6.10,216,1719846000"; 
   d="scan'208";a="173214170"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 18:03:22 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id DCACCD8011
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:19 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 31A6ABF493
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id BB90D6BE52
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:18 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6BD671A000B;
	Tue, 10 Sep 2024 17:03:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/42] gensio: upgrade 2.8.5 -> 2.8.7
Date: Tue, 10 Sep 2024 17:02:32 +0800
Message-Id: <1725958990-5719-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
References: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28654.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28654.006
X-TMASE-Result: 10-5.489500-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrG24YVeuZGmOjY8EXdBUdH96u
	rnXKpk/cB+2CCerm0pTZf1VgO3gwHheuWYdUPo65/sUSFaCjTLxhTgzhQSF1ipTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q25x7uAXGEprZiQDIJsDspXCzkaVcXrvbOjxY
	yRBa/qJcFwgTvxipFajoczmuoPCq3afRz7yz9dV+/P0OrgbqUTH0RaLCdcodkDaIsQ+3RZGtvQp
	lKcgYCY7YEN8m2qi5Ai/rlx23pFKCrMbvGv+uj/EMCLu+v6MZp+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 09:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112190

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Lots of fixes to unix sockets.
- The addition of unix stream sockets to Windows.
- Unix datagram and seqpacket sockets are now supported.
- For older systems and newer systems whose pselect() operation is non-atomic
  (BSDs, MacOS) there were race conditions and some issues. Most should all be fixed now.
- For MacOS and later BSDs, kevent() is now supported.
- External threads doing gensio calls will now have their signal masks fixed up
  to work properly with gensio.
- gtlsshd was not working on MacOS

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gensio/{gensio_2.8.5.bb => gensio_2.8.7.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/gensio/{gensio_2.8.5.bb => gensio_2.8.7.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/gensio/gensio_2.8.5.bb b/meta-oe/recipes-connectivity/gensio/gensio_2.8.7.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/gensio/gensio_2.8.5.bb
rename to meta-oe/recipes-connectivity/gensio/gensio_2.8.7.bb
index 27b806970..f4d0c0930 100644
--- a/meta-oe/recipes-connectivity/gensio/gensio_2.8.5.bb
+++ b/meta-oe/recipes-connectivity/gensio/gensio_2.8.7.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     "
 
-SRCREV = "a776fb6fd56d5b0aedb1219ca17474faa1705260"
+SRCREV = "e4dbb9687bd5e887fa98a4cdcec012ea85da1ef2"
 
 SRC_URI = "git://github.com/cminyard/gensio;protocol=https;branch=master"
 
-- 
2.34.1


