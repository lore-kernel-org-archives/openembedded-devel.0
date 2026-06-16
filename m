Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1240CD98DE
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 02:09:26 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.145181.1781575765481616999
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jun 2026 19:09:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bNYOFXg3;
 spf=pass (domain: gmail.com, ip: 74.125.224.41, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-660323f7b27so3797530d50.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jun 2026 19:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781575764; x=1782180564; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dhEZ9YUtlFkhRytG/hrDUC3aCHiwzy/kPPKARJT8IOw=;
        b=bNYOFXg3u7XkPFDgGyWaoEb5MGxUlg0ci8siK9XxHdtzFsugam1cZsBCgMalDMaE5k
         sPYiqiTGmIIRMVa0zStDWZ4eBzhxMUXxDRgdu72RLaTsid9o+ajOUxnCNXvLYlYgWwxG
         bLa4PxifFInxQw/avjn1Qf8aLMtxt2lQejseXlxeRPAdT5FZ/rENPjAuOhliq7tDJaoY
         Om6qXa5WoOE0l8FAbCKKjU/ejxFFnePzjtBw1qsYZ34dAf1pOYeilfOQpVcoMrh92S3H
         NrKaFazhnAXLV7KYWOMbrBfZJzbkG1ZuBOVFA/KII/eIS4nV59Mntq7VPQyKd7/mpXNd
         xvIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781575764; x=1782180564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dhEZ9YUtlFkhRytG/hrDUC3aCHiwzy/kPPKARJT8IOw=;
        b=o746fI/VACDzObAJu8pu0HTDGBfMnlUOcVpJFLa3Rk72Gz3rAoddbxjP8USXYVzypf
         jQ1XT2Dax69LAlHDDbccqoomO6lTOHG+ve8OzDNXRZAwQ/UPk5vtgEsnMRFpNfS2kfXB
         HISNpwQHDbLEGm6LQGYtiFHOFiT4eMG4HvIcLmfQg5P+KmkTT+qZ1sQBwpp2z6IbFvyL
         Knjl5QzoWOacomqvRnY+yEfkwam1dQjOpLwLp3Cu6WaTgYsWytpcWk3JgRUoJitTWQ+R
         NGEuzWQk1Q+MxCCRqAPyLU/WC2zRJGL+IS1YtpE8X1d1Qlz2+P96X1wbf6j/3vAPaH9W
         agpA==
X-Gm-Message-State: AOJu0YwRGMClkIOdCgEpH2OCMzxi5xvgZLLkrWDfcRQ3bQPNTEm7Y34S
	3lvdom/7PMwFKEch9jjtmkNdP+M2tDnad1yh5gQkYA1JGWSs7VUy4ras0IjsvNeY
X-Gm-Gg: Acq92OEarZz06EC0q+pnJe2DKI8wNLIubGMe949K8QWjeIb+FzSDQseduK1QIY6to44
	zxOhBzlIaq1szRn7FMRWUfAiVaDJFX054XeqNpZDwPrhI1K3s2u6EKayXpogAgrruWBbxlJy3ga
	wBOyVibL/FPwgiUl92UdMg3vTViqmgQpdgm9CRMOz7g7G9WiuAuO4LY/9r/V8t+pz+9ltP+LWFJ
	xc8KGKU64vWneSoX6IYAtPVPPsvqju5lbgoEVk7NWke4fK1sq6iJz8D+agst0LpeNwS/NBQq7IG
	wxFkfIkAnrEIHOasVt9fiUlYIG/wBTAmIbVznsk9jAXJYZ3jm8/WAnRPKXFaZO0oISULfrHEDuT
	GU4sYLp1N0rNVRviNRXub6jPCj1EEy+1rnEtihmqj84nkcWDqhqtfA2pGCHVDllX1mYxfYX7A9w
	ifXKLcmpzXV7Xdkp+RshbpuhkArezQBTQWiTWy63JxDFkW6FQtBLjX8IlDsX8bjWf3Qo2kUjdlg
	YGTGI6hm+0954G18qeVi+Vc8g3mwYFaM8TwJRplWOdbtovykf0=
X-Received: by 2002:a05:690e:4803:b0:651:bc51:e6b6 with SMTP id 956f58d0204a3-6628500c7ffmr8072430d50.38.1781575764234;
        Mon, 15 Jun 2026 19:09:24 -0700 (PDT)
Received: from localhost.localdomain ([71.54.207.93])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66274ae1ce4sm6124389d50.0.2026.06.15.19.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 19:09:23 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH] Add missing HOMEPAGEs
Date: Mon, 15 Jun 2026 22:08:59 -0400
Message-ID: <20260616020859.9578-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 02:09:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127599

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-xfce/recipes-apps/catfish/catfish_4.20.1.bb                 | 1 +
 meta-xfce/recipes-apps/mousepad/mousepad_0.7.0.bb                | 1 +
 meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.3.bb            | 1 +
 .../closebutton/xfce4-closebutton-plugin_git.bb                  | 1 +
 4 files changed, 4 insertions(+)

diff --git a/meta-xfce/recipes-apps/catfish/catfish_4.20.1.bb b/meta-xfce/recipes-apps/catfish/catfish_4.20.1.bb
index 49483f602d..3f9d923da8 100644
--- a/meta-xfce/recipes-apps/catfish/catfish_4.20.1.bb
+++ b/meta-xfce/recipes-apps/catfish/catfish_4.20.1.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Catfish is a handy file searching tool for linux and unix"
+HOMEPAGE = "https://docs.xfce.org/apps/catfish/start"
 SECTION = "x11/application"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
diff --git a/meta-xfce/recipes-apps/mousepad/mousepad_0.7.0.bb b/meta-xfce/recipes-apps/mousepad/mousepad_0.7.0.bb
index 68e84dd3c4..a1f269feaa 100644
--- a/meta-xfce/recipes-apps/mousepad/mousepad_0.7.0.bb
+++ b/meta-xfce/recipes-apps/mousepad/mousepad_0.7.0.bb
@@ -1,4 +1,5 @@
 SUMMARY = "A simple text editor for Xfce"
+HOMEPAGE = "https://docs.xfce.org/apps/mousepad/start"
 SECTION = "x11/application"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
diff --git a/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.3.bb b/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.3.bb
index 167cc538b9..f9db607697 100644
--- a/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.3.bb
+++ b/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.3.bb
@@ -1,4 +1,5 @@
 SUMMARY = "A simple PolicyKit authentication agent for XFCE"
+HOMEPAGE = "https://github.com/ncopa/xfce-polkit"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=758b03f872a88c99fc36d50c5932091c"
 
diff --git a/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb b/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb
index f2a5e544d5..9c5e6e9515 100644
--- a/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb
+++ b/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Plugin displaying close button for application currently active"
+HOMEPAGE = "https://github.com/schnitzeltony/xfce4-closebutton-plugin"
 SECTION = "x11"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b6952d9a47fc2ad0f315510e1290455f"
-- 
2.43.0


