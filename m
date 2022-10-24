Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7292C38A2D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 06:57:05 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web09.16360.1666594618104884824
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Oct 2022 23:56:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ciX4u3Rn;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666594616; i=@fujitsu.com;
	bh=ubwSzT/yaD9CCcDi8McfMBeZ+42tpjeucR5FPUKvfTk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ciX4u3Rn73dyq6gSxDQ9lUL1NRWzRL1/HWBAuPonN4kq0AIACfJM3WsElxIxOrRT8
	 fy5Gh/6Ns1UyEjcTIYC/0/8AMTPuVwyA5f0l3Jp/pqkAKTZUqoDuECP3ERAqUYMCWf
	 7afnPG/cPBO6T3F5Us+K8GCSbVeSgewibWumOoIH2Q1AYPmW+q4tVk7sVAAhvmeAWW
	 kUSCTY9BeT75vs41BfVYpKtol7AhvqYCkwOM6yIEE2xkqyOdYvd0FGriYb+eSaKKf3
	 g+6nzas4zetUxLTzK0pf6oXvo60awAvklAXdyustwxT0RGiP2A0tUJQdeeoNXXKJJS
	 ZUXJ2xzfP2qkQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRWlGSWpSXmKPExsViZ8OxWdfCPCz
  ZYNJtZouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPzt69MBfs4K16v1GlgfM7RxcjFISTwkFGi
  6exmRgjnMpPE0Yk/2CCcPYwSx6e+Ze1i5ORgE5CSuHH/PxuILSKgL7F09h5mEJtZQEXixe8ed
  hBbWCBI4uz7PWD1LAKqEtsWvQOr5xVwkjg74QFYXEJAQWLKw/fMEHFBiZMzn7BAzJGQOPjiBT
  NEjaLE7MvNLBB2hcSsWW1MELaaxNVzm5gnMPLPQtI+C0n7AkamVYymxalFZalFuuZ6SUWZ6Rk
  luYmZOXqJVbqJeqmluuWpxSW6RnqJ5cV6qcXFesWVuck5KXp5qSWbGIGhmFKsarGDcf2yP3qH
  GCU5mJREeRnEw5KF+JLyUyozEosz4otKc1KLDzHKcHAoSfDWaAHlBItS01Mr0jJzgHEBk5bg4
  FES4Z1lBJTmLS5IzC3OTIdInWLU5Zj5te0AsxBLXn5eqpQ4L7cZUJEASFFGaR7cCFiMXmKUlR
  LmZWRgYBDiKUgtys0sQZV/xSjOwagkzOtnCjSFJzOvBG7TK6AjmICOuLQiCOSIkkSElFQD0wS
  T55uZ1nZf4ZzwaPmpLV7XYtedyCtstVR59Ub7BbM949zyz6l7jptkXjbLdz/o3bnKYFVE+AqJ
  D8q2vv8fCHdWvfTbuPF0olT2zW9LrVpZ2JSlXwQoNL45NUn8W9CU++dktid4b65knGKr+75TM
  H4a08cNIlOj7vQnrXjw7whn14mYcnfTC/dbHf8qvfTqvZjQeO3Z0fJ9ctvS1uZ9C97pm7M/PC
  nuf1f327/uaxLuzDlR7bsqVnKjJnf3sgtpk+4vOGbY6Pxx6lz1N5MFilhyU/e+8H631YVtk/b
  xQ0e+zlj4StZe+/PGjxLyzdanF0e9+XtBymHHDG+3uqOZGR9Vy3pezbPa9PmIB0Oqhp0SS3FG
  oqEWc1FxIgAFfY35TAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-565.messagelabs.com!1666594615!208821!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3071 invoked from network); 24 Oct 2022 06:56:56 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-3.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Oct 2022 06:56:56 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id C45B3142
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 07:56:55 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id B7CF673
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 07:56:55 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 24 Oct 2022 07:56:54 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-incremental: upgrade 21.3.0 -> 22.10.0
Date: Mon, 24 Oct 2022 14:56:34 +0800
Message-ID: <1666594597-29274-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 06:57:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99283

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...on3-incremental_21.3.0.bb => python3-incremental_22.10.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-incremental_21.3.0.bb => python3-incremental_22.10.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-incremental_21.3.0.bb b/meta-python/recipes-devtools/python/python3-incremental_22.10.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-incremental_21.3.0.bb
rename to meta-python/recipes-devtools/python/python3-incremental_22.10.0.bb
index 60c80a2c85..016bafc134 100644
--- a/meta-python/recipes-devtools/python/python3-incremental_21.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-incremental_22.10.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/twisted/incremental"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6ca9b07f08e2c72d48c74d363d1e0e15"
 
-SRC_URI[sha256sum] = "02f5de5aff48f6b9f665d99d48bfc7ec03b6e3943210de7cfc88856d755d6f57"
+SRC_URI[sha256sum] = "912feeb5e0f7e0188e6f42241d2f450002e11bbc0937c65865045854c24c0bd0"
 
 inherit pypi setuptools3
 
-- 
2.25.1


