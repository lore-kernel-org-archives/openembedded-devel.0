Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.7185.1624717692385083281
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Jun 2021 07:28:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GpkhB6pw;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: texier.pj2@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id j1so14032298wrn.9
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Jun 2021 07:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=JcuEP55UUcOuQS/uqmcyBRbCE7yD90WpxTUKfJPZplU=;
        b=GpkhB6pwfYAU+3a33dvyhs4rp5EwHQ+Ly/2RrfhVMpFBVA9x0wMOtXu/6SYvlu6M9C
         pcMffkBDA60CpvxqxrhdHV7PUCvMegBMyxJZ3YYmy9ZG+CRCtmdof9P8zMox4goD0Qg9
         PIw7Lknljesg8I1xr4v4y9M4ReL+gMBzcCe2H+ykkJKNs1ORQaRf+SgdWdiLrZvMQXSL
         70ZSlkDqTH7Buj826oaWgh9ojCMUvcvhwrt5yKmGjfLQN4LfSAC7BW+BQNcztMtbg2od
         0YL5BRuKOyraRgy/7C4a85oBSIMTmYMMvecFlaM/Pct9Qu/t4my5q8vHlMRuy+uLSKnC
         48gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=JcuEP55UUcOuQS/uqmcyBRbCE7yD90WpxTUKfJPZplU=;
        b=gsQX94XBw14HKoUGJpFpknaayyKprcYGiDQTLKAEiuQVxNRLgc+kMZiT+04DrMZsEt
         N4PV1GXcZas0A+WA1nYF3lxgNxn+2M/A2jxePSbvOtim2MUUMIKR+jQXgy2zVBSZ/O1I
         W9m8ctvaZtjk19JLuWQKv4av84rdwt7mFL/U0abOJPd2ypy6II3ldbyaoDBj/SAlk0NE
         h7cW7LXxrqyceMjbye8WPx4UdFZdBu47NVJUpNa3S3yN/U/73SSyXduGdln+8nITjrTJ
         UsgicDVod8k4iKQvQ6fNEJgajyCVjFDyw0vluoJqzPD3Q9LYLuafda7QFgwOyMWOir/w
         oueg==
X-Gm-Message-State: AOAM532cadnjYoDIfVqvoQoN+QI2ASb1iGnQ91lB6XbHmYriY88IxUoD
	fyhkiIESWdq6eqrhcUZgQutj43e9B7IGTw==
X-Google-Smtp-Source: ABdhPJx0qgnULp0Ou0xtYSF0nENbaR34I71ZrNA3ejtjRlGzVadttwY3ZjVejvq2gicGk1Teu1WmHg==
X-Received: by 2002:adf:f20c:: with SMTP id p12mr17527725wro.257.1624717690335;
        Sat, 26 Jun 2021 07:28:10 -0700 (PDT)
Return-Path: <texier.pj2@gmail.com>
Received: from menoah.home ([2a01:cb19:190:c500:8e3:52c4:2147:e10d])
        by smtp.gmail.com with ESMTPSA id d15sm9039824wrb.42.2021.06.26.07.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jun 2021 07:28:09 -0700 (PDT)
From: "Pierre-Jean Texier" <texier.pj2@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Subject: [meta-filesystems][PATCH] sshfs-fuse: upgrade 3.7.1 -> 3.7.2
Date: Sat, 26 Jun 2021 16:27:59 +0200
Message-Id: <20210626142759.7310-1-texier.pj2@gmail.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
---
 .../sshfs-fuse/{sshfs-fuse_3.7.1.bb => sshfs-fuse_3.7.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-filesystems/sshfs-fuse/{sshfs-fuse_3.7.1.bb => sshfs-fuse_3.7.2.bb} (92%)

diff --git a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.1.bb b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.2.bb
similarity index 92%
rename from meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.1.bb
rename to meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.2.bb
index 1db3284653..2debc6d8bc 100644
--- a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.1.bb
+++ b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.2.bb
@@ -7,7 +7,7 @@ DEPENDS = "glib-2.0 fuse3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/libfuse/sshfs"
-SRCREV = "8059e2ce630dd2b984f7a6c44a2b5291b0fe2abc"
+SRCREV = "9700b353700589dcc462205c638bcb40219a49c2"
 S = "${WORKDIR}/git"
 
 inherit meson ptest
-- 
2.17.1

