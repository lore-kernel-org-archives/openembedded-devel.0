Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F283C4332F
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 07:39:15 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web11.15734.1668843551569058833
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Nov 2022 23:39:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=VjlTVMX9;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668843549; i=@fujitsu.com;
	bh=p+tb1tZTfY/hHORWbFNB8ZLT7YdwCryQvXeBiVB3wAg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=VjlTVMX9RyKEX6J8fkaJpIYh8YcPkJD0h+dbDYNKI0M3yybztKLo6Z6754CJvylN9
	 KEFzL0Cfv8Ourt0FAbKeSy/yjEnpJBnT0aB4JYL4arVvKeMPsThH9R3Mbqx8Nn8B7v
	 7difYIEJn+VRTD1VWAUwhSfxrI4/8jLukfz35mwDYE2Pg+aGbImOl6lIlO6kggf9K+
	 99clhskS2ApcTQdk9wYzhFWOQGvQ4ya7gdFDVj+DLCFOgMYbKz9I0sU9evLhqAeQ62
	 hDXr+u8zFZt2DPT+K42dQfZTt+6l3/zmM5LS2pG9m2FZsqZqxP+qdtKkowCUFNuhs8
	 rp8bhdAz14qlA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8MxSVemoyL
  ZYNE0RouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePykhvsBZ+4Kp5v/87SwPiGs4uRi0NI4Amj
  xI3D91ggnOtMEj0X9rBCOHsYJZ7N28vcxcjJwSYgJXHj/n82EFtEQF9i6ew9YHFmARWJF7972
  EFsYQEPiWdf17CC2CwCqhInn38Bs3kFHCXOr/kGViMhoCAx5eF7sF5OASeJ57NegdlCQDWLHx
  5ihKgXlDg58wkLxHwJiYMvXjBD9CpKzL7czAJhV0jMmtXGBGGrSVw9t4l5AqPgLCTts5C0L2B
  kWsVoVpxaVJZapGtoopdUlJmeUZKbmJmjl1ilm6iXWqpbnlpcomuol1herJdaXKxXXJmbnJOi
  l5dasokRGL4pxWyrdjD+WvZH7xCjJAeTkijv3vbyZCG+pPyUyozE4oz4otKc1OJDjDIcHEoSv
  HFtFclCgkWp6akVaZk5wFiCSUtw8CiJ8Ir4AKV5iwsSc4sz0yFSpxh1OWZ+bTvALMSSl5+XKi
  XOmwQyQwCkKKM0D24ELK4vMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmnQ4yhSczrwRu0yu
  gI5iAjshxLgM5oiQRISXVwBSmYuOm/7rkRkB8mLnhn2XXRYvNSjIbZt91Od35K/OZbPcDTV+5
  DXmflJkYD9ouC5jpkJqXlNuxa/YNdi7HN3802QujlZfZCMVNEbFyXfdR4kzklGIv13d8HKaq1
  3RLazY8fFIaWn2qKq5EslQraYrBPtNkuzePi8WeTtb6vr361+sdW8TjXLTU97XWxWQqS4ly/E
  nMmB/fdDVW6/dGDY8meV73zAYXMdPZdutX/Js+42n7+8prP/f2+LktUpvvIHru/yObfLFAQcn
  Yx0pqYWdEb7P4nlq+8u1fBebbvguabbyu8AuZLHl+LXt5+kORdc3Mr2UXi83KvJER/FHjYOCq
  9g5V7r9t/5UD7KcosRRnJBpqMRcVJwIA0Y1YcmYDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-585.messagelabs.com!1668843547!176706!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13934 invoked from network); 19 Nov 2022 07:39:08 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 19 Nov 2022 07:39:08 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id A0D2E1039DB
	for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:39:07 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 94B151039D9
	for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:39:07 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sat, 19 Nov 2022 07:39:06 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gnome-backgrounds: upgrade 42.0 -> 43
Date: Sat, 19 Nov 2022 15:38:03 +0800
Message-ID: <1668843486-2933-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1668843486-2933-1-git-send-email-wangmy@fujitsu.com>
References: <1668843486-2933-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:39:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99627

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- all new 43 set of default and supplemental wallpapers
- SVG and WebM formats for better compression and resolution
- 4k square format targeting both widescreen, 4:3 and portrait 
  displays.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gnome-backgrounds_42.0.bb => gnome-backgrounds_43.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-backgrounds/{gnome-backgrounds_42.0.bb => gnome-backgrounds_43.bb} (76%)

diff --git a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_42.0.bb b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_43.bb
similarity index 76%
rename from meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_42.0.bb
rename to meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_43.bb
index d700c1bcb..9f94378d8 100644
--- a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_42.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_43.bb
@@ -8,7 +8,7 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gettext allarch
 
-SRC_URI[archive.sha256sum] = "4c7fe1a09f459c5f77189a5982524fce05d888944955d679910f234606c1295d"
+SRC_URI[archive.sha256sum] = "19f749d8c37f872f155bb69a2bbe7aca381175e6929f1998047d775cbc637244"
 
 FILES:${PN} += " \
     ${datadir}/backgrounds \
-- 
2.25.1


