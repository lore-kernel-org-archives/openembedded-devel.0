Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6822BC43219
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 13:50:00 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web09.17040.1652622597084101797
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 May 2022 06:49:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=C4kOWjHT;
 spf=pass (domain: gmail.com, ip: 209.85.215.169,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id a19so11579797pgw.6
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 May 2022 06:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=kzttu7y1XmLmIV54l2bAbg0tQbdlqYW1LYNF2McoSPE=;
        b=C4kOWjHTQh5Y362Pb9oAPEkTBL4Ry+SAkH6Mcr/BUMogjo37OKKwv14E8yfUhl8tOu
         wVRSIlE7WeEtOKQTj7ek3pQQ/Fn1qql3H357EUJHLjHT3hl1u5iyy+EOxUniymxmjkd7
         aej+a8OuunZpeg3Mddnomgj60hdh2wQYHpKxAuDSBFzhobPggTEpfT719WXD9GxiD9rR
         2X7pWvWfi6AQKCGNwahoil3lGiKmtdZZELXYcWcmWHngfyfvhJNEIxKtM5wzprb7FLiM
         Ohdop1cbldbqYIDpGP0rgbuA9ddMpFsyUWVpmpX2owROj07YR4zGK9gDR3pEpxn4rs2h
         6y9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kzttu7y1XmLmIV54l2bAbg0tQbdlqYW1LYNF2McoSPE=;
        b=s68zrHDFXIq+PEM0D0+TACw/lX1+6gY9qyAVlu9esVaYWcN8kLI0VUWo/VFbA7sCZ2
         O9oFknizAQAUSUodP/hh2Hb0qFoG+jJ4d+auu+X5/oxxTbGjHUE26xcjXmZYe9O7g2Fc
         Vvw9eVScBZV5wtQIQg6KCezeCEOQLea9z9Cty7HVyHEUzaMG7jzpipViH5k7dkIKroY9
         IpxAOWPydDQqSF6WXL6ew3xgMZ0+xRfDA2k/dFY2S6kLI4HZ7yCwv6UGw6AQlz89ue6F
         kwZGDqdXBHtNTghP0vt2F7tF4SSupN6bdGmquwfGdbUC6xAg097EkVKegFrAHDzC7hH2
         1g5w==
X-Gm-Message-State: AOAM531yoKPdYf/OK937I5Ze3tIprrhnTnzpt2peT00m7Iw1fCstvFj/
	ig9eQxjBRw0/O6jUw/vxcO4pz7lev8gz9g==
X-Google-Smtp-Source: 
 ABdhPJxA/LyG9G5KJvnLyyR5x6IzX3TCMO0suFaKLVb7BEmpQkhQ7Uox49Klstw773p9Z4I2TFrPcQ==
X-Received: by 2002:a65:6b95:0:b0:3f2:638f:db1d with SMTP id
 d21-20020a656b95000000b003f2638fdb1dmr2172080pgw.604.1652622596323;
        Sun, 15 May 2022 06:49:56 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:48be:3d3d:c26:7949])
        by smtp.gmail.com with ESMTPSA id
 z22-20020a63e556000000b003c644b2180asm4961650pgj.77.2022.05.15.06.49.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 May 2022 06:49:55 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 22/22] minidlna: fix obsolete license warning
Date: Sun, 15 May 2022 06:49:22 -0700
Message-Id: 
 <80aa238913a0c41bc0f823a0f141023313c3105f.1652622481.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652622481.git.akuster808@gmail.com>
References: <cover.1652622481.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 May 2022 13:50:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97119

From: Markus Volk <f_l_k@t-online.de>

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f26d0085d7bbbffd5fcfe6a1bb67cc338ebd1cbb)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-multimedia/recipes-multimedia/minidlna/minidlna.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc b/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
index b913a83931..4959a3c8d7 100644
--- a/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
+++ b/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "MiniDLNA (aka ReadyDLNA) is server software with the aim of \
 being fully compliant with DLNA/UPnP-AV clients."
-LICENSE = "GPL-2.0|BSD-3-Clause"
+LICENSE = "GPL-2.0-only|BSD-3-Clause"
 DEPENDS = "ffmpeg flac libav jpeg sqlite3 libexif libogg libid3tag libvorbis"
 
 # because it depends on libav which has commercial flag
-- 
2.25.1


