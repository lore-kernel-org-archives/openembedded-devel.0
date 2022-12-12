Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85FA0C4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:37:48 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.37722.1670830667091159703
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Dec 2022 23:37:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=grLJLJ+S;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670830665; i=@fujitsu.com;
	bh=dH88yC7ZxUnXInlVaaXTbKSwUgPanJKJHdK1wcLyDLo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=grLJLJ+SqsItcdlNlbr1DKVmNGWJdq4ahaQvm2/45EqATD/sHV7lkaUMcgZk45gC2
	 p365Ms+9JiKqpOIb+Nhx6dlRhmpVKFOrJ3Yya8Q3r4yzrv6mExTNVtjNHUUVdCjhlO
	 z0of7MedMKgG9IjrnIVxWDoWKbsZ1yT2NfVTC07Tao8x9jg0pLfiLpXUS6o4M7A3ST
	 2rSBR3pSUb4yOPA9QsrtlAg0NVVZ+qgj82qn/rVu97aGSZUmENUE/+TX7gLkO1hmWf
	 aT22Q2mRfx3RDcRRmGXmNBTFBONgpzEYoq1UUDQQmCO3bOyZ5p7bmG+Qos4pwslVCa
	 oCf1dr9nRbUBQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8OxWdfj1rR
  kg6lL1CwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oz2jn6WgqccFbP6v7I3MPZwdDFycQgJPGCU
  2PvvKyOEc5lJouf3P/YuRk4gZw+jxIHvsSA2m4CUxI37/9lAbBEBfYmls/cwg9jMAioSL373g
  NULC3hJXD4zDcxmEVCVaJu7F6yGV8BRoufUcRYQW0JAQWLKw/dQcUGJkzOfsEDMkZA4+OIFM0
  SNosTsy81Q9RUSs2a1MUHYahJXz21insDIPwtJ+ywk7QsYmVYxmhWnFpWlFuma6CUVZaZnlOQ
  mZuboJVbpJuqllurm5ReVZOga6iWWF+ulFhfrFVfmJuek6OWllmxiBAZjSnGSzQ7Gv0v/6B1i
  lORgUhLlrbwyLVmILyk/pTIjsTgjvqg0J7X4EKMMB4eSBO+Ga0A5waLU9NSKtMwcYGTApCU4e
  JREeN1AWnmLCxJzizPTIVKnGHU5Zn5tO8AsxJKXn5cqJc7LfgOoSACkKKM0D24ELEovMcpKCf
  MyMjAwCPEUpBblZpagyr9iFOdgVBLmtbkONIUnM68EbtMroCOYgI6IejkV5IiSRISUVANT0e0
  vNxzKtv26yxBq8DVx1VGelmP+YR5TK2rfluuZCcm+3Tj1iKRl07Hdpz6tEt5z+PO9o2LnP8/S
  /+86fd37o09WhT21d3b9LcYi9/rKFk2x7+r1Z1+1lhofts9elWj8YXrTAy6v7Jcte0QevX8hV
  DAhaoHdiliB7sVf3q1MfpX42aNNv6ahraG8htEuT1diytxT+1P0G9ZGMOiHszhl+2z53Ln+/c
  5DNbxK35YavvOOv+6zPNZy15at/+SP+x2p3WQ9ad4758bGVcc+vM9IL7nGlrS9ScPw56V37Gk
  NnoL/7mbMstVJXyer+HD+t/qoR6eerfCQfynerPJi8Wp5sfuMbi6T/2t8mP1yT9ArMyWW4oxE
  Qy3mouJEAIXcQWdNAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-732.messagelabs.com!1670830664!222843!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6153 invoked from network); 12 Dec 2022 07:37:44 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-7.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Dec 2022 07:37:44 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 188FA7B
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:37:44 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 0C5B773
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:37:44 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 12 Dec 2022 07:37:42 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-web3: upgrade 5.31.2 -> 5.31.3
Date: Mon, 12 Dec 2022 15:37:11 +0800
Message-ID: <1670830635-3098-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:37:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100045

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-web3_5.31.2.bb => python3-web3_5.31.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-web3_5.31.2.bb => python3-web3_5.31.3.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_5.31.2.bb b/meta-python/recipes-devtools/python/python3-web3_5.31.3.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-web3_5.31.2.bb
rename to meta-python/recipes-devtools/python/python3-web3_5.31.3.bb
index 486cf08b8..5c70febea 100644
--- a/meta-python/recipes-devtools/python/python3-web3_5.31.2.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_5.31.3.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dc2732bdc5e50382737979791cbb3b7"
 
-SRC_URI[sha256sum] = "fc27ef2acacb9375e1d486ce7b0f4188c5e543d65f7bb8692f8b969f408bfa9b"
+SRC_URI[sha256sum] = "4b2d420647c81856e3cf398996cd3cc80c719dc3a10881884c5c3b1467e4f850"
 
 inherit pypi setuptools3
 
-- 
2.25.1


