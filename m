Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9613DC47093
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:59 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web08.25383.1649651026583974210
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 21:23:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=lSkhB9fy;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649651024; i=@fujitsu.com;
	bh=iHEfAz7n50NVxrRcr2ueg+NF14nv3Wihx8i2ksCqD24=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=lSkhB9fyHaHElW6yPlf290twp0mMBkTjWiK0ne1EaHE71GJQA5J2y2jnR852GfRVC
	 8nJIIdpssPiww4Sr5U4BfIH/ca2i2XofsPKDvlHbU0F+2iQAsd4LiAGfq2VGaDUfq9
	 +WGfO0aKIwtbHrux+U3Oar5zmKLRwPo0SjXZm7v+R8+tliGW8UAkNVYgopEBlrOvd8
	 xGAGZ6LHe8BN4z0+dprShlrcwBjhDfC48Jw8kfYieQS1ZbhutUIVpbb39EnQwonUDm
	 qXmC3FNsJNA8ZFoJPJ7OcGAu5HCbz5Pt0Ozi/nTpKstxKKHhmQ3wIZLZGSs0T/Yupp
	 3DVvi/3qMRmjQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGIsWRWlGSWpSXmKPExsViZ8MRohuwNjj
  J4O9/DouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePLrz+MBf/ZK67s38fWwLiSvYuRi0NIYDaT
  xLPNd5khnD2MEmtW9gJlODnYBNQkpt+6wQpiiwjoSyydvYcZxGYWUJF48bsHrEZYwE7i1qZTY
  DYLUPzi7N1gNq+Ak8TN5nYWEFtCQEFiysP3YL2cAs4SX+/sYQKxhYBqNl6cxQJRLyhxcuYTFo
  j5EhIHX7xghuhVlJh9uRlqToXErFltTBMY+WchaZmFpGUBI9MqRrukosz0jJLcxMwcXUMDA11
  DQ1NdMzNdQwszvcQq3US91FLd5NS8kqJEoLReYnmxXmpxsV5xZW5yTopeXmrJJkZgcKYUO+3a
  wXiw76feIUZJDiYlUd7v4QFJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR45VcFJwkJFqWmp1akZ
  eYAIwUmLcHBoyTCG7AcKM1bXJCYW5yZDpE6xagoJc5bvhQoIQCSyCjNg2uDReclRlkpYV5GBg
  YGIZ6C1KLczBJU+VeM4hyMSsK80muApvBk5pXATX8FtJgJaHHotkCQxSWJCCmpBiapQ95Zts8
  rTZxu3m3K2aHVlqQjOnH75IeNqztqHiQ0TojRXboz6ZxuW9ufQ/O0Jrs9Upx1X6Z60d2QSdpy
  j6b02/3zXtE4LbHy661ran0fPvjLTzNPUTkwPc6WX3Iny/yK3UYTj9pszA4/J39D9V948IWeF
  JkLkS82+K9L/HxqstgHuc5pfz/Nr62MYKzLrZVaKB15P098d4Jk7P+4L5tfu2nf2sy7Oc/TzJ
  H/lsw/Veskz+yFSz8+3VdXbcnwVMN3kpuL9dcdybW9lVeuCls1PN4tF2wmIS2Q6yZ/jEfqVZv
  o2i17Vl1n+HrbKL0/qEL+QXGMyDa+E5uCd6j2HprDZdQdelKm+sHn+R3fpyuxFGckGmoxFxUn
  AgCdw9HNSQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-532.messagelabs.com!1649651023!231611!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8873 invoked from network); 11 Apr 2022 04:23:44 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-11.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 11 Apr 2022 04:23:44 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23B4NaLP007659
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Apr 2022 05:23:43 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 11 Apr 2022 05:23:40 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] hwdata: upgrade 0.357 -> 0.358
Date: Fri, 8 Apr 2022 19:20:11 +0800
Message-ID: <1649416811-29165-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1649416811-29165-1-git-send-email-wangmy@fujitsu.com>
References: <1649416811-29165-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96543

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/hwdata/{hwdata_0.357.bb => hwdata_0.358.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/hwdata/{hwdata_0.357.bb => hwdata_0.358.bb} (91%)

diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.357.bb b/meta-oe/recipes-support/hwdata/hwdata_0.358.bb
similarity index 91%
rename from meta-oe/recipes-support/hwdata/hwdata_0.357.bb
rename to meta-oe/recipes-support/hwdata/hwdata_0.358.bb
index 01ebf3c909..59513bbb9e 100644
--- a/meta-oe/recipes-support/hwdata/hwdata_0.357.bb
+++ b/meta-oe/recipes-support/hwdata/hwdata_0.358.bb
@@ -5,7 +5,7 @@ SECTION = "System/Base"
 LICENSE = "GPL-2.0-or-later | XFree86-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
-SRCREV = "f9e7eed1b85760028a5157986b3313c99c4d0225"
+SRCREV = "ae144d896eea90e527a57276accaf0da043c9f83"
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https"
 S = "${WORKDIR}/git"
 
-- 
2.25.1


