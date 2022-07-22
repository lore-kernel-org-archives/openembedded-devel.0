Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6BD5CCA485
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 01:37:32 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.3155.1658453847838901694
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jul 2022 18:37:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mb4Qcnmw;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658453846; i=@fujitsu.com;
	bh=H9x4HnWzAVEmC6FWvgDplwqHncoBgB0k/8WMkZbTZrg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=mb4QcnmwyUl1Il1iYqvjlL1yqvFmVnbCjzNol+OpnECOafQIStf6+DUTu9q1alo5u
	 6n+le2nenqVqeFIdfyLiL/i9cJkSuLHGjOnLYIXXdhTCiaRWv77eGxLRRJ9FJmAWm/
	 arl/SEdY4ZRKN0jFHnYscKBgcVZpYbwJhfpD7PNwORKIhdazHOnkOoJCqb68bOk4OU
	 XSW5INI+mX/zkhMl2nPhgc1WMrr4nOWya+Q725K7CN4NUP/VbrFMMAYlAZBKuOUoSv
	 vQoqHqP/BFH6DTBCVMLCRiMkXxvFecCSNnYLC3o1gTkup9jxVXpZsZmuIMmqFIBDCg
	 H45/Aor0dyOqA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8ORpBv6/2a
  SwZEnIhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bqJc0sBeu4Kx61HWJuYFzN1cXIxSEk8JBR
  onNdEwuEc4VJYsra1+wQzklGiUtTepm7GDk52ATUJR7ffM0IYosI6Essnb0HLM4soCrRfXENO
  4gtLOAnce/FRbA4C1D8Y+c9NhCbV8BdYuHLC0wgtoSAgsSUh+/BajgFPCT6Jk5gBbGFgGo+Xv
  7KCFEvKHFy5hMWiPkSEgdfvGCG6FWSOLHiI9ScConXhy9BxdUkrp7bxDyBUXAWkvZZSNoXMDK
  tYrRKKspMzyjJTczM0TU0MNA1NDTVNbbUtTDSS6zSTdRLLdUtTy0u0QVyy4v1UouL9Yorc5Nz
  UvTyUks2MQLDOKVYPWgH47cVP/UOMUpyMCmJ8u6bdDNJiC8pP6UyI7E4I76oNCe1+BCjDAeHk
  gRvwV+gnGBRanpqRVpmDjCmYNISHDxKIrwWX4DSvMUFibnFmekQqVOMilLivEu+AiUEQBIZpX
  lwbbA4vsQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmFf+N9AUnsy8Erjpr4AWMwEtNje/AbK
  4JBEhJdXA5P6iXY7lpvCR7wl3Nx/smrI649iG3sq272kLpy/9o9w9oTeu9vjKTM5Jpfl/3n7z
  eGWg+99R45zWvRX/nm38mS+x59QOyWlFXvfSTRS//psrK7ZDxmIN0+/0bHF1j7pZ62fEz9Pjk
  uW2fLe3VCY0u3Wjytlbxgf/OJUYt96+vX82X2XZwtVZ1XJfV/3dyDz1c/u2qRsYtWP66vbPZn
  d2XTVl3mYfBRX/fcEppzJ+dlxveZxwVrM3ImnXUnMjl1K7Q823Xu1malzypHiV0Qeb1Xt2L3B
  axy4tFSi189iS+dYyWrtMln4rW3yCM+5qjNIa36DA+LeiU1jztsbu117ldvzFjSdJVZ9YqjUW
  F/D0RyqxFGckGmoxFxUnAgAtkc41XgMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-18.tower-571.messagelabs.com!1658453845!478279!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18228 invoked from network); 22 Jul 2022 01:37:25 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-18.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Jul 2022 01:37:25 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 1424C1B5
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 02:37:25 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 091B71B2
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 02:37:25 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 22 Jul 2022 02:37:23 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-kiwisolver: upgrade 1.4.3 -> 1.4.4
Date: Fri, 22 Jul 2022 09:37:13 +0800
Message-ID: <1658453833-26074-2-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658453833-26074-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1658453833-26074-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Jul 2022 01:37:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97930

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
==========
- fix timing in shared data release procedure PR #149
- revert use of nullpointer introduced in #142 Its use is not necessary anymore
  in 3.11.0-beta.4 and used to cause issues on some platforms (see #144 ) PR #145

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...{python3-kiwisolver_1.4.3.bb => python3-kiwisolver_1.4.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-kiwisolver_1.4.3.bb => python3-kiwisolver_1.4.4.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-kiwisolver_1.4.3.bb b/meta-python/recipes-devtools/python/python3-kiwisolver_1.4.4.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-kiwisolver_1.4.3.bb
rename to meta-python/recipes-devtools/python/python3-kiwisolver_1.4.4.bb
index 0280afc114..acc8bd5b6f 100644
--- a/meta-python/recipes-devtools/python/python3-kiwisolver_1.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-kiwisolver_1.4.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/nucleic/kiwi"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f137eeae9cf8004d06830f6ab25b2d52"
 
-SRC_URI[sha256sum] = "ab8a15c2750ae8d53e31f77a94f846d0a00772240f1c12817411fa2344351f86"
+SRC_URI[sha256sum] = "d41997519fcba4a1e46eb4a2fe31bc12f0ff957b2b81bac28db24744f333e955"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.25.1


