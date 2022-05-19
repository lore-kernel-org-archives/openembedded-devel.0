Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D91BFC433F5
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 06:04:46 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web08.4320.1652940279581704005
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 May 2022 23:04:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=rmJrQZBE;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652940278; i=@fujitsu.com;
	bh=9X+3XTCqDgYPQbliShKcHQUEdX9npWr4Ab2h+qtEe2U=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=rmJrQZBEdwFmTuikMCvevNWLCHZBT6AeatOvOkeTOOmd/RswVzx5qbSI8tg8Mdsc8
	 RQz9WhcfPmvUZgnUvjQp70wSqEH9ELCRi3oQuKGwfCy3+t5IPbBIFjXR9lulmB0Xfb
	 RdIMIHdrc7JWo4wIYAWWWge2DE97AS8uPcN7JuGJwR9bC3pwOpCKqA7GfxcHFs+hic
	 pqcnqMJ3AsUFux2l3Y4X8q97Jj5jhLIO9lUhvyDpCxgltXbQHHZqqyWsTUJ/S3PF1o
	 TFFLWkC8OUXFehjsRZcvEXGGNPeg09e4t9qtbw4PExODuiOXRy9efQhMAKyVBJRgln
	 6svZOMbHGSl0g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJIsWRWlGSWpSXmKPExsViZ8MxSffr3dY
  kgwO9ahYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b0Q+1MBae4KiZuWc/YwHiTs4uRi0NI4Amj
  xJKrX5ghnAtMEvvvXmCDcA4wSnx+/oOli5GTg01AV+LFj8VgtoiAvsTS2XuYQWxhAW+Jpst/2
  EBsFgFVibe3foDFeQU8JJZdfw4WlxBQkJjy8D1UXFDi5MwnYHOYBSQkDr54ARTnAKpRlJg9XR
  6ivELi9eFLzBC2msTVc5uYJzDyzULSPQtJ9wJGplWMtklFmekZJbmJmTm6hgYGuoaGprpmFrp
  GJnqJVbqJeqmlusmpeSVFiUBZvcTyYr3U4mK94src5JwUvbzUkk2MwBBMKXaR2MF4s++n3iFG
  SQ4mJVFe9yOtSUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkePfcAcoJFqWmp1akZeYA4wEmLcHBo
  yTC27ILKM1bXJCYW5yZDpE6xagoJc4bCowiIQGQREZpHlwbLAYvMcpKCfMyMjAwCPEUpBblZp
  agyr9iFOdgVBLmXQiynSczrwRu+iugxUxAi28pgy0uSURISTUwWcuIq8XsibXeriX9VemSscc
  rhtm3F3PvcvmZoi3L3ct6zCMlO9Jk0cq76f88uC8/U8tpqHb+18Wa2+pvfqtGzcKyfYU7c6dn
  g6Pmm9l7Tr6R2ftSvOfrn8ePkt5LXZjn4Hl5Yu5asz+WrnZfr797krD+kN1LqZ70XFPxNwq5F
  dFHnA8eVf/+bpLW/Gsb9rFx6UcbXA2b9jlu/6voFMc1RVZPrEQ/XV2Sd1EjbNu5YjV781C9Nk
  ldtQn+Tzyefjn6IWdGp8NheeH/lYsFxTtP18cdPlJiu1pjupZZ+FTT0LN3mJa/nmeVWO7ylOe
  nY/bm2U6yZ/8FLfRS2vTs6/InPE8r9rzyi9rAGLvzQfo/JZbijERDLeai4kQA/Cl67DwDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-13.tower-532.messagelabs.com!1652940277!80561!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11646 invoked from network); 19 May 2022 06:04:37 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-13.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 May 2022 06:04:37 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 27B93100441
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 07:04:37 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 1A04A100352
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 07:04:37 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 19 May 2022 07:04:27 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-wrapt: upgrade 1.14.0 -> 1.14.1
Date: Thu, 19 May 2022 14:04:20 +0800
Message-ID: <1652940260-24975-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 19 May 2022 06:04:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97181

License-Update: Copyright year updated to 2022.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-wrapt_1.14.0.bb => python3-wrapt_1.14.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-wrapt_1.14.0.bb => python3-wrapt_1.14.1.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-wrapt_1.14.0.bb b/meta-python/recipes-devtools/python/python3-wrapt_1.14.1.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-wrapt_1.14.0.bb
rename to meta-python/recipes-devtools/python/python3-wrapt_1.14.1.bb
index 9dcab8101..54bf1ee99 100644
--- a/meta-python/recipes-devtools/python/python3-wrapt_1.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-wrapt_1.14.1.bb
@@ -2,9 +2,9 @@ SUMMARY = "A Python module for decorators, wrappers and monkey patching."
 HOMEPAGE = "http://wrapt.readthedocs.org/"
 LICENSE = "BSD-2-Clause"
 SECTION = "devel/python"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=fdfc019b57affbe1d7a32e3d34e83db4"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7a4e084dbc322d180bc74f26cdf8236e"
 
-SRC_URI[sha256sum] = "8323a43bd9c91f62bb7d4be74cc9ff10090e7ef820e27bfe8815c57e68261311"
+SRC_URI[sha256sum] = "380a85cf89e0e69b7cfbe2ea9f765f004ff419f34194018a6827ac0e3edfed4d"
 
 inherit pypi setuptools3 
 
-- 
2.25.1


