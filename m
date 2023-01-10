Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8EC3C46467
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 07:23:13 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.98126.1673335387716362484
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jan 2023 23:23:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=bpG3r9On;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673335385; i=@fujitsu.com;
	bh=Ub72M/H+iraWqZzuD20dFbDWty807FysGKW7lNRsXzE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=bpG3r9OnpiAQz5b6+3ma/WTuFV7RQlUGi3h1X6mvQab5UjaQAlGUB9b/Nf5ndTMUh
	 KuEmqEGDQ/FblUiLfnEwj+kU3Br2Et8RaBXHiTokBcJ73mfFuWIRO0yjD9xZ0eVzL0
	 ugLuA5KJHoWjDAzKNWr3YZBGE1uAO2/MvvFc9OOAEpHTjnATIZ9ksMGvZd+bnZu2X8
	 Na36u4i7ncyFmN9sywkCOZ8d/gyjsW/kM8dMIxZC9FYTszFxpPyii2h7PQmHIrn9ei
	 AktRIP9xCT6V7UwDxR0h55AB4tpVoeGhTRbBNzhIYPojDjV5HdvBLoqajmZZOBav0l
	 WeCkwf1WDa/jg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8ORqBsptDf
  ZoOk5k8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrGxYQ5LwXOOiumzP7I1MN5j72Lk4hASeMIo
  8Xz7LlYI5waTxJS5J5kgnH2MEjPvf2HuYuTkYBPQkNg99TKYLSKgL7F09h4wm1lATeLoy59gt
  rBAlETjk6ksIDaLgKrEg3XrGEFsXgFXiY8XHzGB2BICChJTHr5nhogLSpyc+YQFYo6ExMEXL5
  ghapQk3l7awwhhV0q0fvjFAmGrSVw9t4l5AiP/LCTts5C0L2BkWsVoWpxaVJZapGusl1SUmZ5
  RkpuYmaOXWKWbqJdaqlueWlyia6iXWF6sl1pcrFdcmZuck6KXl1qyiREYjCnFbNU7GN8u/aN3
  iFGSg0lJlLfo055kIb6k/JTKjMTijPii0pzU4kOMMhwcShK8k/n3JgsJFqWmp1akZeYAIwMmL
  cHBoyTCW8EBlOYtLkjMLc5Mh0idYlSUEucVEwRKCIAkMkrz4Npg0XiJUVZKmJeRgYFBiKcgtS
  g3swRV/hWjOAejkjDvbh6gKTyZeSVw018BLWYCWvxj6k6QxSWJCCmpBqY9MTOiGp3WBRlfTzj
  6v3mX1R75qc9vGc6fXhiR9mXK8rP3xPq3ROkW1HXHLnLnn8nrIsF0OrmzbkWThlaix+RHp/PZ
  NZ4/1P0/673+jt6eZdFbbDXeWMt8WrJTMfVAs7HqqQPnz6gxPwx9XPDuKb/c6uv/5JV5/QPdF
  H/fYDdLnLq1p2VL2L/Ja9iNPnm4Kdj/4XjF+uD/Orkzkx755835tlSCy2X7h29MxWJn979xXr
  qB1/N2vEZfzRuz1fYLqzzK/LwqDi281Bg1w3jR3FuB4kFZ/C37gs5eW/tjqdLRikuShetnOle
  qF+b5JNWtMY89H3/D49+VFyFnLvJs7drwR+Qsx+rt60NnZDeX/eZTYinOSDTUYi4qTgQA7/UN
  nkEDAAA=
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-3.tower-587.messagelabs.com!1673335384!400643!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6457 invoked from network); 10 Jan 2023 07:23:05 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Jan 2023 07:23:05 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id A517D100188
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 07:23:04 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 98BDF100043
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 07:23:04 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 10 Jan 2023 07:23:03 +0000
From: Lei Maohui <leimaohui@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [oe] [meta-oe][PATCH] trace-cmd: Fix QA Issue of do_package when enable multilib:
Date: Tue, 10 Jan 2023 15:22:53 +0800
Message-ID: <1673335373-31576-1-git-send-email-leimaohui@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 07:23:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100512

ERROR: trace-cmd-3.1.5-r0 do_package: QA Issue: trace-cmd: Files/directories were installed but not shipped in any package:
  /usr/usr/lib64/libtracecmd.so
  /usr/usr/lib64/libtracecmd.so.1.3.0
  /usr/usr/lib64/libtracecmd.so.1

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb
index 50d73df03..78315553b 100644
--- a/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb
+++ b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb
@@ -25,7 +25,7 @@ do_compile() {
 }
 
 do_install() {
-       oe_runmake libdir_relative=${BASELIB} etcdir=${sysconfdir} pkgconfig_dir=${libdir}/pkgconfig DESTDIR=${D} install install_libs
+       oe_runmake libdir_relative=${baselib} etcdir=${sysconfdir} pkgconfig_dir=${libdir}/pkgconfig DESTDIR=${D} install install_libs
        # Because makefile uses cp instead of install we need to change owner of files
        chown -R root:root ${D}${libdir}
 }
-- 
2.25.1


