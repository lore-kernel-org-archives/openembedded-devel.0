Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07455C77B7D
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 22:44:15 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.94680.1683499453520055299
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 15:44:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=VMvjJwcE;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-50bd37ca954so43817013a12.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 15:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683499452; x=1686091452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3t4LDF4mf+RShlb3NtiAFabsZyP/pFAORBFzRLxwTBg=;
        b=VMvjJwcEoRb3NizDwiQlYiOoD1o84+psaCTWRzuTnrHglDSet+qPq9zJHn6FPrthPt
         TbomS1Kn0nwtECHl6Xxp828lUkhXUsJKdRy+oVRBw9pt5j8C0EV6HN1hDbtUhldq/4z7
         e33RwdF8b4ouEX25tUu2Tt/nBseGBG7/m/ZjoVeDM7dywckvIJbVrzYPpP9xizm+wqk5
         MKwN6IemX4v9oegaX7Youd/5+l6PUN/PCzbLHxyLM6paD3/jI8xakMpXaOYjhtRyQU2/
         akT9L8AES6+g3nOP3igM8LyAVR18f/axGzfaCS0Fjx787cCMljhlx6IIqThqSiv1we07
         1NDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683499452; x=1686091452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3t4LDF4mf+RShlb3NtiAFabsZyP/pFAORBFzRLxwTBg=;
        b=F13vVeIInUZht+uryXsLerGo64TRZr+/3qF8+SscIoXgNJMI3W4mtuJExRexshQ2nF
         8ia2mfsTj4JSxaE88lmGx9kzclvTy4p2/a0SOZKYK4o6ZOMrV4WSqMOsYa5FN7IkTIQG
         FF5pXQW16YAVy1ed5r2RbCQQdLVpbbCgve1qRxBUAwZ/v2Ez2JygSPRO508ktVnQreXJ
         V80uImGUmQ+E41DKDwz3hnnX6Aj/d0kk54drXC51pXz/1wxGaMMTtyxFu0vcu55mZzds
         Rhj4YBgzVwG+2aR1GE2uenTb/Yj+qxvJ65eyBWEYGvaWdUHRyddYp5bGJhhMus0E/sbX
         ZAmQ==
X-Gm-Message-State: AC+VfDxgVU+O080c8hvD130k6vWJbTPk0rMgkxw9uppfSCukvfv9SoPd
	fn6uDVme5SVQ+XhQSkWxnAzR4GPCLN8=
X-Google-Smtp-Source: ACHHUZ7R4foymFrJAbHx7Yf/CRLS3JxkgjcjAoh00DISpl/s8+9UM0nbHIE0Ocl7UvAUxGBvHz/hSQ==
X-Received: by 2002:a17:907:3e2a:b0:966:4973:b35 with SMTP id hp42-20020a1709073e2a00b0096649730b35mr2271278ejc.22.1683499452010;
        Sun, 07 May 2023 15:44:12 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id w11-20020a170907270b00b009600ce4fb53sm4163967ejk.37.2023.05.07.15.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 15:44:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 09/16] spice-gtk: respect gobject-introspection-data
Date: Mon,  8 May 2023 00:43:47 +0200
Message-Id: <20230507224354.1149327-9-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230507224354.1149327-1-Martin.Jansa@gmail.com>
References: <20230507224354.1149327-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 22:44:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102371

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


