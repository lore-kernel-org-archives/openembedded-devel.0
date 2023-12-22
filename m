Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FA18C4706C
	for <webhook@archiver.kernel.org>; Fri, 22 Dec 2023 15:11:36 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.25181.1703257890812123885
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Dec 2023 07:11:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I+2wJMOZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5534abbc637so2283103a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Dec 2023 07:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703257889; x=1703862689; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mXbN6EQjgv2BNsfxe+wmv4mgAp+SHqPTDfAA41oFw0s=;
        b=I+2wJMOZv6az9fE3l0+yBD1iACVJspPOJ4xX0C3QAFmYwl4VMUK2ustEZpjMnKd+3g
         BptmSQyuF+J/bIVTI0tkMe4HlbkwyLuNcr3r6I4X2/lqEBTzsPGBezQ7jumn19tA6ryB
         Y2mmasEgQKt0TFFKjCcJwRCGliAN+RTBrMwZk9am1jgwsxH1dxO+QsCnusNh83TMBcDF
         clBpB9L7uRqrPI8mr5wIAJX97G1339QXoUqUDitPEk/MewtwtKxJ5KC8el86noXO8eBF
         SuR/tm/l2GA2s03QF00BLG1uOQsmNe1AO6IoJzYqkvLpM8x2rJzDTlZaL86eP9Yl1FlU
         TZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703257889; x=1703862689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mXbN6EQjgv2BNsfxe+wmv4mgAp+SHqPTDfAA41oFw0s=;
        b=wQhkQhC14AI9GzcvQk1jCcU4eI82OiiUwaFNY9xz66oeXIlIAqRPp3fEAGi1Lv7cv1
         rYGG7LVk7VOtyTS3S2GGIdw8BX0Dsxwa7Bud299xXcMcTcK4lCuxlO5v6QjJtASEOJql
         +QmnP4fEjtMeAnR7xVamco3hD9Jord2zgLsDTkXE96FTYulvAS9OiHgYy/pQK5AJOEPN
         meMqtRx/ARElJXaFM/ev2Mtl86agk3M+X/rJnXTfJgptzb/MQSThnmEH+cv4h+iMb4qp
         K8yszX+JpTL2PXXwOS2XIYW7NBF9r2MbFJHCemtKQyC/DUk2Zplbiwr7khvmKrvMqz/b
         Cxew==
X-Gm-Message-State: AOJu0YzkZyyjA04Az964NC2NMK+QNaBLZFgKhbiBAirEAPlZtEeuQGcW
	akFHl8QkpO8UFnoODTXql5AvE6hxsatf0Q==
X-Google-Smtp-Source: AGHT+IEY97+BElBVeLfVpShU5JTzIYim/W4mLLFO2pt/Y3CU/8X/cUfJTiM0E5SbwkGnRLapyM+Ycw==
X-Received: by 2002:a50:d702:0:b0:554:4ad0:f4a6 with SMTP id t2-20020a50d702000000b005544ad0f4a6mr682972edi.13.1703257889277;
        Fri, 22 Dec 2023 07:11:29 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m9-20020aa7c2c9000000b00552666f4745sm2650247edp.22.2023.12.22.07.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 07:11:29 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 8/9] flatpak: do not rely on executables from the host
Date: Fri, 22 Dec 2023 16:11:07 +0100
Message-Id: <20231222151108.645675-8-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231222151108.645675-1-alex@linutronix.de>
References: <20231222151108.645675-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Dec 2023 15:11:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107759

This is not how yocto builds work: any needed executables
should come from the build itself, with limited exceptions
listed in HOSTTOOLS. flatpak is entirely capable of building
without requiring them upfront.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-oe/recipes-extended/flatpak/flatpak_1.15.6.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.15.6.bb b/meta-oe/recipes-extended/flatpak/flatpak_1.15.6.bb
index 0ee53afb6..caa353bb8 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak_1.15.6.bb
+++ b/meta-oe/recipes-extended/flatpak/flatpak_1.15.6.bb
@@ -43,8 +43,6 @@ RDEPENDS:${PN} = " \
     xdg-dbus-proxy \
 "
 
-EXTRA_OEMESON += "-Dsystem_dbus_proxy=${bindir}/xdg-dbus-proxy -Dsystem_bubblewrap=${bindir}/bwrap"
-
 GIR_MESON_OPTION = "gir"
 GIR_MESON_ENABLE_FLAG = 'enabled'
 GIR_MESON_DISABLE_FLAG = 'disabled'
-- 
2.39.2


