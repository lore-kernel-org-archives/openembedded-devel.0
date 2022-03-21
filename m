Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04362C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 00:18:53 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.24654.1647821932032235202
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 17:18:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CIuA1/9M;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id
 l4-20020a17090a49c400b001c6840df4a3so9242213pjm.0
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 17:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JRtAhO398Y55DZD5kkHz3VTsgiQU98Oew9EIR0nEJh8=;
        b=CIuA1/9MD4n+yzr0ddXahWB6BPNf79IFKktvpsC9NwxFbakXcpqkR9/ZP/asejmOog
         EeSNW44gur5JBasVGlosiDvuqdg8CckiJhnos8ltNwgf72b/xtTKkWP8ZFl6DV/V700Y
         b8rm6JEdH4pOgpwLwZK9FaWOv9KwJh6FB7cafuv+yq8QkARjIKB3a9UWxq0mfSiixKld
         KZjTwTUpVkbbiB+Kzj9Z+/SfgegjqIvsK3sv457pK0hC1ukotZlEy8o1CtJi5vkC7D4R
         TdVBwbTvOINpVtAyRs8Mw/uOxiTa0Qy5O2AmNn5IrCgzvW/SBTGrWer9MdkR/7NauYcn
         2/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JRtAhO398Y55DZD5kkHz3VTsgiQU98Oew9EIR0nEJh8=;
        b=yt3JjYJSBBF6xDaEXGrfOhitMs2mNor11fOgvJe7Du5tdCA6Xt8t5Y7JraSQCM+Wl4
         3pYE9/QnCRsawQM/Ied5uXb13FDjUgl0IKM/BOpVocBiZEUghn+flICBEAvYBjA1vi/b
         COSZc02R5HWmJ2BGt3LykKrz1M+31nDXLG8NEaDxVk45nqHX6Z1xZggVrVOPXVh2dUlL
         u9a8vBOBccb4Z2KPSp/n/4J/0fDRkcF7SqFMDod/gP1dFyf+sz4oghqwixZyZ8DMTujN
         ybrg4i8Id0cW/vpNCqrC11cteTDmaVHlOIon/ygxm5hQlvfEPGBz7/uOYOoQaTgTA2Gn
         LQVg==
X-Gm-Message-State: AOAM530xFkJfR30piqkYyngBQcfEChzt7rBUaS4tTwx7Of7hf6iUY2By
	3oDWslgoITk66I/oV8M03x6PZCzxUWG3nw==
X-Google-Smtp-Source: 
 ABdhPJz6oTrD6SH9kQRYUpneyK5JPfzDyOGMPAT1yPUycTmuCuUfrv8ekBEcsz8HTW6YQW/7AWK63w==
X-Received: by 2002:a17:902:f787:b0:152:157:eb7 with SMTP id
 q7-20020a170902f78700b0015201570eb7mr10123123pln.109.1647821931040;
        Sun, 20 Mar 2022 17:18:51 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 b16-20020a056a00115000b004f6ff260c9esm16713342pfm.207.2022.03.20.17.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 17:18:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] geany-plugins: Do not overwrite OE's pkg-config env
Date: Sun, 20 Mar 2022 17:18:48 -0700
Message-Id: <20220321001848.2618871-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Mar 2022 00:18:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96090

geany.m4 tries to push additional pkg-config paths to respect
--with-geany-libdir if it sets to different paths, however we
do not use --with-geany-libdir with in OE build so this is more
of a problem for OE than solution.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Do-not-tinker-with-pkg-config-paths.patch | 32 +++++++++++++++++++
 .../geany/geany-plugins_1.38.bb               |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/geany/geany-plugins/0001-geany.m4-Do-not-tinker-with-pkg-config-paths.patch

diff --git a/meta-oe/recipes-devtools/geany/geany-plugins/0001-geany.m4-Do-not-tinker-with-pkg-config-paths.patch b/meta-oe/recipes-devtools/geany/geany-plugins/0001-geany.m4-Do-not-tinker-with-pkg-config-paths.patch
new file mode 100644
index 0000000000..cd417e0d7b
--- /dev/null
+++ b/meta-oe/recipes-devtools/geany/geany-plugins/0001-geany.m4-Do-not-tinker-with-pkg-config-paths.patch
@@ -0,0 +1,32 @@
+From b2187b45f61ce362a9d58d9081d66daddb4e577f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 20 Mar 2022 15:54:14 -0700
+Subject: [PATCH] geany.m4: Do not tinker with pkg-config paths
+
+OE sets up these paths correctly w.r.t. target sysroot
+
+Upstream-Status: Inappropriate [OE-Specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ build/geany.m4 | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+--- a/build/geany.m4
++++ b/build/geany.m4
+@@ -32,7 +32,8 @@ AC_DEFUN([GP_CHECK_GEANY],
+ [
+     AC_REQUIRE([PKG_PROG_PKG_CONFIG])
+ 
+-    GP_GEANY_PKG_CONFIG_PATH_PUSH
++    dnl GP_GEANY_PKG_CONFIG_PATH_PUSH
++    AC_REQUIRE([_GP_GEANY_LIBDIR])
+ 
+     PKG_CHECK_MODULES([GEANY], [geany >= $1])
+     geanypluginsdir=$geany_libdir/geany
+@@ -40,5 +41,5 @@ AC_DEFUN([GP_CHECK_GEANY],
+     AC_SUBST([geanypluginsdir])
+     AC_SUBST([GEANY_VERSION])
+ 
+-    GP_GEANY_PKG_CONFIG_PATH_POP
++    dnl GP_GEANY_PKG_CONFIG_PATH_POP
+ ])
diff --git a/meta-oe/recipes-devtools/geany/geany-plugins_1.38.bb b/meta-oe/recipes-devtools/geany/geany-plugins_1.38.bb
index b6857917f5..fa4cccca03 100644
--- a/meta-oe/recipes-devtools/geany/geany-plugins_1.38.bb
+++ b/meta-oe/recipes-devtools/geany/geany-plugins_1.38.bb
@@ -32,6 +32,7 @@ SRC_URI = " \
     https://plugins.geany.org/${BPN}/${BP}.tar.bz2 \
     file://0001-Use-pkg-config-to-find-gpgme.patch \
     file://0001-git-changebar-Adjust-structs-for-libgit2-1.4.x.patch \
+    file://0001-geany.m4-Do-not-tinker-with-pkg-config-paths.patch \
 "
 SRC_URI[sha256sum] = "1c578a7ebb390aa8882f195acd3d8da3ceb73925d291b28dec90cd3e5fd20586"
 
-- 
2.35.1


