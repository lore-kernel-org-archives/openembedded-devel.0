Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6A40CE9D45
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 15:22:50 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92208.1767712962923868674
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jan 2026 07:22:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jRAfQJ39;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-78c66bdf675so11425637b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jan 2026 07:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767712962; x=1768317762; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fnsqv+dtTn2R3pNSyNJzI+ch+4iEa8yPjDrx8FnuiSI=;
        b=jRAfQJ39KezeZusb/2xphJcTR5cl6fnudLd0E4XxUTN1TarP7XibxpRSM2Rne79/Us
         OpwYWnd3bQds6HK1HD9Vul7Kl/lf5P6XW4UxDuO2hh8wdDFZxJPM2fLKfcSqQkh5pd5z
         0tWCL6Tbg01N5+XQkqeeGI0+aQoX4oerDTHOM+g6KT6Fhxp3EkSeleIJJ3q1NDPE5ZRy
         G3G8WFZA4U6u/mkmIM1aD/w3UhY1iuMcHI72jIdPonLobNxXRdDJ3/O8WvX+9Y2IUX2Z
         I4e4LOJ/HEIFGmJcnwP6gLushIOdmIuOvwUchw6043h8qQ4x7ggyxuxl1JqkzuJrCIHu
         v9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767712962; x=1768317762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fnsqv+dtTn2R3pNSyNJzI+ch+4iEa8yPjDrx8FnuiSI=;
        b=uIvaynxuCUTsz442CUD/JM0e13Lx3OQSllXVgwuUl3oI3H1ByHeDJKqBcMfJqhwE7d
         PbIveIoe5Cbg6LU+N+C1/qylkrWkL2Ej7AeJ9zSUCJCL8LSYThx2KcPGHZqAo5XsX/CB
         xsiv5DyNRT9MEdILtV67p0F2umJqQNRXPpqAGxmFX77v0xMyNOHXTIM1jRECYxDfTvKE
         a8LEjaOsGMXUi72hAy/weWbu67y2z5tf4mWw0SFyIMxpo7S2mAitm+orfxoDvq+gpETn
         i9LYrFqPUvaNz0GWK907F6e8lWTSqgkLwyTcTNe+UwyvJ4Wxeyb3j5Iajq0iILoDX1oU
         mVSw==
X-Gm-Message-State: AOJu0Yxcf8tKRBLbgvLdTfE7jaNBHK5Em4giga2fIxa1/zHcsWnuRaEc
	kvpJRY3CBlpnaBrx/wyldJzPVX/BHeD8K78wFFviQM7h9PzrTHESQCjJQW/T+Eop
X-Gm-Gg: AY/fxX5NF/13QkT1SToW47ITk4WCGPIYiSDqPmL2zzCheTj0Dl1j3dYvkv8koYupe+8
	2WmQgVx5Dqn6OpoBQXXyDIiFg4zLXW2RaBJUZkUpTXHp6hYi9dIWEM/rAylf58h870rhhOQqjzJ
	zQn3hVWE74fyFpmgjnMk6fMXlUm/q6sP5vtFUCefAnxHNUOsghhS+ottNvvyiNT6EId1ZxNPIQE
	JJTpRhMSxZb6C6h/oTzoYXqiORfwDppczHTQCE4WkRARJHPzTHxBtN8qc8OQ65P6ZVogJMI4m28
	RleZFqh2iJgNQ48yHl8I466+pKNJs/deWKLAdL942/UTZG5EM3+xR9I/UlDt1oiLtT59AvGZu+j
	B/HVdvPvTM+hp0JThehCC7kgx/NM1ERc2wDRKUqZyKD1rCj6l6N4CU0xwEqNoTNQL8cxD7Fx2/F
	wIsv9KBQ799TGmhvRPMN/MrG9nXiH5CQjqkPirHHtPMNTvDTct5VzbKKeac9uFyUuohlK8eay0D
	/zDzi8j+y38oyOPEYBeS4hHqF0/M0y+CF+JXD+yStZ5zLwPa9UkkRBPxlwJq4y9nQ==
X-Google-Smtp-Source: AGHT+IEHRI+0QCISaMj+VAKhvnX7F8D/cKrU87sLqzQtNTNmy8p2xmSs8PdLMnszE6qW9YKbpkGyZA==
X-Received: by 2002:a05:690c:e09:b0:78d:e514:8d55 with SMTP id 00721157ae682-790a8b64becmr27530677b3.61.1767712961334;
        Tue, 06 Jan 2026 07:22:41 -0800 (PST)
Received: from localhost.localdomain (71-208-41-41.ftmy.qwest.net. [71.208.41.41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-790aa6d93d1sm8278587b3.49.2026.01.06.07.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 07:22:40 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][kirkstone][PATCH] Add missing HOMEPAGEs to xfce recipes
Date: Tue,  6 Jan 2026 10:22:26 -0500
Message-ID: <20260106152226.17589-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Jan 2026 15:22:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123180

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4d964d4d79388c8c2db8d8a3fec029a656f9f937)
Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-xfce/recipes-xfce/exo/exo_4.16.4.bb                         | 1 +
 meta-xfce/recipes-xfce/garcon/garcon_4.16.1.bb                   | 1 +
 meta-xfce/recipes-xfce/thunar-volman/thunar-volman_4.16.0.bb     | 1 +
 meta-xfce/recipes-xfce/tumbler/tumbler_4.16.0.bb                 | 1 +
 meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.16.1.bb | 1 +
 meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.3.bb         | 1 +
 meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.16.0.bb     | 1 +
 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.5.bb   | 1 +
 meta-xfce/recipes-xfce/xfconf/xfconf_4.16.0.bb                   | 1 +
 meta-xfce/recipes-xfce/xfwm4/xfwm4_4.16.1.bb                     | 1 +
 10 files changed, 10 insertions(+)

diff --git a/meta-xfce/recipes-xfce/exo/exo_4.16.4.bb b/meta-xfce/recipes-xfce/exo/exo_4.16.4.bb
index b97d9943f4..2cce8907a3 100644
--- a/meta-xfce/recipes-xfce/exo/exo_4.16.4.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_4.16.4.bb
@@ -1,4 +1,5 @@
 DESCRIPTION = "Application library for the Xfce desktop environment"
+HOMEPAGE = "https://docs.xfce.org/xfce/exo/start"
 SECTION = "x11"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
diff --git a/meta-xfce/recipes-xfce/garcon/garcon_4.16.1.bb b/meta-xfce/recipes-xfce/garcon/garcon_4.16.1.bb
index a6c56edf3b..c472402a6a 100644
--- a/meta-xfce/recipes-xfce/garcon/garcon_4.16.1.bb
+++ b/meta-xfce/recipes-xfce/garcon/garcon_4.16.1.bb
@@ -1,4 +1,5 @@
 DESCRIPTION = "Xfce Menu Library"
+HOMEPAGE = "https://docs.xfce.org/xfce/garcon/start"
 SECTION = "x11/libs"
 LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=04a01abcbdabffae1ca26335a293276b"
diff --git a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_4.16.0.bb b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_4.16.0.bb
index 4b72d3a790..4b2ece0c54 100644
--- a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_4.16.0.bb
+++ b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_4.16.0.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Automatic management of removable drives and media for thunar"
+HOMEPAGE = "https://docs.xfce.org/xfce/thunar/thunar-volman"
 SECTION = "x11"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_4.16.0.bb b/meta-xfce/recipes-xfce/tumbler/tumbler_4.16.0.bb
index 6a583ade73..c1d61298a9 100644
--- a/meta-xfce/recipes-xfce/tumbler/tumbler_4.16.0.bb
+++ b/meta-xfce/recipes-xfce/tumbler/tumbler_4.16.0.bb
@@ -1,4 +1,5 @@
 DESCRIPTION = "Thumbnail service implementing the thumbnail management D-Bus specification"
+HOMEPAGE = "https://docs.xfce.org/xfce/tumbler/start"
 SECTION = "x11/libs"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
diff --git a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.16.1.bb b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.16.1.bb
index 18d9fedfce..e457a4a5b9 100644
--- a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.16.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.16.1.bb
@@ -1,4 +1,5 @@
 DESCRIPTION = "Xfce4 Application Finder"
+HOMEPAGE = "https://docs.xfce.org/xfce/xfce4-appfinder/start"
 SECTION = "x11"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.3.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.3.bb
index b9201bc655..40f52107a0 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.3.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.3.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Xfce4 Panel"
+HOMEPAGE = "https://docs.xfce.org/xfce/xfce4-panel/start"
 SECTION = "x11"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=26a8bd75d8f8498bdbbe64a27791d4ee"
diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.16.0.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.16.0.bb
index e6613b8ee9..60b8943210 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.16.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.16.0.bb
@@ -1,4 +1,5 @@
 SUMMARY = "xfce4-session is a session manager for Xfce 4 Desktop Environment"
+HOMEPAGE = "https://docs.xfce.org/xfce/xfce4-session/start"
 SECTION = "x11"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.5.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.5.bb
index 4a4e9f1883..2dc1def57e 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.5.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.5.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Xfce4 settings"
+HOMEPAGE = "https://docs.xfce.org/xfce/xfce4-settings/start"
 SECTION = "x11/wm"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.16.0.bb b/meta-xfce/recipes-xfce/xfconf/xfconf_4.16.0.bb
index be742192b1..703537011e 100644
--- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.16.0.bb
+++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.16.0.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Xfce configuration daemon and utilities"
+HOMEPAGE = "https://docs.xfce.org/xfce/xfconf/start"
 SECTION = "x11/wm"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.16.1.bb b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.16.1.bb
index a32bad47ed..a001343dd1 100644
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.16.1.bb
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.16.1.bb
@@ -1,4 +1,5 @@
 DESCRIPTION = "Xfce4 Window Manager"
+HOMEPAGE = "https://docs.xfce.org/xfce/xfwm4/start"
 SECTION = "x11/wm"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d791728a073bc009b4ffaf00b7599855"
-- 
2.43.0


