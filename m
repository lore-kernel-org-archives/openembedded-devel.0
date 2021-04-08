Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web12.223.1617899778914587073
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eOIsMwLL;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id w31-20020a9d36220000b02901f2cbfc9743so2883741otb.7
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=NYDcu4hyoGNNOIjaj6/m1ZBNUWz3ivWziaZ95j9htLs=;
        b=eOIsMwLLs57/t61gnq8aUNDoaS3AefcpTFZHCQwMP56P2WIdmMoXjw0j5HrRZT4dkX
         TJNci2pNONMRzaVqskS5Xui+CXgKYiJX5MkWL5nk+cszDoYKj6/CUDEbGAWg3LP+zgpK
         +BZ7xfx6wKBmIP0HFvoOHSwHBvD9L0VRUvbNSiDqPQm/iBJW6xyEpFQYtUgVD/68XT4/
         ing737VvbwdHD3wgSUen8R2a4qHqx2s1Gu9zv3BavRF1vVMt34zy8xFZADHou8LdM38V
         D6t+Qzqz0wM9OcbxN7+kjaMy12E1ZvM7aIA91t7JpuGDh+/H/HTknIrQd8RtRKUaaU4d
         jjkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=NYDcu4hyoGNNOIjaj6/m1ZBNUWz3ivWziaZ95j9htLs=;
        b=sp+F6BQSs25mTQ7w0sglryrHQojfbur0F8XBjPZDjnr6p4gPkzklpkvW86Q6sS6nIe
         Lo6npdTIqwMxLS5QnTbVURmZKr7Mfx9QTf4IV8lwUooR767A03zIXVPnkIPPn/It8vl+
         aGfVLzXUkpeBdP8D/REOnevKMQfO5Nn8Dinsy0HO5YFw+D3/rfouwyYFV1+XxP5SMYp3
         Bl5TXaGHmHwGVbeJsnWjs3+I38M1j8hZ6/8VBb5iJGYhLBotHaMakYlnTS+Z0Qju9SOy
         7QqF3aNkAqmVxNuc5KDNikSONmAX1Dxh+5bSHsigGGAqvhga32Yrh1GSkKUxljmFLFoW
         D7/Q==
X-Gm-Message-State: AOAM530fxTcRr+ssGsjLBNAti697p9DrjkZQX0REOvioviulbxeM7pNS
	GMBovmh7CFLHf0RqeLS438OzQ0mp5+c=
X-Google-Smtp-Source: ABdhPJxzATGRxiE3zIys4F1Q/4OzZt4DOuopUY9HtI/Dhudfu+5cEaTPQ6Drp/N0rvRpQYNgQWfb4g==
X-Received: by 2002:a05:6830:817:: with SMTP id r23mr8160487ots.234.1617899778020;
        Thu, 08 Apr 2021 09:36:18 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:17 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 02/64] libssh: add gcrypt to PACKAGECONFIG
Date: Thu,  8 Apr 2021 09:35:09 -0700
Message-Id: <603f75b0759e7f26e5eb80ba27ccd8683e68439f.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: Valentin Longchamp <valentin@longchamp.me>

This would allow to build it without libgcrypt (relying instead on
libcrypto).

Enable it by default to keep the recipe behaving the same wihtout a
configuration change.

Signed-off-by: Valentin Longchamp <valentin@longchamp.me>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 86eb692a4e96b77857a4160a12625fc694812d52)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/libssh/libssh_0.8.9.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
index 39ed8a8fbbb..2aff2c8781d 100644
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
2.17.1

