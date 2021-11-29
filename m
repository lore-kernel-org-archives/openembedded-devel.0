Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2F73C433F5
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 15:05:13 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.62134.1638198305122293151
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Nov 2021 07:05:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=U9KyR5NK;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1638198303; i=@fujitsu.com;
	bh=XJwYtzRCX+jI8pyvXAZASqjpoCxYgxduCCF/iiAHLOY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=U9KyR5NKsjwHtTYznlUatNA7Iy7dm4+ME5EKWW4/P5UmOa+saFCNsTH98/OJdiQjR
	 y95ujcYQ1xm4xKDLlypRTr2qIRL83CgMc25lPuoN1Yo95jnEsfsM/66YkaFmB1BvfB
	 tYa2efkYmm4s71FPw+eb42un/S1qXk3oIprRfnI4TPG4ef5bSX2dwaaCPZsl/Mr+sz
	 c6oYHpp8VvTT2vL8lGkWcNFLrkeL/iUY3PdYPRPQ0+gy8A/eBm57R7FzflcyZK6eCP
	 rmRm+eqb3JUfKi6WG5MMtas8fjjXGnz7Vge/lrspWNZGMXg21WAfTn8SotIbYm+auM
	 pmZMTMJgH7q3g==
Received: from [100.115.3.142] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.ess.symcld.net id 7D/46-12056-F1CE4A16;
 Mon, 29 Nov 2021 15:05:03 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRWlGSWpSXmKPExsViZ8MxRVfuzZJ
  Eg9ubTCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oxT008wFvyWqfjydzFzA2OXZBcjJ4eQwEwm
  iel3XbsYuYDsE4wS119dYgVJsAmoSUy/dQPMFhHQl1g6ew8ziM0soCLx4ncPexcjB4ewgK3E8
  r+8ICaLgKrEuqW2IBW8As4SN6fMZAexJQQUJKY8fA/WySngIvF57zFWiLXOEp+vL2SFqBeUOD
  nzCQvEdAmJgy9eMEP0KkrMvtzMAmFXSMya1cY0gZF/FpKWWUhaFjAyrWK0SirKTM8oyU3MzNE
  1NDDQNTQ01TXQNTI01Uus0k3USy3VLU8tLtE11EssL9ZLLS7WK67MTc5J0ctLLdnECAzHlGKG
  6zsYJ/b91DvEKMnBpCTKm7VkSaIQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd7+V0A5waLU9NSKt
  MwcYGzApCU4eJREeItfAKV5iwsSc4sz0yFSpxh1OZonLd/OLMSSl5+XKiXOexJkhgBIUUZpHt
  wIWJxeYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMextkCk9mXgncpldARzABHfF26WKQI0o
  SEVJSDUzqi9e8LJpxKKlQM9GiV+PT7/uLFn9/PFXV70rVlmdL/5yvUdHe9kLJ/dHRZUuOvuaa
  MPPItMnWeWa2817fEc1ySj9y5d0GjlbV4H9b7zfeC73zNd3ChW/f2vUXT5zU3MZue+Wn9Ivzy
  w8xbL5jof7hx/8T927r2gg0JC56qRpm4VdZdtJL+nO0wfN3zVYfeip1vm87+tfBj/XtYjmt8k
  w35Wtmy6f3M0emWke6F6fpzGB6cf1u6/Hlk6dNXMuyvHTx5ZUW90+9fnG6+NlqP+mDt1cFZF0
  XNOkJPrl+4dvzri9fb1T+MV3zvKvc3Dl9z58eLFi1inMJn2qpq/PG7L172N/X5uxgVnP0T5I3
  PzftSIUSS3FGoqEWc1FxIgAuTGXDTgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-587.messagelabs.com!1638198302!40953!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4428 invoked from network); 29 Nov 2021 15:05:02 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-15.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Nov 2021 15:05:02 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1ATF4v3G030174
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Nov 2021 15:05:02 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 29 Nov 2021 15:04:58 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] icewm: upgrade 2.8.0 -> 2.9.0
Date: Mon, 29 Nov 2021 23:04:45 +0800
Message-ID: <1638198287-119133-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1638198287-119133-1-git-send-email-wangmy@fujitsu.com>
References: <1638198287-119133-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Nov 2021 15:05:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94134

Changelog:
Improvements to drawing right-to-left text within left-to-right locales.
Improvements for right-to-left locales like Arabic and Hebrew.
Give icewmbg an error handler to protect against destroyed windows.
Updated translations, most notably Ukrainian.
Only free cursor attributes when they were allocated.
Fix column alignment in menu's for right-to-left languages.
Prefer to keep the system menu within the frame when
opening it from the menu button in the titlebar.
Don't repaint the taskbar when it is collapsed.
Refresh the taskbar to prevent background artefacts in CoolSteel.
Fix the last entry in the themes menu for the default theme.
Ignore empty resize events to reduce flickering when resizing in CoolSteel.
Only redraw frame borders on the last expose event.
Fix the the bottom right hole of a scrolled window list for bbidulock/icewm#620.
Add logout icons to Logout submenu for issue #69.
Update minimum required cmake version to 3.2.
Support right-to-left languages for corefonts when i18n is enabled.
When codesets are missing in a fontset, then only search for
extra fonts in the same font family, and only when i18n is enabled.
Detect UTF-8 locale and support multibyte to wide character conversions.
Make DejaVu the default backup font family for corefonts.
Fix the horizontal scrollbar for the window list window.
Improve the ascent/descent detection for font sets.
Optimize text length detection for width-limited text fields.
Improve the Xft last resort backup font.
Improve vertical font positioning for the address bar.
Reuse discarded miniicon positions when minimizing to desktop.
Flush stdout after printing preferences.
Detect Right-To-Left locales Arabic, Hebrew, Farsi, Pashto, Sindhi, Urdu.
Improve the handling of font loading failures.
Improve the handling of setting "PreferFreetypeFonts" to false.
Use the font "10x20" as the last resort font instead of "fixed".
Be resilient to font preferences being set to the empty string.
Document drag and drop.
Add support for edge switching during drag and drop operations.
Update icewm.desktop for issue bbidulock/icewm#617.
Add a font cache to prevent repeatedly loading the same fonts,
which also makes icewm a little faster on startup.
Don't kill internal windows.
Only let a frame retake focus on an ungrab event when the manager still
believes that frame should have focus. This fixes the flashing of title
bar buttons when the window list window is popped up.
Fix for FreeBSD build.
Document the -T switch for taskbar in icesh for issue #18.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/icewm/{icewm_2.8.0.bb => icewm_2.9.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/icewm/{icewm_2.8.0.bb => icewm_2.9.0.bb} (94%)

diff --git a/meta-oe/recipes-extended/icewm/icewm_2.8.0.bb b/meta-oe/recipes-extended/icewm/icewm_2.9.0.bb
similarity index 94%
rename from meta-oe/recipes-extended/icewm/icewm_2.8.0.bb
rename to meta-oe/recipes-extended/icewm/icewm_2.9.0.bb
index 259187b0cd..e8e157658d 100644
--- a/meta-oe/recipes-extended/icewm/icewm_2.8.0.bb
+++ b/meta-oe/recipes-extended/icewm/icewm_2.9.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4a26952467ef79a7efca4a9cf52d417b"
 SRC_URI = "https://github.com/ice-wm/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.lz \
            file://0001-configure.ac-skip-running-test-program-when-cross-co.patch \
            "
-SRC_URI[sha256sum] = "12b7cce67b95b09f34873f46948e7f1cef9edd88682139e054b79ba165c53e49"
+SRC_URI[sha256sum] = "c76a8c9965a1edde4f2446b47ee17c8564e0e20f3d8474465f6d4c54d1125ac4"
 
 UPSTREAM_CHECK_URI = "https://github.com/ice-wm/${BPN}/releases"
 
-- 
2.25.1


