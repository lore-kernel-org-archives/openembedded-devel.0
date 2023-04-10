Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB288C77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 08:33:58 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web10.40301.1681115634398567725
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 01:33:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=My1ar1vF;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681115632; i=@fujitsu.com;
	bh=NKy07wsKM7OF4LV06cChD2Poog87moZz1fzBeKKZgRQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=My1ar1vFA5d4fEQqbnrOQ0wkbvoxqxoF+EwDuk6wXqJrCyShzzPTb2elCVPvUaIhg
	 i/r1m5mmudfpicCsr8m3ZO1VgWJwuxlWyQ3Wz6DYkYa8uRro9KSg8uLODmU8YQX/0G
	 f+8TGEQHFVcO2/q7QN10lK6BUzbxT2PzRRGxo1DvJUO6PwQJf5aIYW/SsT38JXIb1l
	 9Ozc/S7npechy5KNRYgtUIcHAh74x4HoeYhcUJZjL9s+MCc0QF8vwyJ0nN5zuoVi8T
	 Rn1gsOhb1SHxgUDc24KunNyu0E4J9LTnbLZLKFhQuvC4Lf51BNl+Yai/n8RZJiEEvO
	 7gNfzJ6cGC5sQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8OxWffDSeM
  Ug3lNrBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a+rbdYC2ZwVSzrbGVrYFzK2cXIxSEk8JBR
  4v7EPmYI5wqTxJeLZ9ghnD2MEvsedbB2MXJysAlISdy4/58NxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSwQIHHk1yawOIuAqkTf3QdgNq+Ak8Sra99YQGwJAQWJKQ/fg8U5BZwldh3ZADZTCKhm0e
  8njBD1ghInZz5hgZgvIXHwxQtmiF5FidmXm6HmVEg0Tj/EBGGrSVw9t4l5AqPgLCTts5C0L2B
  kWsVoVpxaVJZapGtoqZdUlJmeUZKbmJmjl1ilm6iXWqpbnlpcomuol1herJdaXKxXXJmbnJOi
  l5dasokRGL4pxazHdzDO6vurd4hRkoNJSZS3i8s4RYgvKT+lMiOxOCO+qDQntfgQowwHh5IEb
  xkwIoQEi1LTUyvSMnOAsQSTluDgURLhrTgGlOYtLkjMLc5Mh0idYlSUEufVAOkTAElklObBtc
  Hi9xKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd5th4Gm8GTmlcBNfwW0mAloMZeLAcjikkS
  ElFQDU9Lf+nvn2Re8XcqxY7GY27dH5Yfbf6i45caZJD2dOPFLetWeVYf3eTx5kVBqtGCpYXCp
  Skz/pE3W7yYeD91294Ly3UrvpymxffeVWTuPVE/RW6pwauqy79KxezZxy0jV3o85L3Oel/Gs6
  Lb2UAPlP1zbPO8I/GPT/PTqkan6r5mWP+83nv+XN0FynmhMyty+xj+9EjHrz8YW5j/QKZ11/e
  1Mo+v2e69VqJ/tYlvlmOe4K2rmtsyAOqeA/gBZo4CXf/J1WjJmdURU5Ir6X9z4IeVLBnOTWqN
  fy1xlpwO54X1ruEy1EkOW9mQujXmTJL2CS+vM9TyeCWWh99pX7jZ3ecl6x2zzwbzy6RVm/h9s
  lViKMxINtZiLihMBsMXiaVoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-585.messagelabs.com!1681115631!193094!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31307 invoked from network); 10 Apr 2023 08:33:52 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-12.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 08:33:52 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id A860415F
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:33:51 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 9BEA1159
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:33:51 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 09:33:50 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-sentry-sdk: upgrade 1.18.0 -> 1.19.1
Date: Mon, 10 Apr 2023 16:32:12 +0800
Message-ID: <1681115532-24518-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681115532-24518-1-git-send-email-wangmy@fujitsu.com>
References: <1681115532-24518-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 08:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102028

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Make auto monitoring beat update support Celery 4 and 5
New: Celery Beat auto monitoring
New: gRPC integration
New: gRPC integration
Fix: Do not trim span descriptions.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sentry-sdk_1.18.0.bb => python3-sentry-sdk_1.19.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_1.18.0.bb => python3-sentry-sdk_1.19.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.18.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.19.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_1.18.0.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.19.1.bb
index add255d5b..0eb29c71b 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.18.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.19.1.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} += "\
 	${PYTHON_PN}-datetime \
 "
 
-SRC_URI[sha256sum] = "d07b9569a151033b462f7a7113ada94cc41ecf49daa83d35f5f852a0b9cf3b44"
+SRC_URI[sha256sum] = "7ae78bd921981a5010ab540d6bdf3b793659a4db8cccf7f16180702d48a80d84"
 
 PYPI_PACKAGE = "sentry-sdk"
 
-- 
2.34.1


