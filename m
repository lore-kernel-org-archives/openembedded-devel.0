Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70305CCA47B
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 08:49:19 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.26293.1657529348635701810
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jul 2022 01:49:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=y/GmuLTP;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657529346; i=@fujitsu.com;
	bh=M9cRg3aMOA4IMygqEiZ0X8A2Xy7CYsgQp8xRHZoY/ko=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=y/GmuLTP0cZheTQ2YmGkKU/dBNn28psF5eJUuvXw14SBrDVzRi87kKsaOdD7vrttB
	 TNB31pNcQuO8kEhPToqWxqKno1JT2a3/0yRkg63mOtlkI5bb2ZIaLC/XJ8TtGFnt7E
	 UDwSWPQTXgZReBq9UAEPeyNlqBinuoJccqaL53OQWWeNmZfDuS39nS+ZlVvDsrKJeK
	 fDPeT3g6vRC1lTdadrIca9qWlW90QdvKotcTP4Fc3wPPI0+nAKTpNL1wrgkdDuZbqS
	 X8W2ZQR+VuxYH+5XBci/iKz3WI5q1jme0vsFf/3wur14UJt9n8wcyM2ws4yV/z1xJJ
	 S/3m5Gr76HmCQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRWlGSWpSXmKPExsViZ8ORqMv05HS
  Swc5PYhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aUHbUF2zkrbi1oYW5gvMXRxcjJISTwhFFi
  zuzaLkYuIPs6k8Sk09PYIBJ7GCUO7AsCsdkE1CSm37rBCmKLCOhLLJ29hxnEZhZQkXjxu4e9i
  5GDQ1jATeJzjyZImEVAVWLBrslgJbwCThL3Ht5iAbElBBQkpjx8DxUXlDg58wkLxBgJiYMvXj
  BD1ChKzL7cDFVfITFjxjY2CFtN4uq5TcwTGPlnIWmfhaR9ASPTKkarpKLM9IyS3MTMHF1DAwN
  dQ0NTXSBpZKyXWKWbqJdaqlueWlyia6iXWF6sl1pcrFdcmZuck6KXl1qyiREYjinFDNU7GP/3
  /tQ7xCjJwaQkyit88nSSEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQneL4+AcoJFqempFWmZOcDYg
  ElLcPAoifBePQGU5i0uSMwtzkyHSJ1i1OWY+bXtALMQS15+XqqUOO8RkBkCIEUZpXlwI2Bxeo
  lRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMK/zY6ApPJl5JXCbXgEdwQR0RFzKCZAjShIRUlI
  NTIuOfbf2MaziDY2YfntFaBVvc3rJKXONcOPI3XZBmqx7fnrfa77mvCrHjO+d/N6qf/s+3TeN
  dHhTabLsjLRS0Mpg/4K3EjfXmVzP+X8whPGh3vq1Jg+OmG2OYWCbWByTJXLSIOf7zEPBfJNt5
  Mu+3P1m57X2bXWOxukPnXZvJrxpEO3xe3er5fr7kIdSv2aF6/y/FD+3izPOZK2JTdLe81d8/v
  f4ObAK7335RlxlCafth01ffMRn7T/3cvL9vKXpDDNPRmYufPji/ey1beUOt847pdoV3rvtJvU
  j6vESpWWmKtOZ+7P7rKS0Yrkv3ru4S2ZNdd+t9tZTOa2zC2Kz/og3xOrqvRTpNraVXHH8vBJL
  cUaioRZzUXEiAA7hUZtOAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-591.messagelabs.com!1657529346!7587!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18380 invoked from network); 11 Jul 2022 08:49:06 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-22.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 11 Jul 2022 08:49:06 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id F129B100198
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jul 2022 09:49:05 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id E3601100195
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jul 2022 09:49:05 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 11 Jul 2022 09:49:04 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libencode-perl: upgrade 3.17 -> 3.18
Date: Mon, 11 Jul 2022 16:45:13 +0800
Message-ID: <1657529116-24181-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Jul 2022 08:49:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97806

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libencode-perl_3.17.bb => libencode-perl_3.18.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libencode/{libencode-perl_3.17.bb => libencode-perl_3.18.bb} (97%)

diff --git a/meta-perl/recipes-perl/libencode/libencode-perl_3.17.bb b/meta-perl/recipes-perl/libencode/libencode-perl_3.18.bb
similarity index 97%
rename from meta-perl/recipes-perl/libencode/libencode-perl_3.17.bb
rename to meta-perl/recipes-perl/libencode/libencode-perl_3.18.bb
index 8b4f292a3..999863b1f 100644
--- a/meta-perl/recipes-perl/libencode/libencode-perl_3.17.bb
+++ b/meta-perl/recipes-perl/libencode/libencode-perl_3.18.bb
@@ -15,7 +15,7 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://META.json;beginline=8;endline=10;md5=b12e3be1e17a7e99ca4f429ff32c28b5"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/D/DA/DANKOGAI/Encode-${PV}.tar.gz"
-SRC_URI[sha256sum] = "b44cbf7dd60ec6128ec575dd348484975086522611bc7580cfd305a095faa6d2"
+SRC_URI[sha256sum] = "74dcbd851171a68cf3ef225568ece47b0959b8e3cda887482fde97c1ae1691e2"
 
 UPSTREAM_CHECK_REGEX = "Encode\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.25.1


