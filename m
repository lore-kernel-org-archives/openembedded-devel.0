Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.4])
 by mx.groups.io with SMTP id smtpd.web08.24652.1629941628022517633
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Aug 2021 18:33:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=LbaLuyYq;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.4, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1629941625; i=@fujitsu.com;
	bh=5DTX8bnkvvzl/AkwJiYPV9m4BVYYG7zEGe7qegV5yS8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=LbaLuyYq6d/UzDS++yAL5Yp3JaUg/rfOtSiES8jTWk3eipbYMc+uOA51+MqeJLcmf
	 Sv2NL2J23rv7i6+hH8X7M8ON70DCZnvRQOhEjBPHJWL/LFRjguRwc40oNFpwg2Syxt
	 +651nkIQEAsR5Lc1dLIM8zp6ihTkvG2KAdCLNvPdle4edxX3sfKwWTlCv04QEybLTN
	 03+ioqqf9cs5SH/GvEB4jkxg8vd65EXQeitX49sbLXheTHC1eA4Fk1fPqAxlfEqgT7
	 z37ZaejpVvXolmCc+wEjd+GU8ZC6BpeoACS5c7KGp2db6IkaFLsLC6O6eeIPM0HNLC
	 dlL8OzeQjjxhA==
Received: from [100.112.192.137] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.symcld.net id 65/F6-28260-87FE6216; Thu, 26 Aug 2021 01:33:44 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8MxVbfivVq
  iwY/rchYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bP132sBY84Kj51tLA0MJ5n72Lk4hASmM0k
  cfdHO5RzglHi4fZTbF2MnBxsAmoS02/dYAWxRQT0JZbO3sMMYjMLqEi8+N3DDmILC9hJ9J/eD
  FbPIqAq0b6qG6yGV8BJonnJX7AaCQEFiSkP34PFOQWcJX6dOQ00kwNomZPE1blREOWCEidnPm
  GBGC8hcfDFC2aIVkWJ2ZebWSDsColZs9qYJjDyz0LSMgtJywJGplWM5klFmekZJbmJmTm6hgY
  GuoaGRrqGlka6JiZ6iVW6iXqppbrlqcUluoZ6ieXFesWVuck5KXp5qSWbGIHBmFJwQGcH489X
  H/QOMUpyMCmJ8s4/qJYoxJeUn1KZkVicEV9UmpNafIhRhoNDSYL322ugnGBRanpqRVpmDjAyY
  NISHDxKIrwz3gKleYsLEnOLM9MhUqcYFaXEebeDJARAEhmleXBtsGi8xCgrJczLyMDAIMRTkF
  qUm1mCKv+KUZyDUUmYdwnIFJ7MvBK46a+AFjMBLS7gUwVZXJKIkJJqYLK1uPSvkqNGeqoFg5k
  50yv/It6VzU6fw07pabx6qWf0vuWz0+OYgx5TVO5nTI08G3xgbkbTr6Lzld8UNlnbXvYMmFny
  u9p3WWTOTc6/r1cdaDkT8uKoQ4j6kz/S/9O72XdknFbivvj/eWVGj5e/IgPHtfw5afvv2R3d3
  OUVv+OE5aYSTplbz97xPPUPXf+zzZ215JXFqZWXokLPyHJveG+sK1Fg3Xqo9seFdfGFOW+Wz4
  lssTl6tZvZMcZ4LdPXoONJleePCi7o9gxvTbzTcoT3Hodk6HejD/euLdvSL1O2aJ962rqni/l
  vnOqzedlvoWqp4b5V1+NWSaRz+OZXEyU+Vgizh8blJr26W120SomlOCPRUIu5qDgRAO4zxnBB
  AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-267.messagelabs.com!1629941624!103923!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27911 invoked from network); 26 Aug 2021 01:33:44 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-6.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 Aug 2021 01:33:44 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17Q1XZj2018832
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Aug 2021 02:33:44 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 26 Aug 2021 02:33:38 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] gensio: upgrade 2.2.8 -> 2.2.9
Date: Thu, 26 Aug 2021 09:33:15 +0800
Message-ID: <1629941597-62033-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1629941597-62033-1-git-send-email-wangmy@fujitsu.com>
References: <1629941597-62033-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

v2.2.9: Fix a crash if telnet is used without rfc2217

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gensio/{gensio_2.2.8.bb => gensio_2.2.9.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/gensio/{gensio_2.2.8.bb => gensio_2.2.9.bb} (93%)

diff --git a/meta-oe/recipes-connectivity/gensio/gensio_2.2.8.bb b/meta-oe/recipes-connectivity/gensio/gensio_2.2.9.bb
similarity index 93%
rename from meta-oe/recipes-connectivity/gensio/gensio_2.2.8.bb
rename to meta-oe/recipes-connectivity/gensio/gensio_2.2.9.bb
index a2478dd54e..fb83361856 100644
--- a/meta-oe/recipes-connectivity/gensio/gensio_2.2.8.bb
+++ b/meta-oe/recipes-connectivity/gensio/gensio_2.2.9.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a0fd36908af843bcee10cb6dfc47fa67 \
                     file://COPYING;md5=bae3019b4c6dc4138c217864bd04331f \
                     "
 
-SRCREV = "78b30dc952512c98db8c2e7e0eded2982b802b93"
+SRCREV = "343ccf17ce656203b6b5513f4b7962f45d37b589"
 
 SRC_URI = "git://github.com/cminyard/gensio;protocol=https;branch=2.2.x"
 
-- 
2.25.1

