Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C929C25B50
	for <webhook@archiver.kernel.org>; Sat, 21 Jan 2023 18:01:37 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.2131.1674324096895347591
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jan 2023 10:01:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h+UA0NAz;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id lp10so4949964pjb.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 10:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rLzr+LYiVermOH3tcxV9g2hMGYTE7+/8hGhjfyd7kBc=;
        b=h+UA0NAz36VN0e7Nz+3wgXQF9YLyQotgiXzRuKlkYe3nMdbij7j+PAtE3o043brywB
         MZqPAvykrgjXF5dkQTijbwpnljDSpYg3MD3iy53G2od2aZX6IhaH2+2FqJPlGt/kzOu6
         gOdY9ekvz46EUToG1nLu+fvcO42A1KinBKe7i5jBmc9qOZFrb7vqOAPiLiiqvTB0gefn
         r2RpjCCbdfqJ6by5Fge8ftofGTISCyd/stgQF7BEmpvCmvlzlHvKs/wp0gxQrHKu0svg
         RZyyMxyYp6cU/4D89BIaufrhAo1eh7L3c2DGhSDjTexMmaDS3dOF5y3QsEcPEQoVAPmf
         eypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rLzr+LYiVermOH3tcxV9g2hMGYTE7+/8hGhjfyd7kBc=;
        b=e/Pyy7mKMxfj/MstM+Meupr7MqfhbNoI6NvOcHAoxV1r+xZcYd/Gn+saEOXMcGOjVf
         2C+lYCgTTX6SxsTNwNLI0tSzDdETDYfl33dG8IUHF17jXcADVv+HstMS2+LJDHDwdePQ
         o7V6dIAwk4yYnOgaeW56Px8ei1Oyx2sf1PLxj0Q4X3HFWgTrsD5rdzFoEpm2FTLytlOG
         Qg6HBEXmtz+2BzPoNrwCoEqQc/n93SFwR1L9GQXMcrUiQ0jDfw7cPakJtA7q4XNWvzvH
         kmT8dRqRo3SbiD13MGlszz50k4UswFAXo7PCGBwc8yR6cetc2kDQsfLyosTG/XbcZb/7
         N3ZA==
X-Gm-Message-State: AFqh2krIYpALvX7ClKdgSjqXnKm8fiZo+i5zlgfFwdTeSlPZQEWYn7ZC
	z+T7szFZokISBj++FRjYhBG9bzVoCykJMg==
X-Google-Smtp-Source: AMrXdXtHC+mhvhSNKUYtkA2u+Y+W8vMo1jj9UH5gJjSdnPY7qfNlw+75qun2mbpMdDYBYm74SS/4Yw==
X-Received: by 2002:a17:90a:e647:b0:229:5b13:d850 with SMTP id ep7-20020a17090ae64700b002295b13d850mr19645093pjb.5.1674324096148;
        Sat, 21 Jan 2023 10:01:36 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id d15-20020a17090a02cf00b00226c2d90c04sm3623583pjd.38.2023.01.21.10.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 10:01:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 15/30] pipewire-media-session: Use PW_ENABLE_DEPRECATED
Date: Sat, 21 Jan 2023 10:01:06 -0800
Message-Id: <20230121180121.1229895-15-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230121180121.1229895-1-raj.khem@gmail.com>
References: <20230121180121.1229895-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 18:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100682

pipewire 0.64 has removed [1] NODE_TARGET which is still used by pipewire-media-session
so enable deprecated features for now to get the definition of PW_KEY_NODE_TARGET [2]

[1] https://gitlab.freedesktop.org/pipewire/pipewire/-/releases/0.3.64#highlights
[2] https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/2952

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../pipewire/pipewire-media-session_0.4.1.bb                   | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb
index 9fdb60380b..da8d1d7ad6 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb
@@ -16,7 +16,8 @@ S = "${WORKDIR}/git"
 SRCREV = "e5d5cf2404786af8bcc40bdb8a2962bef4ec18b6"
 
 inherit meson pkgconfig
-
+# https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/2952
+CFLAGS += "-DPW_ENABLE_DEPRECATED"
 FILES:${PN} += " \
 	${systemd_user_unitdir}/pipewire-media-session.service \
 	${datadir}/pipewire/media-session.d/* \
-- 
2.39.1


