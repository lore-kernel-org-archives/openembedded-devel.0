Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E464FC433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 05:13:36 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web08.5658.1634620415566151645
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 22:13:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qq4gSpvL;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1634620413; i=@fujitsu.com;
	bh=Rv+qUm2d1eccCQUAL/meyGpjSqUBjM74zw46SgFbft8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=qq4gSpvLNj6dl5eL5PmFnfJsCGuE2jMM598wFMC/p5xaVi3lCNzztOUd+Hp/P5UBx
	 vKIe2PGA8jj3Ys6DB0+OLxe2HHVlc5tBCDNIuwVKe0B6YNSGKU/t4kqK8AOyOcElyj
	 tr7KrTjIXvTUfXzZljbNfE6TdMuYt2kqOqQNPZrDib/6FNc5l6u4D50fLlySQ6xdYJ
	 PwUp+addXXaMUkVi0IEJQo0EnH8KyvNmTl+rqNhQGAUHZGrJ3aUuDAMAx0szX+ujX7
	 JNyu3xsh3B/HW1BVA61ePaA6WCnlxUQs1WhQ2sNGWp+AjfYuN1PEoETKTM5PMiWdQe
	 kqpudV9G/9/9Q==
Received: from [100.112.195.206] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.symcld.net id 2B/21-16630-DF35E616;
 Tue, 19 Oct 2021 05:13:33 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRWlGSWpSXmKPExsViZ8MxSfdvcF6
  iwbMVrBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bj9Y+YCjq5K47+6GJrYJzF1cXIySEk8IRR
  ouFUURcjF5B9gUni9u4rTBDOHkaJV3snsYFUsQnoSpx7vJYdxBYR0JdYOnsPM4gtLOAmsXnOY
  bA4i4CqRPfzTSwgNq+Au8TeyXMYQWwJAQWJKQ/fM0PEBSVOznwCVsMsICFx8MULoDgHUI2ixO
  zp8hDlFRKvD19ihrDVJK6e28Q8gZFvFpLuWUi6FzAyrWK0SCrKTM8oyU3MzNE1NDDQNTQ00jW
  0BGITE73EKt1EvdRS3fLU4hJdQ73E8mK94src5JwUvbzUkk2MwLBLKTgwYQfj/tcf9A4xSnIw
  KYnyXnTNSxTiS8pPqcxILM6ILyrNSS0+xCjDwaEkwRsbAJQTLEpNT61Iy8wBxgBMWoKDR0mE9
  78/UJq3uCAxtzgzHSJ1ilFRSpxXJAgoIQCSyCjNg2uDxd0lRlkpYV5GBgYGIZ6C1KLczBJU+V
  eM4hyMSsK8OSBTeDLzSuCmvwJazAS0+KpzDsjikkSElFQDU+uy567mGxbWdCs7rTmS3rNBUzy
  9X++Jes7rSz/nJh9e/n21fPq1nd8+MFZsimk1Mz12a94+nmn6Phfutvux/8pO+n/rriCX7Cq+
  p2+05865WqG9g7PLqq7x043KwyZ3NrcwfEyY80+BXZU/4MwRq+iVoXzXHF4dYNfQLvjIYiSu2
  Log4dxN/32fTviqOsyaUXE4d0b1xKQr25Uv7tTtsj1gonri1+RTUsEM9Uf5bboEvOb/Nou1OC
  9yQ7dkxbWFi45fur7MQ9njm/Hst+EvfrhndXzjM9Ddwn62U1PaNuuC5spnuTfXqUm5dn3P1DW
  QX77P6amy1kUD+1772fzyXwNTWk2SuaO7TnFO55KKU2Ipzkg01GIuKk4EABJqldo2AwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-4.tower-265.messagelabs.com!1634620412!2379298!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7045 invoked from network); 19 Oct 2021 05:13:33 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-4.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Oct 2021 05:13:33 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id A493E100464
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Oct 2021 06:13:32 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 97F3D100445
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Oct 2021 06:13:32 +0100 (BST)
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Tue, 19 Oct 2021 06:13:11 +0100
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-perl] [PATCH] libencode-perl: upgrade 3.12 -> 3.16
Date: Tue, 19 Oct 2021 22:13:05 +0800
Message-ID: <1634652785-3542-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Oct 2021 05:13:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93458

Revision: 3.16
 Makefile.PL
  Pulled: Only add -Werror=declaration-after-statement for 5.035004 and earlier
  https://github.com/dankogai/p5-encode/pull/162/filehttps://github.com/dankogai/p5-encode/pull/162

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{libencode-perl_3.12.bb => libencode-perl_3.16.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libencode/{libencode-perl_3.12.bb => libencode-perl_3.16.bb} (97%)

diff --git a/meta-perl/recipes-perl/libencode/libencode-perl_3.12.bb b/meta-perl/recipes-perl/libencode/libencode-perl_3.16.bb
similarity index 97%
rename from meta-perl/recipes-perl/libencode/libencode-perl_3.12.bb
rename to meta-perl/recipes-perl/libencode/libencode-perl_3.16.bb
index 90ae623f79..2286ee5249 100644
--- a/meta-perl/recipes-perl/libencode/libencode-perl_3.12.bb
+++ b/meta-perl/recipes-perl/libencode/libencode-perl_3.16.bb
@@ -15,7 +15,7 @@ LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://META.json;beginline=8;endline=10;md5=b12e3be1e17a7e99ca4f429ff32c28b5"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/D/DA/DANKOGAI/Encode-${PV}.tar.gz"
-SRC_URI[sha256sum] = "38da5b7f74bc402075f5994557b5f1426636291efea0f39fcdf4b1366b0756fd"
+SRC_URI[sha256sum] = "e5e91d98a97de70dccecc2a25d049a0b5f5f12228c618680020d73043355294c"
 
 UPSTREAM_CHECK_REGEX = "Encode\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.25.1


