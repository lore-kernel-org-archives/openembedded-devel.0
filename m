Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.6276.1622029983898713822
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 04:53:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qH6tuo/h;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id ep16-20020a17090ae650b029015d00f578a8so200496pjb.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 May 2021 04:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=o0JufDNMgBUYFzW5fsndxWIkjCJKULBXtBBLA3pYlvQ=;
        b=qH6tuo/hxhJcs+KaT/VhKgZpwrTNHJo3T0FbCMRgkosYnJYY/i0k7OsRG2XFeZqcx5
         ftccBKSBNKjm5jtDYRKD5EMvChQMfQXMoCs2mka/XAPbPrrCHPAtrU6gpi5GNU84zLtW
         4l9DOKWCEG9shcMKUVdIgKdhoMjCg/v9VfN7TjK7+p8uDW8QIj/WrbPrAhPHrlhq1lZ/
         SulFJXuZRqCrQuhrIpz9GD0kGs5tpwp7BUWqVd0sQBJ6u7P5b5A4h+cb/j6u6eAthVTF
         W+ITQpnfnlKLM5Xy1L3/PwBD0Opu8Q68XYmKfy/89BAx8xM/Ub59ybhC3pg37r/X6qJu
         nATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=o0JufDNMgBUYFzW5fsndxWIkjCJKULBXtBBLA3pYlvQ=;
        b=kTlvmA4hHvNO3ziM78TNTugIwgT/MNR6d00A4GbaIKeVW7rykd/ffFbgPJqC1Aqj6M
         XwkupTINLOLfc5sfIMEmXIiReWLRLyBE5RmPyfpOmhd1BXNP9m/6T+IY2qhPaKhLgO0z
         PwizMpwzwX9wT9NSDsNAHp7rHY1Y3WGwqvauutV7F6gQ0WVQU/7oT/EbP5Pi88uHkiPZ
         5diwb9w9EtfjbFJKOYmb/ueYrEprHcw1sF9zj8876ZvHZDf0G0xezFlCI8lT1XVbDirH
         dnvmEBsniBQ+exGhSz8MZZLlh9ikVg3RoCLDwIhjpju/DsBa7svfZE1GYCc9Grtsalr+
         LWeQ==
X-Gm-Message-State: AOAM533davm9aI/7anU0y0k2QsGGFsYdQL1gCpj+uYsqUnlttNb5kcYn
	7wgdMBkCJP9iJp3MUgP1wfijnBVXdy9LRA==
X-Google-Smtp-Source: ABdhPJwjSIQG3t6TG7XcduosC5xkbuY1FtDWezY+WKKw5PF6yxyUKVUNe0oMV/PqD4zCuinGZHQRfQ==
X-Received: by 2002:a17:902:6f09:b029:f9:173e:847d with SMTP id w9-20020a1709026f09b02900f9173e847dmr18343606plk.35.1622029983211;
        Wed, 26 May 2021 04:53:03 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:68d3:e59c:b64:76e3])
        by smtp.gmail.com with ESMTPSA id h22sm15408818pfn.55.2021.05.26.04.53.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 04:53:02 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [harkknott 17/23] opencv: remove tbb packageconfig for powerpc
Date: Wed, 26 May 2021 04:52:32 -0700
Message-Id: <c7c0a292cf5089dcbd7840b01027d636fb29c831.1622029873.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1622029873.git.akuster808@gmail.com>
References: <cover.1622029873.git.akuster808@gmail.com>

From: Saul Wold <Saul.Wold@windriver.com>

Since tbb does not build for powerpc remove it from the enabled list

Signed-off-by: Saul Wold <saul.wold@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e0581ad12f42427932e24abad97399c54f4b75f7)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_4.5.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.5.2.bb b/meta-oe/recipes-support/opencv/opencv_4.5.2.bb
index 311355bd7a..1dcd8586cd 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.5.2.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.5.2.bb
@@ -106,6 +106,9 @@ PACKAGECONFIG ??= "gapi python3 eigen jpeg png tiff v4l libv4l gstreamer samples
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)} \
     ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libav", "", d)}"
 
+# TBB does not build for powerpc so disable that package config
+PACKAGECONFIG_remove_powerpc = "tbb"
+
 PACKAGECONFIG[gapi] = "-DWITH_ADE=ON -Dade_DIR=${STAGING_LIBDIR},-DWITH_ADE=OFF,ade"
 PACKAGECONFIG[amdblas] = "-DWITH_OPENCLAMDBLAS=ON,-DWITH_OPENCLAMDBLAS=OFF,libclamdblas,"
 PACKAGECONFIG[amdfft] = "-DWITH_OPENCLAMDFFT=ON,-DWITH_OPENCLAMDFFT=OFF,libclamdfft,"
-- 
2.17.1

