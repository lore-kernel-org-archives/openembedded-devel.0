Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B35BC43217
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 21:39:13 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web12.534.1642801152259131858
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 13:39:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=D0LMDGHM;
 spf=pass (domain: gmail.com, ip: 209.85.128.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id c66so18964211wma.5
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 13:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zdlcvV9O48SwTuYsBcTiuGAtFLugL5WPvWXZAFjrE5g=;
        b=D0LMDGHMmUzViga9M3XdgoJz06ncHjmMUcjHQzXVB6Ewmv7AThPBLjeqpTXY/3i7kj
         ZpAl7Sb/DqYJ5iRCbAekJ3+7LWKIqS5SaG2AXz/2I69RsAyec/f4eBaBe/KEljOiD+Oo
         AfQkuRNYDMz2454+Pxs3fQ1oCsyRXQyFmfqUm7nx26TP+s7FDrGubWYDUKqB0BVugwVJ
         66IHwinqnxkqM9T1imGZ+ZUxbSPaNKhbII0QMS3d1nn/L1VlPItrbyhdbJzHWEn+h5oO
         gTTAljhj1C/0OjSyx8l/omOxtW6J/j5wo5ph458wP3GoeeU76M2Eej9Z1Q6vf5yCAFOU
         3HSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zdlcvV9O48SwTuYsBcTiuGAtFLugL5WPvWXZAFjrE5g=;
        b=thz2PZneex8ZouPeThzVRZ0RLejRfx3yH8kWZBDjroBAygNajefFZQQwPtkDEntx0a
         q37Him9NmC+3Rqf2aJBdMfCKx4qzV2FU3fMq1LqnGRBtF1P2RaxkDoNxbyeQ3piZq7A/
         KlxRFGKLUcU2Q3G55AQOa3+fEQLqSynaqvpPjgqDptc/uxrUAN9ENLrcg0FPHCkXcYhL
         MBuDDdmOMZVBkEMjWrjo1mgIX4TCyE8GKNZjTmNXger5q3tO6nHWenIVt+jMTIXKPEWu
         E6vDURNzAwZu46ztHe47eqE+2t7L3XlY6SC1Dzpf0icLKqT6ZyHC7pQCGUwTI3yhBITn
         FyEg==
X-Gm-Message-State: AOAM530EQdMM29NpZgo916G5WQ2aByOTIrplH3qip8beu3M+QgxU1Ovk
	IFBEW04rsMK71Kkpdee8GQ4kilsvC8Y=
X-Google-Smtp-Source: 
 ABdhPJyaG8pey1rbVO2hS2xKmt70X5X6DPpaxpGQ18PCdMsOXVBFIJqiOMNdKfRRraZS0chJmuY5uw==
X-Received: by 2002:a05:600c:5028:: with SMTP id
 n40mr2258188wmr.10.1642801150900;
        Fri, 21 Jan 2022 13:39:10 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 l24sm5870274wme.17.2022.01.21.13.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 13:39:10 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/19] gnome-session: update 40.1.1 -> 41.3
Date: Fri, 21 Jan 2022 22:38:45 +0100
Message-Id: <20220121213858.762625-6-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220121213858.762625-1-alex@linutronix.de>
References: <20220121213858.762625-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jan 2022 21:39:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94984

This addresses meson 0.61 issues.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{gnome-session_40.1.1.bb => gnome-session_41.3.bb}       | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-session/{gnome-session_40.1.1.bb => gnome-session_41.3.bb} (84%)

diff --git a/meta-gnome/recipes-gnome/gnome-session/gnome-session_40.1.1.bb b/meta-gnome/recipes-gnome/gnome-session/gnome-session_41.3.bb
similarity index 84%
rename from meta-gnome/recipes-gnome/gnome-session/gnome-session_40.1.1.bb
rename to meta-gnome/recipes-gnome/gnome-session/gnome-session_41.3.bb
index c2513e928..010f815cd 100644
--- a/meta-gnome/recipes-gnome/gnome-session/gnome-session_40.1.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-session/gnome-session_41.3.bb
@@ -21,11 +21,8 @@ GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gettext gsettings upstream-version-is-even features_check
 
 REQUIRED_DISTRO_FEATURES = "x11 polkit systemd pam gobject-introspection-data"
-# This can go when they come back to a one-dot version
-def gnome_verdir(v):
-    return '40'
 
-SRC_URI[archive.sha256sum] = "9c787829ee32e13e1508b9aee2b1d9ba42a02c48e6c8094e34f3e7f92af4df82"
+SRC_URI[archive.sha256sum] = "ee4a229053f522624054889609335b885287cf67bbde0dc9fd882b01ec9b5b39"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', 'consolekit',d)}"
 
-- 
2.20.1


