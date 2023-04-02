Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F40FC7619A
	for <webhook@archiver.kernel.org>; Sun,  2 Apr 2023 17:06:19 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.49251.1680455173795073133
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Apr 2023 10:06:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MichweBm;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id c18so25850652ple.11
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Apr 2023 10:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680455173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bxrIyCAc94Efew4iruYMXOkymkX8GGIhl90iIBj9rVw=;
        b=MichweBmAdSrZ26CKDMq4H+biB1Jf1jnRi4t3QcqNJslZkmdJTLG1q3FG6QPOBgG5b
         tcyA+j5P+Huo+jQzvC2C2A0K6voC1DvTSQvdCPTmqx3qHZB7nO/W6klJiMejl6bU43Zf
         UDVQyLDRfaBE6Koswm5Mhslr6qDUvEUelbMay7omAUmTiZe1Q40F5TyZWFyYDTMj0XiH
         M8VbSreloYv8FEJ+ivpLQmVmUzAq+sgCslN2WcG0qX/PZSRHMz0lDoSq0NqI6ATMNELY
         +Z1RMGULX/N39Li4lr/KglnGB/31F+BIPLW58xRKpAPkhtP0o+QySEyqAEIM+943CsU8
         kB6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680455173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bxrIyCAc94Efew4iruYMXOkymkX8GGIhl90iIBj9rVw=;
        b=Dwj10itOM1WOFUkPJyhP9E/063d//M9V+y0hzAKxzlYID/U56n2pSQ5P0OqK/JO5TX
         soB4mubHWGhaaDhg8jTfiwi6UAy+UMorHmIFdRqE2M0H4UU3mB3tmqDoC+a7awM0WkkB
         h/jR7uxgRtXS6fXSpTWi0Dv1Ta7P1w4Zu898Dk1ixIgnJrnSNTWinxlFWSEoPWJZeeWo
         +N28WECvyX8+Dn8VKTxSdKgzPTwH2ARFBSZqpFRc6IWTBSRflW/Mqr5ge1WPdleEwZxI
         99v/+fzpxA7LOnKciHoGT2KBXQA3Bunl2J+2DeOfZSqe3VFQJsALxXE0KV+UnCt/2efq
         s4QA==
X-Gm-Message-State: AO0yUKVKUInj/V+EuutIGKAt/XkVFAJC4Vsn9fXzXOGxqI2UsrurEILn
	AW5UMryQv3a75PvTyiKTjxN9IqwO/pHhCw==
X-Google-Smtp-Source: AK7set8arG/yYs/xk9Y3V+kG5hTbs9KyJq2H1Doqy/aOKXEucw8Rzem7PEw07ac4PsrA3G9B5hn94g==
X-Received: by 2002:a05:6a20:7788:b0:d9:18ab:16be with SMTP id c8-20020a056a20778800b000d918ab16bemr28111687pzg.29.1680455172913;
        Sun, 02 Apr 2023 10:06:12 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::17e4])
        by smtp.gmail.com with ESMTPSA id r18-20020a62e412000000b005a8ba70315bsm5322047pfh.6.2023.04.02.10.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 10:06:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 1/2] fwknop: Use pkg-config instead of gpgme-config
Date: Sun,  2 Apr 2023 10:06:09 -0700
Message-Id: <20230402170610.2128019-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Apr 2023 17:06:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101874

pkg-config is sysroot aware which is needed for cross-builds

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Use-pkg-config-to-find-gpgme.patch   | 27 +++++++++++++++++++
 .../recipes-support/fwknop/fwknop_2.6.10.bb   |  3 ++-
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/fwknop/fwknop/0001-Use-pkg-config-to-find-gpgme.patch

diff --git a/meta-networking/recipes-support/fwknop/fwknop/0001-Use-pkg-config-to-find-gpgme.patch b/meta-networking/recipes-support/fwknop/fwknop/0001-Use-pkg-config-to-find-gpgme.patch
new file mode 100644
index 0000000000..146501c775
--- /dev/null
+++ b/meta-networking/recipes-support/fwknop/fwknop/0001-Use-pkg-config-to-find-gpgme.patch
@@ -0,0 +1,27 @@
+From f8f4e1a617c4610ea7dc40a60f1c696ebc37850c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 2 Apr 2023 09:27:42 -0700
+Subject: [PATCH] Use pkg-config to find gpgme
+
+Upstream-Status: Inappropriate [OE specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ m4/gpgme.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/m4/gpgme.m4 b/m4/gpgme.m4
+index 44bf43c..c9a8ae6 100644
+--- a/m4/gpgme.m4
++++ b/m4/gpgme.m4
+@@ -18,7 +18,7 @@ AC_DEFUN([_AM_PATH_GPGME_CONFIG],
+   if test "x$gpgme_config_prefix" != x ; then
+       GPGME_CONFIG="$gpgme_config_prefix/bin/gpgme-config"
+   fi
+-  AC_PATH_PROG(GPGME_CONFIG, gpgme-config, no)
++  GPGME_CONFIG="pkg-config gpgme"
+ 
+   if test "$GPGME_CONFIG" != "no" ; then
+     gpgme_version=`$GPGME_CONFIG --version`
+-- 
+2.40.0
+
diff --git a/meta-networking/recipes-support/fwknop/fwknop_2.6.10.bb b/meta-networking/recipes-support/fwknop/fwknop_2.6.10.bb
index a35ec06795..d3753217c7 100644
--- a/meta-networking/recipes-support/fwknop/fwknop_2.6.10.bb
+++ b/meta-networking/recipes-support/fwknop/fwknop_2.6.10.bb
@@ -3,10 +3,11 @@ HOMEPAGE = "http://www.cipherdyne.org/fwknop/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 		    "
-inherit autotools-brokensep
+inherit autotools-brokensep pkgconfig
 
 SRC_URI = "http://www.cipherdyne.org/${BPN}/download/${BPN}-${PV}.tar.bz2 \
            file://0001-Fix-compilation-with-GCC-s-fno-common-flag-fixes-305.patch \
+           file://0001-Use-pkg-config-to-find-gpgme.patch \
           "
 SRC_URI[md5sum] = "47a9c7c214c40dceb5dc2aa8832e4f32"
 SRC_URI[sha256sum] = "f6c09bec97ed8e474a98ae14f9f53e1bcdda33393f20667b6af3fb6bb894ca77"
-- 
2.40.0


