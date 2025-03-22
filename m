Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E8C2C35FFC
	for <webhook@archiver.kernel.org>; Sat, 22 Mar 2025 22:03:31 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.5882.1742681000862414496
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Mar 2025 15:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=nnwPR/4X;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43948021a45so24552065e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 Mar 2025 15:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1742680998; x=1743285798; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R/nMbPMx6yRmAHlLR1w3UCXzoKaTq06Y1o5zzxAhR0k=;
        b=nnwPR/4XipOlE2x5jMDefbuksHqx90p739bUAhAKWcGWv3wshwduHI33uUWBskYKqi
         eGKQkF0mEz6jdqvrp7NhEn5wV7C0QGEy8RTUsN5erovDwXiBJjemTFq5BmOoPBMY7NEV
         S4KqDZZEyVbc2fjW/bjfDUrmonf/Td2hhwfoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742680998; x=1743285798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R/nMbPMx6yRmAHlLR1w3UCXzoKaTq06Y1o5zzxAhR0k=;
        b=xF4m0u8AszpwPOu0vfwMecJkT1/4Ra6h13TM3zLRB7C6b8mQr0tmcGedG6LtJ/oHyp
         GiccCH/CXKm8oFRQUXA47gx+0P0qmsZcnWn2GuyzZhYD2sGlPdOUxCVxJKoOR5B/lMWf
         vSn0z4K1R8LScV7LON5fU+GD926YLNJ847eAWFhTb1s9HhHcujRwpgmn45bptZ3V4ygf
         z7h7xD7MFhJQb1RsJm9jQJv3dXv38ciagIhaO7bXP+QoNBszl7UlTeP2+qKd02ffvTfF
         2tMDUSVCfud3qhSCFE3+afQJHfQ/s+/qU7DMejamP1X22O9hcBP9ywFdFietT3WXMV31
         ev0w==
X-Gm-Message-State: AOJu0Yz1ajPTCWObuQb3hnrQ4iPr7gNJoVftBqsMmX14XMQaNBK5uNjL
	JQfviKTDFo7dx8C6vMKrlAR3oBzgtmzWKw8/feBqvQnh8lnvsILgiF7LgYO9+R3TYbymkCBnn84
	s
X-Gm-Gg: ASbGncuWkn/jMjZfoZoZY/g8SC3UujwzI1yvw0fgchWcxZl4hX8xxAIO5q+i+u0+co8
	83f5Gy9voXbNgmtd2CidtvnZTjDjg7LgR9j7NfbMPfE0fdtj3OYb5+UYPIJS5iy/3RomVmS81+T
	cVmi+9EZd5EOvzV4oaNyyPG2Vjjrxm/07mfk8Hu5NeuAkdeay9ltcGwlreIr1KZ1XyVEA7p6+cp
	71MUZDKxpEm5U8oq1ulI0JLd0YR+mcgVa6cPnRniE691/ZC2yRCvtPeQd2tOKfzF76912/wHqKJ
	v+FDEmVDBfpeXTtS/2stN4Zff+4TU+CuI5dN9pwrT5SrjxEdAjYxC+8pbxU6xmV/bHF8YE+2jdi
	6dwAfEd8nv3/o5JW/suPSf9snyGe8RPfB3ausefRfq+biX71SU5x3
X-Google-Smtp-Source: AGHT+IHkMfuO5oNrpmPJuXYv7Q8I8CqIsc02Ii7Q1dSn6DDes7SQ5/18Az927uN+Qb17kDWHpW541A==
X-Received: by 2002:a05:6000:2a11:b0:391:9b2:f49a with SMTP id ffacd0b85a97d-3997f941a94mr5492801f8f.55.1742680998104;
        Sat, 22 Mar 2025 15:03:18 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local (2a01cb000deef000f0da383060e5e6f8.ipv6.abo.wanadoo.fr. [2a01:cb00:dee:f000:f0da:3830:60e5:e6f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f332adsm119789065e9.3.2025.03.22.15.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Mar 2025 15:03:17 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH] poke: Fix the reproducibility of installed scripts
Date: Sat, 22 Mar 2025 23:01:47 +0100
Message-Id: <20250322220146.3969535-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Mar 2025 22:03:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116201

From: Yoann Congal <yoann.congal@smile.fr>

There is a race condition between 2 actions at install around the
installed script in $pkgdatadir:
* Removal of existing scripts /usr/share/poke/*.pk
* Installation of default scripts in the same directory

Sadly, those 2 actions are not ordered. Depending on the build system load,
removal can (rarely) happen *after* the installation. In this case, no
script in present in /usr/share/poke/ when the install process end.

In OE, we always install on an empty sysroot, so, no pre-existing scripts can
exists. Remove the code that does the cleanup to avoid the
race-condition and ensure the scripts are always present.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
FWIW, I plan to report a bug to upstream.

 ...bpoke-Remove-existing-script-cleanup.patch | 43 +++++++++++++++++++
 meta-oe/recipes-devtools/poke/poke_4.2.bb     |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/poke/poke/0001-libpoke-Remove-existing-script-cleanup.patch

diff --git a/meta-oe/recipes-devtools/poke/poke/0001-libpoke-Remove-existing-script-cleanup.patch b/meta-oe/recipes-devtools/poke/poke/0001-libpoke-Remove-existing-script-cleanup.patch
new file mode 100644
index 0000000000..8562e36c66
--- /dev/null
+++ b/meta-oe/recipes-devtools/poke/poke/0001-libpoke-Remove-existing-script-cleanup.patch
@@ -0,0 +1,43 @@
+From 65d1c6146995216538b0224e5aefe5e8c0c69a0d Mon Sep 17 00:00:00 2001
+From: Yoann Congal <yoann.congal@smile.fr>
+Date: Sat, 22 Mar 2025 22:11:47 +0100
+Subject: [PATCH] libpoke: Remove existing script cleanup
+
+There is a race condition between 2 actions:
+* Removal of existing scripts $(pkgdatadir)/*.pk in "install-data-local"
+* Installation of default scripts with automake:
+  "dist_pkgdata_DATA = pkl-rt.pk pkl-config.pk std.pk std-types.pk"
+
+Sadly, "install-data-local" and the generated target from
+"dist_pkgdata_DATA" are not ordered. Depending on the build system load,
+removal can (rarely) happen *after* the installation. In this case, no
+script in present in $(pkgdatadir) when the install process end.
+
+In OE, we always install on an empty sysroot, so, no pre-existing scripts can
+exists. Remove the code that does the cleanup to avoid the race-condition.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+---
+ libpoke/Makefile.am | 9 ---------
+ 1 file changed, 9 deletions(-)
+
+diff --git a/libpoke/Makefile.am b/libpoke/Makefile.am
+index 6eff76b..965252b 100644
+--- a/libpoke/Makefile.am
++++ b/libpoke/Makefile.am
+@@ -268,13 +268,4 @@ pvm-vm1.c: pvm-vm.h
+ pvm-vm2.c: pvm-vm1.c
+ 	@{ test -f $(srcdir)/pvm-vm2.c && test ! $(srcdir)/pvm-vm2.c -ot $(srcdir)/pvm-vm1.c; } || $(MAKE) generate-vm-files
+ 
+-# In order to avoid problems with older installations, we remove the
+-# Poke scripts installed in $(pkgdatadir).  Note however that other
+-# programs may install scripts in subdirectories under $(pkgdatadir),
+-# and these are not to be touched.
+-install-data-local: uninstall-sources
+-uninstall-local: uninstall-sources
+-uninstall-sources:
+-	rm -f $(DESTDIR)$(pkgdatadir)/*.pk
+-
+ # End of Makefile.am
diff --git a/meta-oe/recipes-devtools/poke/poke_4.2.bb b/meta-oe/recipes-devtools/poke/poke_4.2.bb
index a31b6605a2..3e12ddb11c 100644
--- a/meta-oe/recipes-devtools/poke/poke_4.2.bb
+++ b/meta-oe/recipes-devtools/poke/poke_4.2.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "${GNU_MIRROR}/poke/poke-${PV}.tar.gz \
           file://0003-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch \
+          file://0001-libpoke-Remove-existing-script-cleanup.patch \
           "
 
 DEPENDS = "flex-native bison-native bdwgc readline"

