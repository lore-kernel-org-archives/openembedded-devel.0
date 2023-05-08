Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68408C7EE2D
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:04:38 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web11.103525.1683540276827139862
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:04:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=VnCoxWJg;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683540274; i=@fujitsu.com;
	bh=cBqDgtGIeATrZHsF1IVpVgzxHZxcVOQe6cTP901V6MQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=VnCoxWJgO/+LNPCIieBKaaL8hWQpzfYDMUYvEuOni8xkcWZtdiohXRbFkpcaH15zp
	 ajY0ZjZEN3WcMvlGJKQHhD2nIu9QQWAoA8+V9eQYfONaCuaQHVgcNnCveLi3pWlIdx
	 NEGeJ8rk9ZHgMZhM74/ijHLnOSTyHT9DAl9uQvZixmREP9mjiuo0DaKcFJYx6fyAM5
	 Q3NadYyXrr2PHdY8LNwkmsgzxK4qfdRebc49fUf9EvBA0RyNQwuYaBmaNFTPfyGCNR
	 Hp560/aAHEUSy9Irbp9ozcN0ngaNDJr93fM+FT9Tf4bZ+mdBBCFtXpiHxO0Kotjqbq
	 3X320p5xJ36bA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrILMWRWlGSWpSXmKPExsViZ8ORpGt0MiL
  FYNl+SYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePP05nMBWc5KjqvX2duYPzE3sXIySEksJFR
  YlWTUhcjF5A9jUnizOm7jCAJNgEJiel7T4IViQjoSnz8MBcsziygIjFj8hEmEFtYwE6ic88ls
  DiLgKpEz7L5bCA2r4CTxN6WE2A1EgIKElMevmcGsTkFnCWeH5jCCrHYSWLZ1W3MEDVqElfPbW
  KewMizgJFhFaNZcWpRWWqRrqGpXlJRZnpGSW5iZo5eYpVuol5qqW55anGJrqFeYnmxXmpxsV5
  xZW5yTopeXmrJJkZgSKQUsxnuYFyx66/eIUZJDiYlUV7Tg2EpQnxJ+SmVGYnFGfFFpTmpxYcY
  ZTg4lCR427ZFpAgJFqWmp1akZeYAwxMmLcHBoyTCK3sEKM1bXJCYW5yZDpE6xagoJc4rcgIoI
  QCSyCjNg2uDxcQlRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8m0Gm8GTmlcBNfwW0mAlosf
  /lcJDFJYkIKakGpuMXY/Yt33WPl/H3koeLJ26KOmElNnWL7jetyYVeHVU/2/7qV050vOoubu1
  0/6Qyw/lpM3wF+49bnA0RnWxnlpkYO3W/9Cyeja5bohbG2Cx6LV9aFp54Sn7xjP8d01RSmH6d
  59G9wmhyQ9EmNaw0evk1J/6G10xz0/VXeXFt59lbOude2ev+9JMHPrn86Zvvl2QVuDa4mNuh6
  afOKz/9Es3OuZz99azbAg/c2iU85UJ5wxlHSZ4fszOX/jid58p/bca+mptn7y1MMInS/MLmJc
  2sxl/fds5/gdWxzJm6TXaWhzavFu99Kstne9PUZWL1BN45PTeLrCo+s7xKs9192jzVM3PxXMG
  JNqrvFh/+pMRSnJFoqMVcVJwIAGtx1BEEAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-587.messagelabs.com!1683540274!424409!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21259 invoked from network); 8 May 2023 10:04:34 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-2.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:04:34 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 090431D4;
	Mon,  8 May 2023 11:04:34 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 2FA7E1D2;
	Mon,  8 May 2023 11:04:32 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libbpf: upgrade 1.1.0 -> 1.2.0
Date: Mon,  8 May 2023 18:04:18 +0800
Message-Id: <1683540259-25209-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1683540259-25209-1-git-send-email-wangmy@fujitsu.com>
References: <1683540259-25209-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102393

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-kernel/libbpf/{libbpf_1.1.0.bb => libbpf_1.2.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-kernel/libbpf/{libbpf_1.1.0.bb => libbpf_1.2.0.bb} (92%)

diff --git a/meta-oe/recipes-kernel/libbpf/libbpf_1.1.0.bb b/meta-oe/recipes-kernel/libbpf/libbpf_1.2.0.bb
similarity index 92%
rename from meta-oe/recipes-kernel/libbpf/libbpf_1.1.0.bb
rename to meta-oe/recipes-kernel/libbpf/libbpf_1.2.0.bb
index 1aee51f1eb..7c3df5f8ad 100644
--- a/meta-oe/recipes-kernel/libbpf/libbpf_1.1.0.bb
+++ b/meta-oe/recipes-kernel/libbpf/libbpf_1.2.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://../LICENSE.LGPL-2.1;md5=b370887980db5dd40659b50909238
 DEPENDS = "zlib elfutils"
 
 SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=master"
-SRCREV = "6597330c45d185381900037f0130712cd326ae59"
+SRCREV = "fbd60dbff51c870f5e80a17c4f2fd639eb80af90"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_HOST = "(x86_64|i.86|aarch64|riscv64|powerpc64).*-linux"
-- 
2.34.1


