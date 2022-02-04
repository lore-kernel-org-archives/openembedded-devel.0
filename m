Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F911C433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 17:27:44 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.12146.1643995663589155038
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Feb 2022 09:27:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TKO5st92;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id l1so1236104pjn.4
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Feb 2022 09:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y2dMo1SR3ccxfXsg7Je+XIoYjKYW2PCB34xuIVBwIQc=;
        b=TKO5st924I6C31MBuggOhwES+TW5vtvHVekri8Gal9Q/Nk/Jd3hmDpq95gWbbeS86f
         /uvDEiAWHmY81D/bCkUrIQSXrYurLyfPEsgd4xN5nDx7d8tctLygwn5FzCZCeNFJL76+
         A2pkVTUYQWoH2ZhRX1ur0NkrZIyFb7Q7zzSyX4mZHtqmkR0IYIRPyGbx3IXc6mNPDc/a
         y80ui52T2GuVEEjW5lBJlMUdFbRPSLEUhZd7XTMDF1knMYB7PS3tpYghVQV5TpwlHSlY
         WnCuDMSSoPJ2MGBuQ1MTYAWTDYyHUQ/fvssmGu64N5SwSks12BmFo8RGvcgrT0NUZa5h
         SFmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y2dMo1SR3ccxfXsg7Je+XIoYjKYW2PCB34xuIVBwIQc=;
        b=Wn15jxBsqOj5WFJk1yN8/HUggeRGdkRNFalSMqpPpM+SxF61lY2mV6PeOvleFuol5h
         ZPdraQEcfh9MFdE1nokpcL3q0xNaxrArIeJp3dX34SyP0c8cuPejg6l6Ef1tzEQrx4Zw
         iTArh/FANhE/H9giFi+WhAlsY8ZIlBxgyJAMT0+RC7tSju+FVsgXPJ76HJ1otMQUxrIG
         XI2VyP24vPgESxDYeo9gGUcMl2SxdEmC5Ny9+xDbVQmAKhSi+ka8BePacclnvtJZBTbZ
         ux/CVA9VENKGIq3p8IRVVnSjK2jC+ySmlJO+tR8LwIIxL7Qo/8BUwd7G7qIS+ZYeTh6J
         LlBQ==
X-Gm-Message-State: AOAM532uSjuBR/W5VmxRPBQHybnIIBRkjQOEwZiT0CtpbWJCxyhtb9Bj
	2qDlK6fVjGP0Ip6fNInyfGpZ5tjg2687iw==
X-Google-Smtp-Source: 
 ABdhPJzHS2Q4IAtb56/9ezlc5aBlGkjXWn5b6ZfG1zuML28E25xplf9laxbYaFSJK3JA7O2BymUvag==
X-Received: by 2002:a17:902:c409:: with SMTP id
 k9mr4347596plk.132.1643995662486;
        Fri, 04 Feb 2022 09:27:42 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 rm11sm2257954pjb.21.2022.02.04.09.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 09:27:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 1/2] gst-shark: Upgrade to 0.7.3.1
Date: Fri,  4 Feb 2022 09:27:38 -0800
Message-Id: <20220204172739.4009892-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Feb 2022 17:27:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95224

Fix buffer overflow found with clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-tracers-Fix-buffer-overflow.patch    | 33 +++++++++++++++++++
 .../gstreamer-1.0/gst-shark_git.bb            |  7 ++--
 2 files changed, 37 insertions(+), 3 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark/0001-tracers-Fix-buffer-overflow.patch

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark/0001-tracers-Fix-buffer-overflow.patch b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark/0001-tracers-Fix-buffer-overflow.patch
new file mode 100644
index 0000000000..1d85e51d6b
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark/0001-tracers-Fix-buffer-overflow.patch
@@ -0,0 +1,33 @@
+From d84807ec6d6f8511e4ec939a745d4d7bb35c3cfb Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 4 Feb 2022 09:22:48 -0800
+Subject: [PATCH] tracers: Fix buffer overflow
+
+Fixes
+| ../../../git/plugins/tracers/gstcpuusagecompute.c:106:9: error: 'fscanf' may overflow; destination buffer in argument 3 has size 8, but the corresponding specifier may require size 9 [-Werror,-Wfortify-sour
+ce]
+|         cpu_name, &user[0], &nice[0], &system[0], &idle[0], &iowait, &irq,
+|         ^
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ plugins/tracers/gstcpuusagecompute.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/plugins/tracers/gstcpuusagecompute.c b/plugins/tracers/gstcpuusagecompute.c
+index 39255fb..00bae66 100644
+--- a/plugins/tracers/gstcpuusagecompute.c
++++ b/plugins/tracers/gstcpuusagecompute.c
+@@ -69,7 +69,7 @@ gst_cpu_usage_compute (GstCPUUsage * cpu_usage)
+   gint *idle;
+   gint *idle_aux;
+ 
+-  gchar cpu_name[CPU_NAME_MAX_SIZE];
++  gchar cpu_name[CPU_NAME_MAX_SIZE+1];
+   gint iowait;                  /* Time waiting for I/O to complete */
+   gint irq;                     /* Time servicing interrupts        */
+   gint softirq;                 /* Time servicing softirqs          */
+-- 
+2.35.1
+
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_git.bb b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_git.bb
index d9863608a8..8c0a5c153f 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_git.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_git.bb
@@ -10,14 +10,15 @@ DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad "
 
 SRCBRANCH ?= "master"
 
-PV = "0.7.2"
+PV = "0.7.3.1"
 
-SRCREV_base = "50e3dbd3b131de2a39d3917576e8f834631ec46b"
-SRCREV_common = "88e512ca7197a45c4114f7fa993108f23245bf50"
+SRCREV_base = "5413ef5475e5b70476c2480a75ca3746d91d4caf"
+SRCREV_common = "b64f03f6090245624608beb5d2fff335e23a01c0"
 SRCREV_FORMAT = "base_common"
 SRC_URI = " \
     git://github.com/RidgeRun/gst-shark.git;protocol=https;branch=${SRCBRANCH};name=base \
     git://gitlab.freedesktop.org/gstreamer/common.git;protocol=https;destsuffix=git/common;name=common;;branch=master \
+    file://0001-tracers-Fix-buffer-overflow.patch \
     "
 
 S = "${WORKDIR}/git"
-- 
2.35.1


