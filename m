Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web08.24000.1610915772232941852
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 12:36:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LMbzHKAX;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id gx5so1620511ejb.7
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 12:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0lFlRx0qBVFf8KB9qlijzbwkgV8p8sichPA6B2xnKlo=;
        b=LMbzHKAXR0R2ZSnhwGAgK3g938K7S44NRHigqPl2FjIle+sBnwECg0m/WXqXoyhcDr
         4XJhrgu23pl2bGW98JjP4yDzRA+vafgXNsvIe3a4R5m4xKQrJwqU7dn/viuD0MYiONsv
         tS3BLMTezsGb0pA5f3OGB46Yu1ENCx+OikasnKBnnGwG+BDH1ls5l4aFpMTeppibvmau
         x/Eg8vkBK9sEtsSO5MT7GEhe6MxCXKLbkK4Qh4CGGXWy8Dhg6PswIU33cEHiRh/eAUl1
         QFOMj2wdRKMQNCA40ucxdxInw4/3bqB0QvZfXBPweGxrcqQyVUFjIOq72N798L/wi508
         CsCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0lFlRx0qBVFf8KB9qlijzbwkgV8p8sichPA6B2xnKlo=;
        b=qtXqTz5HFB5NpD0cPixNcFWwaiLrX6oE8hnHxFdBzVJ8ybb65tT0Lt1AHHrDTpEFYq
         FyMC+BSGaKT+IBOepwgbhgazACuXqdCqEHbIASGPFXd9e05ntjCX1ozb/zSjycesrvaS
         viWK3FUZwTBVJ56w/LWsY84jvKjtOF3bdQhE7QhMpyblhMPMCtE9+gyXP5xkq3H+7Zj+
         p/3NUoYxko9DocIAcjl0wQBXq/60l6V916xGUnx7U6HHek/F4XvecgLwLhBM60DlNmYs
         OyLJ/um/HIADIW10b+xUmgEfUHeP1jXzsAK+ntkbtdbjsOkROxsj2vIV1aEV/+8er+I4
         86Ww==
X-Gm-Message-State: AOAM5306WchuVm/ZmLdkDtnx0pEaKwVtVkzAv2dt5zTBqaMIHzytfr3T
	7+5otQgnESsjTG3vKhBmpoddonEqCmBObw==
X-Google-Smtp-Source: ABdhPJz2+U1sXowge4k7cimnkUnHRiQa6ax2EHgzGoxaSVcHua0M7kPCm5KR1ZvIQLCEWPeDE8u5qw==
X-Received: by 2002:a17:907:2049:: with SMTP id pg9mr2733789ejb.401.1610915770836;
        Sun, 17 Jan 2021 12:36:10 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f07b38751750a69f7d327ba.dip0.t-ipconnect.de. [2003:f0:7f07:b387:5175:a69:f7d3:27ba])
        by smtp.gmail.com with ESMTPSA id x6sm6922369ejw.69.2021.01.17.12.36.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 12:36:10 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATC][dunfell 1/2] graphviz: Extend for nativesdk
Date: Sun, 17 Jan 2021 21:35:59 +0100
Message-Id: <20210117203600.2714-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117203600.2714-1-schnitzeltony@gmail.com>
References: <20210117203600.2714-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Christian Eggers <ceggers@arri.de>

The "dot" tool is often used together with doxygen which is already
available for nativesdk.

Cross compiling graphviz for nativesdk looks quite similar as building
for target. At installation time of the SDK, "dot -c" must be called in
order to create <SDK sysroot>/usr/lib/graphviz/config6.

Signed-off-by: Christian Eggers <ceggers@arri.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a661a41606d0f0b4bac1665c29ba7d5c7e6ef486)
---
 .../graphviz/graphviz/graphviz-setup.sh       |  6 +++++
 .../graphviz/graphviz_2.40.1.bb               | 24 ++++++++++++++++++-
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/graphviz/graphviz/graphviz-setup.sh

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz/graphviz-setup.sh b/meta-oe/recipes-graphics/graphviz/graphviz/graphviz-setup.sh
new file mode 100644
index 0000000000..df0be9e3ed
--- /dev/null
+++ b/meta-oe/recipes-graphics/graphviz/graphviz/graphviz-setup.sh
@@ -0,0 +1,6 @@
+#!/bin/sh
+
+echo "Setting up graphviz..."
+
+# Create /usr/lib/graphviz/config6
+$OECORE_NATIVE_SYSROOT/usr/bin/dot -c
diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_2.40.1.bb b/meta-oe/recipes-graphics/graphviz/graphviz_2.40.1.bb
index 12ecb99091..aa5c0c8206 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_2.40.1.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_2.40.1.bb
@@ -16,6 +16,7 @@ DEPENDS = " \
     freetype \
 "
 DEPENDS_append_class-target = " ${BPN}-native"
+DEPENDS_append_class-nativesdk = " ${BPN}-native"
 
 inherit autotools-brokensep pkgconfig gettext
 
@@ -33,6 +34,10 @@ SRC_URI_append_class-target = "\
            file://0001-Use-native-mkdefs.patch \
            file://0001-Set-use_tcl-to-be-empty-string-if-tcl-is-disabled.patch \
 "
+SRC_URI_append_class-nativesdk = "\
+           file://0001-Use-native-mkdefs.patch \
+           file://graphviz-setup.sh \
+"
 SRC_URI[md5sum] = "2acf30ca8e6cc8b001b0334db65fd072"
 SRC_URI[sha256sum] = "e6c3f8dbfde1c4523055403927bef29f97f9fc12715c1042b5dcf648a2c1c62a"
 
@@ -47,7 +52,17 @@ EXTRA_OECONF_class-target = "\
                 --disable-r \
                 --disable-sharp \
                 "
+EXTRA_OECONF_class-nativesdk = "\
+                --with-expatincludedir=${STAGING_INCDIR} \ 
+                --with-expatlibdir=${STAGING_LIBDIR} \
+                --without-included-ltdl \
+                --disable-java \
+                --disable-tcl \
+                --disable-r \
+                --disable-sharp \
+                "
 CFLAGS_append_class-target = " -D_typ_ssize_t=1 -D_long_double=1"
+CFLAGS_append_class-nativesdk = " -D_typ_ssize_t=1 -D_long_double=1"
 do_configure_prepend() {
     cd ${S}
     # create version.m4 and ignore libtoolize errors
@@ -59,6 +74,13 @@ do_install_append_class-native() {
     install -m755 ${B}/lib/gvpr/mkdefs ${D}${bindir}
 }
 
+do_install_append_class-nativesdk() {
+    # graphviz-setup.sh must be executed at SDK installation
+    install -d ${D}${SDKPATHNATIVE}/post-relocate-setup.d
+    install -m 0755 ${WORKDIR}/graphviz-setup.sh ${D}${SDKPATHNATIVE}/post-relocate-setup.d
+}
+FILES_${PN}_class-nativesdk += "${SDKPATHNATIVE}"
+
 PACKAGES =+ "${PN}-python ${PN}-perl ${PN}-demo"
 
 FILES_${PN}-python += "${libdir}/python*/site-packages/ ${libdir}/graphviz/python/"
@@ -74,4 +96,4 @@ INSANE_SKIP_${PN}-python = "dev-so"
 
 FILES_SOLIBSDEV_append = " ${libdir}/graphviz/lib*${SOLIBSDEV}"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.26.2

