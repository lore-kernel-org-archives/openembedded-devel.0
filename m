Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC0DBC6FA89
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 10:21:18 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web08.3019.1663064471340023537
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 03:21:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=V12roJJG;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663064469; i=@fujitsu.com;
	bh=IFFhUkgpK536g/+7Kjo8NT3mMM/swY/7inMC1Z5CHqs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=V12roJJGhZ7wa906kx+rybmnfl8cu9FvWtgQC11mLmFSwz4xOdhKxtLPONE1EwuKB
	 OnoSyZgj2vr+YUtK5XNYgeA6pc+xd9CVbX/Gbz33rlnYSyPhztJQc3uDOMom8Y30yI
	 Ivmjk1tqvXb5vwuEYNLOPR3UyBD/5j9K7BNTOimAji8rc6p1bGToP4pMnliv8X9+3Q
	 CYaXt+q4WNu0NsrgtpwydC/scM41RLq/u9NvZoP5Ea73OkU26ybWI3pr3RcO9x4qNP
	 gEz0LemVgOnf7+AB15lfPSykML9akkHPWETOlhkoh8QvNiWyCAisjZjG770/CRgxbL
	 GkfH7QA8VAk+A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCIsWRWlGSWpSXmKPExsViZ8OxWXdqpEK
  ywYd3MhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aDCWoFLzgqNj6eyNrAOJmji5GLQ0jgAaNE
  0/Z+NgjnMpPExI9b2CGcPYwSXz59YO1i5ORgE1CTmH7rBpgtIqAvsXT2HmYQm1lAReLF7x52E
  FtYwFfiwobHTCA2i4CqxPIr69lAbF4BR4kXZ9+AxSUEFCSmPHwP1MvOwSngJLGNr4uRA2iVo8
  SHt7EQxYISJ2c+YYEYLiFx8MULZohGRYnZl5tZIOwKicbph6AGqklcPbeJeQKj4Cwk7bOQtC9
  gZFrFaJ1UlJmeUZKbmJmja2hgoGtoaKprbKFrZGikl1ilm6iXWqpbnlpcogvklhfrpRYX6xVX
  5ibnpOjlpZZsYgQGcEqx2pUdjHtW/dQ7xCjJwaQkyhvppZAsxJeUn1KZkVicEV9UmpNafIhRh
  oNDSYI3PgQoJ1iUmp5akZaZA4wmmLQEB4+SCC9PMFCat7ggMbc4Mx0idYpRl2Pm17YDzEIsef
  l5qVLivDO9gYoEQIoySvPgRsAi+xKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV6JMKApPJl
  5JXCbXgEdwQR0hJG1PMgRJYkIKakGpskX/rpnpCguP3bwZsDSmIAfQstrHTexqB4ukP1wxMTE
  ayufVZSJzvFmoXlJ/ZcM19kK/+4QqGW+M31fm49q/DSGe/kZqx8KerHkvvi2SO2VY8zWRc+Y1
  3sHNquZ+M6e//cta+DrOuPmSfdD3V79+dcnqZLIyuFuZ+uqaaf/qS6zny/4+56pZ748rN96nW
  nLcf1PZi9+7Hz4k5H3mdftHdNkhTi+l7FMa7nT2LrEodeP9+wd1oN+cpcka/vvFT7/bSLZYlF
  Y8OP7izVbLgnn+1y5fNPPRmCGUecPqfcR5zIn3t45STHswHxLkfALj6XTrm514Ci8mT8tnSHA
  me/elh02Dy6V1VrMXso+6/1kWSWW4oxEQy3mouJEAKFurRtnAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-565.messagelabs.com!1663064469!2111!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8491 invoked from network); 13 Sep 2022 10:21:09 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-3.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Sep 2022 10:21:09 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 2D2DE7B
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:21:09 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 207E373
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:21:09 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 13 Sep 2022 11:21:07 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-twisted: upgrade 22.4.0 -> 22.8.0
Date: Tue, 13 Sep 2022 18:20:54 +0800
Message-ID: <1663064456-3336-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1663064456-3336-1-git-send-email-wangmy@fujitsu.com>
References: <1663064456-3336-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Sep 2022 10:21:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98783

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-twisted_22.4.0.bb => python3-twisted_22.8.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-twisted_22.4.0.bb => python3-twisted_22.8.0.bb} (99%)

diff --git a/meta-python/recipes-devtools/python/python3-twisted_22.4.0.bb b/meta-python/recipes-devtools/python/python3-twisted_22.8.0.bb
similarity index 99%
rename from meta-python/recipes-devtools/python/python3-twisted_22.4.0.bb
rename to meta-python/recipes-devtools/python/python3-twisted_22.8.0.bb
index 9429f8faab..f40c5f080b 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_22.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_22.8.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://www.twistedmatrix.com"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0f8d67f84b6e178c92d471011b2245fc"
 
-SRC_URI[sha256sum] = "a047990f57dfae1e0bd2b7df2526d4f16dcdc843774dc108b78c52f2a5f13680"
+SRC_URI[sha256sum] = "e5b60de39f2d1da153fbe1874d885fe3fcbdb21fcc446fa759a53e8fc3513bed"
 
 PYPI_PACKAGE = "Twisted"
 
-- 
2.25.1


