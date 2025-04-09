Return-Path: <alistair23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 923A3C36010
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 02:37:48 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.13410.1744166264775699230
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Apr 2025 19:37:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nYDBNI0F;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: alistair23@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2264aefc45dso80111115ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 19:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744166264; x=1744771064; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VcCIGn3a031MfStN9WkCmkB9AXcebcqNNOVIgMxsBlI=;
        b=nYDBNI0F2SfstP2skfB/typIyclQZjdF3C1cP3M10uy0ZZP6SeB3/d/8MOl9zyQO9p
         AWEwkFMobd5EnWTAHTcbssMUIlFF1jhAMF7+pyBuQX2d4Hr1l/RhtbKDHjKbdQKDf0ce
         jo+FRHX1ktLS+8ZWHe5E/CDizPzNik49lNU6iqoY+TtXwgcnVjDBlCMgSqiEjy6k2OXc
         zsfa+wbvv5VjpnMC79C4u5fF6OdgI1Jtu7itl8LK0X9kR+99by/vlN8VMTsdTKJ9WPM8
         mV7StuH1YhLLXtIvlTOt0cKcPUUtdUxk6McTlETut2VxPA2S4l9l3ayYev6lT5mWvDK7
         6MTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744166264; x=1744771064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VcCIGn3a031MfStN9WkCmkB9AXcebcqNNOVIgMxsBlI=;
        b=feBZjA5I674INPD19Q40s+VDrEy93Cp8nYowyY7M72OrRxFHFXcSlJ2vI2hClpmJPq
         STtPJgVs8VJOQBc1PBN6W/lK635ViY91xs31+iNqOiqUK+/ExLJ4gC6DF8ecS1vrZfeX
         FgZCwRYJTIm7EI9ZQlSfofUGS1DeYnezm//t2j+vOfGEE8vIo/l3oqT29pZzBQnZFcUR
         I+2Ms+xRYb86rGzizzrNHW+F348bTWR0rPnbe+jf/PS1w8wEh/jvsuWy77v0c0C7OO0d
         jq95WeF+fYchTRl0yVZgz/2Pm1FiPSOEe6AHJGhiKd3NNM9yEd4RMGCN8nzwLbXVMqa+
         5EYA==
X-Gm-Message-State: AOJu0YyP0Ia/nGG98iFqPN6VpgE5c+HHexOxbivDuTC/3eF4Hv0Fn/1b
	/GFD5wKYc8kw7+zrCkHu9zYD2hABTrRkvnllzrj4S9Uwk4CzHmLdTVWC4g==
X-Gm-Gg: ASbGnctZ7MhI7gHwuxYCirWIfSmeGjrQroDrBSsuY0Wlvg4NhxAQyxqLjPLNlrjxMOr
	IDnSFEFqz0DME+fweNQdvDfk167vpVSXzfB/i2GLwYg+XHtS2pH7M6AdADrYI8w6EZqCUVJHR2w
	4MRhu7XMM0dW8YcktNS5aWn/+CYmyc+b2nTqcrPxK77nSIpeFQD3RaSyOfVcTYxkv8XM+nhmQvF
	BEkTg9aW3ONR8DzB1Eb1fNFV0kDAp04neFVQC6NvI8cUV5alklO12lx/2XplmSHX3gIAfMScn1/
	Nl5d3R9lN1T+TTqPXY0/eROpz0AlIXJtQW7W4IxZSLdVuV7sL+KScJERQIbhlIkEbqSd3+ZDyKu
	Sx8hxU/363hp6G6d8spJkpSgeenyfAUrAypH/y45dpOlMLD5I2w==
X-Google-Smtp-Source: AGHT+IGvmZ8lIeOvFzzzo+0D4mAKXC3NsLRPWLlAgOzDKITfINFjmlY9377SDXIgLVpXPlE0LUrdpQ==
X-Received: by 2002:a17:903:1a23:b0:223:26da:4b6f with SMTP id d9443c01a7336-22ac298f941mr22495355ad.14.1744166263797;
        Tue, 08 Apr 2025 19:37:43 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8b158sm636485ad.84.2025.04.08.19.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 19:37:42 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [meta-oe][PATCH v3] ktls-utils: Initial commit
Date: Wed,  9 Apr 2025 12:37:36 +1000
Message-ID: <20250409023736.4038799-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Apr 2025 02:37:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116720

Package ktls-utils which includes tlsd.

This is used when in-kernel TLS consumers need a mechanism to perform TLS
handshakes on a connected socket to negotiate TLS session parameters that
can then be programmed into the kernel's TLS record protocol engine.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 ...PERMS-if-it-doesn-t-exist-to-fix-mus.patch | 37 +++++++++++++++++++
 .../ktls-utils/ktls-utils_0.11.bb             | 24 ++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/ktls-utils/ktls-utils/0001-tlshd-Define-ALLPERMS-if-it-doesn-t-exist-to-fix-mus.patch
 create mode 100644 meta-oe/recipes-kernel/ktls-utils/ktls-utils_0.11.bb

diff --git a/meta-oe/recipes-kernel/ktls-utils/ktls-utils/0001-tlshd-Define-ALLPERMS-if-it-doesn-t-exist-to-fix-mus.patch b/meta-oe/recipes-kernel/ktls-utils/ktls-utils/0001-tlshd-Define-ALLPERMS-if-it-doesn-t-exist-to-fix-mus.patch
new file mode 100644
index 0000000000..d27e2aa741
--- /dev/null
+++ b/meta-oe/recipes-kernel/ktls-utils/ktls-utils/0001-tlshd-Define-ALLPERMS-if-it-doesn-t-exist-to-fix-mus.patch
@@ -0,0 +1,37 @@
+From ca95e956307672484e8c018263600749aa9c4f4d Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Wed, 9 Apr 2025 11:14:52 +1000
+Subject: [PATCH] tlshd: Define ALLPERMS if it doesn't exist to fix musl build
+
+ALLPERMS exists in glibc, but not on musl, so we manually define
+it if it doesn't exist. This fixes building on musl systems.
+
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+Upstream-Status: Submitted
+[https://github.com/oracle/ktls-utils/pull/88]
+---
+ src/tlshd/config.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/src/tlshd/config.c b/src/tlshd/config.c
+index 38948e8..e653bd8 100644
+--- a/src/tlshd/config.c
++++ b/src/tlshd/config.c
+@@ -46,6 +46,14 @@
+ 
+ static GKeyFile *tlshd_configuration;
+ 
++/**
++ * ALLPERMS exists in glibc, but not on musl, so we
++ * manually define it if it doesn't exist
++ */
++#ifndef ALLPERMS
++#define ALLPERMS (S_ISUID|S_ISGID|S_ISVTX|S_IRWXU|S_IRWXG|S_IRWXO)
++#endif
++
+ /**
+  * tlshd_config_init - Read tlshd's config file
+  * @pathname: Pathname to config file
+-- 
+2.49.0
+
diff --git a/meta-oe/recipes-kernel/ktls-utils/ktls-utils_0.11.bb b/meta-oe/recipes-kernel/ktls-utils/ktls-utils_0.11.bb
new file mode 100644
index 0000000000..650b69fcd1
--- /dev/null
+++ b/meta-oe/recipes-kernel/ktls-utils/ktls-utils_0.11.bb
@@ -0,0 +1,24 @@
+SUMMARY = "TLS handshake utilities for in-kernel TLS consumers"
+DESCRIPTION = "In-kernel TLS consumers need a mechanism to perform TLS \
+handshakes on a connected socket to negotiate TLS session parameters that \
+can then be programmed into the kernel's TLS record protocol engine."
+DEPENDS = "gnutls keyutils glib-2.0 libnl"
+RDEPENDS:${PN} += " gnutls"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d568123389d9a12625cca2b089b1728b"
+
+SRCREV = "5c3314b5728b272cbaf0d98f4d521cca9610b6bf"
+SRC_URI = " \
+	git://github.com/oracle/ktls-utils.git;nobranch=1;protocol=https \
+	file://0001-tlshd-Define-ALLPERMS-if-it-doesn-t-exist-to-fix-mus.patch \
+	"
+
+S = "${WORKDIR}/git"
+
+inherit autotools-brokensep pkgconfig systemd
+
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+
+PACKAGECONFIG[systemd] = "--with-systemd,,systemd"
+
+SYSTEMD_SERVICE:${PN} = "tlshd.service"
-- 
2.49.0


