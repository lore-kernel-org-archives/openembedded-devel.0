Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 238E2C5479D
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 05:27:08 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.16694.1673414823899124650
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Jan 2023 21:27:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B2QGf1Sw;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id jl4so15626350plb.8
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 21:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6uwzyaHRJwyE4OTH4UV7OBfcOST0Wwbzyl6Gm83FdU4=;
        b=B2QGf1Swk/IVSAD6gmpiwhelGduxsN/TwTR5PubhVOaTg/93x5aCZOMXxeqmGekZdo
         EYcDekOzz3GcI7OvppW40eT6qZ1ZVBwVhrmmFr1MGfCrNzu4ZgyDHSnw9n1DNzFvVrhN
         M/GxRDqqMDRDF3f/8T3AuKrGxFqDS+8lly84PesFA3VJ6H+sKfw8PtTk69XYSz4p/kEK
         ESfbEXDcDPDRZQkeLkA0MPaTktYDLNnE9fCdUIyOnKreDUBXZflOh0TtU13UpuhThfqR
         4hWjalXERmB2DT1i6eYCDmAI0vY76wcJaFVqimp8F00gqQAaeP65NsPoYUAJ5lkmONZk
         jkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6uwzyaHRJwyE4OTH4UV7OBfcOST0Wwbzyl6Gm83FdU4=;
        b=6EcOKi2DpYVBpUncs4wREt22kxo3ycld2rpi/PfaphpEoXYOpv6soUcJFx4i3gaHVZ
         caiI0tTUxAKHJDImtMZCcQONTtzIT4WC7ZRSioBRG85aznqldTUOLrNzAutBzg/htj39
         XwmsXKWbPEkPfqTMpv8Ea+FSWZW6GcKldQQ2YB111TqDFf3Kcjk8u/1N63JVD3lxGsIX
         QNMq1dd5U6OHrs6MHbjoPfO5KYzXRAd+2+REzq+13CxkpgGaqac3YsEMBQH1Xzv2GkmU
         NTe5UahvLF/aZWHCP69GfTV7BOCh6eRSh5apVj1RpJkAewWjdTj1Yklxhp6w/2V+kZKm
         TnrA==
X-Gm-Message-State: AFqh2krL3OPWmu+O27RCVpBdK3iTU8bS3w0zjOz4H4nUsuCs5K00zM6x
	I4LtxBX5BkPYtzhK6waHPqCrCKlskxPQCQ==
X-Google-Smtp-Source: AMrXdXvTiav4JIYriRm1VvavG1ZS9NQhQeN1+zoOUn7gtxNDEeiDewOBsHX8Z8TPs3Wbn/Lq8HLkJA==
X-Received: by 2002:a17:902:b20d:b0:189:8016:9b4d with SMTP id t13-20020a170902b20d00b0018980169b4dmr69638118plr.33.1673414822949;
        Tue, 10 Jan 2023 21:27:02 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::ee35])
        by smtp.gmail.com with ESMTPSA id l15-20020a170903120f00b00188fce6e8absm5929317plh.280.2023.01.10.21.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 21:27:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH] xdg-desktop-portal-wlr: Add wayland to REQUIRED_DISTRO_FEATURES
Date: Tue, 10 Jan 2023 21:27:00 -0800
Message-Id: <20230111052700.3399968-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:27:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100538

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.6.0.bb      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.6.0.bb b/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.6.0.bb
index 7e1b7b9d26..a72116154c 100644
--- a/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.6.0.bb
+++ b/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.6.0.bb
@@ -14,7 +14,7 @@ DEPENDS = " \
 "
 
 inherit meson pkgconfig features_check
-REQUIRED_DISTRO_FEATURES = "opengl"
+REQUIRED_DISTRO_FEATURES = "opengl wayland"
 
 SRC_URI = "git://github.com/emersion/xdg-desktop-portal-wlr.git;protocol=https;nobranch=1"
 
-- 
2.39.0


