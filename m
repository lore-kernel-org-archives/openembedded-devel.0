Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8200.1795739691902350086
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:34:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=GoVKLgb1;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-38431138772so9740670eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739691; x=1796344491; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d1YGk8jwjqG74S4EzeSKWtfMG/eF/wJOZHdNYsk4Fk8=;
        b=GoVKLgb1VKIVR8ElzsvNHrew+5STICuti5eUdnb57/35I9vdLaOrrLx9QAZsFx1hpg
         6f+NZBzLaGZjNArD2FDcYO0divqBehta7elsB/6u4C/R51AvPOkajmUHwox8px1tbShD
         CloaKED5RS0w6bKfQsa2Yt57BbdplcDM3FbEB/+FRVDkMyaIQECri7KsqNDqfMoGwUWS
         nCJXpOLFinlNYjGAOWclSTGcJpq1iZXBpSG2cN3mrheQtj8RlZ5FcQeQiTkJ82Va8Wn0
         14rb6nr+8goaeV2hYfLyFnzNIYuobJZfw5ifWybDIXkXKUxQZtmPqvG7EeZBlnSZisgN
         WSUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739691; x=1796344491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d1YGk8jwjqG74S4EzeSKWtfMG/eF/wJOZHdNYsk4Fk8=;
        b=2Cg7jYCC09Dh8Iplt3Yvsj6Myw/3L+QSoWLaljbeqQWg85Exhuc69mQ1UWQysmWPdM
         HbiAw/3qcFiSGvI6/wZyUyrO06Hy6cbjoA+DxLxzchpzOo72suxTZtEAYdOVXG71Vm/1
         FnVdzFVPt00ikqT3X0Xznh5zcPt738b0UxJ4XE24Ok6UFeTUwhuJzY82ERY4Qce3xjau
         4hMCTV525p5n0hf/1BvY6qX/qK5KkliP07neuzrLjZMLM5x5dlU6rn6GzW6sb5UmPRMj
         fCzFI32yOEUU0yZE7WL+D9Um5j4WRokUugSRbvQnziiGG8128LIYEc+s21nuMGr8DlKB
         I5gA==
X-Gm-Message-State: APuU4Z8D55ciofDDeCyjbslkQdGdOrVjyk8pZbrsyXL4hmVz2y7wQmQc
	QIBH7q3BD/ddw77Xs16qmyfEwYmi0Ah/5uEBg+SMEiFWthL4gZ58yLVgS3PcRdjg
X-Gm-Gg: AZFdTZegX0PBlVT84xT5xs68Cg2eh4kFof/YXqC5Pm3r/IPcZzEHjfJH+Yq9iM60DEW
	VlmDCiVUw5uiPDcPSrImMJDKhwulnlcpC/tQYZkg+Rwg3gWemvrpRBKPd8rn6QNZoaDzzd/DA/8
	S08RH9t91NqQ2hQvGVirUH5/U2BAOxuOU11yi/nm2XR92ziYoAHP5by3TWygXLlsk9b02S68zqh
	+iSJx6GNfBTGAT8N9nmTFiimXKsvO2qUiHB/3BzYD9X/NTA1tOzwyQwjsKiCpT6zQOq/axtuj59
	lDZbSlt71zYVKuiS6RAgU+DhWPE7AsKfXp2+OVhWyoGexKrxztud9D2nyfa8y+2LFVCLyoOmz99
	vZIWXYeEeaW7cPsgGgM0+4ojSPRDbV3C7+eashRwRbUAe55Lk/xp999gnxp/eRgetjdCOZKPYWA
	PCJttI4jcGhJhPHRjJTT7GQZIiY1q4Ux+BAHeIb9BgVH86q2re4zb0YFZOEppeGDeHL1x05jnoR
	mYhsNn42tdcVg98ztmDMaRWr9u8GhfdpBb2F8Emj68Hi3bcOMgu+4EyEtYiq04XR5MQ5tNCuJ/z
	iZiGoRpwlhHuU5ulPTgCMXk0omz+OcwokXJKGmMYodlkpY0OSPnmg5+ttj3xT+d/7YAidzYU9Pz
	4AHOVEPL8MpRiAi3AvktbpeNrwdfslYevsQcnR1+i6TTQk11jFM1abLJZffQySS96IJLbqdDkYp
	X+1lS43KSWvg5fOZAU1UGkMsG3vnsgRDhGizlDlIoTAne/ef0N1f2HUrlkIeAoVc6qWsjOT5cgk
	3HkmVzUEXwBU8ep+A76DVZIMvcP9ixldyUzhqvSx5DlvZlmLkZbkW8WU0M4HniySXZhJA9y3yn5
	6Hbp
X-Received: by 2002:a05:7300:dd08:b0:386:ce6a:b256 with SMTP id 5a478bee46e88-386ce6ab415mr7024793eec.7.1795739691242;
        Thu, 26 Nov 2026 16:34:51 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:34:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 20/69] p8platform: Fix upstream version check
Date: Thu, 26 Nov 2026 16:33:36 -0800
Message-ID: <20261127003425.2166632-21-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133120
Content-Type: text/plain; charset="utf-8"

The default tag regex matched the 8 in p8-platform-* tags. Match the
version after the p8-platform- prefix.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-extended/p8platform/p8platform_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/p8platform/p8platform_git.bb b/meta-oe/recipes-extended/p8platform/p8platform_git.bb
index 4c98de3cd7..ab98e89592 100644
--- a/meta-oe/recipes-extended/p8platform/p8platform_git.bb
+++ b/meta-oe/recipes-extended/p8platform/p8platform_git.bb
@@ -8,6 +8,7 @@ PV = "2.1.0.1+git"
 
 SRC_URI = "git://github.com/Pulse-Eight/platform.git;branch=master;protocol=https"
 SRCREV = "2748be52ae27e6007ef548b697d4a03ff7de4291"
+UPSTREAM_CHECK_GITTAGREGEX = "^p8-platform-(?P<pver>\d+(\.\d+)+)$"
 
 
 inherit cmake pkgconfig
