Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1364EC19F2D
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 05:48:03 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web12.1617.1659592073743300550
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Aug 2022 22:47:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=UdqLvzaC;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1659592074; i=@fujitsu.com;
	bh=dpVKiB6V9Wst1zLN2ikEchWAu+NzY9QcrOr6PlkPsJg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=UdqLvzaC8W5JOIzpG40UiT4sLyMnKYquKzYahpkg+7aZbCN+SRaQXZlTqtUL1dpqy
	 yONmJkBJZo1mcdNyMBm4S9UVx4bvbPOG9tSXowtzNHX1y1qD8EVhsiHLsFdtIdMgJr
	 1oE0FLwkt7apvM2wjQynWAId9l8kNdjcusDJ5sS+I3Urj3ExNQqes7cVyB1qgDf9W6
	 Qqy49npqiM+7Lq1o22qCW3YNU34pwRopKtEUEnoHmoAkU3RjZLnm33YgI107SsBfAb
	 1lDHJLf+bxrHC6bZnSZBvJwXrdUx0cq/KK/+cCVNndB8Lc1esAnJPcGUkmBMJwMNVI
	 MeL2tTCGSQF2w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8MxSbcz9nW
  SwcUVKhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8buqfdYCvo5K97MXc3WwLiNo4uRi0NI4Amj
  xOLbb1ghnOtMEvef7ARyOIGcE4wSSxf4g9hsAuoSj2++ZgSxRQT0JZbO3sMMYjMLqEp0X1zDD
  mILCwRK9L2bwwZiswioSMw9PRcszivgJvGgr5kJxJYQUJCY8vA9WC+ngLtE37Q5LBC73CSOdD
  UxQtQLSpyc+YQFYr6ExMEXL5ghepUkTqz4CDWnQuL14UtQcTWJq+c2MU9gFJyFpH0WkvYFjEy
  rGK2TijLTM0pyEzNzdA0NDHQNDU11jS10jQyN9BKrdBP1Ukt1y1OLS3SB3PJivdTiYr3iytzk
  nBS9vNSSTYzAME4pVruyg3HPqp96hxglOZiURHnbo14nCfEl5adUZiQWZ8QXleakFh9ilOHgU
  JLgLYgGygkWpaanVqRl5gBjCiYtwcGjJML7IAIozVtckJhbnJkOkTrFqMsx82vbAWYhlrz8vF
  Qpcd7IGKAiAZCijNI8uBGw+L7EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZj3EsiVPJl5JXC
  bXgEdwQR0hA7XC5AjShIRUlINTFyaajM785k1d5t3Znxs7OmKtBZN0nNTD/JXPFp59+8HvfJr
  36YKzlKUsFkQvlMlrz7mpaGOooGfUH6p+ZSpZ1/baEadiLfuMdZ9rhAxTcb4zBRBky83J/1v/
  edafudda9Je1wlr1yxw476YFZqseYv71xTRvA1fu7IfLzPW/nJoXW9blUbUzQu8K8X+mYe7KJ
  9wmZ1oyf7C03Tvd42lX+bdnRWsdLz6u3vT1S3FflKnLLlXB7vFRQrMPDFljdaHPwlTr16eYyD
  kdTLAweBBAI/TxzdTpX+Z6XLKKVlnv/bYyG76d2LfjLrHOwXfbXuvn/XEbuoLmbJCBtVwwf+v
  Hh0R4pH7e3TnxK1rcldlKbEUZyQaajEXFScCALbmD3NqAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-20.tower-571.messagelabs.com!1659592073!185329!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6924 invoked from network); 4 Aug 2022 05:47:53 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-20.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 4 Aug 2022 05:47:53 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 4DA401000CC
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  4 Aug 2022 06:47:53 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 412FD1000C1
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  4 Aug 2022 06:47:53 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 4 Aug 2022 06:47:51 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-regex: upgrade 2022.7.24 ->
 2022.7.25
Date: Thu, 4 Aug 2022 13:48:52 +0800
Message-ID: <1659592133-4137-5-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1659592133-4137-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1659592133-4137-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Aug 2022 05:48:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98128

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-regex_2022.7.24.bb => python3-regex_2022.7.25.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2022.7.24.bb => python3-regex_2022.7.25.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2022.7.24.bb b/meta-python/recipes-devtools/python/python3-regex_2022.7.25.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-regex_2022.7.24.bb
rename to meta-python/recipes-devtools/python/python3-regex_2022.7.25.bb
index 897aa76c35..437563b1c0 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2022.7.24.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2022.7.25.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "fa8a4bc81b15f49c57ede3fd636786c6619179661acf2430fcc387d75bf28d33"
+SRC_URI[sha256sum] = "bd0883e86964cd61360ffc36dbebbc49b928e92a306f886eab02c11dfde5b7aa"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.25.1


