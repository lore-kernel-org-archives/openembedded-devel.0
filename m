Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C375C5479D
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 05:25:38 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.16720.1673414730116371759
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Jan 2023 21:25:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=UGfjWJAK;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673414728; i=@fujitsu.com;
	bh=oencR94cFprwcAxaPreXohGWK+s2H8eb5y6k0YReTAw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=UGfjWJAKjV2U2Y/spR5pD/IeN0tJ1Bdx+EBre4dVM44cMgTWq/V2ZrB/O2HhWC1bl
	 yznmzfQdA1NRz+UHG2S2zysTluRKGL7a3zB2Fwh/E5Cj7slVBJpceuI5yRNXRlG7Fm
	 JSY0soB5HsI1g6bPkBdouO83jJAc4XlNaGs2UqvxiVXrXSk7IrGuDyKXQoq8Nyj/7N
	 MSxmbnS1LUlyCNL8lIOKwwGFQXeNR6NZgLAkJVWug9W8wELLBuXHbl/tAAs4QH3mEn
	 PZv6PuuIjpYYHCKsR+qL6r5u5JweFKkcxXdu0JVKTamQtWh/PvX2nR3ZmSzIDp8Oij
	 njGj48CtmjZvQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8ORpOvusS/
  ZYOo0CYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePMxyWsBZc5K2ZOamFsYPzM0cXIySEk8JBR
  4uWG2i5GLiD7CpPEoxO/2CCcvYwSl1//ZwKpYhOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jAT6LvRStYnEVAVaLzyz0WEJtXwEli5dZWsDkSAgoSUx6+B6vhFHCWaJzwlRXiCieJVd
  PXMkHUC0qcnPmEBWK+hMTBFy+YIXoVJWZfbmaBsCslWj/8grLVJK6e28Q8gVFwFpL2WUjaFzA
  yrWI0L04tKkst0jU01UsqykzPKMlNzMzRS6zSTdRLLdXNyy8qydA11EssL9ZLLS7WK67MTc5J
  0ctLLdnECAzflOIE7h2Mj5b90TvEKMnBpCTKmyexL1mILyk/pTIjsTgjvqg0J7X4EKMMB4eSB
  K+KK1BOsCg1PbUiLTMHGEswaQkOHiUR3lpHoDRvcUFibnFmOkTqFKOilDivsztQQgAkkVGaB9
  cGi99LjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5mZ2BpvBk5pXATX8FtJgJaPHhrr0gi0s
  SEVJSDUwG66Ya6wds+bn06eoPQdtcPkpOTt6e8+z4s99NjplS920srGQNUxdMMuayv5q9a37X
  3km1Wbt3SC1Rurr4ZYfVtZ7VVyp+PH635vb+OLZVPx5kxh6a2sDHtML0TongltQtTA6i+uWPD
  u/OffW7oUS/0NIgPzE4bM7HCbUu29f+ZJr9q7Li2dmE9ZsdP/JIrHu5eGrzosJ47YBDyz9xar
  2NawsIXydfV3H/a8PDE6dlsnutd/sfS+1qrd5pa5m2YEqSxtGs8n83rf96zPPp+Vp3h+Ni2NT
  wuH+uU3Z+C/QV8U4M2x7k5zm34YNPvMWzx7IPrx1m1kn1Ujx1OM7Tuf2X59XOt/+fPE73XfbK
  ZW+AEktxRqKhFnNRcSIAAS3YzVoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-728.messagelabs.com!1673414727!498385!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2578 invoked from network); 11 Jan 2023 05:25:27 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-10.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 11 Jan 2023 05:25:27 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id CE5B81AF
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:25:26 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id C2D6D7B
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:25:26 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 11 Jan 2023 05:25:25 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-cantools: upgrade 38.0.0 -> 38.0.1
Date: Wed, 11 Jan 2023 13:25:11 +0800
Message-ID: <1673414714-13796-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673414714-13796-1-git-send-email-wangmy@fujitsu.com>
References: <1673414714-13796-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:25:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100529

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Changed relative links to absolute links

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-cantools_38.0.0.bb => python3-cantools_38.0.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_38.0.0.bb => python3-cantools_38.0.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_38.0.0.bb b/meta-python/recipes-devtools/python/python3-cantools_38.0.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-cantools_38.0.0.bb
rename to meta-python/recipes-devtools/python/python3-cantools_38.0.1.bb
index 96e193d4f..c11606351 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_38.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_38.0.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "b7d5465aba357ce4c103a7d38c9e01a6f12d8265090b4147b3cc1fa4c3adb993"
+SRC_URI[sha256sum] = "be391520a43c8041ba99839a00a0a61b7afa929387def6c6348a9626b99f24d7"
 
 PYPI_PACKAGE = "cantools"
 
-- 
2.25.1


