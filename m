Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.267.1617117710681785151
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Mar 2021 08:21:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: valentin.longchamp@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id v11so16595670wro.7
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Mar 2021 08:21:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BhqmnTIL55rb/T1BCrEbjv9SXv50I5NanvjUvhKJHgg=;
        b=rE7U4vCp50kOje3FULWpcbvU+NOtWqxp4bi2K1NY2fMeafxYQBfxVfP0WfUDfY0IDz
         i/v2IV1KbS53Yv/+EHKyKFti5zQVyn2Asf8k2p53HV5d2QXBxldXJev9CEi5Rja8RSC4
         s8akbp0uS1VwI5w0U/F85LvkWWAtHr631SYYa6j66p/wNaKNEFEJyvJWWdPnT7OcSEcq
         Tu8N2ZaFvq9NH2xLxkDU5VcfKcIu6uwMRvh390fOEsfWpCTbf5Ch0TfZpDJiLrgCUpR8
         TiRQBqXfiS3otEn09mN58SQUfqikLATleXqBaIQTjNeqSQg+SyfqIhwQuwvFTjGJorpy
         gbmg==
X-Gm-Message-State: AOAM530OOcNWkqqXhR289S/P5CCWcX1H2L+UzZrTmRLMGUejqxQq4exM
	/EwczseIhuri6XtNxUGNc9iW0mMiHGyf0w==
X-Google-Smtp-Source: ABdhPJwaJDsfND/iuLAbnTVizJL67HsTEVv0RZdsucl+u3Rer+Lp+Fm34IBumJ0nZj4a6urkwxpDFw==
X-Received: by 2002:a5d:4688:: with SMTP id u8mr34466695wrq.39.1617117708962;
        Tue, 30 Mar 2021 08:21:48 -0700 (PDT)
Return-Path: <valentin.longchamp@gmail.com>
Received: from localhost.localdomain (bbcs-95-88.pub.wingo.ch. [144.2.95.88])
        by smtp.gmail.com with ESMTPSA id k12sm37107845wrx.7.2021.03.30.08.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 08:21:48 -0700 (PDT)
From: "Valentin Longchamp" <valentin@longchamp.me>
To: openembedded-devel@lists.openembedded.org
Cc: Valentin Longchamp <valentin@longchamp.me>
Subject: [meta-oe][PATCH] libssh: add gcrypt to PACKAGECONFIG
Date: Tue, 30 Mar 2021 17:21:46 +0200
Message-Id: <20210330152146.57055-1-valentin@longchamp.me>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This would allow to build it without libgcrypt (relying instead on
libcrypto).

Enable it by default to keep the recipe behaving the same wihtout a
configuration change.

Signed-off-by: Valentin Longchamp <valentin@longchamp.me>
---
 meta-oe/recipes-support/libssh/libssh_0.8.9.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
index 39ed8a8fb..2aff2c878 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=dabb4958b830e5df11d2b0ed8ea255a0"
 
-DEPENDS = "zlib openssl libgcrypt"
+DEPENDS = "zlib openssl"
 
 SRC_URI = "git://git.libssh.org/projects/libssh.git;branch=stable-0.8"
 SRCREV = "04685a74df9ce1db1bc116a83a0da78b4f4fa1f8"
@@ -13,13 +13,13 @@ S = "${WORKDIR}/git"
 
 inherit cmake
 
-PACKAGECONFIG ??=""
+PACKAGECONFIG ??= "gcrypt"
 PACKAGECONFIG[gssapi] = "-DWITH_GSSAPI=1, -DWITH_GSSAPI=0, krb5, "
+PACKAGECONFIG[gcrypt] = "-DWITH_GCRYPT=1, -DWITH_GCRYPT=0, libgcrypt, "
 
 ARM_INSTRUCTION_SET_armv5 = "arm"
 
 EXTRA_OECMAKE = " \
-    -DWITH_GCRYPT=1 \
     -DWITH_PCAP=1 \
     -DWITH_SFTP=1 \
     -DWITH_ZLIB=1 \
-- 
2.27.0

