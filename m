Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web12.2983.1591818561667069330
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 12:49:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CiT/x6DR;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: jacob.kroon@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id x93so2265872ede.9
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jun 2020 12:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YnChMsI6yNA7VFcO3R+WuTkD1eh5Zt/xfKEYpTZ1tIg=;
        b=CiT/x6DR0AJ+QKbQgmNQtUrrT6G/RfhbY0eCFo26JG+56TPdR79EqDQVmI8VBhwwUS
         /gl+i0VLrA+Rb6JwmR0Apg4l8W1U2GdIBj/aIWXNhjVHhDF0NzXwFVO7XmjoUv4iJl9N
         fqmcvGm5o1f4oXg5yfizabkwShLOwfndiaN3ixx3dChV0FEONovbKigjIbZ5v9BLUGAk
         z+a53BeZV9CaQhFfqPEOeCMBskmMTPv48Lry5jijv6WBAKGC67YuzL3GQeQPZBG+uGMS
         3XgOaoQ7+CsMmFbCrivPF8DWflwqun50zArp+TmxSDFjTcSDKzzus23ocwwBAcuA7JlJ
         CBIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YnChMsI6yNA7VFcO3R+WuTkD1eh5Zt/xfKEYpTZ1tIg=;
        b=IT2fC1OPh8+8FoFovvHZjvRxEyhpS+yQzXkCCWgz8LXs7cI5blm8sSvnUgRl8Eu08n
         ihW5qd4MhBIm7AjPTxeFpYzgs24YaEV9bJpczuQwmO+YOLd/EL1FQljdX+cJgyo/VxK9
         cdNRC0q8OTbUIK3cFaBlGHqmomQOAa/pTBoeZVr33t+wccUvORtFY4lKDC/hJIXz5u9H
         AwRwLI7Gqr+VcWsPFsVRy1HmYDvwzLcWQl8esxNxjLA0po11SYDwuqHPyw9Zw4Ai0aI3
         YRDErD1KwSM4Mnz+ucdr8FRPUMpTQmh7kwawnfnrHvLrVqArT7HpNdufZWSyzyYWDGum
         6KvA==
X-Gm-Message-State: AOAM532RF+ClTOGlMBpMf52hzPsM3HTiBc37riUYex4PF2ESyyhNIenL
	BcwamOxwRuC9wcbPZVrkJpAkBYao
X-Google-Smtp-Source: ABdhPJxD/E0pkgyG7vOKhopn21jJKUK7JpFbL5Z06y8rWjo7PXzO+QsPj/48avoLDCc8/kPjDsyMjQ==
X-Received: by 2002:aa7:d6c1:: with SMTP id x1mr3824208edr.154.1591818559525;
        Wed, 10 Jun 2020 12:49:19 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se. [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id fw16sm512505ejb.55.2020.06.10.12.49.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 12:49:18 -0700 (PDT)
From: "Jacob Kroon" <jacob.kroon@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] meta-oe: Don't inherit 'features_check' in recipes that don't utilize it
Date: Wed, 10 Jun 2020 21:49:01 +0200
Message-Id: <20200610194901.3082-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta-oe/recipes-connectivity/transmission/transmission_git.bb | 2 +-
 meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb         | 2 +-
 meta-oe/recipes-support/upower/upower_0.99.11.bb              | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/transmission/transmission_git.bb b/meta-oe/recipes-connectivity/transmission/transmission_git.bb
index ee5578f8b..412bd9d3f 100644
--- a/meta-oe/recipes-connectivity/transmission/transmission_git.bb
+++ b/meta-oe/recipes-connectivity/transmission/transmission_git.bb
@@ -19,7 +19,7 @@ PV = "2.94"
 
 S = "${WORKDIR}/git"
 
-inherit autotools gettext update-rc.d systemd mime-xdg features_check
+inherit autotools gettext update-rc.d systemd mime-xdg
 
 PACKAGECONFIG = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)} \
                  ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)}"
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
index 06895a03a..21d13ac93 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
@@ -52,7 +52,7 @@ EXTRA_OECMAKE_append_riscv64 = " -DFLB_DEPS='atomic'"
 # DEPENDS += "openssl "
 # EXTRA_OECMAKE += "-DFLB_OUT_KAFKA=On "
 
-inherit cmake systemd features_check
+inherit cmake systemd
 
 SYSTEMD_SERVICE_${PN} = "td-agent-bit.service"
 TARGET_CC_ARCH_append = " ${SELECTED_OPTIMIZATION}"
diff --git a/meta-oe/recipes-support/upower/upower_0.99.11.bb b/meta-oe/recipes-support/upower/upower_0.99.11.bb
index 640841792..d6c89a65d 100644
--- a/meta-oe/recipes-support/upower/upower_0.99.11.bb
+++ b/meta-oe/recipes-support/upower/upower_0.99.11.bb
@@ -10,7 +10,7 @@ SRC_URI = " \
 SRC_URI[md5sum] = "abe6acb617f11f2e8dbd9846fcf86e24"
 SRC_URI[sha256sum] = "64b5ffbfccd5bdb15d925777979a4dbee1a957f9eaeb158dc76175267eddbdef"
 
-inherit autotools pkgconfig gettext gobject-introspection systemd features_check
+inherit autotools pkgconfig gettext gobject-introspection systemd
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[idevice] = "--with-idevice,--without-idevice,libimobiledevice libplist"
