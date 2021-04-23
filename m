Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web12.3601.1619140928097533665
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Apr 2021 18:22:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UII1FhKQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id u7so22631771plr.6
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Apr 2021 18:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CgqtyiyQNWwPiCc9gtc5RT/PX/587F5Nqk1eTba2+7o=;
        b=UII1FhKQqG9AQoQ57DqwaeuyGnRX49rp25hCeIoVQhxRCfoBWcKuXJckdMxj0QBzt9
         d8MCR8oZqDBdXJ0Jl1KDPeDZfwWpIq4Icv1c1VMzx1gKDHSJ6HmqXUi8/CKPUtosLNM3
         gqQw1Pr55lFKrXAvfzaJZ+Crk91CXP+kNG7BMaeBZ1FbFHt65fYuxenl5HF58D9ABGXa
         Rl0zw5vWP5BdCeOBRcHvyC78MU5jBghYUoTCqoHkmWQg7QbCUv3Dnl3LOun4lnHBsZif
         8NRXy56q4GkLuuMH/2RFrtWwMS0jZW8AZLi5bXdc2SVC1dIaarepGxEepPG45dzyCzMm
         8tcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CgqtyiyQNWwPiCc9gtc5RT/PX/587F5Nqk1eTba2+7o=;
        b=EsUw+I8Q8DKA6emqnb34LXdbMffF6fwK++WdMQq88SBgXCG0Y3+t03YEPrgaaJwmop
         etBPAJvWBs+xLI+aUCcu3+8H6/RRIbuY9oPbp+mMum344YP4kfGgEACRUMY1kDKwc1BD
         B3TbxMqWZmMlrZE3gnBjGcyRK6k46jejf+CnFJE8MlkagZsPYOFDFg7SVkYxjjo/c5YA
         k9TRWl48W2b6R0WGXP9LhQQM00WonIe38aGE+C5FLwZClryo248HzfWxV9OmvUJUV9+o
         cw+n5gyIJkz6cKeb4YL8T47bqpkPoaIgwYIeJeDsXXxWKkXr1FBxxRJ6JRk2Zj8b2Q5V
         4DPw==
X-Gm-Message-State: AOAM530e/auTl10QtGzjFnsyB2AeorC1sx97KhaSmxCccJ3pxXKQKai3
	D9E7REVXlUoka3w784Xa3QZ7IYtyv1IvDw==
X-Google-Smtp-Source: ABdhPJxQ5e307TvhPnv/QkKnbwfYSBNOcapXk8k8wXLvacC0pOWhvQP8Yhy3l3q7N4ZOGiDAzk7MtQ==
X-Received: by 2002:a17:90a:b794:: with SMTP id m20mr1602054pjr.152.1619140927413;
        Thu, 22 Apr 2021 18:22:07 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id w2sm3152376pfb.174.2021.04.22.18.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 18:22:07 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-gnome][PATCH] packagegroup-gnome-apps: Add gnome-disk-utility only if polkit is in DISTRO_FEATURES
Date: Thu, 22 Apr 2021 18:22:03 -0700
Message-Id: <20210423012203.3651788-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-support/packagegroups/packagegroup-gnome-apps.bb   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb b/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb
index 1f450fd9da..593e5866d1 100644
--- a/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb
+++ b/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb
@@ -14,11 +14,10 @@ RDEPENDS_${PN} = " \
     ghex \
     gnome-calculator \
     gnome-calendar \
-    gnome-disk-utility \
     gnome-font-viewer \
     gnome-photos \
     gnome-terminal \
     libwnck3 \
     nautilus \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'polkit', 'gnome-system-monitor', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'polkit', 'gnome-system-monitor gnome-disk-utility', '', d)} \
 "
-- 
2.31.1

