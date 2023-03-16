Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 338D4C7618A
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 21:02:34 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.4171.1679000553469562181
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Mar 2023 14:02:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LuyQ7F9F;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id le6so3140506plb.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Mar 2023 14:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679000553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pvcIs5m4q3s8QQQ0hMJLp1I+n+wZwt86fgZqSx2xtqg=;
        b=LuyQ7F9F7YjE0FkJTX0OSuens6zcmurJViBv9LumU0LZcl8IqzXb4BMLQ2jJpiGIbJ
         hig/PCJF2DABO72f7rv138I2vb43Px/XKiNTPq/DtukxVz/o6AJw2EAlGYS+K9x7wlVd
         0Ws7LLy+oCIIpflcRUlLUSwgYOMuZx8vCxGBpbN0xChbDRB9KLGsXXdwo1OU3Ndi9Zlv
         N08HXZyBp1Lr7I4l7/GAPBsBt6YsWuyLbzyDClN2Phehm0i0gIdpdbH69uP1OodCKQyC
         VmnbmQAKxaaqxJJu4/HPfenzeCGmLc2NmJVegcP0AsrtTCxFUtfksvzQ+J1tb1bD2bUd
         dHJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679000553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pvcIs5m4q3s8QQQ0hMJLp1I+n+wZwt86fgZqSx2xtqg=;
        b=I4GbpNYMjQL2WlGeSle/3nC/SE9Jkb4TiPUxSCnMixgSX6yX34/JnzofYQh7KWxsGG
         DKsyXiNGkTuPWYIwjr8rPT3ElVPVeLcuu93XjvAu3YqVBf8LQhgZjXU3kIMflt5NsPqY
         EvaxQ/KU88iYfO2664y3bG1PRUrqdtEFGo+eI3nbmiHvH5Ao1COZQ5lIw9kXgrZ+r0I1
         udt8GcPZ29oSzQMk7n3Vf2Wu3DFr57IkwUVigvpb8i82v+qbfxdRaOjjmHyVeAzNb4wn
         wO6+U433d7u6QyDeQtS0uKAnJ18X8eRGGZot0D4DI2pEY6mqgaL91knoFOjQwxCCyR0x
         dv3g==
X-Gm-Message-State: AO0yUKXW7sDpuIeJrth7d3bJm9ifskT5JOLIvLxVxtx3T9FV6/dQ3aDR
	m6eotMTjFhEbZpn2eFk2wGt/W4UYGywUOA==
X-Google-Smtp-Source: AK7set9UkIWNszRpTZlatX8Jbb19hkMFraeG02s/I1bN7q5e02KczcfxGyr245oIs5NseSD5Tc/lsw==
X-Received: by 2002:a05:6a20:8b90:b0:d3:5b84:6fcd with SMTP id m16-20020a056a208b9000b000d35b846fcdmr5106786pzh.12.1679000552326;
        Thu, 16 Mar 2023 14:02:32 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::7bc1])
        by smtp.gmail.com with ESMTPSA id s22-20020aa78296000000b00625d56355fesm112531pfm.191.2023.03.16.14.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 14:02:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] lirc: Fix build with usrmerge feature building on ubuntu hosts
Date: Thu, 16 Mar 2023 14:02:29 -0700
Message-Id: <20230316210229.291737-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Mar 2023 21:02:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101583

We get a very cryptic error during do_package

ERROR: Didn't find service unit 'lircmd.service', specified in SYSTEMD_SERVICE:lirc.

The reason is on ubuntu build hosts configure pokes at build host and
decided its ubuntu and applies hardcoded value of /lib/systemd/system
for systemdunitdir instead of /usr/lib/systemd/system as passed from
recipe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../lirc/lirc/0001-Unbolt-ubuntu-hack.patch   | 26 +++++++++++++++++++
 .../recipes-connectivity/lirc/lirc_0.10.2.bb  |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Unbolt-ubuntu-hack.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Unbolt-ubuntu-hack.patch b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Unbolt-ubuntu-hack.patch
new file mode 100644
index 0000000000..e58a93b6f6
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Unbolt-ubuntu-hack.patch
@@ -0,0 +1,26 @@
+From ca126a2832aaff0deef3ba7eaf411dd0dc43b068 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 16 Mar 2023 11:31:14 -0700
+Subject: [PATCH] Unbolt ubuntu hack
+
+This bites during cross compiling where the target is different than
+build host and build host might be ubuntu but that does not matter in
+cross compilation case. This fails builds when usrmerge feature is used
+
+Upstream-Status: Inappropriates [ Cross-compile specific ]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/configure.ac
++++ b/configure.ac
+@@ -429,7 +429,7 @@ AC_CHECK_LIB([udev], [udev_device_new_fr
+ ])
+ 
+ dnl Ubuntu's systemd pkg-config seems broken beyond repair. So:
+-kernelversion=`cat /proc/version || echo "non-linux"`
++kernelversion="cross-compiled"
+ AS_CASE([$kernelversion],
+   [*Ubuntu*],[
+     AC_MSG_NOTICE([Hardwiring Ubuntu systemd setup])
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb
index 458d9d7cdd..88e3f0486b 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://prdownloads.sourceforge.net/lirc/lirc-${PV}.tar.bz2 \
            file://lirc_options.conf \
            file://lirc.tmpfiles \
            file://0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.patch \
+           file://0001-Unbolt-ubuntu-hack.patch \
            "
 SRC_URI[sha256sum] = "3d44ec8274881cf262f160805641f0827ffcc20ade0d85e7e6f3b90e0d3d222a"
 
-- 
2.40.0


