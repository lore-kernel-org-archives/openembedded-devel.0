Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B9CDC433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 00:05:14 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.5298.1644969912493666096
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Feb 2022 16:05:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=A3ToL/p0;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644969910; i=@fujitsu.com;
	bh=MAeMDk6DVZJt6/RV6jWB7WCYObMPGKoqpMskZKXBbLk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=A3ToL/p0Ijo6F0fiPJcVdbl02OPMC7lWhgpI3pV33fYV2EHkBKKHO+IFegRdAy/Vt
	 Oj+0zoRFEbxgjjp2aEzWsm6oxX+XwlMgHaYzlpngqFWEbKEONnMLeSYn+tdqI2y4/E
	 dYCQn/pmfa+nzY+traQAQSws0U53quDgrfFhCJ96m/WyPINM8K2OzVTnQY/hRngEN/
	 0eZpR4f4yaEl32z5M4DKuElUnOW7WVP0skGR1hQWR4D8XvC30sfyRyJP2cpAGm1Q4b
	 Txtrt4lEsIGk7HyRptLvNpYD6or5SEvstQ1FQVGJ5A8//MqTY531QLRgb3IXVptRHe
	 TvCm0Mp43b8UA==
Received: from [100.115.69.48] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 32/0E-30582-6BF3C026; Wed, 16 Feb 2022 00:05:10 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKIsWRWlGSWpSXmKPExsViZ8MRorvVnif
  J4O1RK4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePSmh1MBTfYKw6+2cLWwPifrYuRi0NIYCaT
  xMfvpxkhnBOMEhtWnGPuYuTkYBNQk5h+6wYriC0ioC+xdPYesDizgIrEi9897CC2sICDxM9NX
  8BsFgFViX33P7CA2LwCjhILLi1jA7ElBBQkpjx8D9bLKeAkcf7ED7B6IaCalVsXMEHUC0qcnP
  mEBWK+hMTBFy+YIXoVJWZfbmaBsCskZs1qY5rAyD8LScssJC0LGJlWMdomFWWmZ5TkJmbm6Bo
  aGOgaGprqmpnoGpvoJVbpJuqlluomp+aVFCUCZfUSy4v1UouL9Yorc5NzUvTyUks2MQJDM6XY
  QWkH49m+n3qHGCU5mJREedtucCcJ8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuDlt+FJEhIsSk1Pr
  UjLzAHGCUxagoNHSYT3nSVQmre4IDG3ODMdInWKUVFKnNfPDighAJLIKM2Da4PF5iVGWSlhXk
  YGBgYhnoLUotzMElT5V4ziHIxKwrxptkBTeDLzSuCmvwJazAS0WLGRC2RxSSJCSqqBKdtJfus
  md1OF7EnvpVWtSvoftzdLsvMLz0sru3uj6/qqpC+xXqp6ruVm3eb6fJPz5QKnrXsyu22O5ClT
  ZrPSmOdhc7Vf/Pnet/hsfZX0bLlHHRJTtm+bvNuNX2xmdVpzVaKU5gQv/8YvLHILJy7nq2O/q
  JBrzpYV/3X7MlWZ4gbvhQIG3yMNL8bEsZperX/0/lyjRX/ObrEbXl9u2+34pPis7unRw3ltHI
  k+fA1bimQPa31mKfdgkIw0WtK0szZN/lCO+Nx49/bL+1nPPt93Lont4IJPko/TVT2W3ZphnD8
  n+LiS9t1VuVpNKddPNfLd6eqK2HAoNGqGqu7cm4GNq9sitvNeWVff47H10Q8lluKMREMt5qLi
  RACrBavNSAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-545.messagelabs.com!1644969909!26914!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17398 invoked from network); 16 Feb 2022 00:05:09 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-11.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 Feb 2022 00:05:09 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 21G053qX019255
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Feb 2022 00:05:09 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 16 Feb 2022 00:05:04 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libgee: upgrade 0.20.4 -> 0.20.5
Date: Wed, 16 Feb 2022 08:04:49 +0800
Message-ID: <1644969891-7677-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1644969891-7677-1-git-send-email-wangmy@fujitsu.com>
References: <1644969891-7677-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Feb 2022 00:05:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95323

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libgee/{libgee_0.20.4.bb => libgee_0.20.5.bb}              | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/libgee/{libgee_0.20.4.bb => libgee_0.20.5.bb} (77%)

diff --git a/meta-oe/recipes-devtools/libgee/libgee_0.20.4.bb b/meta-oe/recipes-devtools/libgee/libgee_0.20.5.bb
similarity index 77%
rename from meta-oe/recipes-devtools/libgee/libgee_0.20.4.bb
rename to meta-oe/recipes-devtools/libgee/libgee_0.20.5.bb
index ce8aad50c5..c0d7ea3487 100644
--- a/meta-oe/recipes-devtools/libgee/libgee_0.20.4.bb
+++ b/meta-oe/recipes-devtools/libgee/libgee_0.20.5.bb
@@ -18,5 +18,4 @@ do_configure:prepend() {
     done
 }
 
-SRC_URI[archive.md5sum] = "4d7d6f1f8054f1b3466c752ac2e50946"
-SRC_URI[archive.sha256sum] = "524c1bf390f9cdda4fbd9a47b269980dc64ab5280f0801b53bc69d782c72de0e"
+SRC_URI[archive.sha256sum] = "31863a8957d5a727f9067495cabf0a0889fa5d3d44626e54094331188d5c1518"
-- 
2.25.1


