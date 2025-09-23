Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8C07CAC5B0
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:07:01 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.14130.1758625612344352707
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:06:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nc1OYZPG;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b04ba58a84fso928613766b.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 04:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758625611; x=1759230411; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HuGMKzXBUhn+extLx4eW2ZvPtYfUsjbYZEDTO+VTF2U=;
        b=Nc1OYZPG/9DzfzKBGwmCBsIO5DWXU3AL3MN5YccemGlgjMjFCP5EYYbD/4T4IEppG0
         IAC0jBGVjSyAsOc17g6Fp7mS+h54NiveAsLov2N19yjPfOldX4giE5GyLMsPvHPlvEWp
         PKqkX+i8JMZJFzJNIg8Y2FJEiCYlWT5B/Erg+XyTTF33qH95q1MZp0yxb7Hn9QxwITNE
         YrcULxiT4G5tOX/2fxcYNxBFwmq5eOlR/DLhk6xsGn/SdEbe4Ml24hpZOdPPlVgIWEeX
         Y7kGviZ2VdEnvrEAmZs5O7Ugf7otjLlCVErMl5odMwiuLE8NBnMKddfIkPIuwnihyu0i
         jmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758625611; x=1759230411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HuGMKzXBUhn+extLx4eW2ZvPtYfUsjbYZEDTO+VTF2U=;
        b=UrsXZGHCkljPN01sXMpefBYYmCBeh2qGXluGIPcfui/rEEFOhFJsqgBzKtvEzdd0t8
         jOpnIpm+N3u1s1VWa/N+8J/Sh5kB30BkdzB1K8q6Nj0QKfwyh7Vkd6S1qx3OjVNPXryR
         uxG00DdzzfJe672eL8SJnPCxDL4KiYmxh57Ha1VUlXi0tMWsCfFSxyXGnECXjqiBcr+n
         pSOb02Qv8734TYzvgPEx3KlmmziuhbvTJct7U0T/7XLVcc5iZdhbJndshB368BLI/rlI
         7CxWv2+2R/lIdNe/kNaCzryx4Fv9yTJafMxO/1rs0maHX32O+yB/QPQ9vSWgYjeRcx1E
         0aYA==
X-Gm-Message-State: AOJu0Yx11Lpu/9W73UxiaEmTKhIjOZQyTohNMSW7dtIUKJynAyVuj7pM
	4M1ofbl/XYdsNt+yNpvfApWSka+0DjszrCC4Xcr9vPvSjDL+M+95EDUx7IoEbw==
X-Gm-Gg: ASbGncsf0XkwuvxEpG+TQemXR+uDQcdh7GHuIfOcNbUnZGhmP4YXhVRN9Phcg11VGAO
	04oYF3+xuICzTCt78ryTLWqCJlRQz6d3UvyCg5X6dh1HEgzqvFHecPvqU3twDrYnQVrKNf5JTwb
	2t1XJvlGLKBxI01/eZoc1ho1TEzvgn4CofWTjfJGtpFjm5/k6LLT/1GaRc4j6v2BSIr89XVfx+5
	TWATigEL1dvNLtaA5W4ieWWYbEOt4Php4sGTq/YYkBkAcv+wsClPAhO+eGd1Gg4bGt4GqtUp2TL
	EWuh9/TqRQ2fW/jvFhLiD0o3Hvwk+111O3bN+EU/RehzQwxF+tMC2YG4lDJEgqw/r11JIqPuOG2
	sgtMlcYEj5yYkPBXhXvQG
X-Google-Smtp-Source: AGHT+IHy2jW55REQnghnK+tXPhXJrJaHJaRVSMnFhhj6Hnc7GDN4NU5q96CTQVUG4JMCCm02aswpfw==
X-Received: by 2002:a17:907:868b:b0:b04:708e:7348 with SMTP id a640c23a62f3a-b302a07c94emr220252866b.30.1758625610595;
        Tue, 23 Sep 2025 04:06:50 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b293fa07816sm709263166b.50.2025.09.23.04.06.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 04:06:50 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 20/22] evince: fix typo for RRECOMMENDS
Date: Tue, 23 Sep 2025 13:06:34 +0200
Message-ID: <20250923110636.3413021-21-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923110636.3413021-1-skandigraun@gmail.com>
References: <20250923110636.3413021-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:07:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119684

From: Yi Zhao <yi.zhao@windriver.com>

RRECOMMMENDS_${PN} -> RRECOMMENDS:${PN}

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 783686ae9ad9407f71ec6f8d7e50b7a15bc46166)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-gnome/evince/evince_42.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/evince/evince_42.2.bb b/meta-gnome/recipes-gnome/evince/evince_42.2.bb
index c9e5617e7e..b84674fa98 100644
--- a/meta-gnome/recipes-gnome/evince/evince_42.2.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_42.2.bb
@@ -40,7 +40,7 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[nautilus] = "-Dnautilus=true,-Dnautilus=false,nautilus"
 
 RDEPENDS:${PN} += "glib-2.0-utils"
-RRECOMMMENDS_${PN} = "adwaita-icon-theme"
+RRECOMMENDS:${PN} = "adwaita-icon-theme"
 
 PACKAGES =+ "${PN}-nautilus-extension"
 

