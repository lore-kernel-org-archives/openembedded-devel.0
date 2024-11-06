Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6177ED29F8A
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 06:31:44 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.40034.1730874701676901350
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 22:31:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IIgEBDTb;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1730874701; x=1762410701;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=NNQ6Uq5i37ELHf4mCWby+UU9128Ka6pmvGGZ/J4jr1s=;
  b=IIgEBDTb3X721iQOu534SQLjiHs9FTX8BCkRxxVyegr2dFb8eh80RzgT
   ypeX7SkhWqG/YdsK/MUR8n5peFSSYJA7oMHkv0zfeo78DARyG/muf6H9l
   Ua3QnhdPJTnF7pbdRoGJfEU/Te4tfeqTONUfAQZW96D0YXUHASQmz5VHK
   U57JLopFPTbjmS2Mmy6S0/jCnSniLxeBS70NzymlzOI/0N3+kkfPGCbT+
   7NMwW/+N/F8Q5FrUtDAA06h8UV82bHPCJrsc8zJA9C8qVTSGuSWwGWGQv
   BOKYPW3uix+IgNo1oRDPhH0nxCTOFcryTZ4dfLtvyMMh2R+GxiLnPg+FE
   Q==;
X-CSE-ConnectionGUID: ajqL9/GBQViJbYpXHPvexA==
X-CSE-MsgGUID: aE8Ccf6gS6mmR1iQdKREZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="179498439"
X-IronPort-AV: E=Sophos;i="6.11,262,1725289200"; 
   d="scan'208";a="179498439"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 15:31:29 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 81047D5A48
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:27 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id C7647CFBC8
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 56E0820071A01
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:26 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 047C11A000A;
	Wed,  6 Nov 2024 14:31:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 35/46] python3-rich: upgrade 13.9.3 -> 13.9.4
Date: Wed,  6 Nov 2024 14:30:49 +0800
Message-Id: <1730874660-2364-35-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
References: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28778.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28778.005
X-TMASE-Result: 10-0.609700-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJopGZilTi8ctSOwpfLMeBwRtNdaRpWZzMRZsoi2XrUn/J8m+
	hzBStantdY+ZoWiLImydET58jp62S2B98foCUsBh2FgyigEoKYLRFJSW0T4eep5S2lB16B9XrWt
	NgPDU2ZtjSgQKdAFTlb7SZuIrsSYJ1iDv2fBL9XsNXV5G/ars1S7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 06:31:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113725

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Optimizations to cell_len which may speed up Rich / Textual output

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-rich_13.9.3.bb => python3-rich_13.9.4.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-rich/{python3-rich_13.9.3.bb => python3-rich_13.9.4.bb} (85%)

diff --git a/meta-python/recipes-extended/python-rich/python3-rich_13.9.3.bb b/meta-python/recipes-extended/python-rich/python3-rich_13.9.4.bb
similarity index 85%
rename from meta-python/recipes-extended/python-rich/python3-rich_13.9.3.bb
rename to meta-python/recipes-extended/python-rich/python3-rich_13.9.4.bb
index 9458e4137..cac1ca959 100644
--- a/meta-python/recipes-extended/python-rich/python3-rich_13.9.3.bb
+++ b/meta-python/recipes-extended/python-rich/python3-rich_13.9.4.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b5f0b94fbc94f5ad9ae4efcf8a778303"
 
-SRC_URI[sha256sum] = "bc1e01b899537598cf02579d2b9f4a415104d3fc439313a7a2c165d76557a08e"
+SRC_URI[sha256sum] = "439594978a49a09530cff7ebc4b5c7103ef57baf48d5ea3184f21d9a2befa098"
 
 inherit pypi python_poetry_core
 
-- 
2.34.1


