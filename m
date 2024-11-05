Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E791D40D03
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:58:20 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web11.31008.1730840532098260638
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 13:02:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=foCPQhZV;
 spf=pass (domain: gmail.com, ip: 209.85.219.174, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e30eca40dedso4887863276.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 13:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730840531; x=1731445331; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eTA5ARH0VNQQQI8GSAR9KKgBXtNqSeNVQ7eDTcEFgbA=;
        b=foCPQhZVj8hGBuGR4mG51SW/f66U1hde0qx6Gs4bI4ozKslfiMdYEoOX2ztmRQcdVS
         j1Td+IkFBuLr0rlaNErA8gttG5cahbbOWrO616pvAkKyfmY5mvhX+o4kS5eXmOiEKy2E
         cA210w9f9EKpQVlZdKR2dUUxf9IfVCMfUAu1CpMpL7fzv3BAbcBrViAIps1+/52wYR9e
         3A3ebSMty7y3UnreHvBZf5b8bWcVPMSMMFsNo2xe/6f/ntf7q6GuwFahjsq/r67yjXAT
         EI3orPWPWMKDLAp2XuA+buKgDlOg23hKV9VRoyRYusvxQ+FQ9eILsp7bw/JcxlXASF83
         DZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730840531; x=1731445331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eTA5ARH0VNQQQI8GSAR9KKgBXtNqSeNVQ7eDTcEFgbA=;
        b=mTLzg6AkSF99E7pYmauLJKGopEk/L9b6AK9p+od9KSfBB6yc0fbHM+fb3P7EsU4RJq
         1Ys7aZzqH3VyrdZUB93jcLk31dI64TApgaIoBYXay04n+n9UhiW8dGJp5rmSYFsFYryS
         LWl154zEZnCrlJvmqq9qZIKbSRbijaN3GmZcSIBE8cVWCf0Yfbn+3RSZKxUVvAFWht+f
         vZcIs+mvft8/55h83pC/50CxYwUP+yshsie6VJJCF87EvO/M7oLg40D0yAlVWL9fcgAO
         3EvzhWALA9rYxoVnVVbperJveeX6m2xkpP0Qkr5k10Et1nd/w4TBjuBKjP5YpbW3Ufln
         Arbw==
X-Gm-Message-State: AOJu0YxOKQfR5PSNc0mR1Hhu50LcFstbWjuXGOFtbX0uFb/AAt/M0r3R
	r74ZQ6dcSe8mPPHjFRHmv9Ztc3M6R2O/sPxx3H+GA6dCvaRhY1fLaq+UaOdO
X-Google-Smtp-Source: AGHT+IFQnYX8EGcVF7wB7FoAimpDNSyutpoS8c9KTF2Emh80S/RAhKOu8BNtAgUGmdv4Dy7OIWOkEA==
X-Received: by 2002:a81:d805:0:b0:6ea:7b00:4aa5 with SMTP id 00721157ae682-6ea7b004ecemr102725177b3.33.1730840530697;
        Tue, 05 Nov 2024 13:02:10 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c45b49sm24634717b3.97.2024.11.05.13.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 13:02:10 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 157/161] xserver-xorg-cvt-native: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:47:03 -0500
Message-ID: <20241105204707.4155-157-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105204707.4155-139-schonm@gmail.com>
References: <20241105204707.4155-139-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:58:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113673

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.10.bb          | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.10.bb b/meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.10.bb
index 76aea6f41..e672701ae 100644
--- a/meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.10.bb
+++ b/meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.10.bb
@@ -8,7 +8,6 @@ DEPENDS += "pixman-native xorgproto-native libxrandr-native"
 XORG_PN = "xorg-server"
 
 SRC_URI = "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "8cf8bd1f33e3736bc8dd279b20a32399"
 SRC_URI[sha256sum] = "977420c082450dc808de301ef56af4856d653eea71519a973c3490a780cb7c99"
 
 S = "${WORKDIR}/${XORG_PN}-${PV}"
-- 
2.43.0


