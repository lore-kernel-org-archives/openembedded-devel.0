Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E24F8C74A5B
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 03:04:26 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.26467.1679886262026470224
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Mar 2023 20:04:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ywnhbrHU;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679886260; i=@fujitsu.com;
	bh=tGDTaT6S7PvDckhi8sTfjns4pHKkF0DvSq1pe8oefPA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ywnhbrHUXcMEXuuA0L45zANuNNbksMsG1+CJnBUy6LQZWY13x2sysWsDebXy4IXF3
	 DJJM3zPHrLKLs26evZYWMi4qS1NvSDtR9eWxNvgN8TWI5ljYUNjO+uuZ/5nlIBU3Dt
	 UGz2F2hXf4c7t6V1w/CkZehCmDdDYgJwtSQKzig70/3dY+zxwJ3gctQWSLnMCOy6tG
	 q5pBmEh/3WEsW3lXxE8AlMa8Zi4ugq1nuBaOCkP/AOex4Y4fdghoPMY5DZf9MoOacc
	 hiY1/SInft6ySygSIVthHts+i0BBcAvz+VCoJZWW3b/3RdVmL7IeiQFv+z8v9c/7yM
	 F4kCIC61k76Zg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8MxSXczu2K
  KwYljWhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bem5dYCp5zVLzvn8LcwPiHvYuRi0NI4Amj
  xJwXnYwQznUmibPfV7JCOHsYJWYees/UxcjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAjcTtqe9ZQWwWAVWJTW9/gMV5BZwkGvsWgM2REFCQmPLwPVgvp4CzxPXt/WD1QkA1R4
  8+ZIOoF5Q4OfMJC8R8CYmDL14wQ/QqSsy+3MwCYVdINE4/BDVTTeLquU3MExgFZyFpn4WkfQE
  j0ypG0+LUorLUIl0TvaSizPSMktzEzBy9xCrdRL3UUt3y1OISXSO9xPJivdTiYr3iytzknBS9
  vNSSTYzA4E0pVjy2g/Ff71+9Q4ySHExKorzRbvIpQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4X
  dgUU4QEi1LTUyvSMnOAkQSTluDgURLhXfNLIUWIt7ggMbc4Mx0idYpRl+PDoSt7mYVY8vLzUq
  XEeT+BzBAAKcoozYMbAYvqS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeVtBpvBk5pXAbXo
  FdAQT0BHfCsCOKElESEk1MEmnHTqmYnEkZ+0bn2l+9lunCK5PuSq7/uhxPq5JzdXmBWtW3PTp
  s/i89LhLtkTmv2t1DYf+vH34ODaex2N72vLccu9vKuIPnRX97j87+GZXXO21U9nrNXh5H165P
  V99n8VME7+Aaxxvr05xy1h4wzTmU13OwQf5i8r4s0P6z57+ZZDhH2mnr7hc/OxzBzt9vlfb9v
  nuPsMQxr3xqlE1W99d4W9hGjolXw7eeXLvwFNbXaGWonsPJ5i6SP3u9+s6p/rZnlP4YWR+VVF
  2ZPeHyrr93MpXJ9WFPg50k91yWD/9o4Xy5Bu7JmhkP/6s+qTLQb+NY7P0DXHJsF2SZ31iWb/+
  MqiMdfxnzPvDOUdOUYmlOCPRUIu5qDgRAMkweHJlAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-548.messagelabs.com!1679886259!134634!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10075 invoked from network); 27 Mar 2023 03:04:19 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-14.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Mar 2023 03:04:19 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 656091000D5
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 04:04:19 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 5913B1000D2
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 04:04:19 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 27 Mar 2023 04:04:18 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] eog: upgrade 43.2 -> 44.0
Date: Mon, 27 Mar 2023 11:03:31 +0800
Message-ID: <1679886213-20913-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1679886213-20913-1-git-send-email-wangmy@fujitsu.com>
References: <1679886213-20913-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 03:04:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101756

From: Wang Mingyu <wangmy@fujitsu.com>

Bug fixes and improvements:
----------------------------
 * help: Switch mailing list URLs over to GNOME Discourse

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/recipes-gnome/eog/{eog_43.2.bb => eog_44.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/eog/{eog_43.2.bb => eog_44.0.bb} (86%)

diff --git a/meta-gnome/recipes-gnome/eog/eog_43.2.bb b/meta-gnome/recipes-gnome/eog/eog_44.0.bb
similarity index 86%
rename from meta-gnome/recipes-gnome/eog/eog_43.2.bb
rename to meta-gnome/recipes-gnome/eog/eog_44.0.bb
index 7dbc0ecf2..c95d0e653 100644
--- a/meta-gnome/recipes-gnome/eog/eog_43.2.bb
+++ b/meta-gnome/recipes-gnome/eog/eog_44.0.bb
@@ -21,7 +21,7 @@ inherit gnomebase pkgconfig gsettings gobject-introspection gettext mime-xdg fea
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-SRC_URI[archive.sha256sum] = "9dcfdce5585a90e2bb1cf57e377cb1eb12d41bd9bcb9bbacdf506bc1b1354ef9"
+SRC_URI[archive.sha256sum] = "41d85fab05c430898dbfd847e48e1f5b4935dc3cbcee546e759a907eda671054"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
-- 
2.34.1


