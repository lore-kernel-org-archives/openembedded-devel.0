Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37F42CC6B2A
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 09:25:48 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9317.1791969938932474865
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 02:25:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=tOAdb9vK;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8897e83332fso2566979b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 02:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791969938; x=1792574738; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DLI0VP/Jt3BBslil/tHzmXSVaQanww03QlU4UwGU1P8=;
        b=tOAdb9vKGAsBQwhlMlUZ1uwXYFb1ZiFGxzTaJg1CPGv2iyr1tjZwocVKFWev0Qs7fX
         a4y78Fk76/nBHjx023W/91BB7RiMpUi3DUWh008WZgtpQgFQWFF4KfIVAJSJfqSnK5d2
         VQmFH+Z6XqjqNqjHp/42xSei6fPRg8I5BznUnWyJ2oQiHTBVM/gZSum5JJARs6Z9sMfw
         B2AbfP/kPZ9pCyG2wqik85VDJ3ArOoHyva1F0D8xG3zVG+NgatZ8CzlA7/U4EcYA/8u+
         4ZEt3dL4cUQTathnHmSoAv/alEhsk/Aj64nA5XUFekTtNxgssIzufxtzg9CAW015NEtj
         0Vcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969938; x=1792574738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DLI0VP/Jt3BBslil/tHzmXSVaQanww03QlU4UwGU1P8=;
        b=hyTlhPS6Ua6btc6/lwRvjidkdkmWxLUXzUcbgSDO1T6oxpNpPBjwXKM/V0kfJqEvmv
         42Mz8ci5x9DoWQSluboPZ0ay7OYJdvRo/0Syfmc2EemxM62PLCjFH86t8GBTBMUWlifL
         3DUqYSBiK2A2b2OqjHDapaf+2OZX7LDprFRfyL2ryLqP6H3l6OLffZrP9qthhNoZKIva
         sHepTz4/zjmA0K3PibORulZJL9dBZQiGA8aa4SeEKkke1+dO17tfxaiDTXERjBtw+bdR
         3ncZOeVkI7aKRVdWOYwCFKwa/XGdMsLiTq17bIDp7nGjmyMBvkM9G1DV7vaNwfXUrwqN
         sZLg==
X-Gm-Message-State: AFq9FYIoOHu/CbxtZqc4OGcNhFtrKGwMez9r7x47zEJWTxsL2JgBZx+g
	VnTDEnfcbGdS1E0xFcE5p//3leJ8aBCsZK/p2Qnc7WLXo8ZOIXPDc8HqaTmKzQ==
X-Gm-Gg: AYBFou2ipB89DlF/6ZLLpDm0qQCRQa7iEJfUKkmbRzvul4GrbBoazgMYubw85BMltDQ
	b8FaKhQmSMiCXxU3mVdAosQZwuCPFCXximRIVxqvj+IUzgIe9KKKfZDeWc1L4EX/Wz1fE+9Z7b3
	TZLxMDfdFFNI/v9TYfTjzh895jRiBy0QEBI5j4PeR6vRUPqoutdE+KpRUM7onZJkTVWzeYNK4YV
	4ms3C5mUbaZ2HOgpHZirlm8+i3qsjQlayVikJtfjCQHTwmSbYztyBZwJlkHyu4IrNrfLt+bz1HT
	XlfeBLW7fS59/JttRDJRwP0hpGwW2lEuYFnjMVPCCZIRR58UUZj+k97WQVhc8LNuVi/1wYOxvkk
	uGZkTtjIshLAo4uL+AyA6PqwodyrCIrNXEq816h67wueQ/O4zRlYiZa/BrG6jGWcNKVhvC0dpK2
	Q02wqHLebxOFAtwOfFS/9lzoSKjOYZY9+pn4KQzz9rEoh/AY1IRl+l4r3U7kfqvcYEVtd/TAZNE
	EMfxBeqfSGxAApBp3XJWKZvsknGz7vgS0U2+E0=
X-Received: by 2002:aa7:88cb:0:b0:890:9f61:6b21 with SMTP id d2e1a72fcca58-896a4022d40mr10354610b3a.37.1791969938274;
        Wed, 14 Oct 2026 02:25:38 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d804ec645sm865426b3a.43.2026.10.14.02.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:25:37 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 6/17] xdg-dbus-proxy: upgrade 0.1.7 -> 0.1.9
Date: Wed, 14 Oct 2026 22:25:02 +1300
Message-ID: <20261014092514.454505-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014092514.454505-1-ankur.tyagi85@gmail.com>
References: <20261014092514.454505-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 09:25:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130874

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/flatpak/xdg-dbus-proxy/blob/0.1.9/NEWS

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{xdg-dbus-proxy_0.1.7.bb => xdg-dbus-proxy_0.1.9.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/xdg-dbus-proxy/{xdg-dbus-proxy_0.1.7.bb => xdg-dbus-proxy_0.1.9.bb} (93%)

diff --git a/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.7.bb b/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.9.bb
similarity index 93%
rename from meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.7.bb
rename to meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.9.bb
index eb21f701d6..1a65874155 100644
--- a/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.7.bb
+++ b/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.9.bb
@@ -16,7 +16,7 @@ SRC_URI = " \
     file://run-ptest \
     "
 
-SRCREV = "6a170fa77e3cbecb48f9dd2478fe5c0a119eb467"
+SRCREV = "72b40c8f6d9d585cfbdb249690724f740d207087"
 
 CVE_STATUS[CVE-2026-34080] = "fixed-version: fixed in 0.1.7"
 

