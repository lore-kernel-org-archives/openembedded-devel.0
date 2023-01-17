Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA520C6379F
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 07:14:02 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.191218.1673939637417933034
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 23:13:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=utoaCNQb;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673939638; i=@fujitsu.com;
	bh=FOpgpw4vu24qlSEx73NaqGogjpS4IVfVJKDSct+pTkA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=utoaCNQbBcWyrL0w3vuyt5/qgi5cd32XrMoSuQWVQ95A90Mc8wwwoy/ACpCQ584NV
	 3EtRX9kNr5gjjXY1262e/2ffU3wY8oIbRJGHSkXwn9XpwyKgs3OrRCFxYNlrbJ664x
	 xDx9G3nm1oHQBJYf193ms5LPW3glAJHtSaHMP1dZpBM97A4ys0F3ei/sxMAkaHmyus
	 KrFrxUpsvfQOPvvYl75v04PEw1D9R6bdeAjJiQ5fy7Pt8q4TH8gU+U8XxNi9cCu4G6
	 4AhCPaE60Uy/NgN/8+d0cLPg0nf/h7O9uov9EBIz7WVsKq+IW0O4zbzwLZyrZUXJ+l
	 xsgZHS07iqm6A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8MxSXer17F
  kg1fvjSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oxtO1IK7nNU9Ny1aWD8xN7FyMUhJPCEUeJQ
  dxcLhHODSeL3x22MEM5eRomDW1cAOZwcbAJSEjfu/2cDsUUE9CWWzt7DDGIzC6hIvPjdww5iC
  wvYSLw9tAbMZhFQlThx/BkLiM0r4CRx++wusLiEgILElIfvwXo5BZwlfhxaB1YjBFRz8vQMVo
  h6QYmTM5+wQMyXkDj44gUzRK+ixOzLzSwQdqVE64dfULaaxNVzm5gnMArOQtI+C0n7AkamVYx
  mxalFZalFukYGeklFmekZJbmJmTl6iVW6iXqppbrlqcUlukZ6ieXFeqnFxXrFlbnJOSl6eakl
  mxiBoZtSrH5xB2Pnsj96hxglOZiURHlPmh5LFuJLyk+pzEgszogvKs1JLT7EKMPBoSTB6+UOl
  BMsSk1PrUjLzAHGEUxagoNHSYQ33BIozVtckJhbnJkOkTrFqMvx4dCVvcxCLHn5ealS4ryrPY
  GKBECKMkrz4EbAYvoSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHeJx5AU3gy80rgNr0COoI
  J6AiPkqMgR5QkIqSkGpj4d29o0Wu1e/cp5kxXSsK+kDla27xqr1x4Mi9lI49/176bl127mO5d
  vK+XLjTReJZX7K/1iW+LriU1Ldv9qm0p86oF6fnN7C06aSHHDdTP3Jd2fXnre3oWZ+iyi7blh
  9813+blmmG5Ym2PjF3tjW88yRyzf9yLvOtbMiMp7urGfzmWWdNE/8iH1ot7RZ7+pf/jTD9juD
  D72c0ZzPdW1h654HjEiKf5oMn/1Eyl0yvuTbjf4z6L56Royh4JvrNXEvsV3uidffa4TnwvTzX
  LdEmHf2bmhy+W7VMNEzd7zKL5Vrm/l+XePCbp+ce6mgRlTPZdCA6zZFfa+Pe30OuqQ+8enyk8
  PdEh0FSOecrmK1uUWIozEg21mIuKEwHC0yv6ZAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-548.messagelabs.com!1673939637!20726!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11488 invoked from network); 17 Jan 2023 07:13:57 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-5.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Jan 2023 07:13:57 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 865771000FB
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:13:57 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 7A5E21000F5
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:13:57 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 17 Jan 2023 07:13:55 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] eog: upgrade 43.1 -> 43.2
Date: Tue, 17 Jan 2023 15:13:35 +0800
Message-ID: <1673939617-20032-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673939617-20032-1-git-send-email-wangmy@fujitsu.com>
References: <1673939617-20032-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:14:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100596

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- 142, Avoid critical warnings when saving images on exit
- 143, Fix build on macOS

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/recipes-gnome/eog/{eog_43.1.bb => eog_43.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/eog/{eog_43.1.bb => eog_43.2.bb} (86%)

diff --git a/meta-gnome/recipes-gnome/eog/eog_43.1.bb b/meta-gnome/recipes-gnome/eog/eog_43.2.bb
similarity index 86%
rename from meta-gnome/recipes-gnome/eog/eog_43.1.bb
rename to meta-gnome/recipes-gnome/eog/eog_43.2.bb
index 24701bcb3..7dbc0ecf2 100644
--- a/meta-gnome/recipes-gnome/eog/eog_43.1.bb
+++ b/meta-gnome/recipes-gnome/eog/eog_43.2.bb
@@ -21,7 +21,7 @@ inherit gnomebase pkgconfig gsettings gobject-introspection gettext mime-xdg fea
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-SRC_URI[archive.sha256sum] = "fed79ff3ca19bac62f27155c9bdd69eef875870b971e6dcb0aa38c093d131971"
+SRC_URI[archive.sha256sum] = "9dcfdce5585a90e2bb1cf57e377cb1eb12d41bd9bcb9bbacdf506bc1b1354ef9"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
-- 
2.25.1


