Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0503AC41535
	for <webhook@archiver.kernel.org>; Fri, 22 Dec 2023 06:55:24 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.17777.1703228113632320751
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Dec 2023 22:55:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nx0XAmRh;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2cc6eecd319so18840121fa.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 22:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703228111; x=1703832911; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0wVi/Ya+x1CPRF+OEtjN3AX6Lu7AsqfGqRHHR3YoRV8=;
        b=Nx0XAmRhKpjS/Ibnp6+jW7VfLOqtZmt8wDKq0FkyKivZ7wgTl28tb1Dexm2U3Ziz1F
         e+sIVKEn9DZtrndRd+rLpWsXzWpkyh3h9ynlwp24THNv3llIW4jX9W03FzXg2wzoyHwf
         uluDaiyEPeYalfurusx1bxothGS6CQHzjHWKLQ0b3kNAaVrLe65ZPTGSV3L1ro/Xdb9p
         KXfNsCjn8q0y/Mpr8Hg0S6gW3TPszQMBQ2S/0UlRqBpvkXgKU0H74DOkrAgOXi7Dp1DC
         ou7DpmgLIzxgqqbOlv9+3PEhZNwhJ9PgUsDFsk/ZKizdPt2HlHyHPPST+4cZ9FfqPDjQ
         ck8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703228111; x=1703832911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0wVi/Ya+x1CPRF+OEtjN3AX6Lu7AsqfGqRHHR3YoRV8=;
        b=HDzo6YLmgYE85NR8mPY2/k6RpYRubV+dfgp+rdpPjuJYowDPumhMq0/HMEy0nzmq7J
         VfQ56U6YkZOHuh5aHjm8ZPhGBjJbh65BqT7PBNVx5r3o+BpFRW5IWXbwK8fj9Wy05lWM
         7etqLxjmvdouV0NYrjP7SPrmdY1TFdNsg0m3dbcsieHjfuuvbrxef+R9FtpUKcXYwCdb
         X5AJFynGw4TSSdEySCjSU+TOi//4AI4tGQGSb4lbXVzEiWrqT+wEHji6dN32e4bHc7Pb
         ie/33hfCaP3B9ANHdMekkLdPytvaR/M/8eiNJ5m5D4SeGnDdcfb2wR1KpfL44hTFvwVV
         OpYw==
X-Gm-Message-State: AOJu0YyWg7bxpbx3TDl9tRIj+UKOKrpRjZRBSlCXgpwQ+IydD3u9lj/L
	AYtMKadIhGX8nFO/gt1yNY3EP1K4PMo=
X-Google-Smtp-Source: AGHT+IEwWqKZbVzIDTbBp02DVc+4rMyugnzXJJ4I3kcMh5gw5bUouLFn3qgFR/lkOT59m4qGQIVAmQ==
X-Received: by 2002:a2e:9d12:0:b0:2cc:68ba:98a9 with SMTP id t18-20020a2e9d12000000b002cc68ba98a9mr285777lji.41.1703228110610;
        Thu, 21 Dec 2023 22:55:10 -0800 (PST)
Received: from localhost.localdomain ([176.88.106.122])
        by smtp.gmail.com with ESMTPSA id j3-20020a5d4523000000b003364b530d1asm3582914wra.5.2023.12.21.22.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 22:55:10 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] driverctl: upgrade 0.111 -> 0.115
Date: Fri, 22 Dec 2023 09:55:06 +0300
Message-Id: <20231222065506.1326249-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Dec 2023 06:55:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107746

Changelog:

* driverctl: Fix duplicate ID write error
* driverctl: add list-persisted command
* Fix device driver binding issue after re-enumeration
* driverctl: fix list_devices() when `driver_override` is not set

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../driverctl/driverctl_0.111.bb              | 28 -------------------
 .../driverctl/driverctl_0.115.bb              | 23 +++++++++++++++
 2 files changed, 23 insertions(+), 28 deletions(-)
 delete mode 100644 meta-oe/recipes-support/driverctl/driverctl_0.111.bb
 create mode 100644 meta-oe/recipes-support/driverctl/driverctl_0.115.bb

diff --git a/meta-oe/recipes-support/driverctl/driverctl_0.111.bb b/meta-oe/recipes-support/driverctl/driverctl_0.111.bb
deleted file mode 100644
index f5f542c54..000000000
--- a/meta-oe/recipes-support/driverctl/driverctl_0.111.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-SUMMARY = "driverctl is a device driver control utility for Linux"
-LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/LGPL-2.1-only;md5=1a6d268fd218675ffea8be556788b780"
-
-REQUIRED_DISTRO_FEATURES = "systemd"
-
-DEPENDS = "systemd"
-RDEPENDS:${PN} += "bash bash-completion"
-
-SRC_URI = " git://gitlab.com/driverctl/driverctl.git;branch=master"
-SRCREV = "fa9dce43d1a667d6e6e26895fbed01b3b04362c9"
-
-S = "${WORKDIR}/git"
-
-inherit pkgconfig systemd features_check
-
-FILES:${PN} += "${libdir}"
-FILES:${PN} += "${libdir}/udev"
-FILES:${PN} += "${libdir}/udev/rules.d"
-FILES:${PN} += "${systemd_unitdir}"
-FILES:${PN} += "${systemd_unitdir}/system"
-FILES:${PN} += "${datadir}"
-FILES:${PN} += "${datadir}/bash-completion"
-FILES:${PN} += "${datadir}/bash-completion/completions"
-
-do_install () {
-	oe_runmake install DESTDIR=${D}
-}
diff --git a/meta-oe/recipes-support/driverctl/driverctl_0.115.bb b/meta-oe/recipes-support/driverctl/driverctl_0.115.bb
new file mode 100644
index 000000000..d37563eda
--- /dev/null
+++ b/meta-oe/recipes-support/driverctl/driverctl_0.115.bb
@@ -0,0 +1,23 @@
+SUMMARY = "driverctl is a device driver control utility for Linux"
+LICENSE = "LGPL-2.1-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+REQUIRED_DISTRO_FEATURES = "systemd"
+
+DEPENDS = "systemd"
+RDEPENDS:${PN} += "bash bash-completion"
+
+SRC_URI = "git://gitlab.com/driverctl/driverctl.git;branch=master;protocol=https"
+SRCREV = "2ba60536eb20ca0a6a751bd8b6501dba84ec45d3"
+
+S = "${WORKDIR}/git"
+
+inherit pkgconfig systemd features_check
+
+do_install () {
+	oe_runmake install DESTDIR=${D}
+}
+
+FILES:${PN} += "${libdir}"
+FILES:${PN} += "${datadir}"
+
-- 
2.25.1


