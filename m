Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAD2CCCA47C
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 07:09:56 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web12.4536.1655968192051149531
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 00:09:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=S2HKm10B;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655968195; i=@fujitsu.com;
	bh=Z9Brc8pVxJLA2uYyT6oiVOyFkGoJ2rEfp8v3ysVY04E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=S2HKm10BGlEVMiQrkhyGOkKBVcP4jXI2d9hxEfyjoMjsW2HqJ1I/3TE22b7wLcHPp
	 oQUwhbHL0u+mnSnsJxc1O/DZi0UUy5+FTp5QWxuQx8yxUPKMXKTPsQVytBq9qI1Cp7
	 F+jLe81zGirnGQIFF8dO0VNCNOyg/vWY4akQqN5EP6IGBxxJctxgJw0VzzIhP9sfgd
	 hmACe1La9XdnNlHnhajh7RRcGuWiorcPCPQzV/uH7Xy0+8Aym2sSYVo1BxHg7vCuqj
	 ajvFxT6+vq32wKvlVfqaYpoo2PNXYi7ntOvy+cOJP8z+6qLFgHTwL/+F5I6k0A518+
	 ZCGWRwjPF6hRg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8ORqHtYcEu
  Swd25/BYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bx4z8ZC9q4K07+2sPcwNjB1cXIxSEk8IRR
  4mz7TUYI5y6TxPzGh1DOSUaJux/nsnQxcnKwCahLPL75mhHEFhHQl1g6ew8ziM0soCrRfXENO
  4gtLOAnMf3icjYQmwUovvrkFLB6XgF3if0X34HFJQQUJKY8fA/WyyngIXFk0wpWEFsIqObClU
  6oekGJkzOfsEDMl5A4+OIFM0SvksSJFR+ZIOwKideHL0HF1SSuntvEPIFRcBaS9llI2hcwMq1
  itEoqykzPKMlNzMzRNTQw0DU0NNU11TUyNtZLrNJN1Est1S1PLS7RNdRLLC/WSy0u1iuuzE3O
  SdHLSy3ZxAgM45Ri1pc7GKf3/dQ7xCjJwaQkyvuMd0uSEF9SfkplRmJxRnxRaU5q8SFGGQ4OJ
  QneS/xAOcGi1PTUirTMHGBMwaQlOHiURHjngKR5iwsSc4sz0yFSpxgVpcR5G9iAEgIgiYzSPL
  g2WBxfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTM6wsyniczrwRu+iugxUxAi58s3wCyuCQ
  RISXVwLRK/O27m5Myzlx0Ued/+m/mjduptfHX/nTq2+ouZAm5kb5T5P76czG/pp0/XKN/5tjy
  uR8m6SeGfVscFhrOXn6qMHZm8FNz1dL+TNHwZ2tuxSx4sNPD7+CppXFzHwRUx2mUV77gX/vRN
  fDZ8e9Zlw/w7+Et+9i6Y29Z9JXGCbHL9JfIVswVWLb7jIDkOru1bGd+lMYVi25f7rT/rEajsn
  P/ywCpT+UbwnZZaG+uSGs4fvDvmaPHNE9teBX1Pbwi92DqlXfXrDPSw+88PDo9fdtH6wvzZi3
  8tnvKTLlddt1acXarW7y07F9lM0/+vCPm/AvbiLvTMjZozXjE0X1K5pd++K1ZC+O2pZQxn2Q5
  7RWsrsRSnJFoqMVcVJwIALjxNn9eAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-12.tower-591.messagelabs.com!1655968194!40960!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 423 invoked from network); 23 Jun 2022 07:09:55 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-12.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Jun 2022 07:09:55 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id C89A7100195
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 08:09:54 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown10-183-43-178
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id BC9ED100190
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 08:09:54 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 23 Jun 2022 08:09:53 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pyscaffold: upgrade 4.2.2 -> 4.2.3
Date: Thu, 23 Jun 2022 15:09:36 +0800
Message-ID: <1655968177-15916-4-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655968177-15916-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1655968177-15916-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Jun 2022 07:09:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97582

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
==========
    Fix github action creating the demo-repo by, #644
    Update GitHub actions, #645
    Automatically create directory when saving config file, #648

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...{python3-pyscaffold_4.2.2.bb => python3-pyscaffold_4.2.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyscaffold_4.2.2.bb => python3-pyscaffold_4.2.3.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-pyscaffold_4.2.2.bb b/meta-python/recipes-devtools/python/python3-pyscaffold_4.2.3.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-pyscaffold_4.2.2.bb
rename to meta-python/recipes-devtools/python/python3-pyscaffold_4.2.3.bb
index 5b61c06ad..fe4f7e4eb 100644
--- a/meta-python/recipes-devtools/python/python3-pyscaffold_4.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyscaffold_4.2.3.bb
@@ -9,7 +9,7 @@ LICENSE = "0BSD & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=14a49c74a1d91829908ac756c07e6b91"
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "11be56d21a0047ea604e7bc4349e95592cdc734b0a405082a6a4f2a7028dc896"
+SRC_URI[sha256sum] = "58c7d9ce296cc26ac377061365c2f87cd8e28f46e4fb2c96ee48f9c64e33ac4a"
 
 inherit pypi python_setuptools_build_meta
 PYPI_PACKAGE = "PyScaffold"
-- 
2.25.1


