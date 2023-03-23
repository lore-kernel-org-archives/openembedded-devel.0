Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D471C6FD1C
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 05:15:08 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.65409.1679548499669688601
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Mar 2023 22:14:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=KJfaS8T8;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679548498; i=@fujitsu.com;
	bh=4Ao76eO46mZzZT5ZbtbR/MslZvRFhTTdakfPdkC3MGo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=KJfaS8T8pLc5gETitaop+/ztkTS+mnUagWZmzJ4tgQcVR9sRnLZXBmfuHVsbz5UFZ
	 Q2fX63qRt99vi0nJm7MeF1ukgenUA3h7vnjeUJEWxeCLCbRf1qb29onexKtxcbti1O
	 YzWrFHXIHToOfU/IRxMLUP1Et7XmCeUNm8hwmCGBgYQYYlqHHDOQnpEAw1MvmSDq0h
	 I2X/G66YNOrVDGbv5Cxi/XTGiM1p9zhwjA/AQWgivGezkWQfQAZhmsGmFqf/lBt4us
	 qGP1A4wQhtliMNpUqKlZwiduqdN3IZRn2kOFEolimjOX3lfXBkcDnz54z1ym8Dmkdt
	 Y4Ao2cya+2thQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8MxSTfwgXS
  KQc8KAYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWP6zhbmggdcFdcnz2dqYHzM2cXIxSEk8IRR
  4ty1zSwQznUmiZ2TTjBDOHsYJXbtOgPkcHKwCUhJ3Lj/nw3EFhHQl1g6ew9YnFlAReLF7x52E
  FtYwF3iw56tYDUsAqoSW6b0gNm8Ak4SR09tZgWxJQQUJKY8fA/Uy8HBKeAscb4pASQsBFTy+P
  4BJohyQYmTM5+wQIyXkDj44gUzRKuixOzLzSwQdoVE4/RDTBC2msTVc5uYJzAKzkLSPgtJ+wJ
  GplWMZsWpRWWpRbqGBnpJRZnpGSW5iZk5eolVuol6qaW65anFJbpGeonlxXqpxcV6xZW5yTkp
  enmpJZsYgcGbUqzIuoPxUt9fvUOMkhxMSqK8EqHSKUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQke
  AXuAOUEi1LTUyvSMnOAkQSTluDgURLhnXsQKM1bXJCYW5yZDpE6xagoJc7LdB8oIQCSyCjNg2
  uDRe8lRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8OveApvBk5pXATX8FtJgJaHHcDAmQxSW
  JCCmpBqY8N++guQ8EI5OEKnnUmK1TBY88lvp9lu2o3zWxted2OOilyk7dqWS+aPKidUH3dxWI
  NU+ZXOcuXmT7OTVdr69t/q/PWa8TF86x+LlkUcr8LdMS/R75Ppx6+dS6lm9P+vWu8vGwC77YP
  2WK1tzqjkliZh/uKIc6Jy/hfHbFUEJ2ldRGocy9h4/H2gXFWm1VEFQr+nLSY+ukOSdnTtxzb9
  EPrWjTmJecm/oYNZ9YzPlsMePH4frIEy7P+B9HKp/p5NiddJTr4DFrlfbOpky3RQyfRSfzzXY
  Ufx/6etpXxp7bkzwKJT4m6moqNDzV/MPkPO1paW54zv9ZE2ao7hKeY1du8vrHxeOitl+X+7wu
  lmxTYinOSDTUYi4qTgQAVSEnalkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-571.messagelabs.com!1679548497!764812!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9686 invoked from network); 23 Mar 2023 05:14:57 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Mar 2023 05:14:57 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id F33241000E9
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 05:14:56 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id E6AFF1000D2
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 05:14:56 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 23 Mar 2023 05:14:55 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-tzlocal: upgrade 4.2 -> 4.3
Date: Thu, 23 Mar 2023 13:14:25 +0800
Message-ID: <1679548466-20438-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1679548466-20438-1-git-send-email-wangmy@fujitsu.com>
References: <1679548466-20438-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 05:15:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101660

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Improved the error message when the ZoneInfo cannot be found
- Don't error out because we find multiple possible timezones for
  a symlink.
- More stable on Android/Termux with proot

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tzlocal_4.2.bb => python3-tzlocal_4.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tzlocal_4.2.bb => python3-tzlocal_4.3.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-tzlocal_4.2.bb b/meta-python/recipes-devtools/python/python3-tzlocal_4.3.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-tzlocal_4.2.bb
rename to meta-python/recipes-devtools/python/python3-tzlocal_4.3.bb
index b9307f100..37d5ed604 100644
--- a/meta-python/recipes-devtools/python/python3-tzlocal_4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-tzlocal_4.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/tzlocal/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=57e0bd61643d81d05683cdce65b11d10"
 
-SRC_URI[sha256sum] = "ee5842fa3a795f023514ac2d801c4a81d1743bbe642e3940143326b3a00addd7"
+SRC_URI[sha256sum] = "3f21d09e1b2aa9f2dacca12da240ca37de3ba5237a93addfd6d593afe9073355"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


