Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A0E7C77B60
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 03:21:59 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.42786.1682306509922091098
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Apr 2023 20:21:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=GbdADkKy;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1682306511; i=@fujitsu.com;
	bh=R87sWAgB81Wt5cCPz4DEIpUDek/+I0RBEjmn848LDb4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=GbdADkKyMDba48lCsBH4d1Sp+ApXgw9/TwOq/PUK5bTX4ql9+o5kFFGrGi43/npE9
	 QGOyHGaqV0/zFFlb6bdTzem2yPm9K1JPZCHPKXJ0MDe63FNSneNfg7/mGgqv7UxV6l
	 1rIMp4FxTgjYeBRxTG7DFziyMtiwSNbfQZOoNmgBfl0l2LmA95ug4LEzzWzZSUH3/F
	 Y8BrZ6DhFPr816hTRPA8ZOImaTWQAQYiTfo5mL6KqaJSQEpuy/zvWvTMNoBGlXSRLl
	 lonlSGPHBYTm365KAC0MeJo8FEB4k/pwD+zBnpGQ2UIkWyp19gU6ROvF+J17lu3z7e
	 n1LP6rh/SwHZw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpHv2q2u
  KweFjWhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bXgrNsBS+4KpqnPmVuYHzC2cXIxSEk8JBR
  4tCSH0xdjJxAzlUmiSVTjCASexkljj3bwQySYBOQkrhx/z8biC0ioC+xdPYesDizgIrEi9897
  CC2sICzxPpfnxhBbBYBVYnjlyexgNi8Ak4Sn5fvAFsgIaAgMeXhe7BeTqD6dyuPM0IsdpJ4Me
  MwM0S9oMTJmU9YIOZLSBx88YIZoldRYvblZhYIu1Ki9cMvKFtN4uq5TcwTGAVnIWmfhaR9ASP
  TKkaz4tSistQiXVO9pKLM9IyS3MTMHL3EKt1EvdRS3bz8opIMXUO9xPJivdTiYr3iytzknBS9
  vNSSTYzA4E0pTp66g/Hpzr96hxglOZiURHmXbHBJEeJLyk+pzEgszogvKs1JLT7EKMPBoSTBW
  /TJNUVIsCg1PbUiLTMHGEkwaQkOHiUR3mVfgNK8xQWJucWZ6RCpU4yKUuK8gSAJAZBERmkeXB
  ssei8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuaV/AA0hSczrwRu+iugxUxAi3dxu4AsLkl
  ESEk1MK0rySncvmjHjbqPSp5SDoUlgSfTOrxzNL6LfkhWLtXjXzA3elY9m8+mDZcjbmRdPBMb
  wsrcrXTuwLmw/M8tJ+wq3p5+pbeoZ7Y286Hp5VIzLFRCVP8Je2fH1sz9LcKrlPR93al/LbJ7w
  hepN195az735k8zVinXZwZ7Is9ufeWqPvXPqUDJS64XHD/PubTu31flzJ3unBZnP+1jsrKN/G
  n/zFvb+v0Se3nXs2bOxe/tpG5POcHN1rZE7PfvFeydl698cLl4+fNx6ZlXTPmOt2m+Vd0vFch
  +RvnM4g6J41O/OXg2ln+9o6q/u74q/clhgf3Kere8NJNN1RotCzkNj5pov9/z47NeaEPCChOF
  /0osxRmJhlrMRcWJABKvX/ZZAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-728.messagelabs.com!1682306509!289152!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15635 invoked from network); 24 Apr 2023 03:21:49 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-9.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Apr 2023 03:21:49 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 283871B5
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:21:49 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 1BD061AC
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:21:49 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 24 Apr 2023 04:21:47 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] c-periphery: upgrade 2.4.0 -> 2.4.1
Date: Mon, 24 Apr 2023 11:21:24 +0800
Message-ID: <1682306487-11783-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1682306487-11783-1-git-send-email-wangmy@fujitsu.com>
References: <1682306487-11783-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 03:21:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102155

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 * Fix realtime timestamp reporting for line events in gpio-cdev v2 implementation.

License-Update: Copyright year updated to 2023.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{c-periphery_2.4.0.bb => c-periphery_2.4.1.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/c-periphery/{c-periphery_2.4.0.bb => c-periphery_2.4.1.bb} (78%)

diff --git a/meta-oe/recipes-support/c-periphery/c-periphery_2.4.0.bb b/meta-oe/recipes-support/c-periphery/c-periphery_2.4.1.bb
similarity index 78%
rename from meta-oe/recipes-support/c-periphery/c-periphery_2.4.0.bb
rename to meta-oe/recipes-support/c-periphery/c-periphery_2.4.1.bb
index be8d18765..3379ba16e 100644
--- a/meta-oe/recipes-support/c-periphery/c-periphery_2.4.0.bb
+++ b/meta-oe/recipes-support/c-periphery/c-periphery_2.4.1.bb
@@ -6,10 +6,10 @@ HOMEPAGE = "https://github.com/vsergeev/c-periphery"
 SECTION = "libs"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4097ec544cf01e9c7cfc4bdf8e4ed887"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=be30d45bdc453f70a494c149c2168289"
 
 SRC_URI = "git://github.com/vsergeev/c-periphery;protocol=https;branch=master"
-SRCREV = "e9799b893ec77f97045544279f0cabd28323b0a3"
+SRCREV = "6c5302cf8255c9bb75e535c566a8f1d94cfded5d"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


