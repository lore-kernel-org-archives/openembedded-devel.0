Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09A27C761AF
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 03:05:47 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web10.26481.1679886340026297636
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Mar 2023 20:05:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=UVb69p+f;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679886338; i=@fujitsu.com;
	bh=oO58u7aR+ZCuhno09ek9CpNwsVXkyRE9FF2VADDFKXM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=UVb69p+fXBqnzWiD68VMEnrHKosgT+DDP97ApwzKZ0XDLlwNDfMoL/qQcrklEy9Cq
	 voP2Tf+x/L8ozpZRaIyDOCon2JZFzaCg0YkHzEqgl2sBhkvTlLLQz281BltR89GCg9
	 HuDSkHm8MknpwmhOU5SRNCV6slF5wuPq1CS46+Of0q7ZID/APVJb8ux9M1vatik2FB
	 PluWCArgigQtoCcVzQPlcD+ScgnpG04ieQ9rCreGzAC574esOXYCnDDyOxh9JZLzWG
	 U/okJH5tNq23ykQ3ZZ2g2oZA8CBrjpBQL4VPT62KWnjhaNQ1paTEjQvU47gZ5BhMzK
	 euCvtkPezfVnQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8MxSZeRQzH
  F4Oo+NYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPezqOsBbe5Km5vnc7cwHiDs4uRi0NI4Amj
  xPer39ghnOtMEmsenmODcPYwSmw52sPYxcjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAo8SMlQ/A4iwCqhIHl/eD9fIKOElM6ugFsyUEFCSmPHzPDBEXlDg58wkLxBwJiYMvXj
  BD1ChKzL7czAJhV0g0Tj/EBGGrSVw9t4l5AiP/LCTts5C0L2BkWsVoWpxaVJZapGuhl1SUmZ5
  RkpuYmaOXWKWbqJdaqlueWlyia6iXWF6sl1pcrFdcmZuck6KXl1qyiREYjCnFrG92MG7r+6t3
  iFGSg0lJlDfaTT5FiC8pP6UyI7E4I76oNCe1+BCjDAeHkgSvC5tiipBgUWp6akVaZg4wMmDSE
  hw8SiK8a34ppAjxFhck5hZnpkOkTjEqSonzfgLpEwBJZJTmwbXBovESo6yUMC8jAwODEE9Bal
  FuZgmq/CtGcQ5GJWHeVpApPJl5JXDTXwEtZgJa/K0AbHFJIkJKqoFJuWTT2usTWB7P07LL5WP
  9aLiR4+jlZXpVH6znzpY93VD22K5houPW16HPUkpESxV25RRp2YpO3fd7xjmW3e+0u7wW/rXY
  4sv/9wRL3c2XBsvvWPwr0KiaOkl9iQZvZsfXrE88j+yLQsUfPo8rK++wmqws8t5BLtb8SKumx
  NuKqZM6PzzZqf+8RK6lLdGyWn7Wmp9nOh7xXd5U/Pkrz7SnNrOPfU40d5C9xHJywa7OkmvSJ/
  fXsocpFvOe2W5qVup3KvNjyMbb1qytP/ctqK7zco7Vyml3+6N7c0XbsmN1puf8ul1eNEh02m6
  b762oVXzeUVe6OGx295f6jS9+MdW3yKtbnjkQ+F5n0tJHC5iUWIozEg21mIuKEwGRVlZhQQMA
  AA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-585.messagelabs.com!1679886337!452368!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32632 invoked from network); 27 Mar 2023 03:05:37 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Mar 2023 03:05:37 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 3D3491000FC
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 04:05:37 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 2D5131000EE
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 04:05:37 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 27 Mar 2023 04:05:35 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gegl: upgrade 0.4.40 -> 0.4.42
Date: Mon, 27 Mar 2023 11:05:18 +0800
Message-ID: <1679886322-20954-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 03:05:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101759

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 - raw-load: add conditional support for 0.21.0 API
 - rgb-clib: improved ui-ranges
 - perlin, mosiac, c2g, long-shadow: small cleanups
 - gif-load: update vendored dependency, including code updates.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/recipes-gimp/gegl/{gegl_0.4.40.bb => gegl_0.4.42.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gimp/gegl/{gegl_0.4.40.bb => gegl_0.4.42.bb} (96%)

diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.40.bb b/meta-gnome/recipes-gimp/gegl/gegl_0.4.42.bb
similarity index 96%
rename from meta-gnome/recipes-gimp/gegl/gegl_0.4.40.bb
rename to meta-gnome/recipes-gimp/gegl/gegl_0.4.42.bb
index 7fe64a9bd..fd75a38b7 100644
--- a/meta-gnome/recipes-gimp/gegl/gegl_0.4.40.bb
+++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.42.bb
@@ -26,7 +26,7 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 SHPV = "${@gnome_verdir("${PV}")}"
 
 SRC_URI = "https://download.gimp.org/pub/${BPN}/${SHPV}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "cdde80d15a49dab9a614ef98f804c8ce6e4cfe1339a3c240c34f3fb45436b85d"
+SRC_URI[sha256sum] = "aba83a0cbaa6c56edc29ea22f2e8172950a53b96daa51592083d59222bdde02d"
 
 PACKAGECONFIG ??= "gexiv2 jpeg libpng libraw librsvg pango poppler sdl2"
 PACKAGECONFIG:class-native = "libpng librsvg"
-- 
2.34.1


