Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web12.14637.1627188758795495292
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Jul 2021 21:52:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=n5ik03n1;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id e21so3324778pla.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Jul 2021 21:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8cq3uTwQvyGZXuxG0Z1UJlYBAXF0KeHXbg1ns+57/1M=;
        b=n5ik03n1wJaRNVxcMyrHGKP5wJ3bcnpQ7tGLm7hVX87atNLA14bTAO2wRyRdQDKwDH
         L9ukPIxr6RHHBiu6IGpkEpx9fdsxhdEJYZJwkGTw+xnRd4tJKD4S6RR7qwvtjguA5XZ8
         62daHSCpubC1B+Ul6XW+zSzSxWHZvzxrZeuQjacif14Jx03Rcwfz39zuFBaZ2pjyy3nB
         P2J3kAslxOjj0lnJkrHg5vqftFpsOD/9yZarbVxzNHrIrG0/XWJaBQ1AQ8WC/YXDceep
         jCq3VjpYHFe2pzfYjjRPvalkmVg8Sk1AFkkhWWLOyoMU23RJKxpIiq+/vDh2A1Vxtj6Y
         mK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8cq3uTwQvyGZXuxG0Z1UJlYBAXF0KeHXbg1ns+57/1M=;
        b=ShEB8d4is4Y4+uTOG661fhU6kMdyD0qc8zs6blKWrMh6+JO54kMGqglTj1OGXMIlMf
         i9ozO/VhYO+uOfI9vmUgqIHIYrLwQFJf7ftMv9b7Wde4KJMiMK/IlorPi5W1CCGMp48x
         tAwSUS9xcNffzn3nA8T/+jzdkNYC+tyA2raMBNoIZ/wxM4kEY/d76y8xYTtYCnntrZ3O
         8UvZnKGWL4/ggkIOWK27JOegFlquRW1dju4+jDPJz6nGgCbwZfTVn83rurxkTs20m2ux
         RUGk89t79DeYhdeR84GzKkw6TG29UIpIT4FSzI/HQa80ye7GOGZRyAIsGc0zWcoQX4+S
         OU0Q==
X-Gm-Message-State: AOAM532PT1toORqQVa73mPiYOesy/6aEAgHQBmAoplEfVPW/iuXeFxA1
	3DUcNzA6YpyD4bt+1oQU3z5JTEJmhiwvVA==
X-Google-Smtp-Source: ABdhPJyAMu7INM13Nrieko2kFE6Vmqt385T61T8vUNsRnC4cHNxJ/30lLrZJ27C8imyQZHyggpSbVA==
X-Received: by 2002:a17:90a:28a5:: with SMTP id f34mr11525734pjd.107.1627188758237;
        Sat, 24 Jul 2021 21:52:38 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:d2f1:9af3:9c5d:7e26])
        by smtp.gmail.com with ESMTPSA id t10sm43368804pgv.52.2021.07.24.21.52.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 21:52:37 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 08/15] vboxguestdrivers: Add patch proposed upstream to fix a build failure on i386
Date: Sat, 24 Jul 2021 21:52:14 -0700
Message-Id: <4435dfaa9e543b9a9aeba08782ba0d52a6fcd612.1627164868.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1627164868.git.akuster808@gmail.com>
References: <cover.1627164868.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianfranco <costamagna.gianfranco@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 09eb0ad187fb14ac1bb83a5a8d1ac4e9e9fdb305)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../vboxguestdrivers/kernel-5.10.patch        | 23 +++++++++++++++++++
 .../vboxguestdrivers_6.1.18.bb                |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/kernel-5.10.patch

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/kernel-5.10.patch b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/kernel-5.10.patch
new file mode 100644
index 0000000000..a6b0a04545
--- /dev/null
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/kernel-5.10.patch
@@ -0,0 +1,23 @@
+Origin: https://www.mail-archive.com/pld-cvs-commit@lists.pld-linux.org/msg461494.html
+From 80bfab5ec8575703ef26b442a3af2d030793ebde Mon Sep 17 00:00:00 2001
+From: =?utf8?q?Jan=20R=C4=99korajski?= <baggins@pld-linux.org>
+Date: Thu, 24 Dec 2020 23:03:55 +0100
+Subject: [PATCH] - DECLCALLBACK generates incorrect code on ix86, remove it
+
+---
+ kernel-5.10.patch | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/kernel-5.10.patch b/kernel-5.10.patch
+index b28d6e0..729235d 100644
+--- a/src/VBox/Runtime/r0drv/linux/memobj-r0drv-linux.c
++++ b/src/VBox/Runtime/r0drv/linux/memobj-r0drv-linux.c
+@@ -536,7 +536,7 @@ typedef const LNXAPPLYPGRANGE *PCLNXAPPLYPGRANGE;
+  * @param   uAddr               The address to apply the new protection to.
+  * @param   pvUser              The opaque user data.
+  */
+-static DECLCALLBACK(int) rtR0MemObjLinuxApplyPageRange(pte_t *pPte, unsigned long uAddr, void *pvUser)
++static int rtR0MemObjLinuxApplyPageRange(pte_t *pPte, unsigned long uAddr, void *pvUser)
+ {
+     PCLNXAPPLYPGRANGE pArgs = (PCLNXAPPLYPGRANGE)pvUser;
+     PRTR0MEMOBJLNX pMemLnx = pArgs->pMemLnx;
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.18.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.18.bb
index ea6a082f60..d620e9893f 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.18.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.18.bb
@@ -13,6 +13,7 @@ VBOX_NAME = "VirtualBox-${PV}"
 
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
     file://Makefile.utils \
+    file://kernel-5.10.patch \
 "
 SRC_URI[md5sum] = "c61001386eb3822ab8f06d688a82e84b"
 SRC_URI[sha256sum] = "108d42b9b391b7a332a33df1662cf7b0e9d9a80f3079d16288d8b9487f427d40"
-- 
2.25.1

