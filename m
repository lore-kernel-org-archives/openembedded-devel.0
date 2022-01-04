Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8836C433F5
	for <webhook@archiver.kernel.org>; Tue,  4 Jan 2022 03:42:51 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.2097.1641267770989297369
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Jan 2022 19:42:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=iBd+pQ/F;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1641267768; i=@fujitsu.com;
	bh=QM1DWnOCRCI2YK1oxQrwHbywqMjIeTjlIF98pd0/CuY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=iBd+pQ/FDcMjYjPZ/CzzO/S9STmMgaJFOtruSgpEiBcuWAFDZVcqAlFKU9ObDxt/C
	 YabQfRU6eO44evM92bIJb3kkgoBjfXtsrpjJDo6ZQC1fEeoSOjpS06Bhvvrnr8YNIp
	 NAqk1aRxBEkwnErgH0dZhCrQVao7l9XIFk/OJQgTXFFefm7lqDcOsMubNUfRhMC5cJ
	 aUj8e6HAIXSwDnSUtkyIRcI7LyWiWzYAWhpbmsGQvkk/XTr0m8semJYlr9MZT8pIJ0
	 XkhZPPC6HUo6G7rwTmAocissVTEKApg1Giv8SirA5Q05482KLo8VfbNHQjyCjpdl/0
	 6R8vuuASUfj1w==
Received: from [100.115.64.186] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 88/A6-24146-732C3D16; Tue, 04 Jan 2022 03:42:47 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnkeJIrShJLcpLzFFi42Kxs+EI0TU/dDn
  R4Nx9RYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePh70MsBT84Kg7s2cfawLiYo4uRk0NIYAaT
  xNlp/l2MXED2bkaJo6fns4Ak2AR0Jc49XssOYosI6Essnb2HuYuRg0NYwEei/TYrSJhFQEXi+
  Y53zCA2r4CHxMFTDUwgtoSAgsSUh++h4oISJ2c+ARvJLCAhcfDFC7AxEgKKErOny0OUV0i8Pn
  yJeQIjzywkHbOQdCxgZFrFaJdUlJmeUZKbmJmja2hgoGtoaKprbqhraGysl1ilm6iXWqqbnJp
  XUpQIlNZLLC/WSy0u1iuuzE3OSdHLSy3ZxAgMp5Ri99YdjJf7fuodYpTkYFIS5a2wupwoxJeU
  n1KZkVicEV9UmpNafIhRhoNDSYJ34V6gnGBRanpqRVpmDjC0YdISHDxKIrw8B4DSvMUFibnFm
  ekQqVOMilLivGx7gBICIImM0jy4Nlg8XWKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzHsGZD
  xPZl4J3PRXQIuZgBafkwNbXJKIkJJqYJq3znbtnGy3pXwmeo0en89p1avILjn+5HJuwHUln+x
  jQZuVF95f9cLbm0HSU3Vh5OcoL155Lz6xa0HVdvdblPtOPPVuzb4r1qffEK/GfkHb4epmhntL
  2EodDf8eY3+9Kr6fdWfX7n8uW7e5XP0VF3itTvTPUqOTzoaibEm3AvrajZuCZ3m1sAY535I2s
  a/8k62oybWj3uPd5P51d6WCRZ5yZ6RGflvaJHVV41p12jT1JueQBKW6bdkhUp69/xeJfu09qx
  W/bNGF8zp89zv6DwlE5c//Ob1gZi1b9vTbk0LyfW7uWThBe1KXRS1Htd3GxLnM6svTjSSfNof
  7H3mq917ON/rGvAdJBb/+Lj2rxFKckWioxVxUnAgA+dr7YSIDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-14.tower-545.messagelabs.com!1641267767!341340!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25482 invoked from network); 4 Jan 2022 03:42:47 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-14.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 4 Jan 2022 03:42:47 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 2043gf6a030313
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 4 Jan 2022 03:42:47 GMT
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Tue, 4 Jan 2022 03:42:40 +0000
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-networkx: upgrade 2.6.2 -> 2.6.3
Date: Tue, 4 Jan 2022 20:42:33 +0800
Message-ID: <1641300153-14441-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Jan 2022 03:42:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94652

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-networkx_2.6.2.bb => python3-networkx_2.6.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-networkx_2.6.2.bb => python3-networkx_2.6.3.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-networkx_2.6.2.bb b/meta-python/recipes-devtools/python/python3-networkx_2.6.3.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-networkx_2.6.2.bb
rename to meta-python/recipes-devtools/python/python3-networkx_2.6.3.bb
index e7676a713..1608e0380 100644
--- a/meta-python/recipes-devtools/python/python3-networkx_2.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-networkx_2.6.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://networkx.github.io/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5cfa4d8f5881e0d053bb497130b9c73a"
 
-SRC_URI[sha256sum] = "2306f1950ce772c5a59a57f5486d59bb9cab98497c45fc49cbc45ac0dec119bb"
+SRC_URI[sha256sum] = "c0946ed31d71f1b732b5aaa6da5a0388a345019af232ce2f49c766e2d6795c51"
 
 inherit pypi setuptools3
 
-- 
2.25.1


