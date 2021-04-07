Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.670.1617830622020316304
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Apr 2021 14:23:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: valentin.longchamp@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id x15so10236624wrq.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Apr 2021 14:23:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BhqmnTIL55rb/T1BCrEbjv9SXv50I5NanvjUvhKJHgg=;
        b=najzWmiw2mo5PJnYzPf8qkwryCnyZDg7IBICsf88Wawg231Kd/kxrk9dMcUJhLTX8M
         1GkKJkmoZ96WhdQsozRHmd19kp2aRlfLzDoKuqQSJzBtCaSFY/izEiL4XRqGCD459fwM
         sFZgYKKpm/Il2zRYbtxl8RsEjgClL3fygU+CrOe7UHWX+2skS13FA04VJmMtOt9Dpd3D
         0glQw3V/XrR8C0KK1z+T3dB7W01uhSldcrqEVOn+4HGZwcUGF6JZeheE5wQSTiXlMp8Q
         eOBDkGZ5fjpqUOKj2Nx5zM4oYjLGI5GykVDPc8VYQKp8tB0ttOJBWaY3F00dvlHe2kRI
         jlxA==
X-Gm-Message-State: AOAM533rFqrRRJEGsUSjATDoBv3NHAPQoPZMYKCUk+x/I0yZgAT1XH9y
	ZGAYSeFfXed3FLZ9WrI+TXoz7GGg2qjdlw==
X-Google-Smtp-Source: ABdhPJxfUlFx0ENfIqfUW/QjZVIFYPL+3/mtimKawZjfJ+Zk4j4MPsHlv4Wr+SvGpgHNEmh4HiKJUg==
X-Received: by 2002:a5d:4e01:: with SMTP id p1mr6617047wrt.128.1617830620250;
        Wed, 07 Apr 2021 14:23:40 -0700 (PDT)
Return-Path: <valentin.longchamp@gmail.com>
Received: from localhost.localdomain (bbcs-95-88.pub.wingo.ch. [144.2.95.88])
        by smtp.gmail.com with ESMTPSA id k3sm22643375wrc.67.2021.04.07.14.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 14:23:39 -0700 (PDT)
From: "Valentin Longchamp" <valentin@longchamp.me>
To: openembedded-devel@lists.openembedded.org
Cc: Valentin Longchamp <valentin@longchamp.me>
Subject: [meta-oe][PATCH] libssh: add gcrypt to PACKAGECONFIG
Date: Wed,  7 Apr 2021 23:23:37 +0200
Message-Id: <20210407212337.2307476-1-valentin@longchamp.me>
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

