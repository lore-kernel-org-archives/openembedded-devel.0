Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1AF7C433F5
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 08:07:52 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web11.9092.1638518871056736373
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Dec 2021 00:07:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=DdrOHBzq;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1638518868; i=@fujitsu.com;
	bh=sxPM3WNb5dSDR2CndjlJiHnuiz1vZCisRcqtDU7KRVc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=DdrOHBzqB9d2tsXuD0pKiK3UyV0iv4MDJFBHEMu3ApAJpUw/2c8Kd+JrZUisVcInw
	 uMVFVdXpBGTAzRvgdSkdTl39RPwRBmAXow/kHv7BUcXGx8IAgnfl60/HqFPqQLJvqh
	 tPY9MazXFhKK2ha6tXrH155wmbrtwU/SzXFjEPrJgILavzsHl5bJXWcaGi232K+4Z1
	 clORW+maOc/2LyAoGqKqbpxyFfPYSIf0xBx3paFxN4k7FlrBE/a2jqzd4Y8uSjRyVa
	 uPWYVLQ8zBx7Nwu+HWCMgrTk3f1WKmPdchVUUvl+uC7lEAdejhNKcDjwFf2dwB9RWT
	 CrUnfHkNsxGTQ==
Received: from [100.115.2.64] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.ess.symcld.net id 4E/94-12056-450D9A16;
 Fri, 03 Dec 2021 08:07:48 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8ORqBtyYWW
  iwd49/BYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aFxcuZC/bwVkw58paxgXEOTxcjF4eQwBNG
  iQvPmlghnAtMEocmTWaCcE4wSnz5dZq5i5GTg01AXeLxzdeMILaIgL7E0tl7wOLMAqoS3RfXs
  IPYwgJ+Eh9uzgeLswioSFx4eg4szivgLjHxzwsmEFtCQEFiysP3zBBxQYmTM5+wQMyRkDj44g
  UzRI2SxIkVH6HqKyReH74EFVeTuHpuE/MERv5ZSNpnIWlfwMi0itEqqSgzPaMkNzEzR9fQwED
  X0NBU11jX0NJSL7FKN1EvtVS3PLW4RNdQL7G8WC+1uFivuDI3OSdFLy+1ZBMjMCxTipmP72Cc
  0vdT7xCjJAeTkiivq/zKRCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvHVngXKCRanpqRVpmTnAG
  IFJS3DwKInw/gJJ8xYXJOYWZ6ZDpE4xKkqJ80afB0oIgCQySvPg2mBxeYlRVkqYl5GBgUGIpy
  C1KDezBFX+FaM4B6OSMG8WyBSezLwSuOmvgBYzAS0+PGs5yOKSRISUVAPTcVXfNe+f30zR5zf
  mUGILCb6WN2Ox8fsfuc6c3ydMWJX9doJUS63rRT5FUV8x9k3Ga3Venz6z48aM0Fs3VLXtYh7Z
  xtfp7G3dUNiv1ZTb+DTabDvv4je31V14JlV6rLvwJeeCWcbK4xt/qvqZOL57ymLH+33hop+57
  DeOyq+O/1l6VI3/2QqvL/s5RL1PGd/95FG7XPN/qLX17RliN233qoo/YHnzhm32qXj76oW2ve
  En5guteTkpa7ZOy3yRRuf+g0Ulspu2uWaXa8umH4qznJB/JEDy7p+XZes/tZ77vXXjVGF3AZO
  cBx/umJTJzpybFna5rcqh+99Cvh0rJmoofjz2YrL+71MylYqlSyX3KrEUZyQaajEXFScCAIrq
  mtlGAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-16.tower-585.messagelabs.com!1638518868!88030!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26205 invoked from network); 3 Dec 2021 08:07:48 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-16.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 3 Dec 2021 08:07:48 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id C672610022F
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  3 Dec 2021 08:07:47 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id BAD9A10022D
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  3 Dec 2021 08:07:47 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Fri, 3 Dec 2021 08:07:26 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH v2] python3-pycparser: upgrade 2.20 -> 2.21
Date: Fri, 3 Dec 2021 16:07:03 +0800
Message-ID: <1638518823-24314-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Dec 2021 08:07:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94195

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Lisence-Update:
year updated to 2020

changelog:
=================================================================
  - Much improved support for C11 (multiple PRs)
  - Support for parehthesized compount statements
  - Support for modern Python versions (3.9 and 3.10)
  - Fix support for structs with nested enums
  - Multiple small bug fixes

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-pycparser_2.20.bb => python3-pycparser_2.21.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pycparser_2.20.bb => python3-pycparser_2.21.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-pycparser_2.20.bb b/meta-python/recipes-devtools/python/python3-pycparser_2.21.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-pycparser_2.20.bb
rename to meta-python/recipes-devtools/python/python3-pycparser_2.21.bb
index fde868a701..53b7367903 100644
--- a/meta-python/recipes-devtools/python/python3-pycparser_2.20.bb
+++ b/meta-python/recipes-devtools/python/python3-pycparser_2.21.bb
@@ -1,10 +1,9 @@
 SUMMARY = "Parser of the C language, written in pure Python"
 HOMEPAGE = "https://github.com/eliben/pycparser"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=86f1cedb4e6410a88ce8e30b91079169"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2c28cdeabcb88f5843d934381b4b4fea"
 
-SRC_URI[md5sum] = "b8f88de737db8c346ee8d31c07c7a25a"
-SRC_URI[sha256sum] = "2d475327684562c3a96cc71adf7dc8c4f0565175cf86b6d7a404ff4c771f15f0"
+SRC_URI[sha256sum] = "e644fdec12f7872f86c58ff790da456218b10f863970249516d60a5eaca77206"
 
 inherit pypi setuptools3
 
-- 
2.25.1


