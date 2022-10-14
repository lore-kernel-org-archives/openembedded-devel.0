Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C03E5C433FE
	for <webhook@archiver.kernel.org>; Fri, 14 Oct 2022 19:06:20 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web12.11256.1665774376426178491
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Oct 2022 12:06:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eXlwzY/S;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: festevam@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id p127so5372743oih.9
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Oct 2022 12:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QJwQY6TDvcH5WQ6bPhLF76+fuyu9eMSiv5uQMy/JLQQ=;
        b=eXlwzY/SGPdk0aIBYK71pKajXMSu+QsLM9R2waGSQMwibQz7JfEqvnfI3ScMjlh/Q/
         pcPuU83M0QZ4nWlm6mKtS4VJ0VqblNfi88dWFkaRMT8iPvZ4wh6KsxSc2Ce4nicam+jT
         XWKD0/BzJEJ7+9Tnyq53rh7GDyL4T9fIci5E0Dl2RojfJf1PmaSM80euBc1hThCXh7UW
         Ax5dUWGlsDVfZCik5+7+zEHNIepXh4MLBroT+XE+68n0RdiH0/Fww7Asp387VYXQvkFu
         B9eSw6hN8WD6eiEY3xWDmHj+Eg8tQOfiyL39EyFQabwwulS5jYgxRYf8+OrupPRCo4c2
         ZaKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QJwQY6TDvcH5WQ6bPhLF76+fuyu9eMSiv5uQMy/JLQQ=;
        b=gTn4vLnkzoA1LG8GYK5i70tVycGq4psW+/otuFDQE3KTlruuL0we2wfLtSkHCCPo7L
         7pit0agDvx/F5e9yvjOSlHwyGawx27oQkzAWe8ZKfQp6H1VCgs4XDYmcJhEAGm++V7NS
         tT47xrmdJGDTI6GAoJFyuCeWqUJyZvs2B6e2onvSHkp563dsW9G+XSWvYPrptYcMj/oX
         j5t62WcUdzyi5+LWRA7SkbdkMVbQrbTdeDsDxDagFPMGxjJC6WTVZLXXwBUqNPOcQqgT
         J1rv+8qO92Skh3DobJJ3CFQgcRre4JzCIlq71aPoWd02MAcuDYDZSky3UnkGFraat50t
         cscQ==
X-Gm-Message-State: ACrzQf1H4M/dQwRB+UY0Y2g3v9G+5y5Qn+94EgnhGs3++rZFS9bAYEEh
	aWNhMYVUy+O6igo+2jKpIcaukUb+Tdc=
X-Google-Smtp-Source: AMsMyM6RmTI0tesfKa8M/t7Z0J0KbRgvPkRBUsAOTu0bbyaLfLumMYlbtlJNUU+E2864L7dCgO03Vg==
X-Received: by 2002:a05:6808:179e:b0:350:ae4d:dd3f with SMTP id bg30-20020a056808179e00b00350ae4ddd3fmr3178767oib.0.1665774375447;
        Fri, 14 Oct 2022 12:06:15 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:4b69:77e5:59d:6acc:edab])
        by smtp.gmail.com with ESMTPSA id 186-20020aca06c3000000b003547a3401e6sm1497208oig.43.2022.10.14.12.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 12:06:14 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [meta-oe][PATCH] remmina: Update to 1.4.27
Date: Fri, 14 Oct 2022 16:05:31 -0300
Message-Id: <20221014190531.3026843-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Oct 2022 19:06:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99172

From: Fabio Estevam <festevam@denx.de>

Update to the 1.4.27 version and also pass -DWITH_WEBKIT2GTK=OFF
to allow building it without webkit2gtk support.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 .../remmina/{remmina_1.4.24.bb => remmina_1.4.27.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/remmina/{remmina_1.4.24.bb => remmina_1.4.27.bb} (90%)

diff --git a/meta-oe/recipes-support/remmina/remmina_1.4.24.bb b/meta-oe/recipes-support/remmina/remmina_1.4.27.bb
similarity index 90%
rename from meta-oe/recipes-support/remmina/remmina_1.4.24.bb
rename to meta-oe/recipes-support/remmina/remmina_1.4.27.bb
index 23cafa7e4..7eb87a005 100644
--- a/meta-oe/recipes-support/remmina/remmina_1.4.24.bb
+++ b/meta-oe/recipes-support/remmina/remmina_1.4.27.bb
@@ -25,14 +25,14 @@ DEPENDS = " \
 DEPENDS:append:libc-musl = " libexecinfo"
 LDFLAGS:append:libc-musl = " -lexecinfo"
 
-SRCREV = "ffa6a7ef9c6be7951bac23d14df148098fd2d3fa"
+SRCREV = "9d409a3556c8c2759a376b4f4ac5149db7aacf4f"
 SRC_URI = "git://gitlab.com/Remmina/Remmina;protocol=https;branch=master"
 S = "${WORKDIR}/git"
 
 inherit cmake features_check mime mime-xdg gtk-icon-cache pkgconfig
 REQUIRED_DISTRO_FEATURES = "x11"
 
-EXTRA_OECMAKE += "-DWITH_APPINDICATOR=OFF -DWITH_GETTEXT=OFF -DWITH_TRANSLATIONS=OFF -DHAVE_LIBAPPINDICATOR=OFF"
+EXTRA_OECMAKE += "-DWITH_APPINDICATOR=OFF -DWITH_GETTEXT=OFF -DWITH_TRANSLATIONS=OFF -DHAVE_LIBAPPINDICATOR=OFF -DWITH_WEBKIT2GTK=OFF"
 
 PACKAGECONFIG[spice] = "-DWITH_SPICE=ON, -DWITH_SPICE=OFF, spice spice-protocol"
 # Switch on gtk support in avahi recipe if you want to enable avahi support
-- 
2.25.1


