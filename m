Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48997C4167B
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 17:42:06 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.185776.1672249324300285686
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Dec 2022 09:42:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lR1rWZa0;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id n12so3939226pjp.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 Dec 2022 09:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W5guo80ufBmyHzzaUbzVLaWRZ4jhetsLmf7CnP0H1/g=;
        b=lR1rWZa0TLefqDLZgk4YVdnXhz8VJ8whoa2xE6Nda+32vD7UCUH/bp9FpSdivb8nQm
         BBfSeuk8cLcflIfCeCU3LZ12KHATakwfsbDqnfRMiXP1glydOGmhBnws0tmv0m7iB+eg
         KfcXK4dKQX1XGs3cgCxQluK/FVaqB1K4tCc2kyUMpb4cHoVymDrT0LesJFHvyjuefS74
         V7EVHYBV/5VgHAhOorsT2acjuZ8huHqcAwnYy4AMhVDuwcdf+ZBGLgHV4COJYynwA337
         NmLm1+EQO1ZMSOC4S40/hORM78HwF13pj+io4oJYoh8VGVZW2MsCIDZCqzrZuEWjGlQb
         hTvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W5guo80ufBmyHzzaUbzVLaWRZ4jhetsLmf7CnP0H1/g=;
        b=s+m4IF2lybdFM9IIZx1bKjg53C4BGpR12FhTRlNMiOuSdN0xmPNoMRHtgNa02wN0lS
         LHVx8LnqeptIE7H+tWu4Kdsc7sOF0RJ0Nq6I44ubi6PEyHLe813RCmnrJJEyBh6O6Yop
         kxvj3R2OL1QqiTzv61dnmZojuV2uDX5qk2FQYnrxiRL1f06T2mfnZgpFFv064Z4PT/YT
         VbfgBnE/GvuKm50Hi8PHoK/cLDSlM5NUxY3yEoJHw71l6nDT/Efec7pCULS5cLET5/nV
         v1lydoR/hWylHx+PL3aKCTS6wjjiLLj4zFrSjgakPgbBfUQSGCEweScsOhK1qZjgeO8P
         WgYA==
X-Gm-Message-State: AFqh2koj9F2SjXU81N1Y/kWyLmYmr8n7IuyzR0DCL54n3MjRyH/OAPXz
	RzJS1fxTsivsR+A/MLow1qvNk6rfOIY=
X-Google-Smtp-Source: AMrXdXti8CtFsOmALzAflGv6K1ZJdss5RuUC5srsVpMamm63tisgx9nPABLbEsumZFZUTwxN75S4hA==
X-Received: by 2002:a17:902:da86:b0:18d:6138:e4f6 with SMTP id j6-20020a170902da8600b0018d6138e4f6mr37047021plx.29.1672249323391;
        Wed, 28 Dec 2022 09:42:03 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id y2-20020a17090264c200b00192749a5257sm6799443pli.189.2022.12.28.09.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 09:42:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][PATCH] parole: Define DATADIRNAME
Date: Wed, 28 Dec 2022 09:42:00 -0800
Message-Id: <20221228174200.572426-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Dec 2022 17:42:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100294

This helps pur pixman files in right directory
pixmapsdir: /usr/share/parole/pixmaps

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-xfce/recipes-multimedia/parole/parole_4.16.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-multimedia/parole/parole_4.16.0.bb b/meta-xfce/recipes-multimedia/parole/parole_4.16.0.bb
index 545ab816e1..04aabe0c71 100644
--- a/meta-xfce/recipes-multimedia/parole/parole_4.16.0.bb
+++ b/meta-xfce/recipes-multimedia/parole/parole_4.16.0.bb
@@ -20,7 +20,7 @@ SRC_URI[sha256sum] = "0d305ad8ccd3974d6b632f74325b1b8a39304c905c6b405b70f52c4cfd
 
 RDEPENDS:${PN} += "gstreamer1.0-plugins-good"
 
-EXTRA_OECONF = "--disable-gtk-doc"
+EXTRA_OECONF = "--disable-gtk-doc DATADIRNAME=share"
 
 PACKAGECONFIG ??= "notify"
 PACKAGECONFIG[clutter] = "--enable-clutter, --disable-clutter, clutter"
-- 
2.39.0


