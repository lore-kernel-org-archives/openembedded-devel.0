Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.6749.1587402578529588621
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2020 10:09:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kBqz7xiE;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: andrea.adami@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id k1so13152965wrx.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2020 10:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=P05emrYCviQVQCmkk1H890pG7N4K7PlycBxy6TTHtp0=;
        b=kBqz7xiESL6nQdhNP5AGkn3C1f2xJSIMIzZRGBsHXXKNQNONBKGL4yZL7UzY110Gjn
         RH59etuMzhpBASDE/K46JQbJNu6jZxeUXcqZpNx8rv1QGihl3M9u+89dnQgohQIZgYrr
         66MyFOSCdjgbakbuIGbAw8dXfywvocK25FFc2d4ZkvOxwkCCmy533Ddt53Ph0YJ2u9yj
         oXv6uR/Qb8NHUszw0QA0iAyEfW1bMWWTB8n2MkBIr7rrksCr3ezzN31SEXIMgYgA1758
         Tb96ZrGdzJZ3CajLFhhiNdBV9uR9RIyXppDhwkiHaCDRcnXpOBQNpsajr3vaeqciA1Hl
         pmUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=P05emrYCviQVQCmkk1H890pG7N4K7PlycBxy6TTHtp0=;
        b=NJybRvXVLmyNkWmv+uhpG/l3UtxMKKHynaAntv2iifxKKM2xQXFiqzK8nMvwh9U99H
         97xLGrP7mdepF4VINFo/xewGb77PH1qNjmQfbzTLxOikp7RbVYuAwcDIFIcVYP9AdXaJ
         PI8M+EkLmMUD7DB6UiprLsEdYhiN9k2VOuWwt9T5NOMH+eCuaa1mmz66J1jN4wAGvDjg
         4Pns1SAiPnU69oxbjRhmIOiU32PSwjnspr+abZsaq+lXKa1O8LPXDpJi2NxZu9CoAg/y
         k/QT2nF634mWkTiR3Vm6k9R0MPe8IMfEN5gq6CcqCbqHh3xcLpyRRSGo5QUL5oz+2M+c
         3Waw==
X-Gm-Message-State: AGi0PuYtWe4bgBomDKlB46RD5VxymYNg26W4i1rSW0vYJ3nbIOGs2pRS
	fNvCQ1jHdQqsmrIfUoeF+pt676vP
X-Google-Smtp-Source: APiQypIUShUohVju150DyAG9CKdQnXXYjdvMJs9Uu0x7/Po2MpDRU3hBxMO+a45tsFBIdzeXMCAdzw==
X-Received: by 2002:a5d:4404:: with SMTP id z4mr19384189wrq.316.1587402576903;
        Mon, 20 Apr 2020 10:09:36 -0700 (PDT)
Return-Path: <andrea.adami@gmail.com>
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it (host220-224-dynamic.250-95-r.retail.telecomitalia.it. [95.250.224.220])
        by smtp.googlemail.com with ESMTPSA id z76sm99504wmc.9.2020.04.20.10.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 10:09:36 -0700 (PDT)
From: "Andrea Adami" <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrea Adami <andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH] kexecboot(-klibc): update recipe to master on github (5a5e04b)
Date: Mon, 20 Apr 2020 19:09:23 +0200
Message-Id: <20200420170923.11005-1-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.17.1

fix injection of compiler flags (static and debug)

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
index 4b20e1ed9..ed3dece3f 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
@@ -8,7 +8,7 @@ S = "${WORKDIR}/git"
 SRC_URI = "git://github.com/kexecboot/kexecboot.git"
 SRC_URI_append_libc-klibc = " file://0001-kexecboot-Use-new-reboot-API-with-klibc.patch "
 
-SRCREV = "7409a1e0aaea61af87c4eca0149cec18a9f58ab6"
+SRCREV = "5a5e04be206140059f42ac786d424da1afaa04b6"
 inherit autotools
 
 EXTRA_OECONF = "--enable-textui --enable-delay=2 --enable-evdev-rate=1000,250"
-- 
2.17.1

