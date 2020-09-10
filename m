Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web12.21352.1599743204581942779
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2020 06:06:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=o+5/kGAh;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.181, mailfrom: fabio.berton@ossystems.com.br)
Received: by mail-qt1-f181.google.com with SMTP id c18so4744251qtw.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2020 06:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version:organization
         :content-transfer-encoding;
        bh=OE8qaPoVkZ48nUbZPkvyFzNfx13si/+a9HwlV29KR4E=;
        b=o+5/kGAhPGYCvmFhLl1qaNeWyzD7msEcLaQnVvMQ95wVNZo4gJ9sX+esKVpFeNmxVI
         yai2VOXlsfyhf9XLA5FqCx+lVGupv58geuy9wHBjKkMsLltuLOLFBowHMC1+Wt0XTYGL
         IIruRikLy9LDGQXi5Khi5f5QDKDrHO+DlvC6/zlynUNxBBQ+tStz8YkVINBs/2bWzDb6
         Pkw7WjCUMt/h2wRVGSdjKk2C6uKQomRNK8bd76hlkfRV7Yucs62+/wohzzhbOjquc9I8
         jKkDs2v/ln2xp4Ukd3mpIuZbDywebtSMoe6gNz8V4GXyDAo+xeo6XLLZOrX3NKBEDgdC
         IwrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :organization:content-transfer-encoding;
        bh=OE8qaPoVkZ48nUbZPkvyFzNfx13si/+a9HwlV29KR4E=;
        b=W3d22+wLEdxfBPyq8dVHGkpsPTEUnz5jE8nAO4DPc1z8PFow0gwiYCHiv0PG9cAlT3
         foQyrl+LdM714x5gWvmo2mtV/9Wm433ZlAXqiqIaieJtR+VGeVLuTBUwxdbVT2SlR3i2
         sjW8D40koXrvRDfEKzTz5BedRV3+UwVyI8wlXkljbcvnf9ks24FDgFroXD61n2RA/TaF
         tP5n1tzndmV5pNnPV9wNh9MXBqPd2x7qLf+fVygfkc2WoyNzmoIG+n5ClRqHbIhkiVn4
         A+FZQWcAA7Aicup1zoKRLPF4hHcX7kS+V3lVgvXXKtSBzQ4Zc8r4ZHmLABgQz4LaPYPl
         GsRQ==
X-Gm-Message-State: AOAM5303Fwoge0thVd9lzYfMvjLIglL2ZTgOaW9CNvmcY7hRNTzA8KIk
	B356McGDGgHYoh5Kl08qk7ogteA6DPLJ1WPI
X-Google-Smtp-Source: ABdhPJxbHPLZiO2T9a+HgZ2tYMYZ63sh+yTdHLiEl8M3Iix+9KZHQ0EdSLXIsO5mxEzBeESJZk9+1A==
X-Received: by 2002:ac8:6b90:: with SMTP id z16mr7480694qts.42.1599743203202;
        Thu, 10 Sep 2020 06:06:43 -0700 (PDT)
Return-Path: <fabio.berton@ossystems.com.br>
Received: from centrium.lab.ossystems ([181.220.78.182])
        by smtp.gmail.com with ESMTPSA id e188sm6188115qkd.55.2020.09.10.06.06.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 06:06:41 -0700 (PDT)
From: "Fabio Berton" <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] modemmanager: Update 1.12.12 -> 1.14.2
Date: Thu, 10 Sep 2020 10:06:37 -0300
Message-Id: <20200910130637.1134806-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

Remove --enable-more-warnings from toolchain-clang. This option was
removed in ModemManager commit [1].

[1] https://cgit.freedesktop.org/ModemManager/ModemManager/commit/?id=1c078531a017358241a35475fb24f2bd65d501db

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../{modemmanager_1.12.12.bb => modemmanager_1.14.2.bb}        | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.12.12.bb => modemmanager_1.14.2.bb} (92%)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.12.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.14.2.bb
similarity index 92%
rename from meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.12.bb
rename to meta-oe/recipes-connectivity/modemmanager/modemmanager_1.14.2.bb
index b0ab46f3f..d5fe9bf00 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.12.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.14.2.bb
@@ -12,7 +12,7 @@ inherit gnomebase gettext systemd vala gobject-introspection bash-completion
 DEPENDS = "glib-2.0 libgudev intltool-native libxslt-native"
 
 SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz"
-SRC_URI[sha256sum] = "a4fc4b33c0e8ae9372885f86fa033f3c1a89a76cd59a3458670eff1824222a3d"
+SRC_URI[sha256sum] = "5fb5553aecd6eb9d6d8ecd130a24f3461e5f93c5f91a0e4ae0508b5228e8b0be"
 S = "${WORKDIR}/ModemManager-${PV}"
 
 PACKAGECONFIG ??= "mbim qmi \
@@ -30,7 +30,6 @@ PACKAGECONFIG[qmi] = "--with-qmi,--without-qmi,libqmi"
 EXTRA_OECONF = " \
     --with-udev-base-dir=${nonarch_base_libdir}/udev \
 "
-EXTRA_OECONF_append_toolchain-clang = " --enable-more-warnings=no"
 
 FILES_${PN} += " \
     ${datadir}/icons \
-- 
2.27.0

