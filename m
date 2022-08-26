Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F319AECAAA3
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 02:52:22 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web09.32894.1661482337622092489
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 19:52:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ODzTOYe7;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661482334; i=@fujitsu.com;
	bh=clrF20StCGPWn2HPneCqjJlG5NdYVjzYOm9aonc0fkM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ODzTOYe7JbenWsAE6hokiNQsvCaOcZX80+ZyMEku3yy/xl+MBXAg6S2hGCWuwchly
	 HLBw2iowN4o9lxlIGNDGopyXI5HqMHYMPw94R7r4j1wLngyv/vb9ECz4mpe19gRkWv
	 zEZvUdns65Oobb73BIyFrVMX9tC9qbYyvQaqBxDI2GkMAC8N3XK2dQyuCcPmHs1hSs
	 6rsdR08wFwPJ2T3LsoaWZGGIJ6LjJP6uQ78z7822il89VWQV5VGxFPNmal93mBfs5s
	 7X+zo3kJO7L9BSQK3m6+SXc958GF60dX9OAUkXJaR+zPNh16V3TXcUPjNA7Vya3u1s
	 u2L2wcI4nGIwg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8OxWTfWlCP
  ZYO9pc4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePymm7mgv8cFRM/rWVtYFzD0cXIxSEk8JBR
  4u7ZWSwQzhUmiY5P79ggnIOMEo/edQNlODnYBHQlXvxYDGaLCOhLLJ29hxnEFhbwk7j85j8bi
  M0ioCqxctpqJhCbV8BDYtnO44wgtoSAgsSUh++ZIeKCEidnPgGbwywgIXHwxQugOAdQjaLE7O
  nyEGalxI3HqRCdahJXz21insDINwtJ8ywkzQsYmVYx2iQVZaZnlOQmZuboGhoY6BoamupaWgI
  pS73EKt1EvdRS3bz8opIMXUO9xPJivdTiYr3iytzknBS9vNSSTYzA8EspTi7fwbh93y+9Q4yS
  HExKorz6z9iThfiS8lMqMxKLM+KLSnNSiw8xynBwKEnwqplwJAsJFqWmp1akZeYAYwEmLcHBo
  yTCKy0KlOYtLkjMLc5Mh0idYtTlmPm17QCzEEtefl6qlDjvfyOgIgGQoozSPLgRsLi8xCgrJc
  zLyMDAIMRTkFqUm1mCKv+KUZyDUUmYN9UQaApPZl4J3KZXQEcwAR0htYEd5IiSRISUVANT3I7
  w1L0Fk7i+LW+M+PlRvGOL7RvHrbfjn6i0OZ55PVEw0tpDQzdiatGFG9NeLzw4MWppzko+Ce3v
  5lNMVk/4slO287+GrcHleOG8ZHePI/nnZ+gvuNdxuEP6bJTl3thr8ms3mQbYMwWG8Tf9XXA6+
  vAZjrT5OjUxr3OVxf7lzeiI/9N4tqj6yOwZSgkXTaITRNyZlwbX+GyrSbxsOudO6Zp9U3clei
  +7+TTfxXpirVPnPbVos3c+9gfW3kt8PeHonZ8nEqv/VRoE5U9x1bxYoyZw6Yur8cdLn81vn3t
  cECR1ZO7ROboLa5498Woq1riYP50nS0fotWrqkW+Lo9gaer4Hsb8N3c7FPekJV88TJZbijERD
  Leai4kQADJG+5EYDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-745.messagelabs.com!1661482333!164336!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4996 invoked from network); 26 Aug 2022 02:52:13 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-11.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 26 Aug 2022 02:52:13 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 52A4C142
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Aug 2022 03:52:13 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 36D3E73
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Aug 2022 03:52:13 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 26 Aug 2022 03:52:11 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-cantools: upgrade 37.1.0 -> 37.1.2
Date: Fri, 26 Aug 2022 10:51:59 +0800
Message-ID: <1661482319-13298-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Aug 2022 02:52:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98454

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-cantools_37.1.0.bb => python3-cantools_37.1.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_37.1.0.bb => python3-cantools_37.1.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_37.1.0.bb b/meta-python/recipes-devtools/python/python3-cantools_37.1.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-cantools_37.1.0.bb
rename to meta-python/recipes-devtools/python/python3-cantools_37.1.2.bb
index 1af1310aba..ec437eeceb 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_37.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_37.1.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "9f2449e94a7698bd44bb50d9b464788053a0bf070faa09a132535c3aa07e7e6a"
+SRC_URI[sha256sum] = "0d84b879a18d869d182023cdebae9318095a8959ceee6309de59fd3c399dbfef"
 
 PYPI_PACKAGE = "cantools"
 
-- 
2.25.1


