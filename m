Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3BB4C3271E
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:36 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.166870.1719305851742090756
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mP3hYiYf;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305852; x=1750841852;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=3Y8BcYfkBmHfD5esSlsWrlwRwIErGurZdxpKJR+XLWQ=;
  b=mP3hYiYfUvyI8f1Kex5shkYhxpQ13bXAtx1HiTEpEdZdXiT4TrGkZjgK
   AY6IhETdma2eq6TGlYhniC6U8JHTou4BD+yTolkOh85nWoQxS1YuGxyP0
   gh6EuMDfbpHs6LpOuvreRLXZUjplR9RVN90f9L7qFH/kPMmy5BKMGYoVl
   oRUGdgssUwuGqQj7ZvX+R2v/mtpQhWgdgqNgdtq3973gjNpIQ1REZZQ3d
   DUHTMYgNInWoUGEY3mgqQ7IdpTsRPGfq4JPXcxfZ2C9U/n1eEtQBiqCnm
   QutkXnQJdGs5evcFWXPKC0apqdZ7g/fbVeT1YGGA9dX4xcsQ70DHizv4A
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="164869305"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="164869305"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:57:30 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id ABB66D800A
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:27 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id F1A2FD8AF0
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 89CC12007CDC4
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:26 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 374D01A0002;
	Tue, 25 Jun 2024 16:57:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 41/57] python3-portalocker: upgrade 2.8.2 -> 2.10.0
Date: Tue, 25 Jun 2024 16:56:14 +0800
Message-Id: <1719305790-11484-41-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10-0.119400-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrWQ3R4k5PTnChvTAz4tl9Er6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3AdVRmAIzhtAo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXLQqa4omGXlnwF3iMoK6a+9RWA0FXL4oZT03G
	xlsQNcR2+lY5T8ZJDJfUPHUhWRN1Jwdl9kK8iETz515g0H8dp2se6H4AOOpgP+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111054

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- Properly propagating exceptions for NFS read-only lock issues and added support
  for being able to choose between lockf and flock

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...thon3-portalocker_2.8.2.bb => python3-portalocker_2.10.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python3-portalocker/{python3-portalocker_2.8.2.bb => python3-portalocker_2.10.0.bb} (89%)

diff --git a/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.8.2.bb b/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.10.0.bb
similarity index 89%
rename from meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.8.2.bb
rename to meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.10.0.bb
index c45a3fcda..12d1025d0 100644
--- a/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.8.2.bb
+++ b/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.10.0.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=152634da660a374ca18c0734ed07c63c"
 
-SRC_URI[sha256sum] = "2b035aa7828e46c58e9b31390ee1f169b98e1066ab10b9a6a861fe7e25ee4f33"
+SRC_URI[sha256sum] = "49de8bc0a2f68ca98bf9e219c81a3e6b27097c7bf505a87c5a112ce1aaeb9b81"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.34.1


