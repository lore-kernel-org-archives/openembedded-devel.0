Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB7C1C433FE
	for <webhook@archiver.kernel.org>; Wed, 22 Dec 2021 07:02:44 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.16421.1640156563447468392
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Dec 2021 23:02:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=si+CONO/;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1640156561; i=@fujitsu.com;
	bh=ZN1SbBZacqxhTVl8JVdDky7vZ4FngFHbo6bOsTKxvK8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=si+CONO/z/l+zpnIu9XIPBZcbFgsDnFfT6nhvJ1Uu4T7nT31Anjc42JDtrnooP7SS
	 C8Sy8IjqdJQkz8Er/9vgqJD0Xzb8DWXXX4njqfARXJApRGUHgldKV0QnORWeH5v2IO
	 sfAkmbMUL7j3PCfm9LwMFqlEhMP7W59hX1r/3AFED1/FiiYOCmFrZUpJww7J/e13g6
	 6j+0ofE3CK23C8a3g2UyC/R0fJ+IF9xhtZvHf0iZXIvFnXf6q4JNuwZeq1U00bIL5D
	 f60aY4GLOpKr8EXYU4+LxOPVLUPRNXrGp3W2EC0DB8r+O4er26fXuSMPhO5yFwYmfP
	 XkJRksrqRlplg==
Received: from [100.115.70.228] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 CE/D3-31213-19DC2C16; Wed, 22 Dec 2021 07:02:41 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOIsWRWlGSWpSXmKPExsViZ8ORqDvh7KF
  Eg3VfrC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ow95z+xFtzlrlh7dC1LA+NVri5GLg4hgSeM
  EsffX2KHcC4wSbw9eI4JwjnJKLF+6WO2LkZODjYBdYnHN18zgtgiAvoSS2fvYQaxmQVUJbovr
  mEHsYUFPCT+L9/GCmKzAMW//3vNBGLzCrhLvN1zFKxXQkBBYsrD98wQcUGJkzOfsEDMkZA4+O
  IFM0SNksSJFR+ZIOwKideHL0HF1SSuntvEPIGRfxaS9llI2hcwMq1itEsqykzPKMlNzMzRNTQ
  w0DU0NNU1M9M1tDTUS6zSTdRLLdVNTs0rKUoESusllhfrpRYX6xVX5ibnpOjlpZZsYgSGZ0qx
  0/4djE/7fuodYpTkYFIS5eV6fTBRiC8pP6UyI7E4I76oNCe1+BCjDAeHkgRvzclDiUKCRanpq
  RVpmTnAWIFJS3DwKInwZp0GSvMWFyTmFmemQ6ROMSpKifPOPwOUEABJZJTmwbXB4vMSo6yUMC
  8jAwODEE9BalFuZgmq/CtGcQ5GJWHeLJApPJl5JXDTXwEtZgJarBS+H2RxSSJCSqqBactWdZM
  bh7f8Wa32mjma0dNoVezMZJ29ns4My1esqTT/zuTm97bfrsr7NsfFf4sl2P9wbuG679NwkXma
  3K61F36bSvq/nDFZZ8rUWTZaaZ2SMx+tXROfudpMKeKtTlZah3TwlO5eTT3rFfxWnc+OHTg4X
  7Kb8VGj3d9Pn98q50+tc/S+o52Ud+tO44HVsQYsHMcYP6s8Wyv099PfJcqsRQLH2E/d+5j0U6
  lb/1ZU9bN1c7ik7c5GfuH6VNGac3vPo2zP2GvfL1X3PW1kZhPh2NrScXaDhkCp7ueVx3vPvLU
  7r/75Vd5cw4dq7JlJ88yfTmaoVEu4bMne2Ht8xctDc4RVPE/UVKuV3pyxXu/kJyWW4oxEQy3m
  ouJEAAznP7NKAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-5.tower-545.messagelabs.com!1640156560!46728!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16534 invoked from network); 22 Dec 2021 07:02:40 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-5.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Dec 2021 07:02:40 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 712B6100192
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Dec 2021 07:02:40 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 64840100189
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Dec 2021 07:02:40 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Wed, 22 Dec 2021 07:02:18 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-huey: upgrade 2.4.1 -> 2.4.2
Date: Wed, 22 Dec 2021 15:01:17 +0800
Message-ID: <1640156479-18846-1-git-send-email-xuhuan.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Dec 2021 07:02:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94479

From: Xu Huan <xuhuan.fnst@fujitsu.com>

changelog:
=============================================================================
Fix implementation of schedule-pop Lua script so it works with Redis cluster.
Ensure Django connections are closed before and after (previously they were
only closed after) task execution with db_task() and db_periodic_task().
Allow additional lock-names to be specified when flushing locks.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/{python3-huey_2.4.1.bb => python3-huey_2.4.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-huey_2.4.1.bb => python3-huey_2.4.2.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-huey_2.4.1.bb b/meta-python/recipes-devtools/python/python3-huey_2.4.2.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-huey_2.4.1.bb
rename to meta-python/recipes-devtools/python/python3-huey_2.4.2.bb
index 64bd8880ec..865e9ff772 100644
--- a/meta-python/recipes-devtools/python/python3-huey_2.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-huey_2.4.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5cac039fcc82f01141cc170b48f315d4"
 
 PYPI_PACKAGE = "huey"
 
-SRC_URI[sha256sum] = "bd55e90746cec16e7a61d6dc60d4591c74cba59000dca96c387a4d4eee1395f6"
+SRC_URI[sha256sum] = "20683288e27e851f786b38465784c5d0e7e2b93b8791cc826898f9555a320cb4"
 
 RDEPENDS:${PN} += " \
 	python3-datetime \
-- 
2.25.1


