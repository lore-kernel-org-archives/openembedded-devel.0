Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AB46C6379F
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 05:39:53 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.96878.1673329190667086923
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jan 2023 21:39:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=No0+ypOS;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673329189; i=@fujitsu.com;
	bh=0hT04TOfgEE1raDj0EonKysneHIynC2PnLZd0Ou311c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=No0+ypOSjFdLQNEoyiQC0O+XfSkENgLblblVmAsGTVjvWMp7V2Y2UeTlvtb9HZXN3
	 qC1lYjildt2sbsTtVU9n/fMfQlyZklc7JI9M2nWotP5xDuZpEEkewcIi6KY1T+BjpU
	 QXhp1M+uXa3eumRhQ8Ql+jEECZMWGt7xkkJnFWHwFzLNvGDGDeRabR9CcoB4MVQaoS
	 7YL+tcFt3ZBAjDdfsoW42XObShKYlXYVJ6b08bNYBJ3295VBfOTFwyDF1k2qzJ0aXB
	 jJoUK1/od9TMr07U77Cupkvm8S9IKMKqMdgl5YwSq46EgfBqqTIHEX6+9bvgd+CsMQ
	 NLRglHttmep5Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8MxSVfl155
  kg32H2C0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ozOTTtYCp4KVKzb/pe1gXE/XxcjF4eQwBNG
  iRn9u5kgnBtMElNvP2aDcPYySlzach0ow8nBJiAlceP+fzYQW0RAX2Lp7D3MIDazgIrEi9897
  CC2sICrxIFLS8FsFgFViTfztrN0MXJw8Ao4Shzd5gkSlhBQkJjy8D1YK6eAk8SSzb1g5UJAJW
  92rwGzeQUEJU7OfMICMV5C4uCLF8wQvYoSsy83s0DYlRKtH35B2WoSV89tYp7AKDgLSfssJO0
  LGJlWMZoVpxaVpRbpGhrrJRVlpmeU5CZm5uglVukm6qWW6panFpfoGuollhfrpRYX6xVX5ibn
  pOjlpZZsYgQGb0oxw9YdjB3L/+gdYpTkYFIS5S36tCdZiC8pP6UyI7E4I76oNCe1+BCjDAeHk
  gSvzg+gnGBRanpqRVpmDjCSYNISHDxKIrzzrgOleYsLEnOLM9MhUqcYFaXEeZeC9AmAJDJK8+
  DaYNF7iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iwr/VXoCk8mXklcNNfAS1mAlr8Y+pOkMU
  liQgpqQYmlftGzKK8j34rnPA+VPxxQ5SbidyHbnu59c5Ho0unMe5p+izUuj+o8yfnovX1kbLi
  nnc2i/Lqse55+LVVuuHhA4OoJXZT7Wbz+j+Zq3HB7OW7MPEpQp4X+j2eVnO+rPTkr9U5eeebQ
  YFLZrT6iTNz2dMmhSjsjGW2Evq27txM5f3s76q7ti5zlP0l/f/uJ2GDfbVe703+T+u+9cZh4i
  Pn/c5bpC/+5vizzy+YpflgZdBOgbPT5sot3qgQOl9/z5yPB/8nruZaE3VX/nKQYFBnqJ3M78N
  TNtQYSWz/bhK/tNBqfrT1LfcJDr36bIFbJxn1ih2YklmYUPEvRDupg+tlKefFLYlluoL3t8/e
  onJJiaU4I9FQi7moOBEA4oKUjFkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-587.messagelabs.com!1673329187!408441!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28068 invoked from network); 10 Jan 2023 05:39:48 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Jan 2023 05:39:48 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id B5E1E1000DC
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 05:39:47 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id AA10B1000C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 05:39:47 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 10 Jan 2023 05:39:46 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] libadwaita: upgrade 1.2.0 -> 1.2.1
Date: Tue, 10 Jan 2023 13:39:18 +0800
Message-ID: <1673329158-5189-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673329158-5189-1-git-send-email-wangmy@fujitsu.com>
References: <1673329158-5189-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 05:39:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100503

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- AdwActionRow
  - Fix spacing after removing all prefixes/suffixes
- AdwAvatar
  - Correctly redraw on custom image changes
- AdwEntryRow
  - Respect use-markup property
  - Fix error/warning/success styles
  - Fix spacing after removing all prefixes/suffixes
- AdwExpanderRow
  - Fix spacing after removing all prefixes/suffixes
- AdwFlap
  - Fix natural width with fold-policy=never
- AdwMessageDialog
  - Fix focus styles in RTL
- AdwPreferencesWindow
  - Fix a memory leak
- AdwSplitButton
  - Don't make dropdown insensitive when the button is
- AdwTabBar
  - Fix focus handling
  - Fix autoscroll for non-local drags
- AdwToastOverlay
  - Clarify documentation
- AdwViewSwitcherBar
  - Fix typos in examples
- AdwViewSwitcherTitle
  - Fix typos in examples
- Stylesheet
  - Fix GtkSpinButton inside toolbars
- Translation updates
  - Abkhazian
  - British English
  - Croatian
  - Friulian
  - German
  - Greek
  - Hebrew
  - Indonesian
  - Persian
  - Slovak
  - Turkish

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libadwaita/{libadwaita_1.2.0.bb => libadwaita_1.2.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/libadwaita/{libadwaita_1.2.0.bb => libadwaita_1.2.1.bb} (85%)

diff --git a/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.2.0.bb b/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.2.1.bb
similarity index 85%
rename from meta-gnome/recipes-gnome/libadwaita/libadwaita_1.2.0.bb
rename to meta-gnome/recipes-gnome/libadwaita/libadwaita_1.2.1.bb
index a518f251b..3a9576634 100644
--- a/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.2.0.bb
+++ b/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.2.1.bb
@@ -10,7 +10,7 @@ DEPENDS = " \
 
 inherit gnomebase gobject-introspection gtk-doc vala features_check
 
-SRC_URI[archive.sha256sum] = "322f3e1be39ba67981d9fe7228a85818eccaa2ed0aa42bcafe263af881c6460c"
+SRC_URI[archive.sha256sum] = "326f142a4f0f3de5a63f0d5e7a9de66ea85348a4726cbfd13930dcf666d22779"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"
-- 
2.25.1


