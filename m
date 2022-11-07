Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F48FC4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 08:30:20 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.1127.1667809811538110840
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Nov 2022 00:30:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xYgLkKoR;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667809809; i=@fujitsu.com;
	bh=dJ1wtFBynp7PfvCOL8l1qp6ysRhiYm3E/0RbUnZusWY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=xYgLkKoRfzbOlh8+3jQ70nQ2x8F/xidftWe7GZYRQERDJ3SwVQrpitNif1JSRS2J6
	 VBGeQwTqlOzrLPJMQh1i8815AOkJ4ypHa5E6G92YwfkiRLEd1RU2nPUoODeg6BIk92
	 fdD7f4FRhTTVEu55XoUjokgyt4ggS7WV9igY0kTTfJA7BfO9R2YPqfqHpv1YuKQnlI
	 dlhD02EG1kU7Yf/Nl63fepqGLS6XwT3EdwzTpYKJRJAmG9vj2P6CadfsYZPvetMWng
	 KD1zZUeQNtaTPs+CAYQgPLVpVgtucfXsvo46jBpLqQkI+8pcWrKeOACmFtIv5Cm9gl
	 UvUHMVY3t4/5Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPIsWRWlGSWpSXmKPExsViZ8OxWVfgUEa
  ywfoLBhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8ae9fOZCm5yVqzfuJqpgfEVRxcjF4eQwENG
  iZlfP7FDOJeZJNbevsEC4exmlFh79glrFyMnB5uAlMSN+//ZQGwRAX2JpbP3MIPYzAIqEi9+9
  wB1c3AIC9hJHL1TBhJmAQq/ffIIrJVXwEmiZetNsHIJAQWJKQ/fg9mcAs4S61++BKsRAqp5+X
  oKM0S9oMTJmU9YIMZLSBx88QKqV1Fi9uVmFgi7QmLWrDYmCFtN4uq5TcwTGAVnIWmfhaR9ASP
  TKkbz4tSistQiXUMDvaSizPSMktzEzBy9xCrdRL3UUt28/KKSDF1DvcTyYr3U4mK94src5JwU
  vbzUkk2MwPBNKU65uIPxybI/eocYJTmYlER5fy/PSBbiS8pPqcxILM6ILyrNSS0+xCjDwaEkw
  XtjI1BOsCg1PbUiLTMHGEswaQkOHiUR3rB9QGne4oLE3OLMdIjUKUZLjqmz/+1n5lgOJmd+bT
  vALMSSl5+XKiXOe203UIMASENGaR7cOFi8X2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzMu
  8B2gKT2ZeCdzWV0AHMQEdVF2QBnJQSSJCSqqBaeGslNIDbjnTLsz6Zx+VsnBHXfBdi2npXflJ
  E3fJJ2ru259u6ajxs+NJi/p0Lt6NR9v1pCuXz0jIWJkZf0H+x/0HOnzvdoRf4vcMXN4oqxat8
  czm7vrqY0w2jcnsrnP8DEQ1FrnqP7mnWKysFHu0+H6JpfcTqeP7l0kq6a1LSVe6/6LzsI/l5v
  qlTjL1goxfn7Fp366PuveqzIXR2mDe6aVL+G/b3LjFP0k0uizyfoBTleSGa1kKq6sKj3+d1f7
  KPqzikk1Aom8ze+CZCM1/hRvdeBYmb2reuYiHcaLNz4U/pWb9/FThV+jtsOR6I8O0brmOk3+e
  NLfaibY0PW1uY9NNOmuvKbEuquTCFHUlluKMREMt5qLiRACmdy4JcgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-732.messagelabs.com!1667809808!243404!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4618 invoked from network); 7 Nov 2022 08:30:08 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-13.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Nov 2022 08:30:08 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 4491F152
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:30:08 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 411A873
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:30:08 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 7 Nov 2022 08:30:06 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libbpf: upgrade 0.8.0 -> 1.0.1
Date: Mon, 7 Nov 2022 16:29:46 +0800
Message-ID: <1667809788-30849-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667809788-30849-1-git-send-email-wangmy@fujitsu.com>
References: <1667809788-30849-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Nov 2022 08:30:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99449

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://github.com/libbpf/libbpf/releases

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libbpf/{libbpf_0.8.0.bb => libbpf_1.0.1.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-kernel/libbpf/{libbpf_0.8.0.bb => libbpf_1.0.1.bb} (89%)

diff --git a/meta-oe/recipes-kernel/libbpf/libbpf_0.8.0.bb b/meta-oe/recipes-kernel/libbpf/libbpf_1.0.1.bb
similarity index 89%
rename from meta-oe/recipes-kernel/libbpf/libbpf_0.8.0.bb
rename to meta-oe/recipes-kernel/libbpf/libbpf_1.0.1.bb
index 76fd86214..5137a4cb3 100644
--- a/meta-oe/recipes-kernel/libbpf/libbpf_0.8.0.bb
+++ b/meta-oe/recipes-kernel/libbpf/libbpf_1.0.1.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://../LICENSE.LGPL-2.1;md5=b370887980db5dd40659b50909238
 
 DEPENDS = "zlib elfutils"
 
-SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=master"
-SRCREV = "86eb09863c1c0177e99c2c703092042d3cdba910"
+SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=libbpf-v1.0.1"
+SRCREV = "a6d7530cb7dff87ac1e64a540e63b67ddde2e0f9"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_HOST = "(x86_64|i.86|aarch64|riscv64|powerpc64).*-linux"
-- 
2.25.1


