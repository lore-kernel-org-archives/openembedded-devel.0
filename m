Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.25622.1605712094703000779
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2020 07:08:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FPdOdbZ8;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id 5so1120819plj.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2020 07:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=TDx6mGh6Sjifg7qRtA2Sb2tq2CppX2nZ+dF4lwPDT64=;
        b=FPdOdbZ8qGm8KraHHZUrwN+DnmMnzTrcEPwSCMTzYvR/WF1C/a/7ceSkEbzZo8WSbL
         Qzar9ZwfKP3eutCXqqS07hdYNpEeNIW00A7CGxrs3eME45rf+v10D7UirUtI2I+I1JDU
         N3hL6l/zKIHG4U/SjC8GAGOrL9wPbT11FKHjfQGIKMBtBaZTl7ifvC3mGPdg2fhXa7nA
         0kC7D0+4Xf9lIgpA00HN8jDRvLxDKDqtcC1olaODawTMs61NoE9zsgXIkaLQQoHBYN8N
         1KBaoZbuirKRZmtpdpJvT/8JIG2tT1hSnw5NKHJ0Q1VVD9xZrUgJKt7dFKORMs7w3yY6
         rh7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TDx6mGh6Sjifg7qRtA2Sb2tq2CppX2nZ+dF4lwPDT64=;
        b=HxKLMBXT3YGgXQJkiijnqzeYFscnreIdekDcsD6tZHTiLfML8SAaJL27cS/+u5wkI4
         0kxTaITsh/bDVjTjdPxEnvMSHRu56MBWX0TSJyJtkwFzIrzoF3Vl1WoFXePlt+tzVOPT
         KnanBgtunorq3zqNrztjmNV283Nw6lbHANthDEmUIBvrMRXF4oGgDidJOXG2iUMv33zD
         jHl5zs+1rrCKyvXTdCfF7XBcHChyjICvgbJjzcEcC0nvmM3yKU9Ba2e83zBj1gcSE4UT
         gmKHbXfQOwR5yuZZYYygzzXTai5eQkMtyCa46l2YiBYsFo/9ng9LmhMzZ94Moya6zGke
         G/4g==
X-Gm-Message-State: AOAM532qE7ihhu+KL/fDahiF5Uq5FutPu5Cm6O01aC3zfzj7rWZMgyJK
	QlPsXvGsQNGo4R1QF0O7fL7r9ucc85M=
X-Google-Smtp-Source: ABdhPJxuIh1O9cX9rGERuRtanRaAXcR1V5Medv97T4T7Pve+KhrKOP4y3PS9o5/ee9D9u4kuPybXRw==
X-Received: by 2002:a17:90a:e510:: with SMTP id t16mr392638pjy.234.1605712094105;
        Wed, 18 Nov 2020 07:08:14 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:98b0:7a07:4094:f249])
        by smtp.gmail.com with ESMTPSA id g1sm2823005pjt.40.2020.11.18.07.08.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 07:08:13 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 11/17] gvfs: adjust fuse packageconfig to fuse3
Date: Wed, 18 Nov 2020 07:07:51 -0800
Message-Id: <8d0ef1e05cb595f2bdccccaeab0e182e67b7a366.1605711982.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605711982.git.akuster808@gmail.com>
References: <cover.1605711982.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Diego Rondini <diego.rondini@kynetics.com>

Adjust fuse packageconfig to depend on fuse3, which is the only supported
option in gvfs ≥ 1.41.
https://gitlab.gnome.org/GNOME/gvfs/-/commit/7a0a06186b6fef07b8fce2360c04fd075fc84ed1

Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit bc5394b7ae0d88e3b7f614b31d1ebda0e40d3f81)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/recipes-gnome/gvfs/gvfs_1.42.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.42.2.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.42.2.bb
index f04246f168a..4f5784f26db 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.42.2.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.42.2.bb
@@ -62,7 +62,7 @@ PACKAGECONFIG[samba] = "-Dsmb=true, -Dsmb=false, samba"
 PACKAGECONFIG[systemd] = "-Dsystemduserunitdir=${systemd_user_unitdir} -Dtmpfilesdir=${libdir}/tmpfiles.d, -Dsystemduserunitdir=no -Dtmpfilesdir=no, systemd"
 
 # needs meta-filesystems
-PACKAGECONFIG[fuse] = "-Dfuse=true, -Dfuse=false, fuse"
+PACKAGECONFIG[fuse] = "-Dfuse=true, -Dfuse=false, fuse3"
 
 # libcdio-paranoia recipe doesn't exist yet
 PACKAGECONFIG[cdda] = "-Dcdda=true, -Dcdda=false, libcdio-paranoia"
-- 
2.17.1

