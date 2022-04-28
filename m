Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3382C433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 07:04:04 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web09.6941.1651129434886125470
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 00:03:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=MKIEq2ey;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1651129433; i=@fujitsu.com;
	bh=jlDx0qHqX16spFMxqrnj0obXej/+8oANqUBa8IXETRQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=MKIEq2eyedlE4R0yMPUMlp+jTw6Sdmwoa1frFsIK87QJyW2E6xR0wcvHLxEggPoTu
	 VQUjPDwGflW0g8uCqlIJ4koe7fWHB4oOVZLNJswumQGVmffK6XKZdGU6ql/D5S56ma
	 E830GUgovrTlC0ThLwfCceGSc/FyfM90/Y2Cu7waPEhTzF11OWoTlTr/+Cv72S3tir
	 uGiyFNdxxo4u+SoaqZGDkLV7hiR9YmmTgj/M3kBqydTl+BOwa0B7gXQBkEztPCaaIx
	 NJLy4YWU5KHRmVFexVL4UCUV11gSB7A2tYVzMZJrBNERYvPDwPSiMX+Q22nn1YmcGR
	 fqDwyMnurTYDQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8MxRdfSJiv
  J4GQHo8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnHuuHjBGs6KQ/N/sTYwXuXoYuTkEBKYzSRx
  +j5LFyMXkH2SUeLx/3esIAk2AXWJxzdfM4LYIgL6Ektn72EGsZkFVCW6L65hB7GFBfwlHv+6x
  tbFyMHBAhR/8zECJMwr4CZxa84KsDESAgoSUx6+B2vlFHCXaLkJERcCqllx+T4bRL2gxMmZT1
  ggxktIHHzxghmiV0nixIqPTBB2hcTrw5eYJzDyz0LSMgtJywJGplWM1klFmekZJbmJmTm6hgY
  GuoaGprrGFrpGhkZ6iVW6iXqppbrlqcUlukBuebFeanGxXnFlbnJOil5easkmRmBAphSrXdnB
  uGfVT71DjJIcTEqivFamWUlCfEn5KZUZicUZ8UWlOanFhxhlODiUJHgVrIFygkWp6akVaZk5w
  OiASUtw8CiJ8MoYA6V5iwsSc4sz0yFSpxgVpcR5XUH6BEASGaV5cG2wiLzEKCslzMvIwMAgxF
  OQWpSbWYIq/4pRnINRSZjXDGQKT2ZeCdz0V0CLmYAWryzKBFlckoiQkmpgmv21cm7pww/tzxR
  0y4yM335VaomQjZ0X+WI6y/f5l5KCz9yqu9m5KPtxoGE3d8yUjxZbVt74niyw0Hx9x8XM2mtp
  dktVdJlyVjDdNn3jGiry+EbijvgNEmFlfxwndrZJP2c76iXed/rxqpydGnc+qnJ/1Uv4wN0o6
  CPzrWcBp96Hj6+SDarOJ0wJ3iMkc+MCr3qC+Jm1V5dOyCj2z2tZl7sk+smtAz53IuLvPZRhMV
  tZfHl92z7H9Jz/7PfTjs4PP1Qp82cy+9dtR9UjXldNf57DULA8coP4glVvp364Hnvn2dYNS+5
  +v/Sq7Vbx/NX+DJ6Xzkwtffabx+2uQVOW3c+e/OQzrz6dWrPTr3vBFFElluKMREMt5qLiRAB5
  y6EQQwMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-2.tower-548.messagelabs.com!1651129400!81627!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2961 invoked from network); 28 Apr 2022 07:03:21 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-2.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Apr 2022 07:03:21 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23S73FDN021997
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 08:03:20 +0100
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 28 Apr 2022 08:03:15 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-bitstruct: upgrade 8.14.0 ->
 8.14.1
Date: Thu, 28 Apr 2022 15:03:32 +0800
Message-ID: <1651129416-8432-2-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651129416-8432-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1651129416-8432-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Apr 2022 07:04:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96830

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...{python3-bitstruct_8.14.0.bb => python3-bitstruct_8.14.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitstruct_8.14.0.bb => python3-bitstruct_8.14.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-bitstruct_8.14.0.bb b/meta-python/recipes-devtools/python/python3-bitstruct_8.14.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-bitstruct_8.14.0.bb
rename to meta-python/recipes-devtools/python/python3-bitstruct_8.14.1.bb
index f0aa321231..77ef98570f 100644
--- a/meta-python/recipes-devtools/python/python3-bitstruct_8.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bitstruct_8.14.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/bitstruct"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "230c191c75f1526f6922cdb08eab6f52c055452e2239bf5638f02e9cfd382c91"
+SRC_URI[sha256sum] = "d38131bd447b6af5b8f464c4878797c87a5d9da1c95b9357e071c424fde5f055"
 
 PYPI_PACKAGE = "bitstruct"
 
-- 
2.25.1


