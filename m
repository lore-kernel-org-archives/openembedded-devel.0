Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.1827.1621647338238865531
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 May 2021 18:35:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nN84VM+H;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id gb17so14978819ejc.8
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 May 2021 18:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=kq4g5YdDDykE8hgXB4qu2sTmbZW5Ral/WSiurYEnljA=;
        b=nN84VM+HW+d6LIrn36aSDJUG3lRlp3lx5p6zM5kpYM5slMmut+Xt3JhsGcoqxnb/1f
         0bqR9NyUuX80lRzZIl/Q9GHuRvfvEi+sTgOOTDov/8h0WhzvqvZHZA7RVQ5+4kP0JC0Y
         WUggHRl1HbmVucS6DJGBDMK/D/7JEAbAg6JvO2Uy0fbUzZC6PIZbtA6aruVMFM+7AB7+
         wpgNQM+2ddCQ9Wv7/rla0limtxx1X7pIabKq8f4XbJjt7UpxMNR56PGiuhGN4wtt+xGV
         WoJefCtloJdKLydz0d/XDLjcz+sMiaz6KjVaPbMDNrQDCe7TL/mR0MtP5iDEWBS68Vs+
         hGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kq4g5YdDDykE8hgXB4qu2sTmbZW5Ral/WSiurYEnljA=;
        b=EVbVk3WS7CVgi97K2RYsmPvd8pl6+CniZiW1tfQLF5wgLxEBDRq+7emapraDO3znX1
         V7qZSRrAXZRI2z8EKMaBt1k+y6qZ+2pVFEPa/jXkH9JRvB21Q0KnOj1EyxCAaMhmjaLS
         eUR6t6bAjyUTtpT83QoqOdOM4B98HdVK4NXxIDBCQlx/qVo+I/scheFXrMya1DOy5yh6
         8CKQ/TQfpux5FF3aZjus7SQTBKkZ3zqY+3jtuBc7Os4JjTrW2azHDPuBrn5//H/DDDDk
         nwmGiTdajrhi5/lCbUcJKGd64Z/kU4Pmvu0u8VVHFj6DQa518MNYvEhaXH3FaWh6g58o
         d6AQ==
X-Gm-Message-State: AOAM532c+OAKscD4adKPnS4qJ3zCHg0D9fR7/TsUThuyV5DC3zHiPHRl
	INvCBUe5KG1ruAKUtgM8ZbsipXZ6deE=
X-Google-Smtp-Source: ABdhPJygCdRnJtfGyB6qafTmgkxwDU1YER2XY2ucRNk3b4WYDLBGyIKFgfewX22VPTAAiz+jZDTIkA==
X-Received: by 2002:a17:906:fa93:: with SMTP id lt19mr12858419ejb.14.1621647336842;
        Fri, 21 May 2021 18:35:36 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f1a3b69456ae2a4ae47bbb1.dip0.t-ipconnect.de. [2003:f0:7f1a:3b69:456a:e2a4:ae47:bbb1])
        by smtp.gmail.com with ESMTPSA id p9sm5361337edu.79.2021.05.21.18.35.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 18:35:36 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 08/17] remmina: upgrade 1.4.11 -> 1.4.17
Date: Sat, 22 May 2021 03:35:12 +0200
Message-Id: <20210522013521.588774-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210522013521.588774-1-schnitzeltony@gmail.com>
References: <20210522013521.588774-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* 1.4.11 fails to fetch
* do_install_append can go the only path left is metainfo and mime

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{remmina_1.4.11.bb => remmina_1.4.17.bb}  | 40 +++++++++++--------
 1 file changed, 24 insertions(+), 16 deletions(-)
 rename meta-oe/recipes-support/remmina/{remmina_1.4.11.bb => remmina_1.4.17.bb} (56%)

diff --git a/meta-oe/recipes-support/remmina/remmina_1.4.11.bb b/meta-oe/recipes-support/remmina/remmina_1.4.17.bb
similarity index 56%
rename from meta-oe/recipes-support/remmina/remmina_1.4.11.bb
rename to meta-oe/recipes-support/remmina/remmina_1.4.17.bb
index 38fcf45c4..ef7876786 100644
--- a/meta-oe/recipes-support/remmina/remmina_1.4.11.bb
+++ b/meta-oe/recipes-support/remmina/remmina_1.4.17.bb
@@ -3,36 +3,44 @@ HOMEPAGE = "https://remmina.org"
 SECTION = "Support"
 LICENSE = "GPLv2 & openssl"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dab7215512044d49037272ce1ac4ea8f file://LICENSE.OpenSSL;md5=c1eb3cee0a4dea27503c531267a69769"
-DEPENDS += "openssl freerdp gtk+3 gdk-pixbuf atk libgcrypt libsodium libssh vte json-glib libsoup-2.4 libvncserver libsecret libxkbfile"
 
+DEPENDS = " \
+    glib-2.0-native \
+    openssl \
+    freerdp \
+    gtk+3 \
+    gdk-pixbuf \
+    atk \
+    libgcrypt \
+    libsodium \
+    libssh \
+    vte \
+    json-glib \
+    libsoup-2.4 \
+    libvncserver \
+    libsecret \
+    libxkbfile \
+"
 
 DEPENDS_append_libc-musl = " libexecinfo"
 LDFLAGS_append_libc-musl = " -lexecinfo"
 
-SRCREV = "6a8737111adebf571c46f35599cc62e7f7b0bd65"
-SRC_URI = "git://gitlab.com/Remmina/Remmina;protocol=https;branch=rel/v1.4.11 \
-"
-
-PV .= "+git${SRCPV}"
-
+SRCREV = "0ef1621b3e16b3168213147a2bfca39da2c2668f"
+SRC_URI = "git://gitlab.com/Remmina/Remmina;protocol=https"
 S = "${WORKDIR}/git"
 
-inherit cmake features_check mime-xdg
+inherit cmake features_check mime mime-xdg gtk-icon-cache
 REQUIRED_DISTRO_FEATURES = "x11"
 
 EXTRA_OECMAKE += "-DWITH_APPINDICATOR=OFF -DWITH_GETTEXT=OFF -DWITH_TRANSLATIONS=OFF"
 
-do_install_append(){
-    # We dont need the extra stuff form other desktop environments
-    rm -rf ${D}/${datadir}/xsessions
-    rm -rf ${D}/${datadir}/metainfo
-    rm -rf ${D}/${datadir}/gnome-session
-}
-
 PACKAGECONFIG[spice] = "-DWITH_SPICE=ON, -DWITH_SPICE=OFF, spice spice-protocol"
 # Switch on gtk support in avahi recipe if you want to enable avahi support
 PACKAGECONFIG[avahi] = "-DWITH_AVAHI=ON, -DWITH_AVAHI=OFF, avahi"
 
 RDEPENDS_${PN} = "bash"
 
-FILES_${PN}_append = " ${datadir}/icons/hicolor/*"
+FILES_${PN}+= " \
+    ${datadir}/metainfo \
+    ${datadir}/mime \
+"
-- 
2.31.1

