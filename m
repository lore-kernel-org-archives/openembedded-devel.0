Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22BEDC433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 02:17:18 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.19855.1656555431445846320
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jun 2022 19:17:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=EuL/nVJJ;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656555429; i=@fujitsu.com;
	bh=nnATPkzJTG2JXfPCnLtnKwaB10fwjGqJf+hztE28yds=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=EuL/nVJJ0q8q9avB2QhGIN3OD81uUW0Qp8op4JTZ8XPvSQcEcMQlCKmtZxkrG5yWN
	 0fKxbMn8BmhPAquVUlS9riSYwzHA+pUF0ev8EqBx0L1tXHvw5aIyZUH9a5xrcgX/xc
	 lzGFICm6O23YSRW4HZpXbeK08JgPgC0TxT1InBgGUe+d4MEILNly+AcLTSeS1Mq1k8
	 tlRxRIQ8VqYUwt8DqPdS2jpZuhoeKg0wDiP0rI4u+M8T58kzE3mGlhr6GW3pBW1QAW
	 GWINkjzBXh0LQNDWxjRICzOvWJ3NDAdRfMReav/ADskSZfghpevDa/My6ozMzUVz6s
	 aogQnpjC49pGw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCIsWRWlGSWpSXmKPExsViZ8OxWXcJ+94
  kg4sb1CwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oxzj2+wFCzhqti09yhTA+M2zi5GLg4hgYeM
  En9/rmGHcC4zSUy/+Yqpi5ETyDnAKLFtlR6IzSagK/Hix2IWEFtEQF9i6ew9zCC2sIC/xKmD6
  xlBbBYBVYnvFzezgti8Au4S05e1gNVICChITHn4nhkiLihxcuYTsDnMAhISB1+8AIpzANUoSs
  yeLg9RXiHx+vAlqFY1iavnNjFPYOSbhaR7FpLuBYxMqxhtk4oy0zNKchMzc3QNDQx0DQ1NgbS
  xrpGhmV5ilW6iXmqpbl5+UUmGrqFeYnmxXmpxsV5xZW5yTopeXmrJJkZgAKYUp9/Ywbhr3y+9
  Q4ySHExKorxPp+1JEuJLyk+pzEgszogvKs1JLT7EKMPBoSTBu55hb5KQYFFqempFWmYOMBpg0
  hIcPEoivDe+A7XyFhck5hZnpkOkTjHqcsz82naAWYglLz8vVUqcdyUL0AwBkKKM0jy4EbDIvM
  QoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmJeBDWgKT2ZeCdymV0BHMAEdsXMa2BEliQgpqQa
  mMjW2zw4m0+aX3rA/Z1/vs3VzRvfav6evq+fWKtT/PimRkuD+fkPdh16WCu1XqfKBdpXxATtc
  DwidYDS4seTE0//XzgueWutmH101d/F8kcZHutIBc1Q6tkyX5o+yOFR3rX5v1IP4p6cl1QweX
  F29OGuetFOAoj/7M8kzm8LD5eW4nyhvNnO9tsnaOY91y3puz2usKkE3b9qErpnH+XH3lI0hnl
  77XxyfOetj+enVAmraG+osz6ce0Oh1+HSj8pH7ZP2GLuG5x+VPcSw1usd4gimmSumeedoFy53
  qHpXqpXve9zFeOlvcfOnshO39ZY+WLGM9wM9yzfue3Ms7wSYNlwWnnekK6xaUKDh8uGKdEktx
  RqKhFnNRcSIAlEDc5UcDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-6.tower-728.messagelabs.com!1656555428!70683!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18348 invoked from network); 30 Jun 2022 02:17:08 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-6.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 Jun 2022 02:17:08 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 0FC4614E
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jun 2022 03:17:08 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 02CEB75
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jun 2022 03:17:08 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 30 Jun 2022 03:17:06 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-xmlschema: upgrade 1.11.2 ->
 1.11.3
Date: Thu, 30 Jun 2022 10:17:00 +0800
Message-ID: <1656555420-9879-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jun 2022 02:17:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97631

Changelog:
=========
    Fix invalid element not detected with empty particle (issue #306)
    Fix Sphinx warnings (issue #305)

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...{python3-xmlschema_1.11.2.bb => python3-xmlschema_1.11.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xmlschema_1.11.2.bb => python3-xmlschema_1.11.3.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_1.11.2.bb b/meta-python/recipes-devtools/python/python3-xmlschema_1.11.3.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-xmlschema_1.11.2.bb
rename to meta-python/recipes-devtools/python/python3-xmlschema_1.11.3.bb
index e687c0cd9..7837bc8a4 100644
--- a/meta-python/recipes-devtools/python/python3-xmlschema_1.11.2.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_1.11.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/xmlschema"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=47489cb18c469474afeb259ed1d4832f"
 
-SRC_URI[sha256sum] = "0706c84de20686c940fa07e2b88425cff1471c89544a49e9365b9636236ccd2f"
+SRC_URI[sha256sum] = "28a135028f7ab1e0c934fc0c6717a66b2dc5f166d123dfe6ce61afc671ad113f"
 
 PYPI_PACKAGE = "xmlschema"
 inherit pypi setuptools3
-- 
2.25.1


