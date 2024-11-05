Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0618D35E38
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:16 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web10.27904.1730831957974046381
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:39:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IYAZ6qRO;
 spf=pass (domain: gmail.com, ip: 209.85.219.174, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e29267b4dc4so4787685276.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831957; x=1731436757; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GNquuLZLXrmM7w0O+XrPrwhs2DKf904DQR6AMewkwAA=;
        b=IYAZ6qRO58hjxTeCXg5Si3/nLXbXhz3Cv7uACfg53pawMPLWpsweQ3r80fG0aF4UTT
         QQA9fFfHLxmBvpJsesmpKJtOIoZwjEK3uEHPmg4JLYSHxbcun2VxyInhsp292QZv3Mwb
         jKyTFbdaMYnoZ8HsbYx4IZYYUFQMMsGhTdGmGrnNRXITCMFlQRvCDsOFWdUlYsM9JIQb
         9KPIPrvvKaRjjw3P6GFz65FC2s6oYVBObtDaCYXKHWgOpeO75sum3H+9AngDotTVy6x3
         fRc+u5s0x7vyMqzMziBaR9doJwiBQIKkqdzBYsqfmRXbaMFgNlogNpFqk7P62bk06nbo
         fB4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831957; x=1731436757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GNquuLZLXrmM7w0O+XrPrwhs2DKf904DQR6AMewkwAA=;
        b=T4qYimU1mhhTCKFV0svA1ox/r4G/zxJJoCB/fL2PnurDLhdchuBedJYYBT7LFbztgt
         wvvmRtm4N0fw42em02nSlfB0hHXKimxQjbn8hfo0YILzSPpGiSm2PSFV4QhHvLNERibW
         V/ipSTeFIbTGslYU4Sv5TkzPR0ZC6qQvTnk80uF/zFKFagnajzGCkxjQXJke4trIxbOh
         7FedAL/MXvtNlzw7zuQQoMdEemiZRFNCvpMc/+Eetj/dMKxBwof5xoFmJqlp1FrPzzXz
         0niQJ6yvuZ7eL83Qg06zNJj8O/ks+10c2Y5mjGsY7Q/Ahfnalu2FO8la1VirEh+GY9iy
         fAzA==
X-Gm-Message-State: AOJu0YzhPjFhBjPuiHtK8HW4VAgNSrynp6+ufS660HJbehskiUvoMTy4
	YF9wOFl5DnVocnobPvF6go5EN7alkIa5+xKzWrBzUVefXnoed5Kt3a4vtyy5
X-Google-Smtp-Source: AGHT+IFQWyZ6VkDC5kxcIIukQYpX4WfnSn/Rw6uqV76ZZccD3vsUvBBozZdwJM3TipLJhsQc6ESkjg==
X-Received: by 2002:a05:690c:338e:b0:6e9:e097:7191 with SMTP id 00721157ae682-6ea64a9f4b1mr170318347b3.9.1730831956631;
        Tue, 05 Nov 2024 10:39:16 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:39:16 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 096/161] font-bh-100dpi: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:26:12 -0500
Message-ID: <20241105183658.34982-98-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113611

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb b/meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb
index 5d321acc6..fd8f16dca 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb
@@ -16,5 +16,4 @@ inherit features_check
 # depends on bdftopcf-native -> virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "9f11ade089d689b9d59e0f47d26f39cd"
 SRC_URI[sha256sum] = "23c07162708e4b79eb33095c8bfa62c783717a9431254bbf44863734ea239481"
-- 
2.43.0


