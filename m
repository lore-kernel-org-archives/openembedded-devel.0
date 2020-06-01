Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web12.48670.1591047939770770356
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 14:45:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sMKcs8QM;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id r9so944221wmh.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2020 14:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=RgF1Frm52VMpVwMqOchCnbrafQWfJNXJGrdpHi08Rew=;
        b=sMKcs8QMky7aEk8sciKweR+oUa3TmIMumhA+5nqYNdgn91ffnM30wXPgs2xEciykP0
         Pg2Iu9+mym7W7mivrVITpQx7RC+UgDN+5/lyPmamfLkOqd8ViqQT8VLBE+uVgB366i80
         j0NG/x/DPqENt2utuGMRVK2m2q/iS5rqYFnV1cIRQNwA1RyhTR5xPO0DqNFiFHBvhe+L
         c7TSoMT2iAATw7RXEWRHyFQDyFIFrlVin2GTkKKenCbyW2VqxomI6XINBW9D9lFsirt3
         U4JelfPkl/k05InoBlec8nO49mzTguM192mjr4ZYReEq9/DUvOVrJiTuRjF7yyyYOvqg
         ymRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RgF1Frm52VMpVwMqOchCnbrafQWfJNXJGrdpHi08Rew=;
        b=FJsF/814QLeeEqAwkgUHTZLeYsUY7IrGi1npufGFRdjjN7H7w6fmb8Soja/yaBYEkA
         J8I/cTSPjl+y5DRQ9Y0ptlfYp69gLzJQzxPMpraQmG8Lb4dqbadLMbBlI/QHSGn8KDp7
         QWVcUJVzZiSAWdyC66fn1pqfMrsEYQOhLBluxpWh4dNlR/V/DcOGSDCssVm8GYxyU3gy
         plIuqiaSn+KadKsE/Y6lgV5MPe3X4R+J/cpsidZY3Ze8w67lKm1r0SrHkAM7AqDHagxC
         SPlJrnWxVj2qEXwJmFj6IsNFAr9Qsj4MtnNIBEFAmfw1rXFXoFSD1bhqnNxEqKoxmjqE
         aJGA==
X-Gm-Message-State: AOAM530SdIkhQx8dBS/fmLYCD2eEer50079tUYKom7ds/1xnbTteh5ZJ
	C1VPxGsnmBb9KSOlvDXDZyFYSbhULz0=
X-Google-Smtp-Source: ABdhPJyM4D2GNAcEHVXLSCrOgdbYerszHLeGhDnolVwEdtFEbnrpBrP4/fvRgCPVXccollF+KxmH/w==
X-Received: by 2002:a7b:c306:: with SMTP id k6mr1127877wmj.40.1591047938152;
        Mon, 01 Jun 2020 14:45:38 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f06ad34da2c69d11ac2eac0.dip0.t-ipconnect.de. [2003:f0:7f06:ad34:da2c:69d1:1ac2:eac0])
        by smtp.gmail.com with ESMTPSA id 40sm1050119wrc.15.2020.06.01.14.45.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 14:45:37 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 10/38] amtk: initial add 5.1.1
Date: Mon,  1 Jun 2020 23:44:48 +0200
Message-Id: <20200601214516.26624-11-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601214516.26624-1-schnitzeltony@gmail.com>
References: <20200601214516.26624-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is a dependency for upcoming tepl which is a dependency of gedit 3.36.x

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/amtk/amtk_5.1.1.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/amtk/amtk_5.1.1.bb

diff --git a/meta-gnome/recipes-gnome/amtk/amtk_5.1.1.bb b/meta-gnome/recipes-gnome/amtk/amtk_5.1.1.bb
new file mode 100644
index 000000000..58713c35c
--- /dev/null
+++ b/meta-gnome/recipes-gnome/amtk/amtk_5.1.1.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Actions, Menus and Toolbars Kit"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+DEPENDS = " \
+    glib-2.0-native \
+    gtk+3 \
+"
+
+inherit gnomebase gettext features_check gobject-introspection
+
+ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
+
+SRC_URI[archive.md5sum] = "f11c2e0cde10d5224a942b1e13d598b2"
+SRC_URI[archive.sha256sum] = "f9656bdd4278aabfb8554f029049b9ffaf51b53faa463483a840365463355df1"
-- 
2.21.3

