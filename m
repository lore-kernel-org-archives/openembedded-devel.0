Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB44CC76196
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 04:20:47 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.65301.1679545237690389731
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Mar 2023 21:20:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xcoIn0pu;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679545237; i=@fujitsu.com;
	bh=0u6ncpj7R1GGzJ/SiXbiJYCIDLFP3S8A0RGUMVWyLM8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=xcoIn0pukqWuLyyPpXPirMmAfQLUdB3IrHi7ik3eA/5bKm9DohtXt/gx39AXdpQES
	 jlLCb3Ur3moxeNd7+Z+rII6lEoGlWkn1wT5BA3Om8QQSQn2Ay4scX9quVL5feU/cAh
	 JhVYcSvBV3JhNwFqVD8w8VpwlfqzOiN4Wllrq+GCrK1ZPb/ajONcrbxj/vhSLBrvIe
	 Qmu7ELCnkWXAChISzxJhY6m8XeMjZX1xV6rjkgxtZLDOiUIaE1gC7G8ux/UZoWANni
	 UNlo3lvGfp5lPVQCMM0BGNxEl6Msb6IMzgjs944FmeMuOwclmou2TVW+DlAVJ0jAWY
	 FeAPKlDCcJoGA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpDvlsnS
  KwYxjZhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bir4EF3ZwVE1ccZ21g3MbRxcjFISTwkFHi
  8vmPrBDOFSaJR/N/MUE4exglls/+wNLFyMnBJiAlceP+fzYQW0RAX2Lp7D3MIDazgIrEi9897
  CC2sICfxIzHj5hAbBYBVYmWbTdZQWxeASeJP8d6wOZICChITHn4HqyXU8BZYtnX7WA1QkA1B2
  7sYYKoF5Q4OfMJC8R8CYmDL14wQ/QqSsy+3Aw1p0KicfohJghbTeLquU3MExgFZyFpn4WkfQE
  j0ypGs+LUorLUIl1TvaSizPSMktzEzBy9xCrdRL3UUt28/KKSDF1DvcTyYr3U4mK94src5JwU
  vbzUkk2MwOBNKU5m2MHY2fdX7xCjJAeTkiivRKh0ihBfUn5KZUZicUZ8UWlOavEhRhkODiUJX
  p2LQDnBotT01Iq0zBxgJMGkJTh4lER45x4ESvMWFyTmFmemQ6ROMSpKifMGXQJKCIAkMkrz4N
  pg0XuJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvjPNAU3gy80rgpr8CWswEtDhuhgTI4pJ
  EhJRUA1OZV+m6IMmvX21DY9a4i0z3an51cqIPj0a578ctuYdmrTvC0frPiEPtnrziJY+duS/U
  fR9M69LSvee2f/L+WW49Hdt6SuUCi11VrdInNr7k/sv3fnPZtNlSesKzKiJKPgcu3PXmhd2eG
  7fd5yhffl2+NaKgbUuPu4zaQu3SH3/ldQQKCrcono+YIf1jp+G0uxazM5d0PIjJd9It6V/7Pe
  n5RE7NqQxdx1far4qR8NjA8nhp8oKge+2u02VXt9224dre67j9H9cZgZ2ffOIbFATvZvHE6aW
  9U3wherxGdm5TS0brJF0/Br1XhclO8zvMFc7sdi50cHvw5q3iYv65RqyKR4sKL5/znVr54Gky
  jxJLcUaioRZzUXEiAICZ829ZAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-732.messagelabs.com!1679545236!169350!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27322 invoked from network); 23 Mar 2023 04:20:36 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-12.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Mar 2023 04:20:36 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 47F781B4
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 04:20:36 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 3D0691B0
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 04:20:36 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 23 Mar 2023 04:20:34 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-eth-typing: upgrade 3.2.0 -> 3.3.0
Date: Thu, 23 Mar 2023 12:20:14 +0800
Message-ID: <1679545214-20015-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1679545214-20015-1-git-send-email-wangmy@fujitsu.com>
References: <1679545214-20015-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 04:20:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101650

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-eth-typing_3.2.0.bb => python3-eth-typing_3.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eth-typing_3.2.0.bb => python3-eth-typing_3.3.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-typing_3.2.0.bb b/meta-python/recipes-devtools/python/python3-eth-typing_3.3.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-eth-typing_3.2.0.bb
rename to meta-python/recipes-devtools/python/python3-eth-typing_3.3.0.bb
index b810341d2..ad339a22c 100644
--- a/meta-python/recipes-devtools/python/python3-eth-typing_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-typing_3.3.0.bb
@@ -4,6 +4,6 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bf9691ead96f1163622689e47ce3f366"
 
-SRC_URI[sha256sum] = "177e2070da9bf557fe0fd46ee467a7be2d0b6476aa4dc18680603e7da1fc5690"
+SRC_URI[sha256sum] = "e9535e9d524d4c7a0cbd3d9832093cc5001a3e31869e72645674d24c6376d196"
 
 inherit pypi setuptools3
-- 
2.34.1


