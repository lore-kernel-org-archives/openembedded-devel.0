Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3AF6C5472C
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:07 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.2886.1722934020649367662
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:47:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=khDob+Yb;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934024; x=1754470024;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=YZDDVho4udU8z55LC/hyPFxVqdAALWm+Y1+roK2B1as=;
  b=khDob+YbY7Z86Mbvc5qoYcO7lH+5SNyHVdL00tS/1kB7rFQX6jXFdZpt
   Ez2vZ/ZAWZABlJ+Q7YbkNn+SGxBp7+8+TZnr33O9nYYS2FBZK8Yswt284
   o+/CrxwdXOCDEmcAbHXhIfayZjGi2DIF9JPVctwLC6cCBUwwCM1rVfiJ4
   XWLftJ4TnBAUqFTcK4VRG71Uqf7sbLpjyR4ve4bFVr0rDxSUQhTWT5m0p
   xw5TlzUqkvCmYodgdkUljvFzueCC794WXmCpHpI9ZUEvSOKDyBD1xS9JZ
   PrQBabOkYsNQzLKzknwafvceTio/mMzsWYrGaLo+84ESVG/BvVsxRdATG
   w==;
X-CSE-ConnectionGUID: oW82ITIdSaK6B/x1ZlM2Vg==
X-CSE-MsgGUID: QVAMtTRbR76b8rwuXu50MQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="148947968"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="148947968"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:47:03 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4C504D64A6
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:01 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8D624D8B2F
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2DA7620076D14
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:00 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id ED7601A000C;
	Tue,  6 Aug 2024 16:46:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 48/60] python3-regex: upgrade 2024.5.15 -> 2024.7.24
Date: Tue,  6 Aug 2024 16:46:22 +0800
Message-Id: <1722933994-32549-48-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10-1.001800-10.000000
X-TMASE-MatchedRID: uzDfqB7OXkqjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZngIgpj8eDcBpkajQR5gb3mn0m688Eo38Kra
	uXd3MZDUc7ew6pATgQw5KMY6U5VpnuFK01bHVzboujsUv5QNrYGLWbtlui09xC/HfcSKmC+y4Mm
	b1zjHolOLL7KwIQ/O96iBPatJ/VPKCV7SgdjlG21PJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWL
	WlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111562

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-regex_2024.5.15.bb => python3-regex_2024.7.24.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2024.5.15.bb => python3-regex_2024.7.24.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2024.5.15.bb b/meta-python/recipes-devtools/python/python3-regex_2024.7.24.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-regex_2024.5.15.bb
rename to meta-python/recipes-devtools/python/python3-regex_2024.7.24.bb
index 9d356553b..682c30fc9 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2024.5.15.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2024.7.24.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "d3ee02d9e5f482cc8309134a91eeaacbdd2261ba111b0fef3748eeb4913e6a2c"
+SRC_URI[sha256sum] = "9cfd009eed1a46b27c14039ad5bbc5e71b6367c5b2e6d5f5da0ea91600817506"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.34.1


