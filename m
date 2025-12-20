Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E82D3E67480
	for <webhook@archiver.kernel.org>; Sat, 20 Dec 2025 19:03:18 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45066.1766257393543864706
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Dec 2025 11:03:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cbwHHsqb;
 spf=pass (domain: gmail.com, ip: 74.125.224.54, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6467bed0d2fso156068d50.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 20 Dec 2025 11:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766257392; x=1766862192; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tPmf+W+h2THZEOPurIVYIE/BurciiAmykAT2middD2M=;
        b=cbwHHsqbywP5aEG7zxqSkwvy0AFV2GeBCrwnvdMxdpHgiBl0Oha4GjTtdHgoSWx549
         YqGA4I5y51NJLgMyRGONQ/W14jNusMDP97zqECWsUwZt8m2X2bNwjoBqsimDOdIItjX7
         EZTMN9GPteh2R3FLRNlRqnKZE6YyhThKK5+09EggeXx62ydgKlPoYjM3yiF2Ev9bP2K/
         8zDesp+WvzCHKO3a0d+JyxhhjkCbSDZ3UkV7MYb7fJ3vDkjUwSE1/0Lz18mMWdaeDud/
         SFqsk+J4SzRT306u39DlE0a9YJzR90PqwwIXUgAoXm8Ra2EhyW5m+4OUksYkt6tMQlLv
         35ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766257392; x=1766862192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tPmf+W+h2THZEOPurIVYIE/BurciiAmykAT2middD2M=;
        b=TuvBJwa9+YvvOk1H1i0BRi45H18gm3hwJn0KDGA9/xc3zfyicFbNuAwOtgndawkDHw
         +2O0YBAjZ06yo8ArvSEigRhXRlttybz77JtQv6XB1RUyjl4W1DwN01xAMmf6MFGijPzM
         urzcPMXI4/mcpjB+FGZWiDmMJ1EDt35M5DP2TxT+eVARG1qQiCkT7usrywJz6v13ryfH
         8O8H10n2lVcXVTW403eHfhMlwkpL36BJVSbNlaTUctMF1Ay9BRE6sW5rTkNwRk1JO5//
         2T8dTJuFYDmKdHyhMD8BNZlB1EKj8m0BJGnE3za+DIgdqfzoADExgb7vfv1oNtqNgmd4
         COgw==
X-Gm-Message-State: AOJu0YztZ+v6ELGxLNCb53sOrKtfd+4BnH30JP5csPvkXEQUkBECDOrK
	e5X4X2oSO2ttOzRx1RuFzGFKX4vs0u0r+9FiCPnQEsSQ2wp64ajFr7z9BsgXvKMe
X-Gm-Gg: AY/fxX7JBSwRaH9Git/PLassZzxo4qnU2PV4IMq9OGv/6s64V95Sc2BwSwjS8RZuXTp
	XuEEM9MLTfDGttUrQKb/LqqzQJgoEs0pQet8upowvG3xaYyi4efTvgU+74JQEzf6C7shV7QFMlX
	DCLE9kfBa9pqwbZdCQy+FOEWLY57jnWBx+Ui+ql05FTJ9nTeCh1lqtl12bdUBF43WO7K/4SDDZL
	TCk9dhjndTnOz/JmfaFBAXqKOHp5SiyOA3bfQD+DQjB8457dnkD83V0jbP+0E8fiskPXlaiSXTr
	L+P7LfkZV9OHYK4JoW5rVfbhyHLNU1OjfvU2v4qQVlQuhiYrXXsr6lZL9KMlDygFwvf7MFSp8N1
	HS26dtyXs41BxenwZK4Wk5h5sVFOCjW6L9LcwSNKuqnXwZyx4wjCU7eIc/DoaIUxmgGF41QDz0O
	by8ItReR6c92Go4+jLOqJRtd6rgzL9ryspg9h/sv7BbdpIm5hTO4Z8qabEfJBhBd2geMU7wD51J
	D6vC8jivf62BU87MoJP8o0ELbCqhS6jbG2v
X-Google-Smtp-Source: AGHT+IHtO5vv4S75OXRoH4kP5PS/rKxoA060wdefekbygWKvLG963jj+CYUELnQvVBDz/B5O2Ubkhg==
X-Received: by 2002:a05:690e:4298:10b0:641:f5bc:695c with SMTP id 956f58d0204a3-6466a8dd484mr4971892d50.72.1766257392194;
        Sat, 20 Dec 2025 11:03:12 -0800 (PST)
Received: from localhost.localdomain ([71.3.192.67])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78fb44f087fsm23390827b3.34.2025.12.20.11.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 11:03:11 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH] Add missing HOMEPAGEs to xfce recipes
Date: Sat, 20 Dec 2025 14:02:54 -0500
Message-ID: <20251220190254.8166-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 20 Dec 2025 19:03:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122776

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-xfce/recipes-xfce/exo/exo_4.21.0.bb                         | 1 +
 meta-xfce/recipes-xfce/garcon/garcon_4.20.0.bb                   | 1 +
 meta-xfce/recipes-xfce/thunar-volman/thunar-volman_4.20.0.bb     | 1 +
 meta-xfce/recipes-xfce/tumbler/tumbler_4.20.0.bb                 | 1 +
 meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.20.0.bb | 1 +
 meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.20.0.bb         | 1 +
 meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.20.0.bb     | 1 +
 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.20.1.bb   | 1 +
 meta-xfce/recipes-xfce/xfconf/xfconf_4.20.0.bb                   | 1 +
 meta-xfce/recipes-xfce/xfwm4/xfwm4_4.20.0.bb                     | 1 +
 10 files changed, 10 insertions(+)

diff --git a/meta-xfce/recipes-xfce/exo/exo_4.21.0.bb b/meta-xfce/recipes-xfce/exo/exo_4.21.0.bb
index 26ff1d0504..354a5c0426 100644
--- a/meta-xfce/recipes-xfce/exo/exo_4.21.0.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_4.21.0.bb
@@ -1,4 +1,5 @@
 DESCRIPTION = "Application library for the Xfce desktop environment"
+HOMEPAGE = "https://docs.xfce.org/xfce/exo/start"
 SECTION = "x11"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
diff --git a/meta-xfce/recipes-xfce/garcon/garcon_4.20.0.bb b/meta-xfce/recipes-xfce/garcon/garcon_4.20.0.bb
index c827f96d34..5d7282ecbf 100644
--- a/meta-xfce/recipes-xfce/garcon/garcon_4.20.0.bb
+++ b/meta-xfce/recipes-xfce/garcon/garcon_4.20.0.bb
@@ -1,4 +1,5 @@
 DESCRIPTION = "Xfce Menu Library"
+HOMEPAGE = "https://docs.xfce.org/xfce/garcon/start"
 SECTION = "x11/libs"
 LICENSE = "LGPL-2.0-only & GFDL-1.1-no-invariants-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=04a01abcbdabffae1ca26335a293276b"
diff --git a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_4.20.0.bb b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_4.20.0.bb
index afdf410c60..15fa1ee4a1 100644
--- a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_4.20.0.bb
+++ b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_4.20.0.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Automatic management of removable drives and media for thunar"
+HOMEPAGE = "https://docs.xfce.org/xfce/thunar/thunar-volman"
 SECTION = "x11"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_4.20.0.bb b/meta-xfce/recipes-xfce/tumbler/tumbler_4.20.0.bb
index 6c5fce535c..6894e5ad67 100644
--- a/meta-xfce/recipes-xfce/tumbler/tumbler_4.20.0.bb
+++ b/meta-xfce/recipes-xfce/tumbler/tumbler_4.20.0.bb
@@ -1,4 +1,5 @@
 DESCRIPTION = "Thumbnail service implementing the thumbnail management D-Bus specification"
+HOMEPAGE = "https://docs.xfce.org/xfce/tumbler/start"
 SECTION = "x11/libs"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
diff --git a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.20.0.bb b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.20.0.bb
index f018a9927a..0e01740e44 100644
--- a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.20.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.20.0.bb
@@ -1,4 +1,5 @@
 DESCRIPTION = "Xfce4 Application Finder"
+HOMEPAGE = "https://docs.xfce.org/xfce/xfce4-appfinder/start"
 SECTION = "x11"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.20.0.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.20.0.bb
index 250482d2aa..f907e928f5 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.20.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.20.0.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Xfce4 Panel"
+HOMEPAGE = "https://docs.xfce.org/xfce/xfce4-panel/start"
 SECTION = "x11"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=26a8bd75d8f8498bdbbe64a27791d4ee"
diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.20.0.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.20.0.bb
index fb30ba789b..acff2d42b3 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.20.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.20.0.bb
@@ -1,4 +1,5 @@
 SUMMARY = "xfce4-session is a session manager for Xfce 4 Desktop Environment"
+HOMEPAGE = "https://docs.xfce.org/xfce/xfce4-session/start"
 SECTION = "x11"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.20.1.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.20.1.bb
index 353ea9ed81..0cbecab815 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.20.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.20.1.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Xfce4 settings"
+HOMEPAGE = "https://docs.xfce.org/xfce/xfce4-settings/start"
 SECTION = "x11/wm"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.20.0.bb b/meta-xfce/recipes-xfce/xfconf/xfconf_4.20.0.bb
index 04c12b44dd..168bd4d790 100644
--- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.20.0.bb
+++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.20.0.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Xfce configuration daemon and utilities"
+HOMEPAGE = "https://docs.xfce.org/xfce/xfconf/start"
 SECTION = "x11/wm"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.20.0.bb b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.20.0.bb
index 8b913ed3da..ef5a682b77 100644
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.20.0.bb
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.20.0.bb
@@ -1,4 +1,5 @@
 DESCRIPTION = "Xfce4 Window Manager"
+HOMEPAGE = "https://docs.xfce.org/xfce/xfwm4/start"
 SECTION = "x11/wm"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d791728a073bc009b4ffaf00b7599855"
-- 
2.43.0


