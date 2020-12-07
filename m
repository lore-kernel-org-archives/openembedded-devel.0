Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web08.10040.1607361308720517664
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Dec 2020 09:15:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tMyUDrcd;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: wickbergster@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id u19so19181372lfr.7
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Dec 2020 09:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h/i+erBNpYK/2G5B+iql8p0DL2yPcstXld5gTYux0zA=;
        b=tMyUDrcdjUETGwLaLNyk78+n0pCfndZxYT2clYTmD75LcNLtZbuMuHaDY/TxUMx4QI
         PmykW1cwQdUAmDkBPO7Lfsyc9n3Ia6o+iSNJaWEXv0lMaB+DqxbTPYCEBy1zqUbzd/EN
         OMtWTaG4fSicva8Ap9fnjRc9FlmLreXS4JQff4ZpnuVLbne6CYiip7ePHlFDU1VJrGZZ
         bwvRrkdtrN7gagKkhZHPxLXXICtDmsNe0f+FhS+4YWTjtkMUx9n4tzjUP+Aqc58y/LYt
         wK3BXHx7K52C8qEH4agv3QGG3z/k8x5Cb7B/kZAbRIRifvoQhmE1Wd0FE8xkxqN5e5Pf
         LMhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h/i+erBNpYK/2G5B+iql8p0DL2yPcstXld5gTYux0zA=;
        b=sr5UcqRU8CnmZrhjX4CvH7+HB1/5DlYn1tr8lsh3Fclaue41VESMY8aTPX9xfqxhxA
         hDAaN3t+sul0UPXi9ry/3d2zskNxzpA6FHiUDxQA1IW8lYDvMzZwahqp50EEEOJI50Nf
         VXAMmBRIH9dplTU2iE6ib9uuKjCEBqh0XdS23HBTIGF11iKuv7pYwn1t2In4SHIVWAno
         geMH9r6sjmMOUgf/RVYKSGR/9SNQ4KbFAwCmvLLR39t3NWGupyX/J92a0bSV36v7bJ1P
         OwEAOARryq3BYH3RIt4vE5PxO0CthhagBSvGPDrIj6mxr6vdDouqIxyXUk1CuU8KF9hE
         sbew==
X-Gm-Message-State: AOAM532PS53Bd2hlY8t8sJ6bmEJT+PG3TlQBMWWzmkyBBPzxvFLHDjK2
	RvageUqUA4lP7iy9nf+HIjtzK6TKiJF5sw==
X-Google-Smtp-Source: ABdhPJwl4yWMgAPQXLkBgcHu3BY9BG4w5NgrSjdJfp5GV9+C4H5FBDbuCcQf4iJf/Qd+blmGgf27ww==
X-Received: by 2002:a19:c1d7:: with SMTP id r206mr2476980lff.345.1607361306386;
        Mon, 07 Dec 2020 09:15:06 -0800 (PST)
Return-Path: <wickbergster@gmail.com>
Received: from localhost.localdomain (dyn-13-cust157.netit.se. [85.89.70.157])
        by smtp.gmail.com with ESMTPSA id e19sm2957848lfn.72.2020.12.07.09.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 09:15:05 -0800 (PST)
From: "Alexander Vickberg" <wickbergster@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Vickberg <wickbergster@gmail.com>
Subject: [meta-oe][PATCH] libwebsockets: upgrade to 4.1.6
Date: Mon,  7 Dec 2020 18:14:23 +0100
Message-Id: <20201207171423.16180-1-wickbergster@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Event lib support is now built into dynamically loaded plugins so
package them separately and include them in RDEPENDS if enabled.

Building minimal-examples with generated SDK failed due to cmake
configuration had static enabled but not included into SDK. Solve
this by adding static as PACKAGECONFIG option and adding
${PN}-staticdev to RDEPENDS_${PN}-dev if enabled.

Remove CFLAGS_append with -Wno-error for fixing building with Os.
This looks like it's fixed in upstream.

Signed-off-by: Alexander Vickberg <wickbergster@gmail.com>
---
 ...ckets_4.0.20.bb => libwebsockets_4.1.6.bb} | 20 +++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-connectivity/libwebsockets/{libwebsockets_4.0.20.bb => libwebsockets_4.1.6.bb} (51%)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.0.20.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.1.6.bb
similarity index 51%
rename from meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.0.20.bb
rename to meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.1.6.bb
index 5427daac4..e922d681f 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.0.20.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.1.6.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c47b078124308a4e1354e8d59f606b7"
 DEPENDS = "zlib"
 
 S = "${WORKDIR}/git"
-SRCREV = "ec9e8ab892f2dc569ae09336c80c2796fd14a6ff"
-SRC_URI = "git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v4.0-stable"
+SRCREV = "736f0739ed8c75db0e29c7678b5a9194e957c347"
+SRC_URI = "git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v4.1-stable"
 
 UPSTREAM_CHECK_URI = "https://github.com/warmcat/${BPN}/releases"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
@@ -18,18 +18,26 @@ PACKAGECONFIG ?= "libuv client server http2 ssl"
 PACKAGECONFIG[client] = "-DLWS_WITHOUT_CLIENT=OFF,-DLWS_WITHOUT_CLIENT=ON,"
 PACKAGECONFIG[http2] = "-DLWS_WITH_HTTP2=ON,-DLWS_WITH_HTTP2=OFF,"
 PACKAGECONFIG[ipv6] = "-DLWS_IPV6=ON,-DLWS_IPV6=OFF,"
+PACKAGECONFIG[libevent] = "-DLWS_WITH_LIBEVENT=ON,-DLWS_WITH_LIBEVENT=OFF,libevent"
 PACKAGECONFIG[libev] = "-DLWS_WITH_LIBEV=ON,-DLWS_WITH_LIBEV=OFF,libev"
 PACKAGECONFIG[libuv] = "-DLWS_WITH_LIBUV=ON,-DLWS_WITH_LIBUV=OFF,libuv"
 PACKAGECONFIG[server] = "-DLWS_WITHOUT_SERVER=OFF,-DLWS_WITHOUT_SERVER=ON,"
 PACKAGECONFIG[ssl] = "-DLWS_WITH_SSL=ON,-DLWS_WITH_SSL=OFF,openssl"
-PACKAGECONFIG[testapps] = "-DLWS_WITHOUT_TESTAPPS=OFF,-DLWS_WITHOUT_TESTAPPS=ON,"
+PACKAGECONFIG[static] = "-DLWS_WITH_STATIC=ON,-DLWS_WITH_STATIC=OFF -DLWS_LINK_TESTAPPS_DYNAMIC=ON,"
 
 EXTRA_OECMAKE += " \
     -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
 "
 
-PACKAGES =+ "${PN}-testapps"
+PACKAGES =+ "${PN}-testapps ${PN}-evlib_event ${PN}-evlib_uv ${PN}-evlib_ev"
 
-FILES_${PN}-testapps += "${datadir}/libwebsockets-test-server/*"
+FILES_${PN}-testapps += "${datadir}/libwebsockets-test-server/* ${bindir}/libwebsockets-test-*"
+FILES_${PN}-evlib_event += "${libdir}/libwebsockets-evlib_event.so"
+FILES_${PN}-evlib_uv += "${libdir}/libwebsockets-evlib_uv.so"
+FILES_${PN}-evlib_ev += "${libdir}/libwebsockets-evlib_ev.so"
 
-CFLAGS_append = " -Wno-error"
+RDEPENDS_${PN} += " ${@bb.utils.contains('PACKAGECONFIG', 'libevent', '${PN}-evlib_event', '', d)}"
+RDEPENDS_${PN} += " ${@bb.utils.contains('PACKAGECONFIG', 'libuv', '${PN}-evlib_uv', '', d)}"
+RDEPENDS_${PN} += " ${@bb.utils.contains('PACKAGECONFIG', 'libev', '${PN}-evlib_ev', '', d)}"
+
+RDEPENDS_${PN}-dev += " ${@bb.utils.contains('PACKAGECONFIG', 'static', '${PN}-staticdev', '', d)}"
-- 
2.25.1

