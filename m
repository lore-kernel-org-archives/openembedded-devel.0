Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE61FC48260
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 07:54:44 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web10.13006.1707378882013869377
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Feb 2024 23:54:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FEIozTg1;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3be48947186so812876b6e.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Feb 2024 23:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707378881; x=1707983681; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0h2MkE4bW8yRtKcD8eZKaHzt7StrNQ4N2mFm97kMzWc=;
        b=FEIozTg16fdniq//tr6s8z49XUxZr51wYCmOYIBaShVJA78WQg+Zj3CSYRO4UiXhds
         7xEZvUP+EI1+a5uZZQKS0o8kD+/kJKdxFRo8Dq/E+ALPB2qVu/SBzuKghOezJDovAdZo
         FBxqQAx65kiASh8n1OQHNN6plIAWLyECahpHXHqjh7ayxpmtDpp53cO9YR7F/nnMLIFc
         d8wJQOvWcUbZWQ8gLcYEekbrwtSEY8Tfh93KkRgfpZdf+2bevpgdm57mF2dzA4Fui+4T
         CLSIyRfmHNNdBsDPozAC4hvxNJfCPERfn3R2U3IUXaSQ3bkfC0EQOzW5rnE4Uvo4gk6D
         6z5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707378881; x=1707983681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0h2MkE4bW8yRtKcD8eZKaHzt7StrNQ4N2mFm97kMzWc=;
        b=hA2phPYx22CmUQ5r6K0kYlr5b2XPkALgSszsjWadRhMP3m1EMtrg5ashPiG3nAqQlI
         Y4UjITGcPgq8VwPwYpEpdISsnRPNOdBxkVzkfOwVZPodHbo2z/jtCdNyx6SZiyDoJonY
         HujKzg+e6nvDQYPCWuYFf4iDF32Q7pw1UKqozrdlOWA4VDE7WklmTECBYwM6VsSZwPIE
         tpZ1HANcQRfURq4WMa5PK8T8HZKxjzbtL/X7/I3upTq+YwsT38nYSellAG+N0+wEKBUV
         LjL68rzwKfVhX1OFva5Hivl1c3Bb0k2qIQtILAn39X7rn0zhjyTafEO0YdhE9zYcaJSc
         wcnw==
X-Gm-Message-State: AOJu0YzySkMfMuOTkrX8vs+sMMf6JTMPCxlq2Uc5BmZ0CL0Nwnaxgx3I
	Xw5hQOBdNKBGlP3oe1QSZpeeMXKy4qpDrEDEdNpmkLDPHuOW9KIreoL6bnlLYzk=
X-Google-Smtp-Source: AGHT+IGc+uZXYID0nYptNZJZuQLmUzn4AfglAZoh/8SKbu5xlLWqBtKl303CrqtrJ65IxHd8LNHtcw==
X-Received: by 2002:a05:6808:f8f:b0:3bf:ec86:d744 with SMTP id o15-20020a0568080f8f00b003bfec86d744mr4337664oiw.53.1707378880912;
        Wed, 07 Feb 2024 23:54:40 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::c29d])
        by smtp.gmail.com with ESMTPSA id p17-20020a056a0026d100b006dde1781800sm2390539pfw.94.2024.02.07.23.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 23:54:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/4] can-isotp: Update to latest and skip it
Date: Wed,  7 Feb 2024 23:54:35 -0800
Message-ID: <20240208075438.1045660-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Feb 2024 07:54:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108657

Its only needed with kernel < 5.10, in such BSPs it could be
over-written in BSP or distro layers.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/socketcan/can-isotp_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/socketcan/can-isotp_git.bb b/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
index a60b55e7e7..ab97356e9b 100644
--- a/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
+++ b/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
@@ -1,6 +1,6 @@
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=72d977d697c3c05830fdff00a7448931"
-SRCREV = "beb4650660179963a8ed5b5cbf2085cc1b34f608"
+SRCREV = "7626d0a0707391970080d493ce69638719938da7"
 PV = "1.0+git"
 
 SRC_URI = "git://github.com/hartkopp/can-isotp.git;protocol=https;branch=master"
@@ -16,4 +16,4 @@ do_install:append() {
     install -Dm 644 ${S}/include/uapi/linux/can/isotp.h ${D}${includedir}/linux/can/isotp.h
 }
 
-EXCLUDE_FROM_WORLD = "1"
+SKIP_RECIPE[can-isotp] ?= "Not needed with kernel 5.10+"
-- 
2.43.0


