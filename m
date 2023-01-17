Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5670C6379F
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 07:14:12 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.190990.1673939643322912864
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 23:14:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=onMTK8B6;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673939641; i=@fujitsu.com;
	bh=h0dOcBsTkm9vV6ouxFmW/BiVrO2e//8QRg6uzjy18Ag=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=onMTK8B6HKxMrd0sElwiylZtlc8r+5SzI/TWmu/qPZCRkbfAnGzyLjP6xXriFBCA5
	 PcqEt8sah9MeJoj96dIi0nRvgciIVAvWbBJAYN2ziHDHunghX2VuN0rA7sktOyDngw
	 KGJYtt/OR4QDCT0cZSX6+Qd+3fJCX25e6swPgzrPXorqYQMw3FqA6pbG0LZgOCM/rn
	 TaYeS7vRwhyJHt8efnSDjllrIrP7TA2GhbuXWqyg3kQoBEr1U0pVkFO12o46i66wZL
	 LRQ6HfUhnWDeLjej+aR/aAWoW17r+D/3TRR7z4tSbpdIVIXxDg45Dt8QDmJOAkyCqr
	 ifNtNdbQvIrvw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8OxWXeH17F
  kg65HFhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8blfzuZCi5xVOz+nNDAeJS9i5GLQ0jgAaPE
  6rcr2LoYOYGcK0wSvw/oQCT2MkoseDCDHSTBJiAlceP+f7AiEQF9iaWz9zCD2MwCKhIvfveA1
  QgL2ElMvHKAqYuRg4NFQFVif4sgSJhXwEni2cItYK0SAgoSUx6+B2vlFHCW+HFoHQvEXieJk6
  dnsELUC0qcnPmEBWK8hMTBFy+YIXoVJWZfbmaBsCslWj/8grLVJK6e28Q8gVFwFpL2WUjaFzA
  yrWI0L04tKkst0jU00EsqykzPKMlNzMzRS6zSTdRLLdXNyy8qydA11EssL9ZLLS7WK67MTc5J
  0ctLLdnECAzdlOKUizsYnyz7o3eIUZKDSUmU96TpsWQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKE
  rxe7kA5waLU9NSKtMwcYBzBpCU4eJREeMMtgdK8xQWJucWZ6RCpU4y6HFevXNnLLMSSl5+XKi
  XOu9oTqEgApCijNA9uBCymLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5n3iATSFJzOvBG7
  TK6AjmICO8Cg5CnJESSJCSqqByW6S7ckbOzi85J6u3ev4b/5xtUknpEXSzIL+hbwV0tI9tHbv
  08V+CtOOn5XzDTv16bZlR2OdTHXgRS+xqpNN83xTjn7nXffgw+xdlrXvEx9fWL7g8dvXPK3f/
  V+HF1zs2mpqV/z4VqWDq2hyRo23rWRp2byjezZl36020biYZWrG90nuScpRG/ufErcvTWI/6T
  d53Uyzy3syDq3KuzFRYleJrWpWlb+2UdjLSZOvnHTZaW54S93lssyWReHP0+btXyP6cpndpKz
  O1xzhLyP/rFss1TXPv+zV9/y2zVIzVMyfVXvvPtraUnDabzJnbupxzSkMixba35jaovxw3w7N
  p1uCmC/nx6TM1ZrFzJRbLqzEUpyRaKjFXFScCABQk+0BZAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-728.messagelabs.com!1673939640!379472!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12277 invoked from network); 17 Jan 2023 07:14:00 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-18.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Jan 2023 07:14:00 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 5F7C27C
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:14:00 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 5347373
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:14:00 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 17 Jan 2023 07:13:58 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] gensio: upgrade 2.6.1 -> 2.6.2
Date: Tue, 17 Jan 2023 15:13:36 +0800
Message-ID: <1673939617-20032-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673939617-20032-1-git-send-email-wangmy@fujitsu.com>
References: <1673939617-20032-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:14:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100597

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gensio/{gensio_2.6.1.bb => gensio_2.6.2.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/gensio/{gensio_2.6.1.bb => gensio_2.6.2.bb} (93%)

diff --git a/meta-oe/recipes-connectivity/gensio/gensio_2.6.1.bb b/meta-oe/recipes-connectivity/gensio/gensio_2.6.2.bb
similarity index 93%
rename from meta-oe/recipes-connectivity/gensio/gensio_2.6.1.bb
rename to meta-oe/recipes-connectivity/gensio/gensio_2.6.2.bb
index 91450e2c7..4aca6fee5 100644
--- a/meta-oe/recipes-connectivity/gensio/gensio_2.6.1.bb
+++ b/meta-oe/recipes-connectivity/gensio/gensio_2.6.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a0fd36908af843bcee10cb6dfc47fa67 \
                     file://COPYING;md5=bae3019b4c6dc4138c217864bd04331f \
                     "
 
-SRCREV = "d512218c4fa5667d4fe15977d3f15f05591f1f1a"
+SRCREV = "c1e878f5710bafb17aca5ece7d9079e73a78c554"
 
 SRC_URI = "git://github.com/cminyard/gensio;protocol=https;branch=master"
 
-- 
2.25.1


