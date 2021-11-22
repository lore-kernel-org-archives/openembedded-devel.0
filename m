Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D89BC433EF
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 15:05:08 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web09.7508.1637593506847723510
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Nov 2021 07:05:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=uq/goq7Q;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1637593504; i=@fujitsu.com;
	bh=zSqekZEVdlT2DcWZVJcB0cg0kNBGO3AT+xspzgXHi50=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=uq/goq7Q2wLfvRezRqLjExiiLN5+SSUsuS18w7acu2pkRCEK4fCDVqaL5RyX5d/iq
	 GffP9AhgpwyetlHrQAPcRlEGpP1YTFthFFqTTo3E+xB9iqPCfipeFMZ/dCZR6n3mBI
	 ZRAoliIQYYN8Vq/Sw51b0eI0wu3Q/EGu30s311fKDsZUQdixpS8boiEqYW67q3iDYn
	 NMviTrgz1Su9eia7NM6v42wMgJ2Qw7kXOPBfniyTSDeSVs1/nbQL3q1G9U5R6TQXwX
	 YHVLn5FmVoHYzJhibc5ZxCj/FFjmMwOqp0WqZrgQHmV2KAqQDd65WF1+MvhwL5Ew0x
	 nxiXxMgdiXsPQ==
Received: from [100.115.36.91] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-2.aws.ess.symcld.net id FD/F3-17169-0A1BB916;
 Mon, 22 Nov 2021 15:05:04 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8MRqrtg4+x
  Eg5+f2SwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oz/r3ezFEzhqJj+7hNrA+MG9i5GLg4hgZlM
  EitOnWHrYuQEck4wSpx5xgpiswmoSUy/dQPMFhHQl1g6ew8ziM0soCLx4ncPO4gtLOAoMeNyN
  yOIzSKgKrFx9jkwm1fASWLiyXtg9RICChJTHr4HszkFnCUOnbnHBLHLSWL5i6XMEPWCEidnPm
  GBmC8hcfDFC6heRYnZl5tZIOwKiVmz2pgmMPLPQtIyC0nLAkamVYzWSUWZ6RkluYmZObqGBga
  6hoamusamuoYmhnqJVbqJeqmluuWpxSW6RnqJ5cV6qcXFesWVuck5KXp5qSWbGIFBmVKs3LuD
  sffyN71DjJIcTEqivEazZycK8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuB9vA4oJ1iUmp5akZaZA
  4wQmLQEB4+SCK8DSJq3uCAxtzgzHSJ1ilFRSpz34AaghABIIqM0D64NFpWXGGWlhHkZGRgYhH
  gKUotyM0tQ5V8xinMwKgnzrgKZwpOZVwI3/RXQYiagxaePTwdZXJKIkJJqYHJovjBJxW7x9er
  eyHomb475Xq9rpyWu3hFsPFnAbYZkuMqXjCTtuuUXXiyPUrTt2rxYLWbWsZDopK6MDUzh93au
  tKgXrN1h8bI89p6qhOf7uldRHxIZOhunSX3pOzD12qulhuf6SxcxGLfuupzLM/+bQ79fu7RQZ
  DVbUl8RJ9upyBct1n1Lkyw3ztoy7/9hQ8nDN38rJtSFm12/c/ose0dyyZUHV//VCF1+LC4/ye
  2GOLuSPs+cvx/3bpskd8Lbd6E27+T3xf8vqnLevse7ckNOYEjc0SRTmztSm47XS/uknDkqXlm
  4rUGbY+lu/SQj+8Wr3XdPaZNjn7xa0GrLtHnPn91jvP8ky3QjHyergBJLcUaioRZzUXEiAEpb
  PQxFAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-548.messagelabs.com!1637593503!429091!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5396 invoked from network); 22 Nov 2021 15:05:04 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-14.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Nov 2021 15:05:04 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1AMF4vcT015479
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Nov 2021 15:05:03 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 22 Nov 2021 15:05:00 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] xmlsec1: upgrade 1.2.32 -> 1.2.33
Date: Mon, 22 Nov 2021 23:04:20 +0800
Message-ID: <1637593460-99443-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1637593460-99443-1-git-send-email-wangmy@fujitsu.com>
References: <1637593460-99443-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Nov 2021 15:05:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94102

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xmlsec1/{xmlsec1_1.2.32.bb => xmlsec1_1.2.33.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/xmlsec1/{xmlsec1_1.2.32.bb => xmlsec1_1.2.33.bb} (96%)

diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.32.bb b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.33.bb
similarity index 96%
rename from meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.32.bb
rename to meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.33.bb
index 15da5aa6cb..1ca0f79f0b 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.32.bb
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.33.bb
@@ -22,7 +22,7 @@ SRC_URI = "http://www.aleksey.com/xmlsec/download/${BP}.tar.gz \
     file://ensure-search-path-non-host.patch \
     "
 
-SRC_URI[sha256sum] = "e383702853236004e5b08e424b8afe9b53fe9f31aaa7a5382f39d9533eb7c043"
+SRC_URI[sha256sum] = "26041d35a20a245ed5a2fb9ee075f10825664d274220cb5190340fa87a4d0931"
 
 inherit autotools-brokensep ptest pkgconfig
 
-- 
2.25.1


