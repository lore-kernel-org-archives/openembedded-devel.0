Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.5])
 by mx.groups.io with SMTP id smtpd.web10.2941.1626416872865561488
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jul 2021 23:27:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=abWxVPOd;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.5, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1626416870; i=@fujitsu.com;
	bh=vconBdD2JBGQ9FAYsKWPWxlQyC5Y8AJg2oEOjiVHstg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=abWxVPOdBkiUiNBjPkQ87ZB7sVK8Jqnrqm2jgk+NpSVDCk1dWtIvihzCtQ4dKL3ZN
	 1R1blTF2C0k5A3yqmQFskmOStkl0qRKMPvwjZS1v0rsLD1wzWKVaQewhTivNUWiaks
	 wEyJLhnZjTg/sMo6zVqAH29x+bI7hcoQ7Gl34PHWs8eCUeg+jwx4xxRF9crOdvagSv
	 KPLbyB5XqOwhLmjXCCAqJ2UknPy+djmH4lEmonyEAN4WrCJxW7Wt1jD5mghe+8KzJK
	 LCKkA0ibce2oYFNYdvcbSgqgh0LoNwH/FE/xSoMfeNFjD8kb5+KfZBwbqwYVhegXZl
	 lmm4mBIrRZmNg==
Received: from [100.113.3.92] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-central-1.aws.symcld.net id A4/0C-07211-5E621F06; Fri, 16 Jul 2021 06:27:49 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+GYqvtU7WO
  CwY0X0hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8anndfZCu5zVuz+IdHA+J+ji5GLQ0hgG5PE
  0m0b2bsYOYGcvYwSU+75gNhsAroS5x6vBYuLCOhLLJ29hxnEFhbwlJg09StYnEVAVeLsxvWsI
  DYvUPzu7HNgcQkBBYkpD98zQ8QFJU7OfMICYjMLSEgcfPECKM4BVKMoMXu6PER5pcSeWf1MEx
  h5ZiHpmIWkYwEj0ypGy6SizPSMktzEzBxdQwMDXUNDY11jXUNLE73EKt1EvdRS3eTUvJKiRKC
  sXmJ5sV5xZW5yTopeXmrJJkZgEKUUMh/awfjk9Qe9Q4ySHExKoryXP39IEOJLyk+pzEgszogv
  Ks1JLT7EKMPBoSTB66nwMUFIsCg1PbUiLTMHGNAwaQkOHiURXjWQNG9xQWJucWY6ROoUo6KUO
  O9UVaCEAEgiozQPrg0WRZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfM+VwKawpOZVwI3/R
  XQYiagxdpr3oIsLklESEk1MN3qmvDBXjWqUSSyNJG1tcdP/XZlKXvHHpnPfdlBk01OFW+63cj
  osDjprcWbpm+P1qjs/G7HuKxUOdVnofPZc5Mr8yr+vbws3srrP9WMpTHyCsel84tjQ/TvW30o
  PmxxK1lmnuVLi2dr74ftdnR5XOR5gO15hLOwRIq8TvsG6crQl79/Hf2lX/EqZcunxTUzVswO8
  8m49Vj2dc3vxSUWP/do3PBUaNicUrh/1j7FPLuYzQ93GMyV0r627j1feu0fpXuVfyZmR8jJ5N
  38oHVj2u2HHUfL71T+uvyGP2OD2Vw+jXMnZjTNvpJ1Q8Z7f8Ryz7XHXD0WHpnzwX7m/31Hwxi
  OKu1Yfsrj/6r7P7TE1LSUWIozEg21mIuKEwGZ2YylHQMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-226.messagelabs.com!1626416868!45352!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1588 invoked from network); 16 Jul 2021 06:27:49 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-11.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Jul 2021 06:27:49 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16G6RmEk015363
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jul 2021 07:27:48 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 16 Jul 2021 07:27:46 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-pytun: upgrade 2.3.0 -> 2.4.1
Date: Fri, 16 Jul 2021 14:27:43 +0800
Message-ID: <1626416863-107423-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-pytun_2.3.0.bb => python3-pytun_2.4.1.bb}         | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-connectivity/python3-pytun/{python3-pytun_2.3.0.bb => python3-pytun_2.4.1.bb} (57%)

diff --git a/meta-python/recipes-connectivity/python3-pytun/python3-pytun_2.3.0.bb b/meta-python/recipes-connectivity/python3-pytun/python3-pytun_2.4.1.bb
similarity index 57%
rename from meta-python/recipes-connectivity/python3-pytun/python3-pytun_2.3.0.bb
rename to meta-python/recipes-connectivity/python3-pytun/python3-pytun_2.4.1.bb
index bc11d705f4..08ec2cf670 100644
--- a/meta-python/recipes-connectivity/python3-pytun/python3-pytun_2.3.0.bb
+++ b/meta-python/recipes-connectivity/python3-pytun/python3-pytun_2.4.1.bb
@@ -2,8 +2,7 @@ SUMMARY = "Python TUN/TAP tunnel module"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=13f7629e8e4989b66b4a913ab05a91de"
 
-SRC_URI[md5sum] = "adcaeea56d0ed06814487cdbde32d198"
-SRC_URI[sha256sum] = "5ead86b3391acef239535ebcabeb04d2cdc6b40ab14580d28c6da193c2d1fe53"
+SRC_URI[sha256sum] = "20b53ea7a09dfe173c00ec0a00eea508b05e959f5dc4b4bb698aa52252192f8f"
 
 PYPI_PACKAGE = "python-pytun"
 
-- 
2.25.1

