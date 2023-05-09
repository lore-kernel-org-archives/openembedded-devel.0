Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA893C77B75
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 07:07:10 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.25904.1683616027347760446
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 00:07:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ccbBdtqv;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3f1950f5628so54431615e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 00:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683616026; x=1686208026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3t4LDF4mf+RShlb3NtiAFabsZyP/pFAORBFzRLxwTBg=;
        b=ccbBdtqvpAWhCqVrO3ipUCvaiUYYLeL3Oxp4/4Xn1oX2G8r8YQ4iv2wkjxE9qmBomh
         hcTWTw+UI+t65b9ELjhS21WvqFPfTSShTpHavki/HZ+efg8nO5eXXzNhOumTJAKvLxK9
         tZvmvZ55TUqxfDmRD6izXjF1Kt7KEN9gC+BLfH6GzsEVyUAaLnbs5cp7wQGxWLtZxda8
         W2gR4KINOhgA0xSlqOweQHQXpGbgCxsVZ1Qn9g8d4dF8tLK9m6JYNFOlDImkotLq1D4G
         aD39JUNjARSh1m0bg6VdzL/O/GAYA+jBIYrZ38cHsCvs5+dAzoJ/BMjq1UyI66y9v6cP
         uPlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683616026; x=1686208026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3t4LDF4mf+RShlb3NtiAFabsZyP/pFAORBFzRLxwTBg=;
        b=Ejq4rHw0MoRiG+n6nC9+2gl2GOgnM27OgsmayAJJuNUe/65F5+3jSIoCfXINEe0hIa
         hG2vPuzIP5J7C1t/lBhhiNCYPoYQbIh9gIok49ri78/kHLyHJoXGkBzD65whFgBFT9jY
         WePebPIlamTwnznj+6l231fbE3No5NjMQBnThDrTlQMPQcv3ByicdlCWGQz0r+HHOcOm
         sRCbj5A9vtMRhNNEU//MByDCxXFAklfcGuhbh4cDti6QRQPrY5+8wLzvhbxHDYrUfAj5
         TRPn44e6/LK1SVmkXM4Y/evyX3gSBtHiDtaRZDecM56jyk1zCq7cmeb5BdojBUVk6S+E
         9avQ==
X-Gm-Message-State: AC+VfDz4HoeV+OEe0+S42h20OJaAu/gN6S+xutV1k8Jmu/mY3mECyxtX
	wBYUogHgbKotGaDiI2ubhEZl+ovT8ck=
X-Google-Smtp-Source: ACHHUZ46a1AJn4aI+ZzSmy//jEyZvlbmPLUuRp9DuwW+LOqfvknHd54FVKy5Akyoun932KUBU+uzuA==
X-Received: by 2002:a5d:4ecd:0:b0:2ff:6906:7169 with SMTP id s13-20020a5d4ecd000000b002ff69067169mr8525261wrv.68.1683616025702;
        Tue, 09 May 2023 00:07:05 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id s18-20020a5d4252000000b00304aba2cfcbsm13463571wrr.7.2023.05.09.00.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 00:07:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][mickledore][PATCH 09/16] spice-gtk: respect gobject-introspection-data
Date: Tue,  9 May 2023 09:06:48 +0200
Message-Id: <20230509070655.70784-9-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230509070655.70784-1-Martin.Jansa@gmail.com>
References: <20230509070655.70784-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 07:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102477

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


