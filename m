Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4239C07E9D
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 08:21:52 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web08.8240.1664266909863729606
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 01:21:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=e212Q2K3;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1664266908; i=@fujitsu.com;
	bh=m2QSGDdkvOb8VnL9L0oGFuzcoUe7Yk41y7j0M0xEwBQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=e212Q2K3Cxdx5fVOfecWOHnhFuEdXflbx/3tdpla7/bSmNh4oWfpbrtLKawBiaypl
	 9qrJH9OhigfYsbICjE1RfjgmcrC/6sdgtX/o+GBk/Ui4Y2GER9kBEmUMvu6X3KpUCN
	 y+2a+a57HX+eq7EaOhOoyNaGnOoR2xoLyY69Z5FbaK/UFvuPZjtf9oJANC/Yk8zRzT
	 DBlmY8MEe+U0ycLF218vHiNbhkrQDgNOuEbJ/6HHZ4aINpEUP4KINkk9V1D/4RsWe+
	 Q6POcoxLFzhWD8NM1ks35bm2fXW8ufFCJ2Pca+isec6gTaVbIVFstx5ptCDJc0urgp
	 AdPNO7uoXGyCw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8ORpDtzk1G
  ywf7dnBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bK77NYCxZyVjTNWcbWwLiLo4uRk0NI4CGj
  xJEpzl2MXED2FSaJWwdvsUI4exglpl2fxgRSxSagJjH91g1WEFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrBAsMSc/zMYQWwWAVWJt4fmgPXyCjhKbN+9gw3ElhBQkJjy8D0zRFxQ4uTMJywQcyQkDr
  54wQxRoygx+3IzC4RdIdE4/RAThK0mcfXcJuYJjPyzkLTPQtK+gJFpFaN1UlFmekZJbmJmjq6
  hgYGuoaGprrGFrqGJgV5ilW6iXmqpbnlqcYmukV5iebFeanGxXnFlbnJOil5easkmRmBYphSr
  9exgPLHqp94hRkkOJiVRXvtFRslCfEn5KZUZicUZ8UWlOanFhxhlODiUJHiZ1gPlBItS01Mr0
  jJzgDECk5bg4FES4V23BCjNW1yQmFucmQ6ROsVoybG24cBeZo6rV64AyZlf2w4wC7Hk5eelSo
  nzztwI1CAA0pBRmgc3DhbHlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ8y5dCzSFJzOvBG7
  rK6CDmIAOsuPTBzmoJBEhJdXAFBO7xU4rR0w743b5RBs904N7zr+ozN6+O2qjSshnfpmjbTf6
  tnHO3yky7TiDTcfrD4+y85xXx80UPvnM6d+l0p2G1paLPZPK9k/P9kkv+3tua6Ph7s+KW7Ir/
  FN3zbJ6KVK1b+LZNywMftO195o9POe2+1juP3enfY+3ZO7dl+HqqVYy/cWWRI/48KDEkqCs4t
  lPvOdEr9k1g8dTKHWWzp+uaysa51zNjRRZZLazasL+x/J5H/WSE5n3MVQI6MSk+5TEcDKvuPB
  EcKao1PPyGK19C0MDdKP55NPMZy9NN5o/Za/UaYeDsTw33PYeev3HuD/fafMFzXkvNaZvSdx/
  63v6/uZ4L8Uude4Gxl8+SizFGYmGWsxFxYkAwKkOKV4DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-571.messagelabs.com!1664266905!444640!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13932 invoked from network); 27 Sep 2022 08:21:45 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-9.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Sep 2022 08:21:45 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id D17D21AB
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 09:21:44 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id C680B1B1
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 09:21:44 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 27 Sep 2022 09:21:43 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-filesystems] [PATCH] xfstests: upgrade 2022.08.21 ->
 2022.09.04
Date: Tue, 27 Sep 2022 16:21:19 +0800
Message-ID: <1664266883-2234-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Sep 2022 08:21:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98964

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xfstests/{xfstests_2022.08.21.bb => xfstests_2022.09.04.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/xfstests/{xfstests_2022.08.21.bb => xfstests_2022.09.04.bb} (97%)

diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_2022.08.21.bb b/meta-filesystems/recipes-utils/xfstests/xfstests_2022.09.04.bb
similarity index 97%
rename from meta-filesystems/recipes-utils/xfstests/xfstests_2022.08.21.bb
rename to meta-filesystems/recipes-utils/xfstests/xfstests_2022.09.04.bb
index d8caa13ba8..90f49f76d4 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests_2022.08.21.bb
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests_2022.09.04.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=master;na
            file://0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch \
            "
 
-SRCREV_xfstests = "bf1ef26900eec3b028c1b0f55f65b3b233e47c56"
+SRCREV_xfstests = "890c50823b6430bf0929d9a57e76b9b4d6bbc25f"
 SRCREV_unionmount = "e3825b16b46f4c4574a1a69909944c059835f914"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


