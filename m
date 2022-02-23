Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90169C433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 02:37:39 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web12.2722.1645583857820451343
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 18:37:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=JThMa5uk;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645583855; i=@fujitsu.com;
	bh=EAiRNToCHmi9FmOVqD7NAYeQTqJaMqopQQtPcVCp0IU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=JThMa5ukd1cyTFKwGWQffEwGEQ1/VSIOs/Mjgbdimg6XnHOHZmg63LStDy06KGYo0
	 rzBLfR5X+2K3GvZ2hiPk6b0U46tgDZthjeKhfrKJhYn1qF64in6zYr/Qqg5930ENWM
	 mxVxpiLgjPK8l29b39Qu8PqVHN6vpIeUF/mvxdnA7O7X5Pu735nCqq9VMtT4dQ7D5o
	 38nFR5D6NS0mkVckqz7H8B/5PcUb6WikfdpHUj8dLX4b5W9zwK1uoMHnsRAfucBn0i
	 RiM6+ZbTPAhvpeWoKk7R10Dvr7tImWjDyd5XKBwaR7v4+Pukv+QTXTmMN7yc4467P8
	 39ISE45W4EFVQ==
Received: from [100.115.7.206] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.ess.symcld.net id E2/7C-12292-FED95126;
 Wed, 23 Feb 2022 02:37:35 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHIsWRWlGSWpSXmKPExsViZ8MRovt+rmi
  SwebdshYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bOEydZCrZxV+zsWMLUwNjC1cXIxSEkMJNJ
  4uvl3axdjJxAzh5GiU9LUkBsNgFdiXOP17KD2CIC+hJLZ+9hBrGFBZwkGu9sBLNZBFQlzlzqA
  avhFfCQmPv6IROILSGgIDHl4XtmiLigxMmZT1hAbGYBCYmDL14AxTmAahQlZk+XhyivkHh9+B
  LzBEaeWUg6ZiHpWMDItIrRKqkoMz2jJDcxM0fX0MBA19DQVBdImproJVbpJuqlluqWpxaX6Br
  qJZYX66UWF+sVV+Ym56To5aWWbGIEBlJKMcOsHYyz+n7qHWKU5GBSEuWd6y+aJMSXlJ9SmZFY
  nBFfVJqTWnyIUYaDQ0mC98MsoJxgUWp6akVaZg4wqGHSEhw8SiK8++cApXmLCxJzizPTIVKnG
  I05rl65speZ4waIFGLJy89LlRLn1QPGi5AASGlGaR7cIFi0XWKUlRLmZWRgYBDiKUgtys0sQZ
  V/xSjOwagkzHsKZCFPZl4J3L5XQKcwAZ0yJUsI5JSSRISUVAOTlFOgTesP+8Tt9sX3mfdYfpj
  ocIhlxuWQh+XWOesyT9fecfXbOWf/7trVnsEcTmK3BQp/3VbWcczimL9+S9jcwJcfVbXX65fP
  /NWx7eC23EmTrC4ILnEKf//oPIvQmf/vfIJmaDzbbLpDdc0Unqx5a/oqLM13vbvA+nj/jPmzf
  inv0zHPKqts6lYPv7Ul9j7vgvenHsTsea8xodH8+/zg8zPZNKumfjghzTKl7boUxyWne8yt5S
  JTFnGuC94s8V1k9hLZY0nztTdLzM3U+uAxoyHz0rmbLkXV7n571xod+pSj6MD1fceWBR3Pj8Q
  U5Z100lj0vuu0tQ3Tpb2iYsLvrszb3sUYOHnHmi8Lw4q2aSuxFGckGmoxFxUnAgCrqOHdMQMA
  AA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-13.tower-587.messagelabs.com!1645583855!16150!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26477 invoked from network); 23 Feb 2022 02:37:35 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-13.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Feb 2022 02:37:35 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 21N2bY58018899
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 02:37:35 GMT
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 23 Feb 2022 02:37:33 +0000
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] protobuf: upgrade 3.19.3 -> 3.19.4
Date: Wed, 23 Feb 2022 10:37:27 +0800
Message-ID: <1645583847-38766-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Feb 2022 02:37:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95466

Changelog:
=========
Python
* Make libprotobuf symbols local on OSX to fix issue #9395 (#9435)

Ruby
* Fixed a data loss bug that could occur when the number of 'optional'
  fields in a message is an exact multiple of 32. (#9440).

PHP
* Fixed a data loss bug that could occur when the number of 'optional'
  fields in a message is an exact multiple of 32. (#9440).

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../protobuf/{protobuf_3.19.3.bb => protobuf_3.19.4.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf_3.19.3.bb => protobuf_3.19.4.bb} (98%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.19.3.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.19.4.bb
similarity index 98%
rename from meta-oe/recipes-devtools/protobuf/protobuf_3.19.3.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_3.19.4.bb
index f2d6c6fbdf..5662330840 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.19.3.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.19.4.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b"
 DEPENDS = "zlib"
 DEPENDS:append:class-target = " protobuf-native"
 
-SRCREV = "cc7b1b53234cd7a8f50d90ac3933b240dcf4cd97"
+SRCREV = "22d0e265de7d2b3d2e9a00d071313502e7d4cccf"
 
 SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=3.19.x;protocol=https \
            file://run-ptest \
-- 
2.25.1


