Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2736C5AD49
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 01:32:06 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.6049.1749000723094042771
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Jun 2025 18:32:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eWkMt8Tw;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-70df67e1b17so59028587b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Jun 2025 18:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749000722; x=1749605522; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BLlPzV1epnijEdmn0opgRyV0OqHxXLR8G2VigIS6wEs=;
        b=eWkMt8Tw6Xhg41/bCVRzAaFzKu4Lb+OQ7PslGlgLbt6VPIr8k7EqANBrBL6nJe/+m0
         utOHe6BK4a29y3QDKISA308DiMKaf2wPy+gjWJpwG0FAm7Kr2CQtqmhXHfr+3EgyAkz3
         uEQCZA52PfsUecUveD2QeI4z+UM8Y8H+8aHIUktApV4+Bog0BiD8FRXefLX+rpfC6Y9n
         3S3B03irxuPUQwuXFV6A8bNyYUPrT3tGm7y3pKBxcfZ1fE7jJBSYrEmUAk1ke+xS49QH
         e0rFd0tRE3xdqsMhw2o6SSU82KS/1f4K4wbZfaWm5VhdJOoCfkokwQiuBdN6Xo1lwn/V
         U3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749000722; x=1749605522;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BLlPzV1epnijEdmn0opgRyV0OqHxXLR8G2VigIS6wEs=;
        b=cH5ORO2ReFyiwwTdx414+tWRG/o64SEcZb+h7bsv/L4ueZhYzPNJ3PNsWaIKHLdC10
         /EaIqu4+m1HTxbqiWloljxptxPTLfLgEcH8x67KUbbgc2hH6x1o0NYCnW3NuOwRO2Cjq
         /yRMKcx/WbHgb8TgQYwOmd1BzQuJ69zoIVtuCvRcGmDIJSARu2nvqbf4cfXMCRCXOjx9
         X0nBRPh2PF2l6wpH8s8gnxcs3pBLadH/Ajo+drlho+jnQfpLOzxtDNkNtgAUx3dtDUFE
         lP2hFyEt2/qBS9vSV7ymrl6Njd+QJlZGACJUIp/70xDA3+9QL3xVgM3UnT3k3XTE02GH
         ffEA==
X-Gm-Message-State: AOJu0YxuGji9B0WvpENEBfm5BInOVpYQom4N2/VfEZHo8kvLzcD9SgbA
	9rLFZy2DIkXC3wAL4YKf6fFz7H3XKyj55AJoZyY5vc8JPnDZbZkt2MTFqWEqQ+bY
X-Gm-Gg: ASbGncvJlm8hDnPrKlgby/UeQjMQD0uJZVY/KpjI+gJdiw8qK4JOrPiaClxnrEzzr+W
	XGCMFreHimZpyHz6tmipFJgFZf/scVilUNS+Y0Q2TexSp5jomXUxuBhKGa3QVt7A6I2ZGvicAiV
	6SFKdEsbOpuxkB0lOzhzNEmH2xZ264p1d5JHmSlZTVIJIj5u/Tb8tYnQUfdESNPbGAEen+CUkCY
	eaJV+j0j/Od/AXb8II9OonhUgmWDgvFSOrnbqT+tGz6Qkos0NNBeVX+xPB+JCNaasai0HQm6mDJ
	8pgg89Lr+LKozddQRz+tebun17f5xKO+hVLWQLv1/22cIy9sl0+tb752z/rXjv5K/9u+H7xZQWC
	6IAk+ZoXGRA==
X-Google-Smtp-Source: AGHT+IEj+wnfd4yGE2zpLggwKr9mREPU52oZnWGIyHtW/rHMZO8zw95FGEfpGFsSg1hhPxStKAOOxA==
X-Received: by 2002:a05:690c:4b88:b0:70e:73ae:768d with SMTP id 00721157ae682-710d9a2d4bemr13404507b3.14.1749000721727;
        Tue, 03 Jun 2025 18:32:01 -0700 (PDT)
Received: from localhost.localdomain (71-208-4-221.ftmy.qwest.net. [71.208.4.221])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70f8ac0d136sm28010537b3.61.2025.06.03.18.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 18:32:01 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH] thunar-media-tags-plugin: upgrade 0.4.0 -> 0.5.0
Date: Tue,  3 Jun 2025 21:31:41 -0400
Message-ID: <20250604013141.884008-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jun 2025 01:32:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117725

Changelog: https://gitlab.xfce.org/thunar-plugins/thunar-media-tags-plugin/-/tags/thunar-media-tags-plugin-0.5.0

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...a-tags-plugin_0.4.0.bb => thunar-media-tags-plugin_0.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-thunar-plugins/media-tags/{thunar-media-tags-plugin_0.4.0.bb => thunar-media-tags-plugin_0.5.0.bb} (75%)

diff --git a/meta-xfce/recipes-thunar-plugins/media-tags/thunar-media-tags-plugin_0.4.0.bb b/meta-xfce/recipes-thunar-plugins/media-tags/thunar-media-tags-plugin_0.5.0.bb
similarity index 75%
rename from meta-xfce/recipes-thunar-plugins/media-tags/thunar-media-tags-plugin_0.4.0.bb
rename to meta-xfce/recipes-thunar-plugins/media-tags/thunar-media-tags-plugin_0.5.0.bb
index 00afa2bbb2..7418083149 100644
--- a/meta-xfce/recipes-thunar-plugins/media-tags/thunar-media-tags-plugin_0.4.0.bb
+++ b/meta-xfce/recipes-thunar-plugins/media-tags/thunar-media-tags-plugin_0.5.0.bb
@@ -7,4 +7,4 @@ inherit thunar-plugin
 
 DEPENDS += "taglib"
 
-SRC_URI[sha256sum] = "9592111e11699e449c1fbd5f72d1633ef39b00f17a988cd251ba228dab4fc90a"
+SRC_URI[sha256sum] = "105a72d51c7fbcc690c9b9a850f3743accbd9bf5dc51480b5ea283dfde96d61e"
-- 
2.43.0


