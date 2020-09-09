Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web12.12375.1599654208559524515
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2020 05:23:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=jVuaJJTb;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.181, mailfrom: fabio.berton@ossystems.com.br)
Received: by mail-qk1-f181.google.com with SMTP id w16so2161756qkj.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2020 05:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version:organization
         :content-transfer-encoding;
        bh=Lk5srSCY3yc4QlSoY/l06BUMxpGHv0NP3whxNwo70TI=;
        b=jVuaJJTbuCkG+xiXczdEcVwe7xRPgA4lF8dKNw+dM+U/S098nL8XVYDkUq+H2YwdvL
         0h5PVApIcOEPO+sdW4etSPXDVwoMtl0FTSDQwLhbLGUzHjCIHeR8Spis997Vvaj4Lzc6
         O12GQaPsQ93C61kIeQ6CDEmaNFVEMhmP24aAI5cP3FJqudWCEJPICmyKF6WSQ0cB5KBa
         X9/8kUmKFX1Os8VZpXowHMV9T8NWBB4VOZFH5mYk4QmT0ny+9/bHGmlMESMVVaPweHaW
         2pi/Qb5E4TnKQFi6ToIzPM3YOZKTkqOp9qCQhZZ5zpXWNwTBVk0WOzdJgQDUO7dYLNDk
         4sIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :organization:content-transfer-encoding;
        bh=Lk5srSCY3yc4QlSoY/l06BUMxpGHv0NP3whxNwo70TI=;
        b=nWr3/0wC+pojPVvuNpEvZsNuvCuJKqWa5MUAmHe3JhXW1EGMsS7+uvd5vuLJkOVdiS
         Yl3Z/MuRJDjJ+JGpHajygrqCWh4kJK3eB3yy4liPOdNKxXxXJxws66fbeXoMo162o6WN
         9W814Zs2b1hZDit+sgegd1ChC+657Yq4V2IztpPhfc4hJZGXw1QvnaKiwEj5/ozz15H0
         T8YD8zIbaHBUxU4gRSk256FR/WS5ndcO+XrxDl5wyyXDwLLU18spPXcb5kRloqxfFAqP
         ymykyWUylofobEwAr4SRON6nkgbPdgIcMpam85nlaVRXMnDrOlWUeyE7YgLmEHWVT84P
         zluQ==
X-Gm-Message-State: AOAM531jj4qpgsz8nNgQCnzvAoFGFZgVUvFPYuHcm6AtVy7On0JWdx/o
	W4HrFaDeOmc5vhCA/FJdaywNmupEe3M+QJ/l
X-Google-Smtp-Source: ABdhPJw8ymuzdqzXFvr+JySMozQ0bBUsYuX/mvJEBlB4HDjc1yAL3JaAx2BUjikIStpkvyrwqdLItA==
X-Received: by 2002:a05:620a:148:: with SMTP id e8mr3085864qkn.186.1599654207262;
        Wed, 09 Sep 2020 05:23:27 -0700 (PDT)
Return-Path: <fabio.berton@ossystems.com.br>
Received: from centrium.lab.ossystems ([181.220.78.182])
        by smtp.gmail.com with ESMTPSA id z74sm2455222qkb.11.2020.09.09.05.23.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 05:23:26 -0700 (PDT)
From: "Fabio Berton" <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] modemmanager: Update 1.12.12 -> 1.14.2
Date: Wed,  9 Sep 2020 09:23:21 -0300
Message-Id: <20200909122322.12899-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../{modemmanager_1.12.12.bb => modemmanager_1.14.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.12.12.bb => modemmanager_1.14.2.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.12.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.14.2.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.12.bb
rename to meta-oe/recipes-connectivity/modemmanager/modemmanager_1.14.2.bb
index b0ab46f3f..6b5e73ba4 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.12.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.14.2.bb
@@ -12,7 +12,7 @@ inherit gnomebase gettext systemd vala gobject-introspection bash-completion
 DEPENDS = "glib-2.0 libgudev intltool-native libxslt-native"
 
 SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz"
-SRC_URI[sha256sum] = "a4fc4b33c0e8ae9372885f86fa033f3c1a89a76cd59a3458670eff1824222a3d"
+SRC_URI[sha256sum] = "5fb5553aecd6eb9d6d8ecd130a24f3461e5f93c5f91a0e4ae0508b5228e8b0be"
 S = "${WORKDIR}/ModemManager-${PV}"
 
 PACKAGECONFIG ??= "mbim qmi \
-- 
2.27.0

