Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE40C433EF
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 00:29:23 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web09.5021.1642379357245313691
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Jan 2022 16:29:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=QdlDlQ+D;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1642379362; i=@fujitsu.com;
	bh=6u6zFyIdCjUhIIIHpvVREN+TTkDogE+7sckKULWGT3s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=QdlDlQ+DqjtP5VC92Hrl0om4boOBEweSGLTTUCIb0g2j8EAMxMpC2wEXIlJoVYvyD
	 tjvetGr24jyGI9H/FxVmHT9uo2cLKQfyszJiAzh44YBbms7SfwacTT9NUs1eP8Oyqc
	 mNpD9CmMyQLCpnPGWIPkGjeqpvredus3OqWXUZv7ivnXykN/8w0ATw0mPqWZ1Yg85l
	 GtsFtIjPUJVgm5VSYBGstY9NPPGsFH4yzmQuxiZ4Cv3B0cI1JCLEhP6U4z63ewx1Mx
	 mjBuwq6Lpb1JtUesonDuRQOqKh4sZL0NYQIbrikot6E1j3mHqOZtRp6w5h6FRBjMh+
	 LI7iSJTgZM55A==
Received: from [100.115.34.61] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-2.aws.ess.symcld.net id 13/0B-28974-268B4E16;
 Mon, 17 Jan 2022 00:29:22 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRWlGSWpSXmKPExsViZ8MxRTdpx5N
  EgxX7RCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1owDd2cyFuzjqJg9uYe1gfEaexcjF4eQwEwm
  iTXvvjB1MXICOScYJba9EQCx2QTUJKbfusEKYosI6Essnb2HGcRmFlCRePG7hx3EFhZwktjU/
  5ERxGYRUJVY17cTKM7BwQsUf99SAhKWEFCQmPLwPVgrp4CzROvqK8wgJUJAJUfW1YOEeQUEJU
  7OfMICMV1C4uCLF8wQrYoSsy83s0DYFRKzZrUxTWDkn4WkZRaSlgWMTKsYrZKKMtMzSnITM3N
  0DQ0MdA0NTXWNjXXNTfQSq3QT9VJLdctTi0t0jfQSy4v1UouL9Yorc5NzUvTyUks2MQLDMaVY
  0WsH46sVP/UOMUpyMCmJ8oZ8eZQoxJeUn1KZkVicEV9UmpNafIhRhoNDSYK3dtuTRCHBotT01
  Iq0zBxgbMCkJTh4lER42bYDpXmLCxJzizPTIVKnGMM53qxdsoiZ4y2YbLt3F0i2g8mZCw6uZu
  aYBSbvtx8Ckg9ApBBLXn5eqpQ47zqQcQIg4zJK8+CWwWL/EqOslDAvIwMDgxBPQWpRbmYJqvw
  rRnEORiVh3gUgU3gy80rgbnoFdC4T0LmrPj4CObckESEl1cCkWcBj1nZgm92/vP3385Y2HOQ7
  evH6talH5HlvSjSU8+dqds9qrH3Cv/Qbn9qJW64c2+yLHt55F37mBF/Y/8w5rBFv4/Y7HJ/dv
  nTdz+nSIZbhelVnNv5Smaq34nEKh+f1wN0FZ75IzTnwKeie4O9j/MtmhSh+PbSsQXE1y6kTgX
  6tR8s0fnJ774rUiddImc/w9/WnDWeuxbVv8w9uivjwadbXudpam/XSZ9uVfU5KXHKxct5eU0G
  l1R/zv/65KLLNd+KM69q6Msf6Mo85ikQfXTv3UYCw+OnTLyIjr/kzJXFb7ZES3V5QpxS17NTi
  fdnrxMUCHc8v01l+28NA57BH0CkJs9cmiqtuKaq4923QUGIpzkg01GIuKk4EAMzaADV4AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-548.messagelabs.com!1642379362!135075!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8405 invoked from network); 17 Jan 2022 00:29:22 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-12.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Jan 2022 00:29:22 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 20H0TGla006849
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jan 2022 00:29:22 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 17 Jan 2022 00:29:15 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] protobuf: upgrade 3.19.1 -> 3.19.3
Date: Mon, 17 Jan 2022 08:28:56 +0800
Message-ID: <1642379337-12144-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1642379337-12144-1-git-send-email-wangmy@fujitsu.com>
References: <1642379337-12144-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Jan 2022 00:29:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94891

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../protobuf/{protobuf_3.19.1.bb => protobuf_3.19.3.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf_3.19.1.bb => protobuf_3.19.3.bb} (98%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.19.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.19.3.bb
similarity index 98%
rename from meta-oe/recipes-devtools/protobuf/protobuf_3.19.1.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_3.19.3.bb
index bff159590..bc27b0d02 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.19.1.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.19.3.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b"
 DEPENDS = "zlib"
 DEPENDS:append:class-target = " protobuf-native"
 
-SRCREV = "7c40b2df1fdf6f414c1c18c789715a9c948a0725"
+SRCREV = "cc7b1b53234cd7a8f50d90ac3933b240dcf4cd97"
 
 SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=3.19.x;protocol=https \
            file://run-ptest \
-- 
2.25.1


