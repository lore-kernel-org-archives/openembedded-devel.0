Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17E4FC61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 09:46:20 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.9513.1678355173318664704
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Mar 2023 01:46:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=kIycQfJQ;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678355171; i=@fujitsu.com;
	bh=5wFJbGdJuF7dXdlRYW0PK/fBUgbLuTdGUrTVOxLViA0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=kIycQfJQSmL1Kk0POng0lRUXaOPb65S26r+LhxMIICvQ4wpbTQzCBEOhR8I11IPt1
	 Wi94Toc3DebrNM7PJosF7S5W6Z0w5pD3R7uCI9EwbNdcVaI/qX65UBXnoCHTZp1cNU
	 lqY2iMChBbbEHNVcNpapO/Q9bK0kS3jMGhRC/99l/SC7v/bL9nRkpeMLdb1heeC+gt
	 o3Z0Un8UY7dtnoEHbbA0FecbzNsKSVa64Qhdmd7AD0QJfN7ZjmRJlrM3ZO5vDVXZ8P
	 2ay87rnRpaKmT08xewGS+lsO8hJ4s4/T25NP/8xWQP0RgI2unpeSJai2arQVNc+lU2
	 Vmgcrbw/TeNAw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8OxWffRKs4
  Ug0nbDCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oyD1xcwFzzgrLj0ILyBsY2zi5GLQ0jgIaPE
  zONnmSCcq0wS37ZMYuli5ARy9jBKTDxTA2KzCUhJ3Lj/nw3EFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLBAiMf/cS7A4C1B8zbadQEM5OHgFnCQWdJmDhCUEFCSmPHwPVsIp4Cwx5Xs3E8QqJ4kv71
  rBxvAKCEqcnPmEBWK8hMTBFy+YIXoVJWZfbmaBsCslWj/8grLVJK6e28Q8gVFwFpL2WUjaFzA
  yrWI0L04tKkst0jUy0EsqykzPKMlNzMzRS6zSTdRLLdXNyy8qydA11EssL9ZLLS7WK67MTc5J
  0ctLLdnECAzdlOK0fTsYO/r+6h1ilORgUhLl7WbjTBHiS8pPqcxILM6ILyrNSS0+xCjDwaEkw
  Wu+DCgnWJSanlqRlpkDjCOYtAQHj5IIb/9soDRvcUFibnFmOkTqFKOilDhv4kqghABIIqM0D6
  4NFruXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzrgCZwpOZVwI3/RXQYiagxbu2cIAsLkl
  ESEk1MNnsFvun82zn3J+2akn+Bs+vHNyUGzE/syciYaHNHv6rEhG2bxIueH66ZCR//k1cwstT
  b5q4z6fXx72/d7u9KmSJvfX8neyRWdlMUyr/yB4QE22J5kx+zyxubvSI77l65bxDNp6O3Xnt4
  aUpusWVZocu3th8nenYp0+nCyKi2ky7s4SfTXxg8sFms4xIdscMGVPLrKNhS8U1ayQOTi13dj
  C0bauYoNip0PnqvRZTzlFW7V2V+xsu5s62MDkqfuFeW3RJgebaqBeK179vPzGvvD78s0FPw8G
  vc9iCD3sm/zkXanwtU2iqgFXB8e2X20/MPDjHZvniGeumOExaKPOaf66Kgrj21AyT5V+3zHz0
  RImlOCPRUIu5qDgRAMQWSf5YAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-745.messagelabs.com!1678355170!255025!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8636 invoked from network); 9 Mar 2023 09:46:10 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-3.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Mar 2023 09:46:10 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 335F1156
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Mar 2023 09:46:10 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 27A3E152
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Mar 2023 09:46:10 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 9 Mar 2023 09:46:08 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 07/11] python3-protobuf: upgrade 4.22.0 -> 4.22.1
Date: Thu, 9 Mar 2023 17:45:52 +0800
Message-ID: <1678355155-32741-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678355155-32741-1-git-send-email-wangmy@fujitsu.com>
References: <1678355155-32741-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 09:46:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101452

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-protobuf_4.22.0.bb => python3-protobuf_4.22.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_4.22.0.bb => python3-protobuf_4.22.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.22.0.bb b/meta-python/recipes-devtools/python/python3-protobuf_4.22.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-protobuf_4.22.0.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_4.22.1.bb
index 2d59ec754..add20c0e4 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.22.0.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_4.22.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "652d8dfece122a24d98eebfef30e31e455d300efa41999d1182e015984ac5930"
+SRC_URI[sha256sum] = "dce7a55d501c31ecf688adb2f6c3f763cf11bc0be815d1946a84d74772ab07a7"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.34.1


