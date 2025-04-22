Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85888C369DF
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 08:49:43 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.35431.1745311778838706802
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 01:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hGoZNk21;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745311779; x=1776847779;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=xTVBvF6qKw3OwrnW+NA/NOpUMqW7TIRNRe+U7GsMzJA=;
  b=hGoZNk21XRxZEcgbeD62LxCAvwND91rBhNLhbptzL/dvuNLR8o/IBZAE
   JZKaI0KUDIsfvqYhAyLiyxQM1nbFlylywm6UGW1cwtaD9FwmakhveneyO
   Zryk3Suty7LgxGAC1PoHYTWR079F4oxHL2+7yaQWNhekwKyCoG0zphszl
   l593Yz7qSi6KdXTYhz5aj97iIHJzE/GqF5yYUNCl11QyyqQQURtsIgQX4
   8KQV3pF9AxZySqrwR21xsaenbM+Afa3+MbNY2wysE4fwriS4VfTTZe9NY
   iZK/F+h/uXnMwvHLlhWiB0GftHJhknPAt+BU+z12F3OXc3xcLN0rlBJUZ
   Q==;
X-CSE-ConnectionGUID: AkfRL/OKSsqr680ZbabuFQ==
X-CSE-MsgGUID: SaEmXwpDRpGmpcPKAqirxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="200132605"
X-IronPort-AV: E=Sophos;i="6.15,230,1739804400"; 
   d="scan'208";a="200132605"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 17:49:37 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id A7330DBB91
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 66E4AD4BDD
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:34 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F2AC01A0078;
	Tue, 22 Apr 2025 16:49:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/30] python3-rsa: upgrade 4.9 -> 4.9.1
Date: Tue, 22 Apr 2025 16:49:17 +0800
Message-Id: <1745311761-1912-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
References: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 08:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117041

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-rsa_4.9.bb => python3-rsa_4.9.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-rsa_4.9.bb => python3-rsa_4.9.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-rsa_4.9.bb b/meta-python/recipes-devtools/python/python3-rsa_4.9.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-rsa_4.9.bb
rename to meta-python/recipes-devtools/python/python3-rsa_4.9.1.bb
index c27cd1d68a..2fb0bff29f 100644
--- a/meta-python/recipes-devtools/python/python3-rsa_4.9.bb
+++ b/meta-python/recipes-devtools/python/python3-rsa_4.9.1.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c403f6882d4f97a9cd927df987d55634"
 
-SRC_URI[sha256sum] = "e38464a49c6c85d7f1351b0126661487a7e0a14a50f1675ec50eb34d4f20ef21"
+SRC_URI[sha256sum] = "e7bdbfdb5497da4c07dfd35530e1a902659db6ff241e39d9953cad06ebd0ae75"
 
 inherit pypi python_poetry_core update-alternatives
 
-- 
2.43.0


