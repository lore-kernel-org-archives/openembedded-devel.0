Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72952C10F1B
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 06:36:45 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.153504.1672123002747173862
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Dec 2022 22:36:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Qs44oina;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672123001; i=@fujitsu.com;
	bh=IvnDfEwtgBI1RojPYR8zTyiLoVRqokjaaMMkmz+VtMg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Qs44oinaeoDBYM/HkCo54Bbr/Zq3KDtZyba8JV8IlPPJ+0UKNWX5hc/43Gyk+SETK
	 M5hPqcKoYRI2M+NzAboVLkzvpN/FL565A2OzTOk9bC4fSTWG+ikK98WpQ5sdKb2ivF
	 q80IjuEHpQcY9fpQYg1OjyyX7xH9iqIribPWbOt1wQOiPIYp7F0rjIfo/KNa61k56J
	 IuR2XYU6dwmk/DcYorWqdQ6f+Ne3BBtldRAfVB/m5ZpX7dSrQ0HYY0vkkP07+E1/gz
	 gBJIXufe1zKfYezYvALQ89gj2ygrcOgGnsMTLrCIsBMqtyN/qhOR9wI/F2JXCdRvPC
	 KdhjpsvDLVgDg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRWlGSWpSXmKPExsViZ8ORqFsxaVW
  ywbvJvBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aDm7kF1zgqti45xtTA+Je9i5GTQ0jgCaPE
  2yN6XYxcQPZ1JomfnfdZIZw9jBLLD3Ywg1SxCUhJ3Lj/nw3EFhHQl1g6ew9YnFlAReLF7x6wS
  cIC/hJnpkwFi7MIqEpsWrqFEcTmFXCSmLXxLVivhICCxJSH75kh4oISJ2c+YYGYIyFx8MULZo
  gaRYnZl5tZIOwKiVmz2pggbDWJq+c2MU9g5J+FpH0WkvYFjEyrGE2LU4vKUot0zfWSijLTM0p
  yEzNz9BKrdBP1Ukt1y1OLS3SN9BLLi/VSi4v1iitzk3NS9PJSSzYxAgMxpVjVYgfj+mV/9A4x
  SnIwKYnySnWvShbiS8pPqcxILM6ILyrNSS0+xCjDwaEkwXsZJCdYlJqeWpGWmQOMCpi0BAePk
  ghEK29xQWJucWY6ROoUo6KUOG/nRKCEAEgiozQPrg0WiZcYZaWEeRkZGBiEeApSi3IzS1DlXz
  GKczAqCfOqg4znycwrgZv+CmgxE9DiD4dWgiwuSURISTUwMc+/5i10THpv1p+FLyJmKVUeERR
  65eFpvETmvwznu+cpk1yt1Jc5/1h0feqt6RlZaYJLRPNmhZ3YIR+1PepyM+uS7Z3SHJP3GT/Q
  u+B8Op59s6rHi8MWEa/WnDJW03jK1bbG0UD5Soze3Ct3stOnmrXWTF5883Lslv9v5Pw7ZPOWa
  /ZGWOY9WGx7wCApkcny0rWdh9umafr6at68b5YjODtR+cguIcZEjRvVknPU6/qKz7pdfLg3u3
  7O5Nvd+qWRQb2zNVZqnX3Wa9CvZBL+5if7yeeT9uV/CT7sd86Pc9sfBb9HTJItuullCXOjF5/
  QjAny+B7tJLq3aEd35eSurhzHdUu+bw/nsFvlv2G9EktxRqKhFnNRcSIAYygzSD8DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-571.messagelabs.com!1672123000!410718!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28171 invoked from network); 27 Dec 2022 06:36:40 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Dec 2022 06:36:40 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E1F53100197
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:36:39 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id D5FA8100194
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:36:39 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 27 Dec 2022 06:36:38 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 6.0.20221218.0 -> 6.0.20221225.0
Date: Tue, 27 Dec 2022 14:36:02 +0800
Message-ID: <1672122966-31746-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:36:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100255

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.0.20221218.0.bb => ctags_6.0.20221225.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.0.20221218.0.bb => ctags_6.0.20221225.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.0.20221218.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.0.20221225.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.0.20221218.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.0.20221225.0.bb
index 84ba97cc0..60ac26a31 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.0.20221218.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.0.20221225.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "3af413544a0ed0a4c52200894cfd6391f06d2e94"
+SRCREV = "033929ad16caa2742bacbcf7484f89c72b85680e"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


