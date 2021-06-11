Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.3348.1623379395620538009
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Jun 2021 19:43:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=rrBUkULd;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623379393; i=@fujitsu.com;
	bh=yIVgpwtknrxzkHztCSK9qM87u4YkJ09CuXGRJEjy1RE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=rrBUkULdg43FhaEqKJbMsC/bur/AtX9wA25ZW3S7fdRgc6Z/8tBqVi/puFmAutt6U
	 mUR8/KBBezsEqO30GZiteA8HnRbVDbKZoEN4g5h2/gMKNCdFCHvv0HI6aO2sihQofo
	 ND26PjOxsowwH0ELC+qk45nPQlfgfR1VGBYzqBvGGp+X4N7x3DW4OUNSCBnaw1aB7Y
	 K7oyI66lzVPoQBxq/WZhyII/1mefnM7mcQIKKq2pKxL+aIoUuYiryKptxtU9o1HfBR
	 RtQirZX8v3/PBETvRZhB7pD0nFlwGeoGO3sus+TBk57jOoZE4+VeoB/5Nquj/g1v3P
	 UhsKag3YZBCNg==
Received: from [100.112.199.57] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-west-1.aws.symcld.net id A1/D6-00056-1CDC2C06; Fri, 11 Jun 2021 02:43:13 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRWlGSWpSXmKPExsViZ8MRonvw7KE
  EgyPnuSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1ozdn7azFnzirOh+eYK1gXEGZxcjF4eQwGwm
  ibkPrjJDOCcYJV5dm8jUxcjJwSagI9HxopsFxBYR0JdYOnsPM4gtLOAqMen6AzCbRUBVYtWb2
  YwgNq+Au8T8twfZQGwJAQWJKQ/fM0PEBSVOznwCNodZQELi4IsXzBA1ihLbd55hgbArJGbM2M
  Y2gZFnFpKWWUhaFjAyrWK0SCrKTM8oyU3MzNE1NDDQNTQ00jW0NNc1NDbXS6zSTdJLLdUtTy0
  u0TXUSywv1iuuzE3OSdHLSy3ZxAgMpJSCo507GH+9+qB3iFGSg0lJlDfn4KEEIb6k/JTKjMTi
  jPii0pzU4kOMMhwcShK86meAcoJFqempFWmZOcCghklLcPAoifBmHwdK8xYXJOYWZ6ZDpE4xh
  nO8WbtkETPHWzDZdu8ukGwHkzMXHFzNzDELTN5vPwQkH4BIIZa8/LxUKXFeDpBtAiDjMkrz4J
  bBovYSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWFeWZApPJl5JXA3vQI6lwnoXGYNsHNLEhF
  SUg1Mh1/+WXqp/vXp/N6DMsGBU2RS35socnwJFCuXvXSeN8HiGYtS0iXJjM3nd5qaX4y/lVFh
  MHHzjSjRxi0v3t/1NtA/J3LJbFuH8DzN7b2nrrz7et1HzeTfJzujo0dPv+P6b29/YeXejfGiA
  qcV/sobXX3yVpUpbwerm4bhPtlfmhdeTF61seZmk5fVhRJezvfxqxfx1Py3ZjzmdCRcIj0h9p
  mhtEnBlu18zz30EhMKGaeZrxT+MOvHXonFq7+WSk22f3C8s8I6xUx1t6vZY/u4yw0ZIvqi6ob
  Wqfqne3Vy6n6d3hMv4eov8bScs6Kw28YxcXfH9tl6HTbyzer7eBl/x0y5LmEgfeBlvtnur6xK
  LMUZiYZazEXFiQB7lMSOVQMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-9.tower-291.messagelabs.com!1623379392!34447!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19082 invoked from network); 11 Jun 2021 02:43:13 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-9.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 11 Jun 2021 02:43:13 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15B2h7Yx018439
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Jun 2021 03:43:12 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 11 Jun 2021 03:43:05 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] speedtest-cli: upgrade 2.1.2 -> 2.1.3
Date: Fri, 11 Jun 2021 10:42:56 +0800
Message-ID: <1623379376-46033-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../{speedtest-cli_2.1.2.bb => speedtest-cli_2.1.3.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/dynamic-layers/meta-python/recipes-benchmark/speedtest-cli/{speedtest-cli_2.1.2.bb => speedtest-cli_2.1.3.bb} (87%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-benchmark/speedtest-cli/speedtest-cli_2.1.2.bb b/meta-oe/dynamic-layers/meta-python/recipes-benchmark/speedtest-cli/speedtest-cli_2.1.3.bb
similarity index 87%
rename from meta-oe/dynamic-layers/meta-python/recipes-benchmark/speedtest-cli/speedtest-cli_2.1.2.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-benchmark/speedtest-cli/speedtest-cli_2.1.3.bb
index de4fa16426..949b45ba8e 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-benchmark/speedtest-cli/speedtest-cli_2.1.2.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-benchmark/speedtest-cli/speedtest-cli_2.1.3.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 inherit setuptools3
 
 SRC_URI = "git://github.com/sivel/speedtest-cli.git"
-SRCREV = "c58ad3367bf27f4b4a4d5b1bca29ebd574731c5d"
+SRCREV = "42e96b13dda2afabbcec2622612d13495a415caa"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

