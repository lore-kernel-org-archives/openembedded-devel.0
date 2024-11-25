Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05590D58D5A
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 14:54:35 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.20351.1732546471982757564
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Nov 2024 06:54:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H+y5xok0;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6ee805c96dbso39992947b3.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 06:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732546471; x=1733151271; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T4Z765Offi5o2gnDod1LJHutDgsY6enK6tl5a8mdVjA=;
        b=H+y5xok009+H2uTWft+51/M7UoDHlrUYLOsKwQhnYyRCelzAZOLMraB0OtVHpNSnlL
         xy0yYIu9IQ7iNxs5UUPQ8cAeJuvgaTlU9k+sWZcWTjfD39HdQy+u8txNGnwK/dAY6kG6
         wNwmpUjcFLVE9Oaebgy7XZRp9D/bcSaohSntVTefCvSyX/fGYefjwZnqTFDxq7uOSCnP
         RhuACseAjYexut+/JCRT48SAFanB9w7pzxzW8ideUQ1Pi1tShWkgADYitT1bs1G4oxH6
         Tkhmq8k3ah8tMWVnoMxZytH6YMfNG6InmR0dZjUdJJna04DXcCmVbEmqZws7CxpiZHth
         zaSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732546471; x=1733151271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T4Z765Offi5o2gnDod1LJHutDgsY6enK6tl5a8mdVjA=;
        b=RmecH0xSbKHIQ+si5MpMKdUTFV68c8sKl5/b56ZvHI5myH/vOmyFZwWJ/03mT7X002
         GWUfE2G6tOsy27b6XSa2v1GaKy4Xw4bPemeg0bdP9GSLJ0VrXy8PL3dne0khce1jEHwV
         Hg55lFh9VJhPOQNGGou1Z91LclL25ar4xizu0c3dcB7brU2r4al8zkhzwBBPmeBi9D5J
         u1RmPZtugcAwhRYolZEAYzrcowq2/KF+Ebyeg/TpBJaavvpBLCH6LMpaLWVJVeMnqyyl
         XtuLbnn8gUmHzxSTEczrybgZx8QSU2W1PlcEBRS8CiYb5TomYoGpQz8dgIB3Ao71D252
         6dUw==
X-Gm-Message-State: AOJu0YyRF0XhDcLRbUtP4OsfbfxX9QxTmWVpSsUUq9bWRPvRJpSiobqA
	07ekCu9ql1u8X9ROdgocVjBmg6EhlnBhduwsRXmOCZcOVY/a1xYl8gbXRl1F
X-Gm-Gg: ASbGncutBUATZg52wOphUKAzbZTce8Z8qMw9wEAZVALsyebEbr3QCpEUmYaWnIN3pPT
	jxzQu/H44XGZwFVKa1PjeCmLagoONwrCiWgRI40kOo1VNe1xk+zk/BfdatIdq59uoBU1xSrNgbc
	vHHE6bWpAjqFh/vwoigoc7ig95RG0VD4Xxtr89l4NxuthLLLM4NgVmvfjIMDu5evHndqB/pDkos
	33Ja2HL0FKHDwO4+yM1tbtahKKgktmRquJzVyBowqdkvmvynEvjHNGM
X-Google-Smtp-Source: AGHT+IFAFLQzlBG18sycP/171UBOvQao5dCkWk05c/+qJ2mNoqUvaF2wj7SxHhch57hZsxxCTcoOwQ==
X-Received: by 2002:a05:690c:6c87:b0:6ea:87dc:49b1 with SMTP id 00721157ae682-6eee08cd35dmr122743737b3.10.1732546470618;
        Mon, 25 Nov 2024 06:54:30 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6eedfe152b2sm18073417b3.1.2024.11.25.06.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 06:54:30 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 6/7] xfconf: Upgrade 4.18.1 -> 4.18.2
Date: Mon, 25 Nov 2024 09:53:06 -0500
Message-ID: <20241125145307.5479-6-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241125145307.5479-1-schonm@gmail.com>
References: <20241125145307.5479-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 14:54:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114043

Changelog: https://gitlab.xfce.org/xfce/xfconf/-/tags/xfconf-4.18.2

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-xfce/xfconf/{xfconf_4.18.1.bb => xfconf_4.18.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.18.1.bb => xfconf_4.18.2.bb} (89%)

diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.18.1.bb b/meta-xfce/recipes-xfce/xfconf/xfconf_4.18.2.bb
similarity index 89%
rename from meta-xfce/recipes-xfce/xfconf/xfconf_4.18.1.bb
rename to meta-xfce/recipes-xfce/xfconf/xfconf_4.18.2.bb
index e780b0760..39694cd0b 100644
--- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.18.1.bb
+++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.18.2.bb
@@ -8,7 +8,7 @@ inherit xfce gtk-doc gobject-introspection bash-completion vala
 
 EXTRA_OECONF += "PERL=${STAGING_DIR_TARGET}/usr/bin/perl"
 
-SRC_URI[sha256sum] = "d9714751bbcfdc5a59340da6ef8ddfc0807221587b962d907f97dc0a8a002257"
+SRC_URI[sha256sum] = "dce24fb0555e9718d139c10e714759e03ab4e40a7ffcf3c990f046f7a17213cc"
 
 FILES:${PN} += "${libdir}/xfce4/xfconf/xfconfd \
                 ${libdir}/gio/modules/libxfconfgsettingsbackend.so \
-- 
2.43.0


