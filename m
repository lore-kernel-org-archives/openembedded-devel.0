Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7270C44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 23:39:11 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11411.1784590750972010633
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 16:39:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OWSljT/i;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c9d1fc053e0so6338512a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 16:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784590750; x=1785195550; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m4X+PSg4Sk+TweEHUX1lMrWslzbwzFv5g0n9eLM5TQ0=;
        b=OWSljT/izFnLRdp2RRYZwCNvFMqNeRWB0mWIO7gDQljGeMuzvu/2/lhVyyovWa3kiN
         DzzIQ9IqlTb6xX/yOeMQYljlnEgTgWOdZkQ/jt/N0PLIQtyfhVdEhPFfo7kYhzK7Ybm+
         XNOB2xqa53j6gHpYoqu6TX3JEmF/SLLFYzx9oIC7BdWR9d6jqNgVz7zZVyqFQsEV3Ko5
         D08luI+T6FRpBQWGI72g+vWme9Ms1pKHOF6VzUIhG+5LwPnS2jLM/f3jwS9jlLo29/yv
         Irzn5ZzyJ/hX/VFwobCVTGFL3zQYoXqDhs4wTksAPh49HvyYyJVlEWuxmWp4dXx76KF8
         7b1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784590750; x=1785195550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m4X+PSg4Sk+TweEHUX1lMrWslzbwzFv5g0n9eLM5TQ0=;
        b=cZP4W7Y9c+/dIATgnfEP40n09EGym3DjfV0L+//lIIItvEBoRvydYRfOibvsivyXZO
         /wAxdJJ7lGDmnIqrNpeLECXekJrrwEBIRfoh/nd/azUredaotTA16LHFktpyGTv39MD0
         fdC0IRLIsPxALmpWxTO/bw2Zz9fqk/yjwDGHk+F6vDLtCPr2B/+L28AC/Zl7cp8sLjkl
         BfX24Y3Ny29CNB0OzCxCLBdsIgK53+Qp4rlabaHwxEg7C48luI0GtkSgo/WxJAoy3Rpp
         EI4qxf3/Z0NVIkvRx5YL9FTfGWLk9ltoCd592jttvUimjM/thXbEPZ9azOWRBmAgqqFD
         vtRw==
X-Gm-Message-State: AOJu0YyCZiHLTvmGDOqYBuv4kaIxq7gbrJ+ae4v2CbnN/pGVtxX0Knmy
	Bedeo3tHfUMZa9rYMKk2vJyptocVGHH5EZk+0XMo0b0ojde5hbC70LryTY1B4A==
X-Gm-Gg: AfdE7cl9fvFbEUp6CvZYqVb72YzxjmRrB1DQdODd52KSrHU+RcLiq88ooTFj8YZtNu8
	GqJJoAkyAvNmNzRjptw+N0ssaU1pmExFKJPUYNUI8aXhm9sOsb+8oWy8EBk3QsBDUSffOIPgdae
	GJsOi7dVd6PwaPIS6URD/gh9Kazz5r91obvzsYvUkK/UWazbYPoPCqhV80RedE7JHFFzzQXrVKf
	PaeV0JJ/7bW1RA/lifbERfQESEA+mQujhXpnuXYV6OwJxs/pG8UyXtsHxq5fOgH5MfbOWNvhsRB
	d2T7m+bAd7e1ymtFT5Tg+7mAJpwazSX/EAYaCVpeBHXXVkf8WYp1rrgOZk50PZtM6ZPJzg92Pys
	TBYKvSD5F4jnwaWJtD/JjB3FkHzsGWBqAfUgWDo/hP9kx8gliz4r8kSGEhKh7D+T5GvLPzKVj+T
	D5+AeVih4ti+rHDMI=
X-Received: by 2002:a05:6a21:7a46:b0:3c0:b4f8:bbfb with SMTP id adf61e73a8af0-3c3ad66822cmr19689531637.22.1784590750359;
        Mon, 20 Jul 2026 16:39:10 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe4677sm36926061eec.11.2026.07.20.16.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 16:39:10 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-filesystems][wrynose][PATCH 18/30] ifuse: upgrade 1.2.0 -> 1.2.1
Date: Tue, 21 Jul 2026 11:37:59 +1200
Message-ID: <20260720233811.2324493-18-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
References: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 23:39:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128319

From: Khem Raj <khem.raj@oss.qualcomm.com>

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit a2ab019840555e06b13ab72ea96481b9d282de23)

Changelog:
https://github.com/libimobiledevice/ifuse/releases/tag/1.2.1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../ifuse/{ifuse_1.2.0.bb => ifuse_1.2.1.bb}                    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-filesystems/ifuse/{ifuse_1.2.0.bb => ifuse_1.2.1.bb} (83%)

diff --git a/meta-filesystems/recipes-filesystems/ifuse/ifuse_1.2.0.bb b/meta-filesystems/recipes-filesystems/ifuse/ifuse_1.2.1.bb
similarity index 83%
rename from meta-filesystems/recipes-filesystems/ifuse/ifuse_1.2.0.bb
rename to meta-filesystems/recipes-filesystems/ifuse/ifuse_1.2.1.bb
index daeb5b9be2..82dc3b714c 100644
--- a/meta-filesystems/recipes-filesystems/ifuse/ifuse_1.2.0.bb
+++ b/meta-filesystems/recipes-filesystems/ifuse/ifuse_1.2.1.bb
@@ -7,7 +7,7 @@ DEPENDS = "fuse3 libimobiledevice"
 
 SRC_URI = "https://github.com/libimobiledevice/ifuse/releases/download/${PV}/ifuse-${PV}.tar.bz2"
 
-SRC_URI[sha256sum] = "5c584ae999ed52b386b0d2d1af8f8dcba451cddf31d7cd24367b18db0a9a5a9e"
+SRC_URI[sha256sum] = "9d490470ba6553f8052b385bb5330462e46fbe82131ebe65be47a1cc1c70e857"
 
 inherit autotools pkgconfig
 

