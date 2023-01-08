Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 248C2C67871
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 15:21:22 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web11.46800.1673191275034137730
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Jan 2023 07:21:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EhyZOHcN;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id m6-20020a9d7e86000000b0066ec505ae93so3838200otp.9
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 07:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ptq2l3T+IhvlX6dsOTQ1lgihZZB1EPjGc0O15UTTTSM=;
        b=EhyZOHcNGs8PwrCgYoMkZf4WY8otbuWHpBP/2NLg11dVPwAPqRr4jeaE2kDCIKgbMp
         8pXhGhZtoG9y0BqFKF22j3vW6hE4UJ3w/5Nq/OMD9NSxaiFKLdtOcpSSnLumi2l+Jtun
         a74gwOvMHZ8PK2tXJhlvAeRPVHUZ2H5A6DWyU/paxvW8nK89h/Jd0JISnGmrSS6WVqqA
         dIcXf8Yf+GGxVsoYEBJ2kkALz0ErmrvIoMGEbyqM1RR5tMmagrU8aU8jgHLQrumeXaD9
         icSJ8bSVDlEbngRwMRUhJTrbwm+1VGdyTp0XdULF7cUmtAL0I5CyScHue01YsyHiKQLk
         Es3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ptq2l3T+IhvlX6dsOTQ1lgihZZB1EPjGc0O15UTTTSM=;
        b=D63ETDaepd5OhulyaoIzRQUCfTGk040iPxQcskBUdm0b3r0C7TfmUCKplltfqXRc/C
         ZHp2VZavAqtpVgw3yneNP6tFMCdtJ9JQCu1yOcme8ptdrcYYP6CKjLw0ZaYRWAqAqUhX
         eMfPhEKZC6qP+C5q5xUlGUFYEfyr6RHwDhMwgmNMAeSxUQD/xfBr564I/aAamblhL9bn
         X22ctUWXnLvUowVR09syuj1FZyKmwxreZ32iY/O6iqeuVEN2ChzzvTccZvVkMSkWHE7a
         QOugUVnVecH0nEGcENFqFK2ILRw6StZyTk9fid+++tjJxXv+CgISEzm2M5dX6i9S39vT
         c+8g==
X-Gm-Message-State: AFqh2kqxPC9826J3vPpLzRXvrTeQC2dghwjspd3YBg1nlGOzG8Ck3Ljf
	90MNEhggplylza+kqpopEaEMGKIvpuo=
X-Google-Smtp-Source: AMrXdXtPetdFZiaShHU4LZkwDNL1+K2fHdMIl/ufoglpYZpZtLLdOJA9K0RRtZjY3pTrt8FLx9e7QQ==
X-Received: by 2002:a05:6830:3886:b0:670:5e99:4528 with SMTP id bq6-20020a056830388600b006705e994528mr38219087otb.4.1673191274270;
        Sun, 08 Jan 2023 07:21:14 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:14ca:f21f:f9fe:c54d])
        by smtp.gmail.com with ESMTPSA id s24-20020a056830125800b00684074fbce6sm3184725otp.54.2023.01.08.07.21.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 07:21:13 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 04/26] gnome-text-editor: Add missing libpcre build time depenedency
Date: Sun,  8 Jan 2023 10:20:39 -0500
Message-Id: <1a977efd266254b64adcd0ce4ea0a3fe698da246.1673191116.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673191116.git.akuster808@gmail.com>
References: <cover.1673191116.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 15:21:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100449

From: Khem Raj <raj.khem@gmail.com>

libpcre is needed. glib-2.0 now uses libpcre2 instead of libpcre which
was indirectly satisfying this

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b08c4ab7c8efb7ccf9f4c6b6f44194212752959a)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-gnome/gnome-text-editor/gnome-text-editor_42.2.bb    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_42.2.bb b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_42.2.bb
index 1446b151c5..763384b7ea 100644
--- a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_42.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_42.2.bb
@@ -10,6 +10,7 @@ DEPENDS = " \
     gtk4 \
     gtksourceview5 \
     enchant2 \
+    libpcre \
 "
 
 GTKIC_VERSION = "4"
-- 
2.25.1


