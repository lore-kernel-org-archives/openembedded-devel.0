Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.53020.1622518172497281227
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 May 2021 20:29:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OrbRHvJJ;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id o17-20020a17090a9f91b029015cef5b3c50so614027pjp.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 May 2021 20:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QWY5hofX0CFtRX8RO+OHMbGElij+xxQ+Dxz9S1mnWwo=;
        b=OrbRHvJJiwJQXcjsGdOiTyetqr/NCthuVyH0PmQFkFJ7VxEOQDUtD6nd4LBx00C8Oj
         gBS18Qn4CTiEe6azt+v+1Ovp+flMbYhdNAMokL+bIZJIwGFK/vtnwCFmA0NS6AaA7AsH
         tg0S89YYsbUh662HmVfi63w/CR/vo19eDTeMT201hQqu5J4EAhkyGUR6tu1mD9nNt5hZ
         ZLZv3yehupG4zzGx8mZsJLV7AkFxK05Egm8dMOCuxsN9IpGreIm3/CTdBlR7DaSBUBf7
         erWjmWd6ehkHTUYUL4zjZk/UP8ndl/cYBi4oxK6ADQxE9FhPrrH/Xfo62BUhUt74xabT
         lZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QWY5hofX0CFtRX8RO+OHMbGElij+xxQ+Dxz9S1mnWwo=;
        b=JCylEs8A0nD5kkGX5x62WHMoCMcoTG+9qUuSmcAuykuxZdB0Tr5eJlJRtJd8rfdH8n
         3crBkyMuRCPSWh2yTr6p7YiaRaUGlG4WzJSzrIZeYF3o9OjCQse2AozZ55zqonrT5zc1
         +Mfj60ZuO98BLsqjEBoXWaPZe0H0L949E2hngsHcKtR/t+nD/ZNTvj+nlA8xkbeEK1Tt
         ho/1Hz76lluHX1woDJulpP9C5gznGOKVk6yz7uCELgDuJyTaXvHjC7WUoyjhqRAFMtio
         /GnfhIW81XRWZzGNq4TqD/4sWblsQgefZZ4GfI1oj4TKHclsnnnXHjmU+EwS/xZYqGQN
         fJ9g==
X-Gm-Message-State: AOAM5316xV7Zbnvq55jlVgRnOiCB6O0bRB7kX4xMuO17o6ORmUdoWA5I
	MDHcyYgV3/qxqr1ktrAL+WwsIa4WWU5LrQ==
X-Google-Smtp-Source: ABdhPJwP1i1nzXRNiBnsS/abeCHLc/TB3GCUzvh0K7dQlC6xhcI+EROR5gigCeHKQBxbtyb4ufegRg==
X-Received: by 2002:a17:90b:4a12:: with SMTP id kk18mr22685810pjb.99.1622518171713;
        Mon, 31 May 2021 20:29:31 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id r11sm12549316pgl.34.2021.05.31.20.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 20:29:31 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] dhcp-relay: Fix libtool files for internal bind build
Date: Mon, 31 May 2021 20:29:29 -0700
Message-Id: <20210601032929.3873073-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bundled libtool files are arcane and do not work in OE cross build
environment, resulting in creating wrong entried in DT_NEEDED section
as well as emitting build paths into rpaths into ELF files, therefore
copy the OE provided libtool files to fix this issue

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb
index 2af41b217a..b178180ec8 100644
--- a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb
+++ b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb
@@ -38,6 +38,7 @@ EXTRA_OECONF = "--enable-paranoia \
                 --enable-libtool \
                 --with-randomdev=/dev/random \
                "
+EXTRA_OEMAKE += "LIBTOOL='${S}/${HOST_SYS}-libtool'"
 
 # Enable shared libs per dhcp README
 do_configure_prepend () {
@@ -48,6 +49,9 @@ do_compile_prepend() {
     tar xf ${S}/bind/bind.tar.gz -C ${S}/bind
     install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/bind/bind-9.11.14/
     install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/bind/bind-9.11.14/
+    cp -fpR ${S}/m4/*.m4 ${S}/bind/bind-9.11.14/libtool.m4/
+    rm -rf ${S}/bind/bind-9.11.14/libtool
+    install -m 0755 ${S}/${HOST_SYS}-libtool ${S}/bind/bind-9.11.14/
 }
 
 do_install_append () {
-- 
2.31.1

