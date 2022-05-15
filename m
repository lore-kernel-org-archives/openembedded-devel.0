Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5224CC433F5
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 13:49:30 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web09.17025.1652622569819626047
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 May 2022 06:49:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eP4gnaPH;
 spf=pass (domain: gmail.com, ip: 209.85.214.179,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id m12so12108845plb.4
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 May 2022 06:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Y9/Erbevw2owV6+d/VKHZG23OEDi2Y8oFW18bi49Wac=;
        b=eP4gnaPHjLCgqEK+ZmpnRBygFnZM3aD+6YrjYJRZgV8RdmwUDjxcP1z5pYFE13n5Tw
         MRbOZRrE/4VdUougxfndlUGLqE8fxldhrEmCXNO8ZP7L2Vw2/jPbKgGFb1osM676RRm5
         NGQjihMOiCg31bDuZUbg8xO5f499piohXjuxaGkcbrfBcyx3jFrX6yPWhDw+t2sf1eXA
         OiJDcG518JSLKvMUesFcJdDRMubVdMon5ojkWhbgjnW0I+UoWiDj40fPfi3xtIx/bHpt
         HHtHXz0NqnKxxAgHk8byJKUzdtKdnfaHIJ0SRH/ERby5o1LUAcuyHkCTMaaydTACxxWk
         vtUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y9/Erbevw2owV6+d/VKHZG23OEDi2Y8oFW18bi49Wac=;
        b=6A+DUzr1S2hLU1rgYrlY73XwtC4WeTnU67n4VFe/WmmK1i9s+gINTCa03vSwZt68v0
         kDQif7Thm6moJK1navzEWh9alBvlKZOX4bsY42QMbBzZsIHko6jdzs7/e1q3xAc6jVM3
         hR1liCQXvXD4s7hLXg0qiGR+OgLYWiGKOs96oJwlsGiflRsKwtFWCNeoA4x5gvEATd2a
         sanI7oJ7hLjDfHggqR71Wq6RXxtvquqoSRD2N2Ci4KP5DTXcHEjB1h530AkSANWy7z9d
         fMC0Nn7deTfyJV+IT1396sAwPVw7Z4t//wVnaWTi7AMtIVv82iD8cytvupIDmjtzd1r6
         YkLA==
X-Gm-Message-State: AOAM5333wy09Dl8qB8W1nfvXWNRrV+x1TUDwiLzYpYluG4ru7BCq1AfS
	pbO9Q45XSOqEXbNQL2irARmIPQJaeBuHzA==
X-Google-Smtp-Source: 
 ABdhPJw7HjKJyRJGnGfxD8/TNdI2YKMmPxAwwPjlKYw/yB5khJLtOJqaMV//ESj7n+8hQBjdODcQpw==
X-Received: by 2002:a17:90a:d308:b0:1dc:eff1:d74e with SMTP id
 p8-20020a17090ad30800b001dceff1d74emr14517430pju.109.1652622568970;
        Sun, 15 May 2022 06:49:28 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:48be:3d3d:c26:7949])
        by smtp.gmail.com with ESMTPSA id
 z22-20020a63e556000000b003c644b2180asm4961650pgj.77.2022.05.15.06.49.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 May 2022 06:49:28 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 02/22] frr: inherit autotools-brokensep instead of
 autotools
Date: Sun, 15 May 2022 06:49:02 -0700
Message-Id: 
 <e230791ed689c6a65bb9d6edb8efc1e0e30c3cd5.1652622481.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652622481.git.akuster808@gmail.com>
References: <cover.1652622481.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 May 2022 13:49:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97099

From: Yi Zhao <yi.zhao@windriver.com>

There is a parallel build error in separate build directory:

| /home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/frr/8.2.2-r0/recipe-sysroot-native/usr/lib/clippy ../git/python/clidef.py -o isisd/isis_cli_clippy.c ../git/isisd/isis_cli.c
| Traceback (most recent call last):
|   File "../git/python/clidef.py", line 466, in <module>
|     clippy.wrdiff(
|   File "/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/frr/8.2.2-r0/git/python/clippy/__init__.py", line 78, in wrdiff
|     with open(newname, "w") as out:
| FileNotFoundError: [Errno 2] No such file or directory: 'isisd/isis_cli_clippy.c.new-372541'
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/frr/8.2.2-r0/build'
| make[1]: *** [Makefile:17386: isisd/isis_cli_clippy.c] Error 1

This is beacuse clidef.py only creates new file but doesn't check if
parent directory exists. Inherit autotools-brokensep can fix this issue
as these parent directories always exist in source directory.

Also set ac_cv_path_PERL to '/usr/bin/env perl' to avoid path too long.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 09a97158f80a779c3f45b3189adcddbd535e5baf)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-protocols/frr/frr_8.2.2.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
index 91e306f08b..ceb94109de 100644
--- a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
+++ b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
@@ -26,7 +26,7 @@ COMPATIBLE_HOST:armv5 = "null"
 # Error: PC-relative reference to a different section
 COMPATIBLE_HOST:mips64 = "null"
 
-inherit autotools python3native pkgconfig useradd systemd
+inherit autotools-brokensep python3native pkgconfig useradd systemd
 
 DEPENDS:class-native = "bison-native elfutils-native"
 DEPENDS:class-target = "bison-native json-c readline c-ares libyang frr-native"
@@ -63,6 +63,8 @@ EXTRA_OECONF:class-target = "--sbindir=${libdir}/frr \
                              --with-clippy=${RECIPE_SYSROOT_NATIVE}/usr/lib/clippy \
                             "
 
+CACHED_CONFIGUREVARS += "ac_cv_path_PERL='/usr/bin/env perl'"
+
 LDFLAGS:append:mips = " -latomic"
 LDFLAGS:append:mipsel = " -latomic"
 LDFLAGS:append:powerpc = " -latomic"
@@ -77,7 +79,7 @@ do_compile:class-native () {
 
 do_install:class-native () {
     install -d ${D}${libdir}
-    install -m 755 ${WORKDIR}/build/lib/clippy ${D}${libdir}/clippy
+    install -m 755 ${S}/lib/clippy ${D}${libdir}/clippy
 }
 
 do_install:append:class-target () {
-- 
2.25.1


