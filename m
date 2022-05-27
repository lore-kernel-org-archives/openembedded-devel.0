Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABAEBC433EF
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 01:30:05 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web09.2630.1653614995709341284
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 May 2022 18:29:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=W7EdaHH2;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653614993; i=@fujitsu.com;
	bh=iKJQDgxvaNPvviIjwegLRGfvDMw+FdIafPNDjvPDmSk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=W7EdaHH2ByiDFkogWHiNYkhVVasXthvk16qyNV5AU9m5c8jXsaV62qHz8iHgUZkFl
	 0w6U4RTnav8QX/BUBvhDhSBIuUi4orXxygkaHS+6npfHPly4LaAxYioeZtfU9OPddU
	 JsNSAYuavxp2Wp6BYDZOGAwusEEiOFJcm2JnTOLnrPc9NnKRUR1VkoWuecnF6OqU4r
	 70njKS79iph44150JoC7lrJ1v5rUIJXVc5blRaXAM1QGJc3dAXG+fzi45tYO0Dv9cT
	 GA8wiF7TwRG2NnVxpaYuLsadUiBihGHnvK7+y9nJGJu+R9Wb+rPGJUBI55XD9pF9So
	 vkdRDAp8Kf7Jg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8MxSXeC5oQ
  kg4c/9CwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oyTlx+wF0zlqrj4KLuBcQ1nFyMXh5DAE0aJ
  P5d+skI4F5gkNre2s3cxcgI5JxklZi/NA7HZBNQlHt98zQhiiwjoSyydvYcZxGYWUJXovrgGr
  F5YIFji7JZ3bCA2C1B8+pTnYDW8Au4SXxdsArMlBBQkpjx8DxUXlDg58wkLxBwJiYMvXkDVKE
  mcWPGRCcKukHh9+BJUXE3i6rlNzBMY+WchaZ+FpH0BI9MqRqukosz0jJLcxMwcXUMDA11DQ1N
  dQ10jQ3O9xCrdRL3UUt3y1OISXUO9xPJivdTiYr3iytzknBS9vNSSTYzAkEwpZry5g7G176fe
  IUZJDiYlUd7Me/1JQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR476hNSBISLEpNT61Iy8wBxgdMW
  oKDR0mEV0kGKM1bXJCYW5yZDpE6xagoJc67XgMoIQCSyCjNg2uDxeQlRlkpYV5GBgYGIZ6C1K
  LczBJU+VeM4hyMSsK8LCBTeDLzSuCmvwJazAS0OJ+3F2RxSSJCSqqBaUnxC6MvW9/Zm2e+7Dk
  WsNE5+9QP2wx16dc6ZnmiVdVqW9yPck7/nbHLLuPdG+u3Wi8vifF8+ja7qzLdhFvEpcXiOvem
  M/XvT07cOHWL6XNO3r2/jBdttbm3d3/sNd0Q54B+04Qn88KDrn0I2rrcj0f6WfXzOs784OzIt
  ca+tVYvv+Y2vxQTrtxc9K0uyqwur5LJJPY2T/dTkT0W/3ZdnpCqbH5xu55rbcJV9luW1+scar
  88z57+80rZfrWTXb42xm4BG/i9XTbrdczgL9TceTHo1geZM4c8Mw4IH1/AGdc+wfi3YGvkjo3
  M3xnnvyi4e7ZOzIWFvXOT0x1dlt+VEtPvN73h7OoLL3pVt3efEktxRqKhFnNRcSIAadHlskQD
  AAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-6.tower-591.messagelabs.com!1653614992!20720!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1373 invoked from network); 27 May 2022 01:29:52 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-6.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 May 2022 01:29:52 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 5884D100329
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 May 2022 02:29:52 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 3D3E7100446
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 May 2022 02:29:52 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 27 May 2022 02:29:40 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-api-core: upgrade 2.7.3 ->
 2.8.0
Date: Fri, 27 May 2022 09:29:31 +0800
Message-ID: <1653614971-27933-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 May 2022 01:30:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97289

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
=========
    adds support for audience in client_options (#379) (c97c498)

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...oogle-api-core_2.7.3.bb => python3-google-api-core_2.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-core_2.7.3.bb => python3-google-api-core_2.8.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-core_2.7.3.bb b/meta-python/recipes-devtools/python/python3-google-api-core_2.8.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-api-core_2.7.3.bb
rename to meta-python/recipes-devtools/python/python3-google-api-core_2.8.0.bb
index 3422dd711..b7ff8bc29 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-core_2.7.3.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-core_2.8.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "17957f0704cbe95bd2ce25019efd2046423978594d181d4263e5dcffd2dbbc79"
+SRC_URI[sha256sum] = "065bb8e11c605fd232707ae50963dc1c8af5b3c95b4568887515985e6c1156b3"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.25.1


