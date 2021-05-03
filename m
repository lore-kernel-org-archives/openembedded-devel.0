Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web08.1666.1620069141902094733
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 May 2021 12:12:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=M4neq9M7;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id g7-20020a9d5f870000b02902a5831ad705so6058391oti.10
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 May 2021 12:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ZdvVToQ1yBnExj9BP9FPz9vS8YZaZQkivW1V9yQgTvE=;
        b=M4neq9M75HgowsdxQozzuDLgVjA69UXIgQXUsm+YcCISfMhvpinfYgOw6a8MDAS/Zj
         bsl8TxxEfVjIC1gZkER87fZUKuu/5BjclHQpoUwhsowMutmQwpuhVRRRXJQsmeqm0XNe
         Ih4xM5rtuj2nkh+6cvHUO//xwXAffFt9qtEnVqq9wCLFB9cM9sfHbtU7VqFgwPUUhI0u
         I2qjOrPFg56OtN5RY0WaFCV12JdpNWL4DRSOiL8YgVcX1Zzaxnyu0SbTlwt/ePB0epEO
         yS+fAltWPyDrvF/VoosoaKImF6xVOGNbBC6Qt+OAaxiPp0miJNob2PJwV6ovDnJ47v8y
         8AWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ZdvVToQ1yBnExj9BP9FPz9vS8YZaZQkivW1V9yQgTvE=;
        b=O2rC76XVGhPzyZjft7xMHn4anq6A8wsC2RZJgknfNfx1q4HGpZSo4S6D3DossndBqK
         wvvOeLo55y38b8S+BZ7m4nA17oRVoqaf1hR/kpnN/nTiB/68uG/kUIbwRly4+AqRgZKS
         POTHAKFo+bgqyXVVB+xhOlgZ0gIj47AyEyqvLdtr6GLOm00dejAp9xlqDmSN62ienv96
         peVJMIGX/ytuQrnt+20Ak3EUXJyxoH86uimlG+l9TDpetyiAYhfkZa+kGP5rIjGCYMIL
         inguOQfuJTSjjBb21lwyUMqJ0fRCH0+6vhjZZ/EJcSPxB88xSKQXA/p0efr75/AsUv9f
         VhXg==
X-Gm-Message-State: AOAM5313HrqOxmi4DuY7pPB6H+cheBGSnFZPmw8fuUC8usewwqmQSsu9
	9Pwq42NYKV0ZieZHAq7fR6NGr61J5cdxfA==
X-Google-Smtp-Source: ABdhPJwoNKchTDqf1qTWAcoV0g9SEzc3h04hyrQQHK7fW3VcikA446R1ztv4FNyZDm7qavfIOu4eOA==
X-Received: by 2002:a05:6830:55b:: with SMTP id l27mr15605999otb.260.1620069141117;
        Mon, 03 May 2021 12:12:21 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:dc35:22d6:72af:c1da])
        by smtp.gmail.com with ESMTPSA id s85sm150047oos.4.2021.05.03.12.12.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 12:12:20 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 13/14] nostromo: Blacklist and exclude from world builds
Date: Mon,  3 May 2021 12:12:06 -0700
Message-Id: <c4a4070a461c151fc5f75a773b8fcb56e22df71e.1620069042.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1620069041.git.akuster808@gmail.com>
References: <cover.1620069041.git.akuster808@gmail.com>

Host site is dead.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-webserver/recipes-httpd/nostromo/nostromo_1.9.9.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.9.bb b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.9.bb
index e726c9ac66..f1cf59355d 100644
--- a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.9.bb
+++ b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.9.bb
@@ -62,3 +62,6 @@ pkg_postinst_${PN} () {
         fi
     fi
 }
+
+PNBLACKLIST[nostromo] ?= "Host site for URI is dead"
+EXCLUDE_FROM_WORLD = "1"
-- 
2.17.1

