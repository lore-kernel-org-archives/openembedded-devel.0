Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07C25C43458
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 03:52:17 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3415.1783914734458293785
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jul 2026 20:52:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=tF9Y5VbC;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8143daf89c7so25995777b3.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Jul 2026 20:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783914733; x=1784519533; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x9PgR3Ni/pvUXO/hIgONnOq3qALBPruuQ3vdqLXCcgM=;
        b=tF9Y5VbCgBHYghZyeUFKkNPqSajqwpJIz6FwZAbkb+5WGNwc0heha7aYQR/Rd3R9xc
         er8cE5OMx8L//F31w0XTwPiDhCXKlQgRTeE5MjRsPFX0lN96qTmbE4LrO2zMgp+xS2Ju
         ilJYLvDX83EfeDHJSF1YqQ07jkVp4EF6snsNIXvwtLB1iPFmnyEDJT+13mmsL8xneVID
         s4Zzs+r2hCUJagiKlA+JP/+Mgq0cLpW88PXID2IdCKsKm1w+xb+Uc6bG0IEQOjMfrUaU
         VQMUb9/6YvOCtsUmTm2SIrd7FcvOFTCVjaAsb7Ny6JaF35ZCnPQHNDjcJZLS4Aaxnz10
         gRuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783914733; x=1784519533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x9PgR3Ni/pvUXO/hIgONnOq3qALBPruuQ3vdqLXCcgM=;
        b=KVzgXVhOr7Gt6YT/Z6ooQny5u3FCjvTnDMr7CH5SE+4jCQ+Nz0bbfLJnd6wYEbh1Q8
         UeqFqJ0W2ZfqIef6DL5u2sYbFnqG2MKrik1QFQu81FbWYug9W2f9uhvChF2lB2F2k+Dn
         Nkje2EWYl9/luOKGy4+FQtYqt4rBxMTuqgQYzWfA9EkNv9MZ4FLFifGh6r0EtNuz5srm
         jm6cPKNw8q+soryyyr0kAtvoqZYeJd8pSDCs+ukFjyVYM2Z+a3AVrhuUvbuUHCuIeoY9
         Lo+B3xuK4xFHJ1k6yYcCC4LRy1aKuIvfoIk4uSI5d1S07/3gBKJv5NHffihAffYEJIci
         9DoQ==
X-Gm-Message-State: AOJu0Yw4mpWRzlkxInp/6aL6PdAzeQvH44QuzPBvndcj0zqc0xQ1N4ej
	o3/9vYh0U7DG9+uKkvm+ZFZ/oGAn4XelbE4yamYqNqYpgmstpuLDF9M/TbXklkRp
X-Gm-Gg: AfdE7cnmnwqC7i45m/4zS4nO0mfuJNQzf8QRN6xxB/35dI/5UzILFAAK7DYk/N6Iy77
	dAi+QDSZjrSyZhxihGuNXrQxK4c+L/QALfSFjiNhppQAQlGV7PiVHjTANjf2eEcNcYcmz7BoS7l
	RQ2C0XamLSEpMcbMjYOpdt3/pG8gZ8Y1Qrnni6XSbLt0fJxkYdwiQFgO6FWKMl7W9b8Cv9i6iK1
	f2nm7SCKeM1k+5AprhhWvGPgjy7wwRCOolTgRL+rO+bPMF55HJyol6KI39uDG05xHmyspyNF/yC
	AZyFa9qPSypm0nb5J5Fkqp8raNNX5RLKGj3d+qFRUpU3wPAPOr8YU5v/ErjybVS7608uktfoI7+
	VfJ3Q3cbC6yEOH289w852f6UKEUuvHAmEKY9AQOsSt0/NK57g1UO1rTetYGmXbQdpY4cJZwTe6b
	O9nsB04DEux/oykQ8sonlLajH7z7jvV6kB1BC+DP2XOdzWyewa0a/bGCfUXeFaBs4RSv6DxDnlJ
	EUwt/we2ZMR82Z3skEPzrVNTLnsPattOTmGPtMD
X-Received: by 2002:a05:690c:6709:b0:81c:e8ab:c4dd with SMTP id 00721157ae682-81e9011231bmr55827427b3.33.1783914733327;
        Sun, 12 Jul 2026 20:52:13 -0700 (PDT)
Received: from localhost.localdomain ([71.54.207.93])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c1a44d6sm105942157b3.31.2026.07.12.20.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 20:52:12 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH] xfdesktop: upgrade 4.20.2 -> 4.21.0
Date: Sun, 12 Jul 2026 23:51:59 -0400
Message-ID: <20260713035159.17687-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jul 2026 03:52:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128151

Add video-backdrop PACKAGECONFIG option.  default to false.  Setting it
to true will bring gstreamer1.0 dependency.

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../xfdesktop/{xfdesktop_4.20.2.bb => xfdesktop_4.21.0.bb}    | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.20.2.bb => xfdesktop_4.21.0.bb} (77%)

diff --git a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.20.2.bb b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.21.0.bb
similarity index 77%
rename from meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.20.2.bb
rename to meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.21.0.bb
index 996330cc45..a5727f4481 100644
--- a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.20.2.bb
+++ b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.21.0.bb
@@ -19,15 +19,17 @@ DEPENDS = " \
 "
 
 XFCEBASEBUILDCLASS = "meson"
+XFCE_COMPRESS_TYPE = "xz"
 
 inherit xfce features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[sha256sum] = "1d9bd76015fb6e9aca05e73cd998c7c66ed4fc8c10b626e08fc2eb7c39df3f7b"
+SRC_URI[sha256sum] = "10a463b9bc474159622d861c1bf7f098e7848af15a453ac0275a3b92a8565c4e"
 
 PACKAGECONFIG ??= "notify"
 PACKAGECONFIG[notify] = "-Dnotifications=enabled,-Dnotifications=disabled,libnotify"
 PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false,"
+PACKAGECONFIG[video-backdrop] = "-Dvideo-backdrop=true,-Dvideo-backdrop=false,gstreamer1.0"
 
 FILES:${PN} += "${datadir}/backgrounds"
-- 
2.43.0


