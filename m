Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web12.9595.1609946283311489325
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jan 2021 07:18:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FfzYpltM;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id cw27so4716121edb.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Jan 2021 07:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=rmlsy1YiuTCtC8sQ6v8/bWQVA4cvAivj3LN+nt1bw2c=;
        b=FfzYpltMVzJMNqlqoxM8hu5URnAqQ7mMHSgaJPcn1qYgqEPmM1S9iPlf34r8akj+80
         +LUHq4Mb+X0YCX3CbnP9Oxukab8sMbidbR1Zp4pzqpt2Jm//1I+VC7E47HfHnVDvBhky
         P0xjakmzJFSej4XiOS2jzZBMrfzCz8hop/kgNl2Nl5Tmm+C/QBhTZOSc2tp2TbaOyP6y
         sk95wcA7dO+VsBxv3N5qnnRWFW9D3y/y9zWQaUImWK4FRwzo30ujPrfDxg8WWwSkcv3e
         v6eDHDFZlSUT9gAKbZwiBwF0wBLhf3WhlPnTKasUYlDetVbD5JHHtvAZFkztftJ6JIdP
         Yyug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rmlsy1YiuTCtC8sQ6v8/bWQVA4cvAivj3LN+nt1bw2c=;
        b=PnMpPYJZAivesOv2GADzEpF5+8CDsecswB+VTpvRTmcq7hFHipfeaY/fKzDngrx75V
         Tqzq2wx0pv3UHVdnTuDz+4r0Xl8oj/yv7t6OIDCxirhZvnpAqlai8MslrCVEHwA12giW
         QOLH8pujmo+eAkLzW/hLWlPbJr4CGiE01NSOrNWHvjqQFp+FOllctbN+TSUBF6FL14CW
         8Fn9W3Ha0Zpg2YKdXCjFlLxtp52n+57Rl75O1V8YJSt7BTVur2fLufPZES5Bu4PDmno8
         CTxSL/RE1Us/10CyL+WzeVkcVxtEzpn11CrVT1j/+PAktxwvoVjB2BOqPR/ZQMFSNxVq
         3Kyw==
X-Gm-Message-State: AOAM533FaQrDAyW0ldmNrER1DAPQV6c6LiLaa/F6KOtE1klR4CYK09BK
	TTAURCT/x92EyC28ngVP8DkiedBBEvS1dw==
X-Google-Smtp-Source: ABdhPJzxjqZbPmULHFBNjwrzF/UcChbCnOpR8/mKh/vtHCIgK9o9gTPScBT8MxbEBn82NBMkroKJGQ==
X-Received: by 2002:a50:abc6:: with SMTP id u64mr4349557edc.21.1609946281909;
        Wed, 06 Jan 2021 07:18:01 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f47431850a04677ec24921a.dip0.t-ipconnect.de. [2003:f0:7f47:4318:50a0:4677:ec24:921a])
        by smtp.gmail.com with ESMTPSA id lc18sm1366899ejb.77.2021.01.06.07.18.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 07:18:01 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 25/28] xfce4-equake-plugin: remove for now
Date: Wed,  6 Jan 2021 16:17:14 +0100
Message-Id: <20210106151717.1779543-25-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210106151717.1779543-1-schnitzeltony@gmail.com>
References: <20210106151717.1779543-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* It is broken since xfce 4.16
* A ticket was opened [1] but no visible activities yet
* As soon as a working version is released it will be re-added

[1] https://sourceforge.net/p/equake/tickets/3/

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../equake/xfce4-equake-plugin_1.3.8.1.bb          | 14 --------------
 .../packagegroups/packagegroup-xfce-extended.bb    |  1 -
 2 files changed, 15 deletions(-)
 delete mode 100644 meta-xfce/recipes-panel-plugins/equake/xfce4-equake-plugin_1.3.8.1.bb

diff --git a/meta-xfce/recipes-panel-plugins/equake/xfce4-equake-plugin_1.3.8.1.bb b/meta-xfce/recipes-panel-plugins/equake/xfce4-equake-plugin_1.3.8.1.bb
deleted file mode 100644
index 8b24e98b0..000000000
--- a/meta-xfce/recipes-panel-plugins/equake/xfce4-equake-plugin_1.3.8.1.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION = "Equake XFCE is a panel plugin for the XFCE panel which monitors earthquakes and displays an update each time a new earthquake occurs."
-HOMEPAGE = "http://freecode.com/projects/equake-xfce"
-SECTION = "x11/application"
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-
-inherit xfce-panel-plugin
-
-DEPENDS += "curl"
-
-SRC_URI[md5sum] = "07d42b8a3d440d6f1861048a6cc3a15a"
-SRC_URI[sha256sum] = "eff9cfd604d1bd998c5208176fbe2c6da705c250dce572f5e30b2c77f4ec741c"
-
-FILES_${PN} += "${libdir}/xfce4/panel-plugins/xfce4-equake-plugin"
diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index c29827cee..7f1c17261 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -40,7 +40,6 @@ RRECOMMENDS_${PN} = " \
     xfce4-mount-plugin \
     xfce4-powermanager-plugin \
     xfce4-closebutton-plugin \
-    xfce4-equake-plugin \
     xfce4-notes-plugin \
     xfce4-whiskermenu-plugin \
     xfce4-mailwatch-plugin \
-- 
2.26.2

