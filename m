Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 951C7C433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 10:25:23 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.8400.1644488722362113739
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Feb 2022 02:25:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=FigXxtqG;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644488720; i=@fujitsu.com;
	bh=oDmxw3UF+p/uqOOwFx3aXs27dVRjFLlDB95icW4IVfw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=FigXxtqGHlCIXN+5TSt8TVfkW3yOpRRF46aG5M+OYojuQBeefYYr0XpIWTsZOcXvv
	 LRpKOmz7/a/L5JzEr40k4go9P8DHXFv7VfC90S6lBKnZbGDWyXujc4O+zkvoGtjljk
	 BebDUBuJic6IAOyXFPwBw+taCtl+Al3YzoZ2UbqDUPe5NcogN3uQVe2AAYNLZLmgcZ
	 uj0WM1E3Ag+ru1TsdKDNqW5bCybpi02/DsHgpUnifZHy8qB8z76rJnYgnfnojfO+it
	 GAQ/IrJRIDthXoqn2Q19mpA570cpLQc3vBpLFGxGWja0OXqbx2AgfIMijG9xogitsq
	 dkQxAqK5b8wkQ==
Received: from [100.115.37.210] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-2.aws.ess.symcld.net id 7B/E3-29321-018E4026;
 Thu, 10 Feb 2022 10:25:20 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8MRoivwgiX
  JYP9vPouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPGnUlsBf1cFU9ebGdrYFzB2cXIxSEkMJNJ
  YvXdicwQzklGia/du1m6GDk52ATUJR7ffM0IYosI6Essnb2HGcRmFlCV6L64hh3EFhaIllh7v
  4MJxGYBik85uYcVxOYVcJNo+XcBLC4hoCAx5eF7sF5OAXeJuW//sYHYQkA1j7d9ZYOoF5Q4Of
  MJC8R8CYmDL14wQ/QqSZxY8RFqToXE68OXmCcw8s9C0jILScsCRqZVjNZJRZnpGSW5iZk5uoY
  GBrqGhqa6xia6RoYWeolVuol6qaW65anFJbpGeonlxXqpxcV6xZW5yTkpenmpJZsYgWGZUqx0
  awfjhlU/9Q4xSnIwKYnyBp1jSRLiS8pPqcxILM6ILyrNSS0+xCjDwaEkwTvvAlBOsCg1PbUiL
  TMHGCMwaQkOHiUR3te3gdK8xQWJucWZ6RCpU4yKUuK8W58BJQRAEhmleXBtsLi8xCgrJczLyM
  DAIMRTkFqUm1mCKv+KUZyDUUmYVwZkCk9mXgnc9FdAi5mAFm+bzgSyuCQRISXVwFTs312xM5m
  xRti1+O6vnwncau8cL2iLfbISq5Pqmnraah+X3c7D3WYT72SWbHRdd2DliYtLvsnOO7Od/dP1
  qXPOL3tc8vppuFkU25PqdyYeC+or23se3r/AqLDikcdR10tfeiuefDSXVwnRCBMs+SrWtpDXy
  HLxgm37rdSsb+lkCe2ZM+tOdPzhgEe1+92fFGvmRKx4oiD1UWRlrNLyyb0nQ75ND+v+fmGGVp
  br2z6GjZm907Wnqf8MuPnd7ECm1jNp23vpAXN1tzB3rpVrYJ3tlGOlP1Ei5OqrklvHnLS2fIp
  4fvrgn4+hC3K2y61Z1nI7+L/eor1S90pNcw/5SFqvPc+b/yH02LfuuGrvD5ZKLMUZiYZazEXF
  iQAGCwgiRgMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-15.tower-548.messagelabs.com!1644488720!7471!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20885 invoked from network); 10 Feb 2022 10:25:20 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-15.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Feb 2022 10:25:20 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 21AAPCmR004140
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Feb 2022 10:25:19 GMT
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Thu, 10 Feb 2022 10:25:13 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [PATCH 5/5] [oe] [meta-python] [PATCH] python3-pyopenssl: upgrade
 21.0.0 -> 22.0.0
Date: Thu, 10 Feb 2022 18:25:39 +0800
Message-ID: <1644488739-3593-5-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1644488739-3593-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1644488739-3593-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Feb 2022 10:25:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95283

From: Xu Huan <xuhuan.fnst@fujitsu.com>

changelog:
Drop support for Python 2.7. #1047
The minimum cryptography version is now 35.0.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...{python3-pyopenssl_21.0.0.bb => python3-pyopenssl_22.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyopenssl_21.0.0.bb => python3-pyopenssl_22.0.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pyopenssl_21.0.0.bb b/meta-python/recipes-devtools/python/python3-pyopenssl_22.0.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pyopenssl_21.0.0.bb
rename to meta-python/recipes-devtools/python/python3-pyopenssl_22.0.0.bb
index a7e0ae4b14..db0e809ef5 100644
--- a/meta-python/recipes-devtools/python/python3-pyopenssl_21.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyopenssl_22.0.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS += "openssl ${PYTHON_PN}-cryptography"
 
-SRC_URI[sha256sum] = "5e2d8c5e46d0d865ae933bef5230090bdaf5506281e9eec60fa250ee80600cb3"
+SRC_URI[sha256sum] = "660b1b1425aac4a1bea1d94168a85d99f0b3144c869dd4390d27629d0087f1bf"
 
 PYPI_PACKAGE = "pyOpenSSL"
 inherit pypi setuptools3
-- 
2.25.1


