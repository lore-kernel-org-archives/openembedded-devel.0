Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2C4EC3A59D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 06:47:15 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.16550.1666594028725609956
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Oct 2022 23:47:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xJLFIjyE;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666594026; i=@fujitsu.com;
	bh=Xuqb3yq0I65gIYUlpJLaZgPbyX8AoZtGp46+I9YtV1A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=xJLFIjyEiwXnf13eKvGEzOc3b5NkDUoDAxdxGsB0aTqFDw2bv3l+aC1cE2s5+m0Vx
	 0lHVts0syqYH6ohEdt8v9xMNpdK1AFQho8X/nomvT3XJNytW0WV96n6AkXmgQVZ6/G
	 MV6r2RXWAnwSOglCbG3myzRfSr/w3qUPdx/H59Doqeafoqux8lIaznftJrnECBSoz/
	 mmU1cWDXYs/z5bc4U7rcz2/fhGm0BMHOTbnSL9zisiA89209gBStpAiFBf/OgS5wXn
	 lVcoNA5XD+N81b3tsX0TCGqZdz2j+ETQI7pLomPXVV9LGVQlpkSYBexV6j4uIiyQVi
	 eloX/cWHzTQQg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRWlGSWpSXmKPExsViZ8MxSfeVSVi
  ywZXHnBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b5FRtZCpZxVvTOeMHawHiGo4uRi0NI4Amj
  xI5VN5m7GDmBnOtMEnvP8kEk9jBK9P85xwaSYBOQkrhx/z+YLSKgL7F09h6wBmYBFYkXv3vYu
  xg5OIQFAiVOX3AECbMIqEqcnz+fDSTMK+Akcai3CiQsIaAgMeXhe7BOXgFBiZMzn7BATJGQOP
  jiBTNEjaLE7MvNLBB2hcSsWW1MELaaxNVzm5gnMPLPQtI+C0n7AkamVYzmxalFZalFuoaWekl
  FmekZJbmJmTl6iVW6iXqppbp5+UUlGbqGeonlxXqpxcV6xZW5yTkpenmpJZsYgaGYUpwavYNx
  7rI/eocYJTmYlER5GcTDkoX4kvJTKjMSizPii0pzUosPMcpwcChJ8NZoAeUEi1LTUyvSMnOAc
  QGTluDgURLhnWUElOYtLkjMLc5Mh0idYtTlmPm17QCzEEtefl6qlDivGjDKhARAijJK8+BGwG
  L0EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3tkGQFN4MvNK4Da9AjqCCeiISyuCQI4oSUR
  ISTUwJYYuWNrLd6y9JS6m9OmOFT3ZwlfdbzfqrBfTbrMwOxXjFCZ8gm3zm+gNIdOm259b8nTX
  EYeHddnGalzvLlluv/Gq7UCRDcO8uLNPFuwXXm+0YNqM4Gf9E9kPHnTx36L0vq50zplVlUc3H
  /km6e9Sv/NdxfGiOf2aT50mt5iuPrrogQNXUVZPm1CS2c77ndvsPBkXK0RN6vm+JDR66dLvT7
  ket2yRncT0oL5vVWZM8GrjxWyGJ/tLpn7uaDj7y1UrMFiob+nVCidxliWHH7SGz4ub29n9Y5F
  tt0bp6XbHOzx6LOsCIr8p6LXFFb/JKNg+jev2lK2XF6V8031/2mbZ2aC7zhq/WVSX1xT034ye
  o8RSnJFoqMVcVJwIAJovrKxMAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-728.messagelabs.com!1666594025!195956!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10835 invoked from network); 24 Oct 2022 06:47:06 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-3.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Oct 2022 06:47:06 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 9DEEB1000E7
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 07:47:05 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 90D711000F5
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 07:47:05 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 24 Oct 2022 07:47:03 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-auth: upgrade 2.12.0 -> 2.13.0
Date: Mon, 24 Oct 2022 14:46:47 +0800
Message-ID: <1666594007-28879-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 06:47:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99276

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-google-auth_2.12.0.bb => python3-google-auth_2.13.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.12.0.bb => python3-google-auth_2.13.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.12.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.13.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.12.0.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.13.0.bb
index 53c1d00ccb..9e4129b6b6 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.13.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "f12d86502ce0f2c0174e2e70ecc8d36c69593817e67e1d9c5e34489120422e4b"
+SRC_URI[sha256sum] = "9352dd6394093169157e6971526bab9a2799244d68a94a4a609f0dd751ef6f5e"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.25.1


