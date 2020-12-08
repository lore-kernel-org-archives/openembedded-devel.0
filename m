Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web08.6193.1607419712544535216
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Dec 2020 01:28:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kHKX3LO3;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: wickbergster@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id d20so22049595lfe.11
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Dec 2020 01:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VR6v+Mb+3rL4RVxJNGxKnS+ZqiiSOgVp6wSXS4ox+BQ=;
        b=kHKX3LO3+pE88QdIDe2K5B7TPu0nyESPcvU40oe4J6ZPQ5ie+uFHo9WHZdcBCD1xNF
         DuEx1aoxvOoqoAO62iPSEMU6F+tLJF5bcxZWCltMlQkAdN/nueLx3gbcUccHmmp9+y+L
         HYrKaweR6rpUxwcyqsfY0Fz5d7yrJds6TOGdCQv06Jog9VYyeRywv3i43/tKAAd+rps2
         ipv98CjKwrFQjK4lYpEO3II5DUU688vO5cU3mf9dhcdvyS+Wli0xSPCna3wi8pupxpH9
         BEdSj4vAO2VUELIWQzyTOfNFoPKrmhGvPB00L860bGOdl2CwJ/pa/AAZDsMkx/lUykzm
         cbvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VR6v+Mb+3rL4RVxJNGxKnS+ZqiiSOgVp6wSXS4ox+BQ=;
        b=gVez/S50e2cMsRB679IDhM7j9sHt9i4JdmBDvv0XOYZozVkNNGHFj5euHHUPY5OWSS
         XM1mdMIhbMS6D/Ffin2O/cIr1N4YR0ED4qir5yxj4oAhQBlr1pitQkD3KSfKfaPM/WRs
         t+f023F/sXcCY6Wk7OLfGrI82++qcbnU7X4hUmb4gjpOei6lgLDsivJQD+MsQ6GQD9p7
         GaKvOZgo8teXNI1uCMZB/PA6YAWPIVNMZYUdsrI0Uvf+oj5hHpj8iX3Ex+kHXMpvSzju
         Bx4P/pzWca86P+bdzhNU3zrlB9Av6Ba5iz8AkG7GViH1X4Tkr+3NZe0LaagEBpBwcaPa
         oPEA==
X-Gm-Message-State: AOAM5336HFNKPBdYhWD7xmuf6hQASYt7DWOpf2r9crUwOq2AgBM/C/Jz
	w6AMC+3s+FzzupulvNslvqfbElSfNK6g5Q==
X-Google-Smtp-Source: ABdhPJz7yLwHBSRZ9LDQtRZ5bm0b+eEQEzBRZrSGoZdOxa/uvz8xd7qFcsEPIxyfMae7lcHHSCqqmQ==
X-Received: by 2002:a19:8384:: with SMTP id f126mr19956lfd.649.1607419709972;
        Tue, 08 Dec 2020 01:28:29 -0800 (PST)
Return-Path: <wickbergster@gmail.com>
Received: from localhost.localdomain (dyn-13-cust157.netit.se. [85.89.70.157])
        by smtp.gmail.com with ESMTPSA id f4sm576197ljo.84.2020.12.08.01.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 01:28:29 -0800 (PST)
From: "Alexander Vickberg" <wickbergster@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Vickberg <wickbergster@gmail.com>
Subject: [meta-oe][PATCH v2] libwebsockets: upgrade to 4.1.6
Date: Tue,  8 Dec 2020 10:08:47 +0100
Message-Id: <20201208090845.44280-1-wickbergster@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Event lib support is now built into dynamically loaded plugins so
package them separately and include them in RDEPENDS if enabled.

Building minimal-examples with generated SDK failed due to cmake
configuration had static enabled but not included into SDK. Solve
this by adding static as PACKAGECONFIG option and adding
${PN}-staticdev to RDEPENDS_${PN}-dev if enabled.

Remove CFLAGS_append with -Wno-error added for fixing building with
Os. This looks like it's fixed in upstream.

Signed-off-by: Alexander Vickberg <wickbergster@gmail.com>
---

Changes in v2:
- Use legal package names. This wasn't caught in my test (Dunfell)

 ...ckets_4.0.20.bb => libwebsockets_4.1.6.bb} | 20 +++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-connectivity/libwebsockets/{libwebsockets_4.0.20.bb => libwebsockets_4.1.6.bb} (51%)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.0.20.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.1.6.bb
similarity index 51%
rename from meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.0.20.bb
rename to meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.1.6.bb
index 5427daac4..6a3eb917f 100644
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
+PACKAGES =+ "${PN}-testapps ${PN}-evlib-event ${PN}-evlib-uv ${PN}-evlib-ev"
 
-FILES_${PN}-testapps += "${datadir}/libwebsockets-test-server/*"
+FILES_${PN}-testapps += "${datadir}/libwebsockets-test-server/* ${bindir}/libwebsockets-test-*"
+FILES_${PN}-evlib-event += "${libdir}/libwebsockets-evlib_event.so"
+FILES_${PN}-evlib-uv += "${libdir}/libwebsockets-evlib_uv.so"
+FILES_${PN}-evlib-ev += "${libdir}/libwebsockets-evlib_ev.so"
 
-CFLAGS_append = " -Wno-error"
+RDEPENDS_${PN} += " ${@bb.utils.contains('PACKAGECONFIG', 'libevent', '${PN}-evlib-event', '', d)}"
+RDEPENDS_${PN} += " ${@bb.utils.contains('PACKAGECONFIG', 'libuv', '${PN}-evlib-uv', '', d)}"
+RDEPENDS_${PN} += " ${@bb.utils.contains('PACKAGECONFIG', 'libev', '${PN}-evlib-ev', '', d)}"
+
+RDEPENDS_${PN}-dev += " ${@bb.utils.contains('PACKAGECONFIG', 'static', '${PN}-staticdev', '', d)}"
-- 
2.25.1

