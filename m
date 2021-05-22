Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.1932.1621647339817885273
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 May 2021 18:35:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j4vC/bQH;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id u21so32952970ejo.13
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 May 2021 18:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+8FQD0p5GWxff6Yax76gOddRqgCr4mdj33KCdDuGHCU=;
        b=j4vC/bQHQyVhFEKGXJkq9q5E4AAr7wbLZx7W9fnnCJMLodLEI0Opne46ht8LREuEEd
         NYSkJJtshiUUxMSphSY/K7u4AK29YtBPvDIOZ0EXJDMj99/EoVMlPtvcgOgjkxaXxiOh
         us09AfXWJW5UjLwqbWJu/2hKFdC2yM50cuMRWcxkV9qvWM3Ljpgbq/zfdNKMbEkCszbV
         FvN50F1OFER/lAkVMYXhWV92mvDEAO0nxFbPv2TIFuH0afCvDmqexrUDfFHs6BFMZ+kz
         RMMtTR56D1YuZgnQ0QCtXxWmRNYK93IE3dcsOzGhQFHEKGllBoQ6cZuVxbHrGdpC90WD
         hHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+8FQD0p5GWxff6Yax76gOddRqgCr4mdj33KCdDuGHCU=;
        b=o/3HuWnRSu65YsMpIxOHL4ofmzJHBEwGV7ntDJFu6GvRjlPT7BGg+BWXi3fFrlXQKI
         aPFNZqimH6CIp1U9DmcWsJuT22zFI/I6eOdVJ3PP6dWWNobA/k04GGyQgV/hhZC/uwhl
         phPVNVyPFubVQfXvGLBj0uZMIaQVgh5LdO6GJOgvPSQDVvboEAbUBsJwcMqQpr4nBp9W
         uoqBMOxraFAyOsuiq9SncMzLRsGes8ryy19QxD5jKtGI+PNeNCHYZd78eosfWxhPU+4h
         1IfO15IMHybVtybuwfkM4LPZR+Ewip+0CfovqkQnp/E1v4dNvEXycLz/A2t1uvXTXBOn
         zU4A==
X-Gm-Message-State: AOAM530mwvmha+lklHJeve6hki/SjjFNT0Jn9lC8qlt9pJWA310gR7N7
	QSNAaDGdAnhHAU7lqZavF3izuHe5SmI=
X-Google-Smtp-Source: ABdhPJyLpmKTHZqUOkNTc3YzlY+GjLTqk2L9iDG++hEHIpSB2e+UtRQ2rtFwJobnBJhB3+okDK2eMA==
X-Received: by 2002:a17:906:591:: with SMTP id 17mr12876514ejn.347.1621647338477;
        Fri, 21 May 2021 18:35:38 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f1a3b69456ae2a4ae47bbb1.dip0.t-ipconnect.de. [2003:f0:7f1a:3b69:456a:e2a4:ae47:bbb1])
        by smtp.gmail.com with ESMTPSA id p9sm5361337edu.79.2021.05.21.18.35.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 18:35:38 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 10/17] modemmanager: upgrade 1.16.2 -> 1.16.4
Date: Sat, 22 May 2021 03:35:14 +0200
Message-Id: <20210522013521.588774-10-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210522013521.588774-1-schnitzeltony@gmail.com>
References: <20210522013521.588774-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{modemmanager_1.16.2.bb => modemmanager_1.16.4.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.16.2.bb => modemmanager_1.16.4.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.16.2.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.16.4.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/modemmanager/modemmanager_1.16.2.bb
rename to meta-oe/recipes-connectivity/modemmanager/modemmanager_1.16.4.bb
index d1ba8e43e..f8e8aa1d4 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.16.2.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.16.4.bb
@@ -12,7 +12,7 @@ inherit gnomebase gettext systemd vala gobject-introspection bash-completion
 DEPENDS = "glib-2.0 libgudev intltool-native libxslt-native"
 
 SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz"
-SRC_URI[sha256sum] = "efa9a963499e0885f3f163096d433334143c4937545134ecd682e0157fa591e3"
+SRC_URI[sha256sum] = "167e60b26fa05887f87a0b3fb54143d7845e6e4d8c2f2dd93afac059f41e7edf"
 S = "${WORKDIR}/ModemManager-${PV}"
 
 PACKAGECONFIG ??= "mbim qmi \
-- 
2.31.1

