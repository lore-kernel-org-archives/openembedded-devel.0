Return-Path: <zangrc.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65788C433F5
	for <webhook@archiver.kernel.org>; Thu, 21 Oct 2021 09:10:20 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web12.6740.1634807419548824577
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Oct 2021 02:10:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ZGiN5BvO;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: zangrc.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1634807407; i=@fujitsu.com;
	bh=AKg6RbZgVq6nlfSgR+IUSmV33dqa2uORtrvYOY5h9JI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ZGiN5BvOwa+ryx0lR+9o5FKCYttGK0owOy/EV7wyNBva3DMRTK2CsIsgCG/xb8Z/6
	 HNQufUxmQwaVIZjAfkpllAR/oas9abTCunlQPDEyKDyCdS+/Iv1SMaegOCOVfKwT11
	 bVXG7SAovLEQna/CZAuwUyvJlwMADHkNksfS/NljTAsEomn7s4cUxsrqgjk1M4lBdD
	 16rKQ3vWm4i9HFRtWcT+gAaAD6ne3WHnqiHTVcF4F/JFoPQ4vLcPeImCFlj//ZwwpP
	 LaodZJoOtPSA9DyNBnOa8Rn6DGP15IPZSMmqWXYiVIUEcGp3ZNWrVYIt1L6z0LaBXs
	 X3ngHNIyejssg==
Received: from [100.113.1.182] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.symcld.net id 08/A3-08252-F6E21716;
 Thu, 21 Oct 2021 09:10:07 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCIsWRWlGSWpSXmKPExsViZ8MxSTdPrzD
  R4O1PZYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPatd2MBWs4K95d72FvYLzF0cXIySEk8IRR
  4s/00i5GLiD7ApNE99YjrBCJE4wS63+YgdhsAjoSHS+6WUBsEQF9iaWz9zCD2MICwRKNzzaA1
  bMIqErc6TgBZvMKuEls2H4JrEZCQEFiysP3zBBxQYmTM5+AzWEWkJA4+OIFVI2ixPadZ1gg7A
  qJ14dhetUkrp7bxDyBkW8WkvZZSNoXMDKtYrRMKspMzyjJTczM0TU0MNA1NDTWNdI1MjTTS6z
  STdRLLdVNTs0rKUoEyuollhfrFVfmJuek6OWllmxiBAZeSiHTjR2M315/0DvEKMnBpCTKq/Or
  IFGILyk/pTIjsTgjvqg0J7X4EKMMB4eSBO9O9cJEIcGi1PTUirTMHGAUwKQlOHiURHj9lYHSv
  MUFibnFmekQqVOMilLivO/kgRICIImM0jy4NljkXWKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwa
  gkzNulCzSFJzOvBG76K6DFTECLCywKQBaXJCKkpBqYMvY5TnvTtU381qztM3MEZ83SN21UrbT
  3nnzs7I5vd7e8u7pq1sm/QioF3AHLf8tPb7W7s/ppeWWV2uJPPX+Ct1zI+F335vP5s1ES/wrs
  Z/qvWivP9ZdxMZfh5Kezorxrp/YYTHgcusb4ZUFc8Yo5dX9+vRO+Ml9S5Mv6vRcYhOaG7Hrrp
  /aZeVPyxWvWWg5na/svFkus7n6UMj9dJsbmSom6pdKR6FibTQlB3Ea3zJjXqiwUZ1Xvtit1cx
  TJWRSeZT4tW0P3a8S5s++OLNRYcXB6n8Kat4ufZ31hff8rxFTG5f0uFcnVpZ6s8oLl3gybRes
  N1VrWnOIOX2bWsjFJgf3/Kzbzicq/N96fynH8nhJLcUaioRZzUXEiADPqjq03AwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-21.tower-232.messagelabs.com!1634807404!3177362!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24490 invoked from network); 21 Oct 2021 09:10:06 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-21.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 21 Oct 2021 09:10:06 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 413B1100458
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Oct 2021 10:10:04 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 34C96100451
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Oct 2021 10:10:04 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Thu, 21 Oct 2021 10:09:57 +0100
From: Zang Ruochen <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-configargparse : upgrade 1.5.2 ->
 1.5.3
Date: Fri, 22 Oct 2021 05:09:52 +0800
Message-ID: <1634850592-4618-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Oct 2021 09:10:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93513

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...-configargparse_1.5.2.bb => python3-configargparse_1.5.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-configargparse_1.5.2.bb => python3-configargparse_1.5.3.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-configargparse_1.5.2.bb b/meta-python/recipes-devtools/python/python3-configargparse_1.5.3.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-configargparse_1.5.2.bb
rename to meta-python/recipes-devtools/python/python3-configargparse_1.5.3.bb
index e4b679718..7d2137554 100644
--- a/meta-python/recipes-devtools/python/python3-configargparse_1.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-configargparse_1.5.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/bw2/ConfigArgParse"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=da746463714cc35999ed9a42339f2943"
 
-SRC_URI[sha256sum] = "c39540eb4843883d526beeed912dc80c92481b0c13c9787c91e614a624de3666"
+SRC_URI[sha256sum] = "1b0b3cbf664ab59dada57123c81eff3d9737e0d11d8cf79e3d6eb10823f1739f"
 
 PYPI_PACKAGE = "ConfigArgParse"
 
-- 
2.25.1


