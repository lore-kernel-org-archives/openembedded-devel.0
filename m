Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C07ABC47074
	for <webhook@archiver.kernel.org>; Fri, 22 Dec 2023 15:11:36 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.25182.1703257891795279124
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Dec 2023 07:11:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WzoiSM8r;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ccad57dadbso6271601fa.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Dec 2023 07:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703257890; x=1703862690; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5w+zfQ6bq8ZPC32re01x3QWOOx0/cg+VJY/0oqUZFqk=;
        b=WzoiSM8rIhb4DuHi9EiHrEMyZXDKVErRx03BhcKeomaKBY4AARcs07/iI4hXMXaEou
         jNFSRwp5E5QLrsdQYbrEwPQUnBaksgk+WpzKHX/VTonSd8AdAoOGdPIqRtoz9rTxmwRB
         Z50nQX44EXYltftADwkvNpeWfx+mOTGKm1Sg2N/HmJ6MtfcO27qFJAjncaM+KecHeG6c
         uDASFlhNk4bnlRh8Shc0mi8L1IjFRSttdbqefFG1B4s/5JIVZw5TImYsRHBiqfCFzGV1
         KQIiYm9b2Gx8myR20w/QOhY20A5sDHXHoTuVbpDM96neWoDl6AWcevN00KZgoAABxdl3
         9L1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703257890; x=1703862690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5w+zfQ6bq8ZPC32re01x3QWOOx0/cg+VJY/0oqUZFqk=;
        b=fDT89KTo1FFdXA0QSvZByK3kU0M8+wcfe3V+V7W74SmoNREgowCuC8TBW+8btC5g4A
         TOhk/a3lcnKOl70CL5VSvPDGP23oiA+V369fB8fbk2TwNqcEgfGMc9aY84UrEsx8uLmQ
         jb57BEqduAQ4mvRDnQWlLteYE029sngsz03KZlGKPzWUtJwVVYQm2qAD+RUaZRL+F096
         xhYyHfo6gIcnwmXHiz1XJPALa7C4zwE0SiLe+CUyzTofK2H09vB+ZAUWDPyDNkV/uWLP
         OUHGEWJsaKBjRVI4EgZgHvvGliOjtAqVEASfKPJGgrTcF5VCnO1NZUH73zbiT288gxg0
         zTrQ==
X-Gm-Message-State: AOJu0YxCk/gLDxWayUnY3jOxqNi9w+TCgx3h1Eo2rb0KxuI/ZH8qSmYZ
	YzjMMJIRAGgqFGIHZjAzWzgPp3Wj6KjhPg==
X-Google-Smtp-Source: AGHT+IFFM3TX0jzt8GUIvN94gS4bNz3x6PCHcb9c0pyDikJ+aUsQr+MVAJwigUL0sBmkQMZOM2LXlQ==
X-Received: by 2002:a05:651c:c6:b0:2cc:671c:a44f with SMTP id 6-20020a05651c00c600b002cc671ca44fmr775738ljr.33.1703257889859;
        Fri, 22 Dec 2023 07:11:29 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m9-20020aa7c2c9000000b00552666f4745sm2650247edp.22.2023.12.22.07.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 07:11:29 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 9/9] bolt: package systemd units
Date: Fri, 22 Dec 2023 16:11:08 +0100
Message-Id: <20231222151108.645675-9-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231222151108.645675-1-alex@linutronix.de>
References: <20231222151108.645675-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Dec 2023 15:11:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107761

This wasn't seen because the recipe is enabled only
when systemd and polkit are both in distro features.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-oe/recipes-bsp/bolt/bolt_0.9.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-bsp/bolt/bolt_0.9.6.bb b/meta-oe/recipes-bsp/bolt/bolt_0.9.6.bb
index 860cb8381..4688ae860 100644
--- a/meta-oe/recipes-bsp/bolt/bolt_0.9.6.bb
+++ b/meta-oe/recipes-bsp/bolt/bolt_0.9.6.bb
@@ -18,4 +18,5 @@ inherit cmake pkgconfig meson features_check
 
 FILES:${PN} += "${datadir}/dbus-1/* \
                 ${datadir}/polkit-1/* \
+                ${libdir}/systemd/* \
                "
-- 
2.39.2


