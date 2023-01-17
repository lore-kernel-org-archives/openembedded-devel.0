Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE63C3DA78
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 07:24:52 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.191106.1673940288819103177
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 23:24:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=c6PTkOVF;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673940287; i=@fujitsu.com;
	bh=iZJ9PrExRw/Ltxol/jb4e6swNZi9VdwH9gfEl91AzXA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=c6PTkOVFobuVPouEYcxErKPnWvtHVETqjpYD4QUPEpyljlz2aoNhm+bog5TRJ3AaD
	 2ysW/qlt7ZrW+z1Gt8OVPS0pAbRFfNmcDppQqWnTRVrYoRM4ep0juTXlvjw085fQs8
	 SFQSEuyRYDoG2o9N30dlPsOeigGMYDQIjQBXD0AVvWYGWEP+HS7JjMdV48fUo6xEiE
	 Fj47JBVoFXXzYM076BsCQZaLkll25s74j/A12T8vu4eWIkt5RjeMJxl9ocs56QfCRD
	 8Ugs6sJQfiwhtvGcRYHlVfwKmsn64+CqMmaZBekfn4wBdoulV0cmSmhhEFUR7FZ12I
	 r+QsArrNa2AAw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8ORqGvneyz
  ZYNkOSYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPHz4vMBQ+4K3Zs/cLSwHiFq4uRi0NI4Amj
  xLGt35ggnBtMEte/9bFAOHsZJWbeWcvYxcjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAp8TbPy/B6lkEVCVW/PgAVsMr4CSx9uNzMFtCQEFiysP3YDangLPEwV27mEBsIaCaP3
  dPQ9ULSpyc+YQFYr6ExMEXL6B6FSVmX25mgbArJVo//IKy1SSuntvEPIFRcBaS9llI2hcwMq1
  iNC9OLSpLLdI1NNZLKspMzyjJTczM0Uus0k3USy3VzcsvKsnQNdRLLC/WSy0u1iuuzE3OSdHL
  Sy3ZxAgM4JTiVIkdjA3L/+gdYpTkYFIS5T1peixZiC8pP6UyI7E4I76oNCe1+BCjDAeHkgTvK
  S+gnGBRanpqRVpmDjCaYNISHDxKIrzhlkBp3uKCxNzizHSI1ClGRSlx3sPeQAkBkERGaR5cGy
  yCLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5nUEmcKTmVcCN/0V0GImoMUeJUdBFpckIqS
  kGpgk/97KeuIr+nfp7Kqmfz5xG+RbTtYy2x66t7Gk6EeN59uT7NFhgs5HTk74/GDCqpsewYfr
  HLZ8CchoMokL+L4kfzITh+LuEg/Vmjf31ufNcA2bNqfvy98l8fEvpTc6sK+fbLjx9G7JwvR3U
  qytzO/sF7zuNwqIWzltY3SO1aFIwxyPl5PmdRtbWcqvWJLvGKOp9nA6z9N/MR8SbwU85wu+tZ
  HruV+sd/TbDSV/GeLtNzzeX33iWpt04qq9z1XXHn+/SuLd52+2t4UPfz+4ruvRekuPMjmNC/v
  yBc2a1d7nPHza53y4WvzCwv7jt3ZlMicY6y5t7YuXajt/ZMrn4nuqySk24rOcegMTf3nvmblX
  iaU4I9FQi7moOBEAUYuKM1sDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-728.messagelabs.com!1673940286!379343!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18201 invoked from network); 17 Jan 2023 07:24:46 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Jan 2023 07:24:46 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id D5423100195
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:24:45 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id C8AB5100182
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:24:45 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 17 Jan 2023 07:24:44 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-redis: upgrade 4.4.1 -> 4.4.2
Date: Tue, 17 Jan 2023 15:24:23 +0800
Message-ID: <1673940264-20487-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673940264-20487-1-git-send-email-wangmy@fujitsu.com>
References: <1673940264-20487-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:24:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100623

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Experimental Features
---------------------
 Add support for BF.CARD (#2545)

New Features
------------
 Add support for custom connection pool class in NodesManager (#2547)

Bug Fixes
---------
 Allow replica to master promotion in nodes_cache (#2549)
 Security Fix: Updating graph parser for potential injection cases (#2548)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-redis_4.4.1.bb => python3-redis_4.4.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-redis_4.4.1.bb => python3-redis_4.4.2.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-redis_4.4.1.bb b/meta-python/recipes-devtools/python/python3-redis_4.4.2.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-redis_4.4.1.bb
rename to meta-python/recipes-devtools/python/python3-redis_4.4.2.bb
index d805a6ef2..37c64b11f 100644
--- a/meta-python/recipes-devtools/python/python3-redis_4.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-redis_4.4.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://github.com/andymccurdy/redis-py"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1db1f331d351900707368237cc4880cf"
 
-SRC_URI[sha256sum] = "f7a870c44868ab87bbecd6211c6d7c8720b1e9a796b743fbc4725d7ec75651c3"
+SRC_URI[sha256sum] = "a010f6cb7378065040a02839c3f75c7e0fb37a87116fb4a95be82a95552776c7"
 
 inherit pypi setuptools3
 
-- 
2.25.1


