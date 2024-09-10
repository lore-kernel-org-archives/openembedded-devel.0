Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84F6AECE58D
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 09:03:42 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.18334.1725959012353127066
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 02:03:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=r07A14sZ;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725959012; x=1757495012;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=aHhLCdURTGs7ZS4DN9tdYvVTVMSdutjdm91jvF8aAX0=;
  b=r07A14sZkNBM3kipNi01sDRXRPZDU93Za2efkc7yib1kbDFRSOi8PKbq
   KB4v/+IYT6KB8Bqu1pgFgtAacwvP1dfVvbZAONIwxY7rYihz0JjZ3U3qg
   KgUh7eL31KawCoAdhV0JKksQXkwKrwdYwFAvp7sTecO7qSMswx2WlagQ0
   Nrp3kXRS9yQxj2bb23dTDFJ/xhtWM5oZnDyPnv3k1Ar+kcbhvxU3+qyUW
   kgIR+MJPZKgbELVghL5J+cmcdStp20fK8/mkVQlB8pxpDg7cqIrymry9v
   AvEZO+fj5mrNXVrd+1V4b4GBtCnH/oxvrNTst/ywE5ecFOzIrmOHw7aSO
   Q==;
X-CSE-ConnectionGUID: 0fUQpGqGQE6c+hr8Onz8Iw==
X-CSE-MsgGUID: Z2hcAYE/QlS9aV4o1i5/BQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="161556661"
X-IronPort-AV: E=Sophos;i="6.10,216,1719846000"; 
   d="scan'208";a="161556661"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 18:03:29 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id B82CDC68E2
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:27 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 12E4DD969D
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8D3A1200894AD
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:26 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3DFD91A000B;
	Tue, 10 Sep 2024 17:03:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/42] python3-ipython: upgrade 8.26.0 -> 8.27.0
Date: Tue, 10 Sep 2024 17:02:49 +0800
Message-Id: <1725958990-5719-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
References: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28654.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28654.006
X-TMASE-Result: 10-0.556700-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrNi8L88UV9IC+eGAmqR+bQCtw
	uFOs6nVluH0SzH4JWPaqW4fU4IlE44Aiks/+pdsZA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYgB/8cibO8IY4gdubnRQFgyeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNSSFZxwBH+WRJAtIZih7iJF1QlveoXebqHFqaDT/d+Xp3gqU1F9z/qPuAtZv731KlGcw6
	+jU35LpH9hxaF+pfIx67kXAKGPuHY4g39jQjFhNU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 09:03:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112208

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- autocall was beeing  call getitem
- Only copy files in startup dir if we just created it.
- Fix some tests on Python 3.13 RC1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ipython_8.26.0.bb => python3-ipython_8.27.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_8.26.0.bb => python3-ipython_8.27.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_8.26.0.bb b/meta-python/recipes-devtools/python/python3-ipython_8.27.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-ipython_8.26.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_8.27.0.bb
index 6f35d9548..94e731b88 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_8.26.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_8.27.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://ipython.org"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
-SRC_URI[sha256sum] = "1cec0fbba8404af13facebe83d04436a7434c7400e59f47acf467c64abd0956c"
+SRC_URI[sha256sum] = "0b99a2dc9f15fd68692e898e5568725c6d49c527d36a9fb5960ffbdeaa82ff7e"
 
 RDEPENDS:${PN} = "\
     python3-setuptools \
-- 
2.34.1


