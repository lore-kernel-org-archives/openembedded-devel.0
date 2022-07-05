Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A8F4C43334
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 06:36:56 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web12.81193.1657003013931899042
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jul 2022 23:36:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wnxx0ocu;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657003012; i=@fujitsu.com;
	bh=ezFwIYmu5988hbvwHWAF1GiunJCCSSnpYowqX01PdzM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=wnxx0ocul/44WR6YSggfLY8upvD1a1BHbVSbVTA/tX2oi0YPD3baSOLUQyzqEMmyw
	 LIEKkWwaiNx4y3OVPYypUqlULqBmH7Smr3ThFNia6iXh6Z1XoV/X0etaZ+yNT9NESZ
	 OKlJNrzg0hqPpGzSRdkZYospAt9f8hCfD41zE0XV5bFtLhAU7vwUnIVonPFENERSUJ
	 +B4FHZLDQM1CAlX9L9GHBEZ6L1LFlcjB2ugq6QRcDItXgZxEB1NTJdcV0ksKwz8cTc
	 i1yogqTAK189Lrslx3yidFJDM7rVk9ywPtAUJ/MwVtuzh3b3cDi4Oj8fJwxmFI4yjP
	 PNN7fbVnhC14Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHIsWRWlGSWpSXmKPExsViZ8OxWZflzuE
  kg4NHmSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1ozj7W9YCmZxVSxsPsHSwDifs4uRi0NI4CGj
  xP3WVkYI5wqTxIQnD5khnN2MEjPP3gRyODnYBNQkpt+6wQpiiwjoSyydvQcsziygIvHidw87i
  C0s4CnRfH0lG4jNAhRfdOYAE4jNK+Ak0XG9D6xXQkBBYsrD92C9nALOEvs29YLVCwHVvLwBUy
  8ocXLmExaI+RISB1+8YIboVZSYfbmZBcKukJgxYxsbhK0mcfXcJuYJjIKzkLTPQtK+gJFpFaN
  1UlFmekZJbmJmjq6hgYGuoaGprrEFkGmpl1ilm6iXWqpbnlpcomukl1herJdaXKxXXJmbnJOi
  l5dasokRGMgpxWq5OxinrPypd4hRkoNJSZQ37urhJCG+pPyUyozE4oz4otKc1OJDjDIcHEoSv
  MxXgHKCRanpqRVpmTnAqIJJS3DwKInwrjgNlOYtLkjMLc5Mh0idYjTm+HDoyl5mjplf2w4wC7
  Hk5eelSonz7r4FVCoAUppRmgc3CBbtlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ8/69DjS
  FJzOvBG7fK6BTmIBOuVF1AOSUkkSElFQDk/T291IspbveGb4tfxTZ1TT3ibvn262H94mtfSm/
  4kJs3an8DPX8Xj+N0re1P2IzeyX09xuanZ+38Hzp2/C/MkGrOedVXHNkztj1dRWX5FO3eUeal
  3b2nn550kAx871i7tbYzaLxgUc/HTp1a3Xj59Q02eX1K7LfXufk2yAwTZFH+OOn7Ldn1S8+mM
  p1enO4+q+ag6mfOHXdrx8+Wybw3XXvttvxoeJPCh/5HOgxWWM4x+Km9jrzTXxzZ39Lz/r8WO/
  I4efO+nGf8x/LLM1PW7rRxr/qRAD/5siOrwkJ877fiWla0rLQ7DTDBYEXTpcnMDQs8mc69vZu
  ZPRLFq3ZxzX5W2Sv2ARtbFly/W8Bi4wSS3FGoqEWc1FxIgCcgxG2cQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-565.messagelabs.com!1657003011!44111!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6959 invoked from network); 5 Jul 2022 06:36:52 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-18.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Jul 2022 06:36:52 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id BB32C151
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Jul 2022 07:36:51 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id AE77514E
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Jul 2022 07:36:51 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 5 Jul 2022 07:36:49 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gnome-calculator: upgrade 42.0 -> 42.2
Date: Tue, 5 Jul 2022 14:36:21 +0800
Message-ID: <1657002982-14427-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1657002982-14427-1-git-send-email-wangmy@fujitsu.com>
References: <1657002982-14427-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Jul 2022 06:36:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97706

Changelog:
==========
 * Updated translations
 * Fixed incorrect history with bits toggling #281
 * Fixed crash when typing in variable popover #282
 * Fixed incorrect libxml usage #283

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gnome-calculator_42.0.bb => gnome-calculator_42.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-calculator/{gnome-calculator_42.0.bb => gnome-calculator_42.2.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_42.0.bb b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_42.2.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_42.0.bb
rename to meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_42.2.bb
index 80cc38c61..31513a5f6 100644
--- a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_42.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_42.2.bb
@@ -28,7 +28,7 @@ def gnome_verdir(v):
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.sha256sum] = "a535a14ebea58e691a4b5a085256aed060a2c3f07384ac3a3d01832332a27e4a"
+SRC_URI[archive.sha256sum] = "33dab1bca43658d66520958b0f674cb0ad3185cfd30c12e459e7f69481c5c6a0"
 
 FILES:${PN} += " \
     ${datadir}/dbus-1 \
-- 
2.25.1


