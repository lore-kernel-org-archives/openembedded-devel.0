Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E1ADE9D80D
	for <webhook@archiver.kernel.org>; Sun,  5 Apr 2026 15:39:49 +0000 (UTC)
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37044.1775403584210441315
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2026 08:39:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AVVFK+f9;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2cb3cb2fc7bso1384963eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 08:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775403583; x=1776008383; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dT4Qx7Xp6ONCtgc7Zz8qNPlG7+R80K8oD75myu7LcnY=;
        b=AVVFK+f9fxjvLnQ3FagsPvPXx9Ndoxvd16lFnTWZSUzew+m/UsKUPT9U4UaarnyawV
         8aNyB3gacbiZQ/dDBYvTDDZYO4LBYFxBKBUDwPd9i3A/nm53AXbK3cAwVxtY7r90gzhu
         DxkrUZVy1z2Foz0zJdeCu5hVNMyfkFDMhN0L4yVq7qua6tJrwcU9yS3No4epGxgkzoYC
         pdl/yeo3/48QK+WBu/OGyh9f/0Aw2bbjqH4FjLvEtZb4AjeYRw5a2+FPf5gBN/su4Isk
         n57/knv9TDMVMiHYqHG0KlxHKffnAtKK7MgfMM1n6+O51kWMnSoa51Ineb1xoxe/T97r
         yCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775403583; x=1776008383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dT4Qx7Xp6ONCtgc7Zz8qNPlG7+R80K8oD75myu7LcnY=;
        b=pt4Zimz97ZDXppysNPxGbTUf4HPCcPEkFfAkr7gsTpLf7FdB1NSF+E8raaYE+YS4/5
         0gFrvnKWLGZnZhy8WNmeZLnBxLR18cnatyy89zCSriWuufvXoHiMbAE9I2C1gzR+j6lC
         RhCr5BVIEiIj+dFYtf3zPgraFg7DsOaEXYnRIQyLicvd5AyTjb/qzylrUWz1ap36vKJx
         kkM+kixRwDhIUePKxx6Kq6ub0DUZA9RvePIbcTchnP66YkZkgnxHUSlVwOYyuYUtlg/F
         kJnX3t5GhFB9DTy+35m9Vn9ViWeMpoyu0WNGLB29gLP7I6xw44VzgCNPpLnG558ceO2a
         /s4Q==
X-Gm-Message-State: AOJu0YxwPHtvMMlVTbhE+vAnX7cxYlZMtCRGmZwSdyNBRl53TJ7+PyOC
	LKP0z79o9GNHhzqQJk8pHKUBiCGM60xmzrPK9v+DrEpgZT0Aif4YVgMdROE5zw==
X-Gm-Gg: AeBDievmBQEefl4ELtbbmDlHCypmUvytbsNYroMWq2hq9dyxGwPWNeCuHEFi2en+Rnh
	YAJLY1UD/KsFvS9aJl4C3sd7o8zbjl7p8gFTWvBxkCPHPpcBUL/fjuTpNI4osTlFLS91I62QVUy
	qrX4zhGOoU7byoof+LxPa+PhEIgFQSKHW+lpicGBLrIR9Uv8UOAYkLCHNBf17WPD49dlxEFmvqW
	o9wduDhn24HHGCxUOP9qlEYgj4UUuUkkI9uBIcWTvh6axdOkpKs3yaG66+cU8cYW3mR7L6lz/WT
	HHytcfJaeyMp+NNvg6sN4VtcwDZlDuRMPXeIkZRNMd2r59941WEukTDsUJKiZGsDfCb097AAJc0
	mm6S1Xakrot0cW0N5fy/9+ofM5XbpEu3o2MG97ZFHKvbodAjGZvSvGR9FmA+Ebxu7HPP0VsPIOF
	jXWbWxcUKmmWzzC55hjVi6RNPKT9uXAtEa9XrZLMI3QHSMSxW+oNqyLkD5VSMBWIEwc8LMLn9cC
	5X2SIOUfNWErifq6UZJBxpa+yG2HlBq+08UzDE3AkFDQ2/q7JmvL1ZJzGLd
X-Received: by 2002:a05:7301:4306:b0:2cf:8de3:d48d with SMTP id 5a478bee46e88-2cf8df3209fmr300155eec.2.1775403583142;
        Sun, 05 Apr 2026 08:39:43 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ce39d13decsm3298121eec.8.2026.04.05.08.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 08:39:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Changqing Li <changqing.li@windriver.com>
Subject: [meta-xfce][PATCH 2/3] thunar-shares-plugin: Depend on X11 distro feature
Date: Sun,  5 Apr 2026 08:39:35 -0700
Message-ID: <20260405153936.1093103-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260405153936.1093103-1-khem.raj@oss.qualcomm.com>
References: <20260405153936.1093103-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 15:39:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126017

it depends on thunar-> thunar-panel, which currently depends on libwnck3 which
only works on x11, thunar technically can replace it with libxfce4windowing
but its not done yet.

fixes

WARNING: Nothing PROVIDES 'thunar' (but /home/ubuntu/yoe/sources/meta-openembedded/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.5.0.bb DEPENDS on or otherwise requires it)
thunar was skipped: using DISTRO 'yoe', which is missing required DISTRO_FEATURES: 'x11'
WARNING: Nothing RPROVIDES 'thunar-shares-plugin-dev' (but /home/ubuntu/yoe/sources/meta-openembedded/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.5.0.bb RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'thunar-shares-plugin-dev'

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Cc: Changqing Li <changqing.li@windriver.com>
---
 .../shares/thunar-shares-plugin_0.5.0.bb                       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.5.0.bb b/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.5.0.bb
index b270ad0838..b8a18c2f51 100644
--- a/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.5.0.bb
+++ b/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.5.0.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"

 inherit thunar-plugin features_check

-ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
-REQUIRED_DISTRO_FEATURES = "pam"
+REQUIRED_DISTRO_FEATURES = "pam x11"

 SRC_URI[sha256sum] = "34d4d69d413e63837c5083506b4dbf65f1fd2efe17667b1d7ad0699e1e2eb07d"


