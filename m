Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.21166.1610905009167686877
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:36:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AQegHWzJ;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id g3so7355517plp.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=jtW8gyanagvRJ7Y2b57H9OP4Hg4FH4TWeVvBI4IBeaA=;
        b=AQegHWzJ/S+HML+Wtzp6fmG8BZBRG0sJaTUEI1wrnBA7hILVDaJR05+9LgcsNXOOWp
         U0LNMQ2KsbEfvi6ev9AbQcK3FZGAZVFInCKNBIvbA/vPEzyOCNqmi+5BhtzFiPfJ/Qg/
         a11QwclHZkW1YBYtXCEOt/Q8pka+lPapoqZ4GWqTci3UEQ96jO4IJpwa9+Pd/3tGXuwM
         4koX/lkMOiIbHDudoYM8yfETIvS7wCzpZXXXLZMeLxIjVnd0Aq3+juILONJShWMKt8yc
         4L+ua2DDhmmJ8Uw8+dWT8NC7Kr3SNH5X1lu++Wj/NzYFZ40pt9l82JH2ij30CSHNXJwy
         kuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=jtW8gyanagvRJ7Y2b57H9OP4Hg4FH4TWeVvBI4IBeaA=;
        b=cUaEdHReKeJSnVnTPDUfu+UTYJiJcZMiE0CW2nPHri0ItGdn3cf/YuCLWaPiY4Yfk8
         2U7gwxXyPRM0WcJpVPBtoET9ysckU7sFNAtdh71HEOve9zMlIcFnd/fI/vm5i4y0hlPV
         sVqAfL2/CquieshxS4YpncJL9CO1sV9hkKtd9rHRoxLP9f7dT2kNnw++9+S8X2guZ6bi
         5NNT057F1eRd18vZM741Kh/XBvIpHCVciup/BvfJXR3kP9/puKwtzumPyHm1gTcmr7s9
         gwqRRzc8OmBLTIArgtSvRGtGVkFGIqCW6jYgxD60ai9NSVVs9cpTJIkDe26S/+1uciZq
         ISQA==
X-Gm-Message-State: AOAM530pb98ikM6mSEPxiXf/+V3AzdwcizqFMWI2m3DMJUdGNFGeFPuT
	jBzHHuiiZ3vH3dF0XIQHMr7b9wHkppzLwg==
X-Google-Smtp-Source: ABdhPJxjD9eQKIXV6nacGhdLZQZ8wtMXyBWFGKtWgBo/TjPu/nmaJk630Buu9q+6CZpjVNTD6jGX5A==
X-Received: by 2002:a17:90a:4541:: with SMTP id r1mr4133841pjm.109.1610905008585;
        Sun, 17 Jan 2021 09:36:48 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id t4sm13661338pfe.212.2021.01.17.09.36.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:36:47 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 08/31] multipath-tools: fix error handling for udev_monitor_set_receive_buffer_size
Date: Sun, 17 Jan 2021 09:36:13 -0800
Message-Id: <d6d0ef5cae7581e55b9c53390a26ae5f0b46ed74.1610904793.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610904792.git.akuster808@gmail.com>
References: <cover.1610904792.git.akuster808@gmail.com>

From: Joe Slater <joe.slater@windriver.com>

Since systemd v246.5[1], udev_monitor_set_receive_buffer_size() will
return 0 or 1 if successful. We only need to check a negative value for
the failure.

[1] https://github.com/systemd/systemd-stable/commit/4dcae666889ae9469e4406c0bcaffadbc01c4f66
    https://github.com/systemd/systemd-stable/commit/fe9b92e566f837665cc06c82374e4e42f9295c99
    https://github.com/systemd/systemd-stable/commit/5dd4cc4b10daea5d2ba969425ba02d2098dd06a4

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 60a95ba16ec29d9cb8be32436bb0f96b2a5106aa)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...ent.c-fix-error-handling-for-udev_mo.patch | 39 +++++++++++++++++++
 .../multipath-tools/multipath-tools_0.8.4.bb  |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0001-libmultipath-uevent.c-fix-error-handling-for-udev_mo.patch

diff --git a/meta-oe/recipes-support/multipath-tools/files/0001-libmultipath-uevent.c-fix-error-handling-for-udev_mo.patch b/meta-oe/recipes-support/multipath-tools/files/0001-libmultipath-uevent.c-fix-error-handling-for-udev_mo.patch
new file mode 100644
index 0000000000..d261b13d91
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0001-libmultipath-uevent.c-fix-error-handling-for-udev_mo.patch
@@ -0,0 +1,39 @@
+From 8579d8a35886f91974e0ac4dbdf2edb7dac06d52 Mon Sep 17 00:00:00 2001
+From: Joe Slater <joe.slater@windriver.com>
+Date: Fri, 18 Dec 2020 11:17:50 +0800
+Subject: [PATCH] libmultipath/uevent.c: fix error handling for
+ udev_monitor_set_receive_buffer_size
+
+Since systemd v246.5[1], udev_monitor_set_receive_buffer_size() will
+return 0 or 1 if successful. We only need to check a negative value for
+the failure.
+
+[1] https://github.com/systemd/systemd-stable/commit/4dcae666889ae9469e4406c0bcaffadbc01c4f66
+    https://github.com/systemd/systemd-stable/commit/fe9b92e566f837665cc06c82374e4e42f9295c99
+    https://github.com/systemd/systemd-stable/commit/5dd4cc4b10daea5d2ba969425ba02d2098dd06a4
+
+Upstream-Status: Pending
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ libmultipath/uevent.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libmultipath/uevent.c b/libmultipath/uevent.c
+index d38e8a7f..4b298052 100644
+--- a/libmultipath/uevent.c
++++ b/libmultipath/uevent.c
+@@ -810,7 +810,8 @@ int uevent_listen(struct udev *udev)
+ 	}
+ 	pthread_cleanup_push(monitor_cleanup, monitor);
+ #ifdef LIBUDEV_API_RECVBUF
+-	if (udev_monitor_set_receive_buffer_size(monitor, 128 * 1024 * 1024))
++	err = udev_monitor_set_receive_buffer_size(monitor, 128 * 1024 * 1024);
++	if (err < 0)
+ 		condlog(2, "failed to increase buffer size");
+ #endif
+ 	fd = udev_monitor_get_fd(monitor);
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
index 331c0cd018..186f78b8f2 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
@@ -47,6 +47,7 @@ SRC_URI = "git://git.opensvc.com/multipath-tools/.git;protocol=http \
            file://0001-fix-bug-of-do_compile-and-do_install.patch \
            file://0001-add-explicit-dependency-on-libraries.patch \
            file://0001-fix-boolean-value-with-json-c-0.14.patch \
+           file://0001-libmultipath-uevent.c-fix-error-handling-for-udev_mo.patch \
            "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
-- 
2.17.1

