Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06912FA373D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 06:58:16 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web10.16605.1666594694198493883
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Oct 2022 23:58:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=RTRzf6S3;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666594692; i=@fujitsu.com;
	bh=DyfHhZwGh3xbr4qOHHPeCpnEBkid3Ah4mIc1EWsdLI4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=RTRzf6S3tYPbkNulhZCEin8q3hVczweS62RLncorBUlRNQF6SvMPUcHVuy6kdpiob
	 HmQdtku3Z0XvHqV7PgtqM1d3MS/B8sTIh7SrFAQw9yXtlXA+bNLrmH8tnzUGupD4Kg
	 lL4dsAknphh2sEj4vcxP39CvQx3quH9p+JovwgbWwoyzt8v1B5u8YyI9Hoy1ZewDvD
	 nchUPfpPKXXXwvYq5IIrPDpbOm0x0Jhoe6yjKjrp26Ekn7PyiDrJo6g3FtriYcaX9g
	 VEtOXLyUSuZeJyiHsFaPNddKqSp9UFJTqN6Tll/leSF0n0qRveJaun+IaDC164gMxR
	 BJl0SSE0gZZUQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8OxWbfZPCz
  ZYN9jIYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPHzlXMBW2cFfOfX2ZrYFzP0cXIxSEk8IBR
  4u2yeSwQzmUmiSdT/zJCOHsYJfa/fMXWxcjJwSYgJXHj/n8wW0RAX2Lp7D3MIDazgIrEi9897
  CC2sICXxMqju8FqWARUJRreQMR5BZwkrj7bwQhiSwgoSEx5+B6sl1PAWeLKvedgthBQzdd7a5
  kh6gUlTs58wgIxX0Li4IsXzBC9ihKzLzezQNgVErNmtTFB2GoSV89tYp7AKDgLSfssJO0LGJl
  WMZoVpxaVpRbpGprqJRVlpmeU5CZm5uglVukm6qWW6panFpfoGuollhfrpRYX6xVX5ibnpOjl
  pZZsYgSGb0oxe/EOxgfL/ugdYpTkYFIS5WUQD0sW4kvKT6nMSCzOiC8qzUktPsQow8GhJMFbo
  wWUEyxKTU+tSMvMAcYSTFqCg0dJhHeWEVCat7ggMbc4Mx0idYpRl2Pm17YDzEIsefl5qVLivN
  xmQEUCIEUZpXlwI2BxfYlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMK+fKdAUnsy8ErhNr4C
  OYAI64tKKIJAjShIRUlINTH3TWD9MYpIMWJ1nZrmza9Vu+0hdJt5G44mp69wclQI80xtn17Ns
  /2WYOuFhrYNnUYx2z87NGZF+C5/OmaCt62j8fk2y8a66inupJ0sfy22w4P2VblvA+kyXUWsPq
  /qPwxMiTDhW7L9dz7iMfY9fZ8fD8/+42Z7vy/yzbLesCUf5jLhJu3TVrxRItEg2LI21iCvuuJ
  xVvzuk9PQRt59zVpW87DN+eGOr8rI5myMX/PDYx9gYdYtxqzLjpk9LrrKw3W6SXbG7oHx95d1
  jn0zs/wc4pR7pcszvvze7zvHQnWhttl9XeCb3leb7T/h13Ispxj612vt4qcy29z+8MtduVwvf
  WRTztVXhe73IPEExJZbijERDLeai4kQAadJde2YDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-585.messagelabs.com!1666594691!441908!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14968 invoked from network); 24 Oct 2022 06:58:11 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-17.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Oct 2022 06:58:11 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id E79DD7B
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 07:58:10 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id DAA3573
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 07:58:10 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 24 Oct 2022 07:58:09 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pandas: upgrade 1.5.0 -> 1.5.1
Date: Mon, 24 Oct 2022 14:57:50 +0800
Message-ID: <1666594670-29314-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1666594670-29314-1-git-send-email-wangmy@fujitsu.com>
References: <1666594670-29314-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 06:58:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99285

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pandas_1.5.0.bb => python3-pandas_1.5.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_1.5.0.bb => python3-pandas_1.5.1.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.5.0.bb b/meta-python/recipes-devtools/python/python3-pandas_1.5.1.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-pandas_1.5.0.bb
rename to meta-python/recipes-devtools/python/python3-pandas_1.5.1.bb
index 998aa123cd..65cd29d9b4 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_1.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_1.5.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://pandas.pydata.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c1cc9ab35a8b2aabf933cd6d245b5db3"
 
-SRC_URI[sha256sum] = "3ee61b881d2f64dd90c356eb4a4a4de75376586cd3c9341c6c0fcaae18d52977"
+SRC_URI[sha256sum] = "249cec5f2a5b22096440bd85c33106b6102e0672204abd2d5c014106459804ee"
 
 inherit pypi setuptools3
 
-- 
2.25.1


