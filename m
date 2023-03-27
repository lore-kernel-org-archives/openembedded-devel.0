Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17136C7619A
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 03:04:17 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web11.26464.1679886248980474786
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Mar 2023 20:04:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=UTDLwb9g;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679886247; i=@fujitsu.com;
	bh=Mwxbewqu+efrCz9GnFzjPA0nVehWCga8AHgJmu/Kv7I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=UTDLwb9g7BSvcx4fsHeJctNZ924ajxtEap+jNfX7VYHK2fGg8hZZEyGfbsVInU9Pq
	 P1trMoTsvJSVMtAfdigCFWZdQ+i4Z2gF2nbFL72IDX0KSIBY+z/AC0wt39fG9nELVr
	 9JbolMHNcsnVBniGaT7C3DOvNZz2Kg1oZTRs0aMmVRKKEGsCiysYKmr/kAAIfIZVL1
	 vyYqUeK59tbdFO5m5Sx5L6nLRCVK4ziSPLbQi4EUz2VUYQmJOqkN33qz+0uIpGcVmJ
	 mKpwNUSZu8/ZTt+MXnNsD+RZoFz1jjslbNwEjSmHERq3KKlNKEz6cla6O5paVEfg0i
	 GA5u+6tk7AIQQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8OxWXcZu2K
  KwZODvBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bHkeyCA1wVx2e+Y25g3M/ZxcjFISTwkFHi
  w5ytzBDOZSaJ+782skA4exglZtxeD+RwcrAJSEncuP+fDcQWEdCXWDp7DzOIzSygIvHidw87i
  C0s4CRx/+BjsHoWAVWJRUf+gtm8QPGe/RPA6iUEFCSmPHzPDBEXlDg58wkLxBwJiYMvXkDVKE
  rMvtzMAmFXSDROP8QEYatJXD23iXkCI/8sJO2zkLQvYGRaxWhanFpUllqka6iXVJSZnlGSm5i
  Zo5dYpZuol1qqW55aXAKUSSwv1kstLtYrrsxNzknRy0st2cQIDMWUYhbmHYyHe/7qHWKU5GBS
  EuWNdpNPEeJLyk+pzEgszogvKs1JLT7EKMPBoSTB68KmmCIkWJSanlqRlpkDjAuYtAQHj5II7
  5pfCilCvMUFibnFmekQqVOMilLivJ9A+gRAEhmleXBtsFi8xCgrJczLyMDAIMRTkFqUm1mCKv
  +KUZyDUUmYtxVkCk9mXgnc9FdAi5mAFn8rAFtckoiQkmpgijmeGxzn0reT5cThHbY39JnZP89
  fwevwLLz/4uRLEhm5W5v+2gerfL01p+xVl3jLPK5trD869XbJTDxovsfv1TOn818Y7h7weK0b
  cyv7qYJdlp6CluSUU9I7WqbfWnhG8+6f8sYFadlHp+ru+amwbm2i6ucTN7acW9ByYd2kx+FRf
  0M1ZryYF1S87cas44+8Dug7756QLPzpzl6ZtzJSr5+4L9+3/S3z80vzLh/fnzbxX/cBlm9tib
  +dut8vVYpwCTn+gDPjl/qLm+n2B06dNguLq5jRra58+cbd/B8Rk2deMvontT7ztof5hf5brWa
  7So8KHfmqvypheYvvJH3JtTcMJR8uOs7YVMr65MHGsFfHlFiKMxINtZiLihMBIe+3+kADAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-591.messagelabs.com!1679886246!449687!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21610 invoked from network); 27 Mar 2023 03:04:06 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-7.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Mar 2023 03:04:06 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id D9031157
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 04:04:05 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id CC7EB7B
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 04:04:05 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 27 Mar 2023 04:04:04 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] babl: upgrade 0.1.98 -> 0.1.102
Date: Mon, 27 Mar 2023 11:03:29 +0800
Message-ID: <1679886213-20913-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 03:04:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101754

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Brown paper bag release - LUT code-paths now disabled by default.
Stop double processing with LUT+normal fishes.
Support for non-ASCII characters in file paths on windows. Improved wrap build
support. 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gimp/babl/{babl_0.1.98.bb => babl_0.1.102.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gimp/babl/{babl_0.1.98.bb => babl_0.1.102.bb} (87%)

diff --git a/meta-gnome/recipes-gimp/babl/babl_0.1.98.bb b/meta-gnome/recipes-gimp/babl/babl_0.1.102.bb
similarity index 87%
rename from meta-gnome/recipes-gimp/babl/babl_0.1.98.bb
rename to meta-gnome/recipes-gimp/babl/babl_0.1.102.bb
index a9e192b75..b12dc162f 100644
--- a/meta-gnome/recipes-gimp/babl/babl_0.1.98.bb
+++ b/meta-gnome/recipes-gimp/babl/babl_0.1.102.bb
@@ -15,6 +15,6 @@ CFLAGS:append:toolchain-clang:mipsarch = " -ffp-exception-behavior=ignore "
 CFLAGS:append:toolchain-clang:riscv64 = " -ffp-exception-behavior=ignore "
 
 SRC_URI = "https://download.gimp.org/pub/${BPN}/0.1/${BP}.tar.xz"
-SRC_URI[sha256sum] = "f3b222f84e462735de63fa9c3651942f2b78fd314c73a22e05ff7c73afd23af1"
+SRC_URI[sha256sum] = "a88bb28506575f95158c8c89df6e23686e50c8b9fea412bf49fe8b80002d84f0"
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


