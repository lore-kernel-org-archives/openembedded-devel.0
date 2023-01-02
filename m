Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42936C4708E
	for <webhook@archiver.kernel.org>; Mon,  2 Jan 2023 22:42:47 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.49908.1672699364140808346
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Jan 2023 14:42:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CBfxM7tP;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id l26so19883864wme.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Jan 2023 14:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59uJUF9Kfww/9w7uUnFZ1R/l7uCmxWL+7VL3CR/AtNI=;
        b=CBfxM7tPx1VZjIUdL4nfxEMA0x9f5ckCBa0EcgP1OzXtEzV69VkBp8Xxfjyt8Wvi8y
         GqOxGEkaY6s/dx81udbKJ9OFNKZan4NJz7CUg8PdgAEhw43DWmSbPKu6zEwmZG0A0fzN
         N7Cry8lgMH54i2AbmjvITjttEVCvqiuOSsjwWRuXDiv0hqrWsXuyku3CLloWg09QutBj
         K06rJu3r3MLDhhtUxywO1G+tU0UI59bqUJdZd17p5JyzJ5n+EJC8F+cHo3G/WwzwLUO1
         JIuMU2rnXbqLrTDKL7VCvuW91iRtDNROxVBnvDdp1Xl/wGXxG878O+65QSktu7C+rYJi
         Id0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=59uJUF9Kfww/9w7uUnFZ1R/l7uCmxWL+7VL3CR/AtNI=;
        b=sF2riGRPeLI4GFa4KQRF8zsopQz7roBrv7dPyfqbbCPcWU10On9FHzKlO8je52ptEE
         dMa533cj77vLDfK28BHPMjDTQNO6VUpmAWbogNE6sGctPe92IObFM92mxKwjltjQ+zNp
         NeqlV3lyAP62v8ukfefGvr8HV3WyHXOkxC0+aaAiBlfdtcyj38lViC2mS4YvkPY3XO8B
         4uuDtlI1Ck/4n/6BBxre3AK7x/vgXrFCZ8T2QodjY3Puh6aG323l4HGgYwSeZGbgMK16
         es3GvaT0iJzFEq3k8LhfUN5ST2fqqooYLrt7Q/NNk14oO0ETFaEjFU2kMmV6+HsZJpi1
         ylQA==
X-Gm-Message-State: AFqh2kpoFCXslcKYeWLSZpOh3m8iHq1R0Dmj8gmYrsOtDZT8xXPNN3nG
	Rhizxs/gd92xA6etOx9K9Hh4wjCD4Pg=
X-Google-Smtp-Source: AMrXdXv9mZb3A918vzisHOoFuvuI69KUWDTl+D6yvi0F+Nl6B8HWF8SBr+bXkVbM07AxRbAVXtcVHA==
X-Received: by 2002:a05:600c:21c1:b0:3d3:45c6:b641 with SMTP id x1-20020a05600c21c100b003d345c6b641mr30351528wmj.22.1672699362215;
        Mon, 02 Jan 2023 14:42:42 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id f8-20020adff8c8000000b00282194eaf7bsm19605859wrq.71.2023.01.02.14.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 14:42:41 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH 3/4] ostree: Fix comments for configuration/ptest
Date: Mon,  2 Jan 2023 22:42:33 +0000
Message-Id: <20230102224234.287772-3-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230102224234.287772-1-alex.kiernan@gmail.com>
References: <20230102224234.287772-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Jan 2023 22:42:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100341

The comments and recipe had diverged, bring them back into line. Update
the instructions on how to get ptest to pass.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../recipes-extended/ostree/ostree_2022.7.bb  | 25 +++++++++++++------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2022.7.bb b/meta-oe/recipes-extended/ostree/ostree_2022.7.bb
index 9cc1bd80187c..2683c4f24558 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2022.7.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2022.7.bb
@@ -39,7 +39,9 @@ BUILD_OPTIMIZATION:remove = "-Og"
 BUILD_OPTIMIZATION:append = " -O2"
 
 # Package configuration - match ostree defaults, but without rofiles-fuse
-# otherwise we introduce a dependendency on meta-filesystems
+# otherwise we introduce a dependendency on meta-filesystems and swap
+# soup for curl to avoid bringing in deprecated libsoup2 (though
+# to run ptest requires that you have soup).
 PACKAGECONFIG ??= " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'selinux smack', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd libmount', '', d)} \
@@ -48,7 +50,7 @@ PACKAGECONFIG ??= " \
     curl \
 "
 
-# We include soup because ostree can't (currently) be built without
+# We include curl because ostree can't (currently) be built without
 # soup or curl - https://github.com/ostreedev/ostree/issues/1897
 PACKAGECONFIG:class-native ??= " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'selinux smack', d)} \
@@ -175,13 +177,20 @@ RDEPENDS:${PN}:class-target = " \
 #
 # Note that to get ptest to pass you also need:
 #
-#   xattr in DISTRO_FEATURES
-#   static ostree-prepare-root (PACKAGECONFIG:append:pn-ostree = " static")
-#   meta-python in your layers
-#   overlayfs in your kernel (KERNEL_EXTRA_FEATURES += "features/overlayfs/overlayfs.scc")
+#   xattr in DISTRO_FEATURES (default)
+#   static ostree-prepare-root
+#   ostree-trivial-httpd (requires soup - note soup and curl can coexist)
+#   overlayfs in your kernel
 #   busybox built statically
-#   /var/tmp as a real filesystem (not a tmpfs)
-#   Sufficient disk space (IMAGE_ROOTFS_SIZE = "524288") and RAM (QB_MEM = "-m 1024")
+#   C.UTF-8 locale available
+#   Sufficient disk space/RAM (e.g. core-image-sato-sdk)
+#
+# Something like this in your local.conf:
+#
+# PACKAGECONFIG:append:pn-ostree = " static soup"
+# KERNEL_EXTRA_FEATURES:append = " features/overlayfs/overlayfs.scc"
+# TARGET_CFLAGS:append:pn-busybox = " -static"
+# IMAGE_LINGUAS:append:libc-glibc = " c"
 #
 RDEPENDS:${PN}-ptest += " \
     attr \
-- 
2.39.0


