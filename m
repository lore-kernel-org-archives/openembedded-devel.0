Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 807D5E7717D
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 11:11:40 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.34758.1733483497805525559
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Dec 2024 03:11:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=xr+/adDs;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.44, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-434a742481aso18591005e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Dec 2024 03:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733483496; x=1734088296; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bv8ZfEt6eAN2A4Aov2EjO/bjhMaWjdZxMa9N0NVnTHE=;
        b=xr+/adDsm378GrnwuqNluewS3zE+dpVgir7idNBfzddS1pB065p4CGIp4hiVKNXfnZ
         IyNXBTFAK+ieuJB/4WytPvjg7PAqvocNvRVbDgGd+HtlAOE3ACDEcaMezi1NK9gD88YO
         VbnGRmgBM6d939vomKBQJatxH9PG+rrbrPU5HG4fKSLcaD2SsfKX595F19QF/zX5vABv
         97VbSdriKgXRvrumR4Hc96bN4Z1GmttdTZnUiJVFIrIkalFF3GTf32Mv0iTfpaoGzM+Y
         I1xLseWlPhr4AaYSBWiuKffjmM33Db3oxBmUhWwjZVN9pBrbrhZRoSFCG03VopmGHL/e
         aVHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733483496; x=1734088296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bv8ZfEt6eAN2A4Aov2EjO/bjhMaWjdZxMa9N0NVnTHE=;
        b=In//QQ10XDxN7PNiSe63BVRn5kP7AUoU9TJP3j+qaYtk8gNf6t0LhGJdATL/bd/D7e
         L8lZl3IlQgbJQVjvg6/Qj9Hr5mGcuCujSZzDlltI7imiBhq+q3Rc1x63bJiZGv4qpkim
         U3yK5HfpYeDAwuQ5fIZ7cY+Yo0/+mrAZRv4kYzTlGh5xj/U2eiSB4WFLJ5IUegKn+OM5
         YTJV6l/RTroRGA3DjXOxvIVtLdU87A0BvRozSZhHCNSJTlWa4aTnKG1dvnYqewI8CVmk
         ninXHZfH/fiI5zt9kkjoFfcff0cnwJz4M5kmMUmkCUx2aBciGWNEot1lq5el1+eOYtlr
         kANg==
X-Forwarded-Encrypted: i=1; AJvYcCXm35KO06tng+z7zw/539jAC6K3RZR0OGQ0mOKlLQIQugnm7ivAlSx95z/as+aMNfdc9wiVPsS0yojgs2zV2N7mwjU=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw22A+tErmDo3SIsFO1DWJ8V1Q4zjaCL0tW13fXPjvJx08HaU0S
	2T8kD1r/Sa6J1t1KBgJszlq+5ztQhcDmfP6/33QjTNHllJrglDMtmo1TxepQpswL453IH6lSd7v
	8
X-Gm-Gg: ASbGnctQ9IZGAacVKm/Zw2pYiJ6w5gJOowB/hWF8F83uXYTWGPp0Nb9jQS9n3BzoDcs
	HbkX2sFKPS1YfwQtaNEbzpvG+nJotwCyc1o7KNjFLuFTcYavL8ieaotXZr75o+xPrDLZG12WORw
	5I01lqDtbw4lV9DFOZtZv/poec0hb+Zo15Q/AonrpxF0T4UOgRqhFX5gH8vWLkqlajwfW058QWb
	MVNM16nqr1JTWGS6o6ccsKO18dpZpFn/HxF5nHzE7eJR9c11Q==
X-Google-Smtp-Source: AGHT+IEnOYhKNOecHHT570PcnD0D1DmD0WHIxHw8htGwVhxl5lM77KKKtec885k8EnKAl6RWzc0LoQ==
X-Received: by 2002:a05:600c:1ca2:b0:433:c463:62dd with SMTP id 5b1f17b1804b1-434ddedbd28mr22307595e9.27.1733483496000;
        Fri, 06 Dec 2024 03:11:36 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6dc5:5621:fbd1:6903])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da0da461sm53830585e9.20.2024.12.06.03.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 03:11:35 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-oe][PATCH 1/3] libgpiod: minimize intra-recipe dependencies for ptest
Date: Fri,  6 Dec 2024 12:11:29 +0100
Message-ID: <20241206111131.35594-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241206111131.35594-1-brgl@bgdev.pl>
References: <20241206111131.35594-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Dec 2024 11:11:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114215

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Make the packaging a bit more fine-grained. Create separate packages for
the libgpiosim library and gpio-manager configuration files. Make the
ptest package run-time depend on only the gpio-manager config. This way,
we don't pull the entire daemon infrastructure if all we want is to run
its test suite.

While at it: add GPIO udev rules to the gpio-manager config package.
Currently they are in the main libgpiod package where they don't really
belong.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-support/libgpiod/libgpiod_2.2.bb  | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb
index 224918a55..259ee04d2 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb
@@ -20,27 +20,30 @@ PACKAGECONFIG[tests] = " \
     --enable-tests --enable-tools --enable-bindings-cxx --enable-bindings-glib --enable-gpioset-interactive --enable-dbus, \
     --disable-tests, \
     kmod util-linux glib-2.0 catch2 libedit glib-2.0-native libgudev, \
-    bash dbus glib-2.0-utils libgpiod-manager shunit2 \
+    bash dbus glib-2.0-utils libgpiod-manager-cfg shunit2 \
 "
 PACKAGECONFIG[gpioset-interactive] = "--enable-gpioset-interactive,--disable-gpioset-interactive,libedit"
 PACKAGECONFIG[glib] = "--enable-bindings-glib,--disable-bindings-glib,glib-2.0 glib-2.0-native"
 PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,glib-2.0 glib-2.0-native libgudev,dbus"
 
-PACKAGES =+ "${PN}-ptest-dev ${PN}-glib ${PN}-manager ${PN}-cli"
+PACKAGES =+ "${PN}-gpiosim ${PN}-glib ${PN}-manager ${PN}-manager-cfg ${PN}-cli"
 FILES:${PN}-tools += "${bindir}/gpionotify"
-FILES:${PN}-ptest += "${libdir}/libgpiosim.so.*"
-FILES:${PN}-ptest-dev += "${includedir}/gpiosim.h"
+FILES:${PN}-gpiosim += "${libdir}/libgpiosim.so.*"
+FILES:${PN}-gpiosim-dev += "${includedir}/gpiosim.h"
 FILES:${PN}-glib += "${libdir}/libgpiod-glib.so.*"
 FILES:${PN}-manager += " \
     ${bindir}/gpio-manager \
-    ${sysconfdir}/dbus-1/system.d/io.gpiod1.conf \
-    ${datadir}/dbus-1/interfaces/io.gpiod1.xml \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '${systemd_system_unitdir}/gpio-manager.service', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '${sysconfdir}/init.d/gpio-manager', '', d)} \
 "
+FILES:${PN}-manager-cfg += " \
+    ${sysconfdir}/dbus-1/system.d/io.gpiod1.conf \
+    ${datadir}/dbus-1/interfaces/io.gpiod1.xml \
+    ${nonarch_base_libdir}/udev/rules.d/90-gpio.rules \
+"
 FILES:${PN}-cli += "${bindir}/gpiocli"
 
-RDEPENDS:${PN}-manager += "dbus"
+RDEPENDS:${PN}-manager += "dbus ${PN}-manager-cfg"
 RDEPENDS:${PN}-cli += "${PN}-manager"
 
 SYSTEMD_PACKAGES = "${PN}-manager"
@@ -74,7 +77,7 @@ USERADD_PARAM:${PN}-manager = "--system -M -s /bin/nologin -g gpio gpio-manager"
 RDEPENDS:${PN}-ptest += " \
     ${@bb.utils.contains('PTEST_ENABLED', '1', 'shunit2 bash', '', d)} \
 "
-RRECOMMENDS:${PN}-ptest += "kernel-module-gpio-sim kernel-module-configfs"
+RRECOMMENDS:${PN}-gpiosim += "kernel-module-gpio-sim kernel-module-configfs"
 INSANE_SKIP:${PN}-ptest += "buildpaths"
 
 do_compile:prepend() {
-- 
2.45.2


