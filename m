Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F138C7EE2A
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 17:24:11 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.26206.1683134646161703808
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 May 2023 10:24:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=DzTgOHvE;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f18dacd392so35233475e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 May 2023 10:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683134644; x=1685726644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3t4LDF4mf+RShlb3NtiAFabsZyP/pFAORBFzRLxwTBg=;
        b=DzTgOHvEEz+PEPLG7gIMDhZeCykPA/EdWGbuLnpKUFtk5wx0M5Pn9LabpYyB1T7Hdx
         +t0oSW6RihVDYTG/gJ2wRV75FO9j4KSo+/b7oOIp9LpR+e228LdJ6DqcQJr5bORYakbm
         dXwulq7cSHP/vb2Qhmh1i2qBWwaqqU8PLk2ayWnbKJT91sVNU206PNKfeMGPD5FIJDbb
         s4/3jAdD47qMI9DJVXI/pyun5C8ztVZeHRdUEI2Nzg4tq41uMDcr5V9W7Adkv8OZ1EoC
         QjiChWPKEIqda/379d03UPH7KNqVB4XxYEkTzFuMlzOCqxffc1kRUWqOEfv2Bc5bXuyf
         ZXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683134644; x=1685726644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3t4LDF4mf+RShlb3NtiAFabsZyP/pFAORBFzRLxwTBg=;
        b=c0AHc0bAlI+5mRIGUzU8dJ8d6HcYXDI1Cqx/2CFe0pf09ijmulLl4muCLCUmIFEQpq
         ovV8Og/V6FluHV0VvCzvG6UDal4fD6wXy4HRt2Mx64IJN195bmo6XPifayxJOdoIEzR9
         CRzRFta7IjQT5QZ4Q+hc6ZOPfS6/uQEmZ6xQFAGOO+N9Onhaeb6jrZpYuc+uRL5/uGIm
         rMTbklIDWnzaG72qOQr51LdIzE2pkrEPfodu6vLNViRyLNXAiaqhYZYtm1aGc99t8dkU
         LeXC2WeABgTKLqhCu9vyk9a0/PaUFx6iaZ7ZaF+4HrJO3/ipO6rQhK4b2ESZEU/hNrxR
         8H5Q==
X-Gm-Message-State: AC+VfDzvmq5hCu1klgFjMccXyVzTAlR0zYcagVtlsR+Xy2CKu3FZuDUh
	+Y0KhS33KAkYlhof7+8ZBLlsm+l15bU=
X-Google-Smtp-Source: ACHHUZ42Ndt/n0ER2nw/7/4k6y115gAZxVtCLsXwXz+8GnNwA+Snn13qekWmULVAFntHrYslJOOM4Q==
X-Received: by 2002:a05:600c:2183:b0:3ed:ec34:f1 with SMTP id e3-20020a05600c218300b003edec3400f1mr14921852wme.35.1683134644621;
        Wed, 03 May 2023 10:24:04 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id l2-20020a1ced02000000b003f19b3d89e9sm2473046wmh.33.2023.05.03.10.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 10:24:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 7/7] spice-gtk: respect gobject-introspection-data
Date: Wed,  3 May 2023 19:23:54 +0200
Message-Id: <20230503172354.1439352-7-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230503172354.1439352-1-Martin.Jansa@gmail.com>
References: <20230503172354.1439352-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 May 2023 17:24:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102297

* without gobject-introspection-data in DISTRO_FEATURES the bbclass
  correctly disables it:

  $ bitbake-getvar -r spice-gtk EXTRA_OEMESON
  #
  # $EXTRA_OEMESON [6 operations]
  #   :append /OE/build/oe-core/openembedded-core/meta/classes-recipe/meson.bbclass:44
  #     " ${PACKAGECONFIG_CONFARGS}"
  #   :prepend[class-target] /OE/build/oe-core/openembedded-core/meta/classes-recipe/gobject-introspection.bbclass:28
  #     "${@['', '${GIRMESONTARGET}'][d.getVar('GIR_MESON_OPTION') != '']}"
  #   :prepend[class-native] /OE/build/oe-core/openembedded-core/meta/classes-recipe/gobject-introspection.bbclass:33
  #     "${@['', '${GIRMESONBUILD}'][d.getVar('GIR_MESON_OPTION') != '']}"
  #   :prepend[class-nativesdk] /OE/build/oe-core/openembedded-core/meta/classes-recipe/gobject-introspection.bbclass:34
  #     "${@['', '${GIRMESONBUILD}'][d.getVar('GIR_MESON_OPTION') != '']}"
  #   set /OE/build/oe-core/meta-openembedded/meta-networking/recipes-support/spice/spice-gtk_0.42.bb:49
  #     "-Dpie=true -Dvapi=enabled"
  #   :append[libc-musl] /OE/build/oe-core/meta-openembedded/meta-networking/recipes-support/spice/spice-gtk_0.42.bb:50
  #     " -Dcoroutine=libucontext"
  # pre-expansion value:
  #   "${@['', '${GIRMESONTARGET}'][d.getVar('GIR_MESON_OPTION') != '']}-Dpie=true -Dvapi=enabled ${PACKAGECONFIG_CONFARGS}"
  EXTRA_OEMESON="-Dintrospection=false -Dpie=true -Dvapi=enabled "

  and prevents build failure:
  http://errors.yoctoproject.org/Errors/Details/702789/
  Run-time dependency gobject-introspection-1.0 found: NO (tried pkgconfig)
  ../git/meson.build:346:0: ERROR: Dependency "gobject-introspection-1.0" not found, tried pkgconfig

* it just needs GIR_MESON_*_FLAG to be set to avoid:
  meson.build:4:0: ERROR: Value "false" (of type "string") for combo option "Check for GObject instrospection requirements" is not one of the choices. Possible choices are (as string): "enabled", "disabled", "auto".

* and enable vapi only when introspection is enabled, use PACKAGECONFIG for that to avoid:
  meson.build:358:4: ERROR: Problem encountered: VAPI support requested without introspection

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-support/spice/spice-gtk_0.42.bb | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/spice/spice-gtk_0.42.bb b/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
index 2d1b64967e..542ddb69b7 100644
--- a/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
+++ b/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
@@ -46,8 +46,13 @@ inherit meson pkgconfig vala gobject-introspection features_check
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-EXTRA_OEMESON = "-Dpie=true -Dvapi=enabled -Dintrospection=enabled"
-EXTRA_OEMESON:append:libc-musl = " -Dcoroutine=libucontext"
+GIR_MESON_ENABLE_FLAG = 'enabled'
+GIR_MESON_DISABLE_FLAG = 'disabled'
+
+PACKAGECONFIG ??= "${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'vapi', '', d)}"
+PACKAGECONFIG[vapi] = "-Dvapi=enabled,-Dvapi=disabled"
 
+EXTRA_OEMESON = "-Dpie=true"
+EXTRA_OEMESON:append:libc-musl = " -Dcoroutine=libucontext"
 
 FILES:${PN} += "${datadir}"
-- 
2.40.1


