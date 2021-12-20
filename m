Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DCD4C433FE
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 15:02:27 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web12.6246.1640012545705985280
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Dec 2021 07:02:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=nGLMX3eZ;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1640012543; i=@fujitsu.com;
	bh=PmnObEtBrqDI68hv+8ZefrAv7ZM40xvDvutvF1EkEHg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=nGLMX3eZ5RPrvsRBJpHJ4jVSDweiOCgOS/6I7Isb/MrMx9TIJwojnwmg0mGjAPaKt
	 CfxiOp/zNO7viseqkPo6lxi6i3b0zfPU5nyWjxmcE+QzC62G1LikyrC+ASjoizDHjE
	 Wf9JjC0D4fiCpCPCTxMCEAZpEk/xUUrlZ6CQWf4Rsqz2p00YeZQv9n+ZE0/jTlQuWE
	 QPJ5Ff+u1OyMlrNWWHO58G0x/ZNUmRwU13BhTlAMvMbqyjXP/5gU7H57M+0G4dgLwB
	 5Y18pnn1WBqIq7ojETS8/+bXk8n34vb0/M+Aebu0WIm1rQDNbz9+EG28vz7u7kV5Sk
	 x9aeijNeyp2KQ==
Received: from [100.115.6.23] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.ess.symcld.net id D9/AE-14524-FFA90C16;
 Mon, 20 Dec 2021 15:02:23 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8ORqPt/1oF
  Eg9dTmS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oxrPw4wFkxlr2hf2M/YwHiIrYuRi0NI4Amj
  xNm5axkhnAtMEu8+NDBBOCcYJY73LwQq4+RgE1CTmH7rBiuILSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBS4vy3RSxdjBwcLAKqEiv6hUDCvAKOEn+2bGMBsSUEFCSmPHzPDBEXlDg58wkLxBgJiY
  MvXjBD1ChKzL7cDFVfITFrVhsThK0mcfXcJuYJjPyzkLTPQtK+gJFpFaNVUlFmekZJbmJmjq6
  hgYGuoaGprqGukaG5XmKVbqJeaqlueWpxia6hXmJ5sV5qcbFecWVuck6KXl5qySZGYFCmFDPe
  3MHY2vdT7xCjJAeTkigvv++BRCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvD9nAOUEi1LTUyvSM
  nOAEQKTluDgURLhbQJJ8xYXJOYWZ6ZDpE4xKkqJ88YB40pIACSRUZoH1waLykuMslLCvIwMDA
  xCPAWpRbmZJajyrxjFORiVhHnTQabwZOaVwE1/BbSYCWixUvh+kMUliQgpqQamRvVQq6W532p
  V921h51q05EXEDMeeyj3qtXN8n3R83Fze9FU54lo728ovk+5OW/u5QqoiPuqR7BTXq9Zno9oT
  Vllyrdyk+vq7MT/Ho1te+1Q0jNszDx75J2XltOaqwVklNsXPng0N627Mv/Ob6cX/jaf13fZMr
  ufjYWvbVbf4XhPvnU+8Qvb7jCZY75jJVL1umS2r9TzxrHmrtI5EKf7hKF742Puecf+jp/Yvj7
  ccNA2cbM4QEfzOV+DJKf/rwgZ+rgXi9Vv2HP7ydM/39H335NdJJvPEVwpnfCi4tX1z49GsU7K
  /Is9tZv+kq38m5WtZZd61F7smZ31bG/XskNFeV5Wcop0nM8tWvOMrXFjMrsRSnJFoqMVcVJwI
  ACEmvN9FAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-591.messagelabs.com!1640012542!5657!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19329 invoked from network); 20 Dec 2021 15:02:23 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-13.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Dec 2021 15:02:23 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 93DE610023D
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Dec 2021 15:02:22 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 88C29100228
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Dec 2021 15:02:22 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 20 Dec 2021 15:02:00 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] fio: upgrade 3.28 -> 3.29
Date: Mon, 20 Dec 2021 23:01:47 +0800
Message-ID: <1640012509-3594-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Dec 2021 15:02:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94446

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-benchmark/fio/{fio_3.28.bb => fio_3.29.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-benchmark/fio/{fio_3.28.bb => fio_3.29.bb} (96%)

diff --git a/meta-oe/recipes-benchmark/fio/fio_3.28.bb b/meta-oe/recipes-benchmark/fio/fio_3.29.bb
similarity index 96%
rename from meta-oe/recipes-benchmark/fio/fio_3.28.bb
rename to meta-oe/recipes-benchmark/fio/fio_3.29.bb
index 93eb1c2dd..54e2f332b 100644
--- a/meta-oe/recipes-benchmark/fio/fio_3.28.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.29.bb
@@ -22,7 +22,7 @@ PACKAGECONFIG_NUMA:armeb = ""
 PACKAGECONFIG ??= "${PACKAGECONFIG_NUMA}"
 PACKAGECONFIG[numa] = ",--disable-numa,numactl"
 
-SRCREV = "d83ac9d3d30d5f5dc6d0e425e4ba945a772839f6"
+SRCREV = "9b46661c289d01dbfe5182189a7abea9ce2f9e04"
 SRC_URI = "git://git.kernel.dk/fio.git;branch=master \
 "
 
-- 
2.25.1


