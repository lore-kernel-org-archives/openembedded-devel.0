Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3441C76196
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 08:59:33 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.65471.1680512366501281498
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 01:59:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=dqvs8H1R;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1680512364; i=@fujitsu.com;
	bh=rmZCclbvBTVdeIj/q4gIq2fYifSdcl8CquLlnnOkVA8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=dqvs8H1RlDJeo+rKOXnUSUCaV+eEbfdieORcUQz9Yqwq0U5pgx9AZvj9xSc+WRBCh
	 oNcv9ZmBNEe30dIQINx7SkTPy6nDKQhzgRuILeeBlqvUlt4lcuwz5saeQV5K+8fyJf
	 t0WIGTgfJ9jIncm6WMgRIMm/f9oVLO2YyLTMH9Tcm18LB5Mv243hGPA3VdUnvpyE4e
	 jXaFFxHJrNZ/homGWTVuoUS10Tjvs/Fh5wtAR2KOlAGFj9J9KHQV2ffKltkHxmN+5P
	 BSwpGI/APGO7ywCVvMPznKduprFgrBPRVP4was+JAqYuDgslcLyYlpzEk6IomOFChb
	 5m8+UVQQaSTmw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8OxWTdnqla
  Kwb1XjBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bb9D6mgmscFetvXGJuYPzL3sXIxSEk8JBR
  YumVrUwQzmUmidamSawQzm5GiZ+nHzN3MXJysAlISdy4/58NxBYR0JdYOnsPWJxZQEXixe8ed
  hBbWMBfoufsRcYuRg4OFqB4R7sSSJhXwEli9p8VYCUSAgoSUx6+B2vlFHCWmNzzHMwWAqrp+/
  qcHaJeUOLkzCcsEOMlJA6+eMEM0asoMftyMwuEXSHROP0QE4StJnH13CbmCYyCs5C0z0LSvoC
  RaRWjWXFqUVlqka6hgV5SUWZ6RkluYmaOXmKVbqJeaqlueWpxia6hXmJ5sV5qcbFecWVuck6K
  Xl5qySZGYPCmFDMm72C82vdX7xCjJAeTkiivYL1WihBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3
  oMTgHKCRanpqRVpmTnASIJJS3DwKInwBvcCpXmLCxJzizPTIVKnGHU5rl65spdZiCUvPy9VSp
  zXbwpQkQBIUUZpHtwIWFRfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTM+2oi0BSezLwSuE2
  vgI5gAjqiNUoD5IiSRISUVANT7KsUrsopfkHf3++ceLNw/sGJiseiTqd8aN68o1E0WOjR4ucz
  5S3Ud/806T6z9PEB7ll/Pk9z2pRcuGGzisLd91Jfb0bU//W7zlfgHzGBOVauf9Xdw1Vz6hv/9
  v3/sHbB5Tvr+a9nLGg7w/HzU6ZDvHO+4a/9zyuDloda5EbePmK8tWTN/jRWBaV0se7zU9KjPT
  U7j0pHGcwMdd+cq7LVeM/ckz+vH2EXu/tnvtX5cjGrBVxT1D8dVZxq1sGh7nXb5Xq663fupb3
  ReVc43/l8SNDmfzA7/F/Dn6sGO98lbO01eX/EjtF++60pZs6ljvd7uVk5glZeU37uOl94ztE+
  7vrP/blFgROLDPWPnlgjocRSnJFoqMVcVJwIAFGd78VlAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-587.messagelabs.com!1680512363!1002115!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1903 invoked from network); 3 Apr 2023 08:59:24 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-14.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Apr 2023 08:59:24 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 99B52162
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 09:59:23 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 8CABD7B
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 09:59:23 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 3 Apr 2023 09:59:22 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 6.0.20230319.0 -> 6.0.20230402.0
Date: Mon, 3 Apr 2023 16:58:40 +0800
Message-ID: <1680512323-30344-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1680512323-30344-1-git-send-email-wangmy@fujitsu.com>
References: <1680512323-30344-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 08:59:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101893

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.0.20230319.0.bb => ctags_6.0.20230402.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.0.20230319.0.bb => ctags_6.0.20230402.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.0.20230319.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.0.20230402.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.0.20230319.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.0.20230402.0.bb
index feee721ba..b7cf45950 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.0.20230319.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.0.20230402.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "6e720ab5591d24cd401b720a63110bc224780f6f"
+SRCREV = "1231ebe5b4ac1cc095b4480a0bb2b016c135d6fb"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


