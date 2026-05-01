Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7930CD3425
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 13:51:37 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14873.1777643491460437415
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 May 2026 06:51:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=eO+TET27;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.43, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ba2cc05c704so31379766b.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 01 May 2026 06:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1777643490; x=1778248290; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sgb/iRsn24q5uHI/02IrG/l/6q0cQWIkyVbq954Gk3I=;
        b=eO+TET274lq+js3z+cG1QmbJ1DseX8+b317mO8WCxPbUsZSHtuPb5FbBoHkxLbzjMD
         6pjJ4Xt/xWY/TeWHkhcQr/d2ziLR/5wIqR+uWWjPg+xyKdCqEnoUGAU9YlqJC/9OX/7D
         RmgHdwnUmb00+uukHWhF2HmeUqcsNSAUELr6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777643490; x=1778248290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sgb/iRsn24q5uHI/02IrG/l/6q0cQWIkyVbq954Gk3I=;
        b=laYf7Hm9hTqU5q6BK+HRi5uuhooFLAYBNByTYrEJ3wJmXZauS0JW0ZmUxLXExVqhat
         Jf7mQeaUPy5ZPvTzBW8ubtN50SrzrVJbTnXhHispCJIIXaZckJ9sBQHm0Dghjts0ximT
         2lXHo91X/GCDvNUqj0j4O8L/HmXiQhsVoMCjdwNHerk2zBzbgrlJRXa+OyTSJBDmaOD3
         CWXWeItf4AAOXl/68VncmPLnhUgkYhv20sxuNYwP9HPG4qFAAMLTlQ3hL5dSfYVGIfWy
         gJFhWrIRRTo6IWWSFKoVKhSULL4d2SYvp/SUbC6fBL3t1O688M3atUDVX8WlaN+OFfJu
         80CA==
X-Gm-Message-State: AOJu0Yw2GvkpUgFVIKzJzJK+867wgPy627Mfjxh82X/0rG/MQ6/wm9RZ
	2VRuURaxSVflN/GlsblGd+wrWwlwtB0nd/bMYlaZgqTbVuO3Wxf9x9ys5jSFJwhj2VYWMurkuQB
	U7S28
X-Gm-Gg: AeBDieuCH9dqqVF1/3UCQUFUHw5D1U1qhNweVqJFKPS43GAY586r23XgBEfvqQyMnq6
	FvQlhnaRsennRNYDNqNoUiT5ykns/+eCTgLzduuoPF+c0wCrfWRdMpueCXUYxGNCthJgJsL6CJs
	zmJr5dDJmPRATQXgE4cWgLBGRI8LaGkeocc3G8G1+GI95rkpY2vaJuGY2Gy0u07MPFi+UBgxwxD
	bNcEIVdABqhFkK+3RYnb5bstho4JFEKUoGuUOLuRosHfsEkDuTsTjnfgg4hA0C3QDvQCM0bwFBg
	H5t/NBhEGuhCNpmqu0bOQONIwELPTHwfJXRSf8yvdPhOCPa4UdZ3LmXelBuesMXYOqCFb4oeEmy
	HPohCdiXCKj2b4yEPCcp5sM5qhYW6CVKCyVlqGJyMtyUDsP4FP+AGHbZ36NI61WO91KHd9bEr/M
	35QdeQdijrs28DMkf1YhOMq+twlTJt6KuCkh5FD1BTdEfWpdwwFtK+fWagSGVD4KaO9ONZWaKcI
	7VjtQEzhlGb+RirEr9n6MDG9p2Ro6rpYgD/0cW5nbe4lZJ2yU+bgD5XP/5ad8Q8YNT9bjgK7yk8
	9vzZuWZhgTM=
X-Received: by 2002:a17:906:7943:b0:b9c:fc84:92c with SMTP id a640c23a62f3a-bbac7896aecmr182708966b.8.1777643489786;
        Fri, 01 May 2026 06:51:29 -0700 (PDT)
Received: from adam.tail032493.ts.net (2001-1c00-8183-9900-dfb4-52e9-0b83-429b.cable.dynamic.v6.ziggo.nl. [2001:1c00:8183:9900:dfb4:52e9:b83:429b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6d06947fsm109196666b.37.2026.05.01.06.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 06:51:29 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH 1/2] libtsm: upgrade 4.4.4 -> 4.5.0
Date: Fri,  1 May 2026 15:51:24 +0200
Message-ID: <20260501135126.1386185-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 May 2026 13:51:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126760

Changelog:
https://github.com/kmscon/libtsm/releases/tag/v4.5.0
Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .../libtsm/{libtsm_4.4.3.bb => libtsm_4.5.0.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libtsm/{libtsm_4.4.3.bb => libtsm_4.5.0.bb} (95%)

diff --git a/meta-oe/recipes-graphics/libtsm/libtsm_4.4.3.bb b/meta-oe/recipes-graphics/libtsm/libtsm_4.5.0.bb
similarity index 95%
rename from meta-oe/recipes-graphics/libtsm/libtsm_4.4.3.bb
rename to meta-oe/recipes-graphics/libtsm/libtsm_4.5.0.bb
index 8168360dec..9e999fe970 100644
--- a/meta-oe/recipes-graphics/libtsm/libtsm_4.4.3.bb
+++ b/meta-oe/recipes-graphics/libtsm/libtsm_4.5.0.bb
@@ -22,7 +22,7 @@ LIC_FILES_CHKSUM = "\
 DEPENDS = "xkeyboard-config"
 
 SRC_URI = "git://github.com/kmscon/libtsm;protocol=https;branch=main;tag=v${PV}"
-SRCREV = "6cdacfc452bf29d98e297fe3a96e55e94a88ce3e"
+SRCREV = "556373437d1c5f57f4dfc7c6cc1330e5088a4174"
 
 inherit meson pkgconfig
 
-- 
2.54.0


