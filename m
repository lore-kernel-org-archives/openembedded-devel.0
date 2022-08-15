Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E945C3F6B0
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 06:32:29 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web09.13590.1660545146747821435
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Aug 2022 23:32:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pvsRPFDc;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1660545145; i=@fujitsu.com;
	bh=C8GnJTYBy9XA1+F9jFZlDAqZfvp4Al9DBh+395AZCQo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=pvsRPFDccj0oJWNcbbN9N1Q7ml/YXRHQpHY8GJ1iEIRU8ylcGAwgK5+euaDwiRwuJ
	 /oJJTmUKITLtWnQ09BsHQLCMEKfD3PwfJcxkmwjKwK7Fkq6X/phwLLhUPlLsyGa+IJ
	 dtgLzvqDhFRS6lTUHdmQshJLhul8IsM87dAUKER9t2uJzJyO5xvf/9NXCiyh9BLThu
	 C5iR77DLNtD4ei9+OYKGQRozY3hih0jfT1LNpsR1h5LWojftJvicVmWUbjHV+VrueB
	 gwWPKiZbmdkP/AL7zzGGru0FExQc058Z15LPJtHLwsxevA1pWHrGAufHLbJcacRZi7
	 cZYmeF2KLyLqg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRWlGSWpSXmKPExsViZ8OxWbfixc8
  kgwV7ZS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ozL856zF3RwVPw5fImpgXEVexcjJ4eQwANG
  ibnHdbsYuYDsy0wSE9ZOZ4Zw9jBK/P62mhmkik1ATWL6rRusILaIgL7E0tl7wOLMAioSL373g
  E0SFvCUuN9zjgnEZhFQlZh1ZxJYnFfAUeJtxxWwegkBBYkpD9+D2ZwCThLH7/ZBXeEosWXeVm
  aIekGJkzOfsEDMl5A4+OIFVK+ixOzLzSwQdoXEjBnb2CBsNYmr5zYxT2AUnIWkfRaS9gWMTKs
  YbZKKMtMzSnITM3N0DQ0MdA0NTXUtzXQNTSz0Eqt0E/VSS3Xz8otKMnQN9RLLi/VSi4v1iitz
  k3NS9PJSSzYxAgM5pThhyg7Gw/t+6R1ilORgUhLlvXbxZ5IQX1J+SmVGYnFGfFFpTmrxIUYZD
  g4lCd7S50A5waLU9NSKtMwcYFTBpCU4eJREeBfcBkrzFhck5hZnpkOkTjEqSonz1j0DSgiAJD
  JK8+DaYJF8iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5IwLy/IFJ7MvBK46a+AFjMBLda7+x1
  kcUkiQkqqgUlFUsSDXWCP5bNzUpf2+zv1rfhsL80QELycrbTya+XsBSoCNxmNL/vL1ymHrd/8
  /IP/NJUZSSbVjrdM3m1bujK6k+Xl21n7foVedN78ODy3n8Xhy5KTy+xL52y4a6yYOtNl6u9TZ
  Xu2tx899fJkxqwFhks/p62vdxQU6+ncHr53jpdkT9/a4mefJnluee0lzLLhSFO8ys60Ceu9Le
  bNLMtzaChxNPC/c7qea+OBnaa/F771OX5Wgum+i6pliIswp3Gl7Mb4wkMfzktf0Hj0bsPepBO
  msz1ZP9seuinzZ+38nyZFi02efcxStTplttswvFzMO/eF87Y/c0yOzd/4ece9eccVfsq8UBP+
  Wxj5KOOzEktxRqKhFnNRcSIAbtHRMl8DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-745.messagelabs.com!1660545144!154012!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4246 invoked from network); 15 Aug 2022 06:32:24 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-7.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Aug 2022 06:32:24 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id E2FE975
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:32:23 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id D6D7573
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:32:23 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 15 Aug 2022 07:32:22 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] nbdkit: upgrade 1.31.15 -> 1.32.1
Date: Mon, 15 Aug 2022 14:31:54 +0800
Message-ID: <1660545115-1513-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1660545115-1513-1-git-send-email-wangmy@fujitsu.com>
References: <1660545115-1513-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Aug 2022 06:32:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98247

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nbdkit/{nbdkit_1.31.15.bb => nbdkit_1.32.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/nbdkit/{nbdkit_1.31.15.bb => nbdkit_1.32.1.bb} (95%)

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.31.15.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.32.1.bb
similarity index 95%
rename from meta-networking/recipes-support/nbdkit/nbdkit_1.31.15.bb
rename to meta-networking/recipes-support/nbdkit/nbdkit_1.32.1.bb
index 373cdb0546..56034ac422 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.31.15.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.32.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f9dcc2d8acdde215fa4bd6ac12bb14f0"
 
 SRC_URI = "git://github.com/libguestfs/nbdkit.git;protocol=https;branch=master \
 "
-SRCREV = "a02ea15ec4e2c5ac533cee51824d5b9dd2933cc3"
+SRCREV = "ea58c4f8a5475de6141f14dd0e37067ac8a7370a"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


