Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC6FF557F8
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 09:33:34 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16002.1776677611453219885
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2026 02:33:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WYRaFlRI;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488ad135063so22048485e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 02:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776677610; x=1777282410; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vXy8eHAkbTOPDQWNkxSRCYMfHGiZy7oFyN/TADXh4oM=;
        b=WYRaFlRIJ9YI9PiVR7C0ibqtdtQsD9QwvSC3YDrJX42sDtX/dA96BjhAC3RkFTZVG3
         AYRFkLRfV6OKj7/eyQtkKkD+FhA/neD34AZcuSvJ879AmMLsd2ICOfWENZs5taoQRFFf
         guD5XEhIUvxl3a0uWvMIAE1pnAMZu74SKdIX+0Y78dvGiZ+Lnf1A6uqMFR4tYHuYwki+
         grPjLukqTRo8HB+ES6fpEEjHEeFAs6NaPij1lxyFyugX92UAQ8KBlTBKLbLSvV5b8tVu
         VzHS1hKKE0TUvWMiEZg5AhL8dwX8aHXULEP6voSqUjnDMJP/NBG78+k/VBrXu6r3YMi2
         rcnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776677610; x=1777282410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vXy8eHAkbTOPDQWNkxSRCYMfHGiZy7oFyN/TADXh4oM=;
        b=SYKcgi118R+Qq1hevROcIbUhb8aU2sxt+/89FTjoX0Qi11VtmkdD4HYL2rFKl5tWDt
         X0SW2X58JVLRrvN1kJMSJheDCS4PBhD0/NWgxQGM2yfG2ofN8/3TuWoR0ClOz7IvnLiU
         3gRJ2i9TVU9kg0+k00KJSwimpYqRxjQfQZ6UGc5BUiTS5azvjWAcBGaBtVTgpGyInINQ
         dZ/uoroLz5jqfJlY8BrrrEl93mCQEXA4jkPmn3OEifd7N8zRewhOHOJsMRQXeadTKXS5
         mBN3lMHeaSza5Pf8pUTdgCQ7HAtP9Am7U/vpFgRTTFY2QTp6DGYqDbpZUuk/7igIEzZy
         kHxQ==
X-Gm-Message-State: AOJu0Yx0p6ddkGo72jPyZygJD+cmHBi7VmxVJCIXYjehwJErAOy5sUSv
	B61RzvfmfPp+5urZeyl7lOwbcAsDvGlMBVp1ac0rkLILtleMQLcx1GM9eUL7Ag==
X-Gm-Gg: AeBDievrHmcq9OnVl+8TPKIRPoNq2Spniqjta/Z3tSwJidLCSH1tBeWgf7H176hQ3cE
	wyDMvMsTCwB1RxRZUGCxQSy1OuapoxvvYgxvx8BQ8JXCPD7QC0TlcvLO0+mjSMsx03EpJgJk+Qh
	MKgSnYFMRnJt5cjJS6cYoT8rgrymPgPHD8jGu/d2AWYPLTlujpe6zC4ZtmQsRzPhZZFH42BBE0f
	PcHgnreHk0S5krqiykeAALttJ9bEtfJqJ6bhZzPklBO0VuROb6LEKMhls5iF4K3gRtpijCTTWPP
	DZG3dwUl72rBZuqTzkR6mVJ2IrGYyFOfGaWIhdb+KarAVvlr8/grwAOXoTbHSaWQr3aqaQYxFQT
	BHQXbiscTV7+Vna94Xofz3wE3YcfFcdTeazVrK97HigQjw/I8ZZ2zlUlWkWb1FDENaZ/ljFdm8j
	K4HV/lePxclzuZE5GMeitf8GoV8EksIf4=
X-Received: by 2002:a05:600c:8a08:b0:488:a82f:bb9b with SMTP id 5b1f17b1804b1-488ff369a1cmr111135255e9.30.1776677609638;
        Mon, 20 Apr 2026 02:33:29 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4eec9sm26577488f8f.34.2026.04.20.02.33.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 02:33:29 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 7/8] xdg-desktop-portal: upgrade 1.20.3 -> 1.20.4
Date: Mon, 20 Apr 2026 11:33:22 +0200
Message-ID: <20260420093323.357053-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420093323.357053-1-skandigraun@gmail.com>
References: <20260420093323.357053-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 09:33:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126493

Fixes CVE-2026-40354: https://github.com/flatpak/xdg-desktop-portal/releases/tag/1.20.4

Also mark the CVE explicitly patched, as it is tracked without version info
at this time.

The project now has a dependency on libglnx, which by default it tries to download
from the internet during configuring. To avoid that error, this dependency is added to the SRC_URI.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...portal_1.20.3.bb => xdg-desktop-portal_1.20.4.bb} | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/xdg-desktop-portal/{xdg-desktop-portal_1.20.3.bb => xdg-desktop-portal_1.20.4.bb} (71%)

diff --git a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.20.3.bb b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.20.4.bb
similarity index 71%
rename from meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.20.3.bb
rename to meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.20.4.bb
index e0aca558fd..be3c2be069 100644
--- a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.20.3.bb
+++ b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.20.4.bb
@@ -27,11 +27,17 @@ RDEPENDS:${PN} = "bubblewrap rtkit ${PORTAL_BACKENDS} fuse3-utils"
 inherit meson pkgconfig python3native features_check
 
 SRC_URI = " \
-	git://github.com/flatpak/xdg-desktop-portal.git;protocol=https;branch=xdg-desktop-portal-1.20 \
+	git://github.com/flatpak/xdg-desktop-portal.git;protocol=https;branch=xdg-desktop-portal-1.20;name=main;tag=${PV} \
+	git://gitlab.gnome.org/GNOME/libglnx.git;protocol=https;branch=master;name=libglnx;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/subprojects/libglnx \
 	file://0001-meson.build-add-a-hack-for-crosscompile.patch \
 "
 
-SRCREV = "23a76c392170dbbd26230f85ef56c3a57e52b857"
+SRCREV_main = "f5aec228c9eb0c9a70eadd6424d92c0ca8a78247"
+
+# this revision comes from subprojects/libglnx.wrap file of the main source repo
+SRCREV_libglnx = "ccea836b799256420788c463a638ded0636b1632"
+
+SRCREV_FORMAT = "main"
 
 FILES:${PN} += "${libdir}/systemd ${datadir}/dbus-1"
 
@@ -47,3 +53,5 @@ do_write_config:append() {
 bwrap = '${bindir}/bwrap'
 EOF
 }
+
+CVE_STATUS[CVE-2026-40354] = "fixed-version: fixed in 1.20.4"

