Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B052C433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 21:35:25 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web08.2578.1644269724606718101
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Feb 2022 13:35:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UswrbEf/;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id
 v13-20020a17090ac90d00b001b87bc106bdso314532pjt.4
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Feb 2022 13:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K8jZ8h2qQJxqCwD8TFEgqJJdXcMMmnRFaQa5kh+OK+g=;
        b=UswrbEf/JPbsrhhDnBOYRNfWIBr9E6TGFgM3pSlAdUm7mB/4Uso//vcGTEpQsp3Ljr
         dHnKFAlzZJ1PbXSr1bZLB0hc5n5Rr/prokfm/cprF2/TdafTLUFPJbuEsAbeckXZdR+A
         F4OLxx1qrPAqn7YnmMadnJvulU9tuMcbvgDwRc0u5KaYY4+0MT+DeM4S0sOLh+xdFIm6
         SgsvAKYCgxlU44Jnb2A6Mc6P3mAw5qxRfEVpIJRzB7rOVdLCOAGyl2EXvDjDX4DUsavr
         QzhiOo2KQrt+qROajtQNziLqu8we8s4E2dVagxWXLx+VWREB5DvLckjpYfMkCaq8NxYf
         jBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K8jZ8h2qQJxqCwD8TFEgqJJdXcMMmnRFaQa5kh+OK+g=;
        b=SY/G8PivKcy78yMKzR/Hm+ZnKFhx52iRgiKkpvCKCMeV/Fh+K/kAVRV0guroqv0OIj
         /SFcz453agKbIxNLTO/Je3yIUsDHGcExTHW+tqF/wKawv1KibkVH6u0ZM7VPJOgHvylg
         rpN/FZR7SGvTnlWuY6Js0B/zrpfc79H2unKA8HQMu0/Exnt/CUq6LwJTDpKAUveDb8AO
         1XhyXgYDigRK0/R8GXMpJ6aEfOZwQV7l0VT7tWFBWfnLsUaw16cL4lziyy514DsN5ZVe
         ylj7yYgXBMxehRxwYZWW4fDsCzQiEYcVEZV5BbiF7drDGfkzihpb4pwacsMqIX+qVif/
         dL3g==
X-Gm-Message-State: AOAM530jgxwZO4EsaIsnQi8RGfZswql4X/b4DNdB+AnlrzKOs3zmWPBr
	GfzQdjQz3JIzF6QCCdUVmsIarddfdr44CQ==
X-Google-Smtp-Source: 
 ABdhPJwBB0HwOV2p/RKLV+vNwE49KDtxiEelsoEeFxP9x8n0U5iEftAroxZ+qYiuoX212fSZBpuFoA==
X-Received: by 2002:a17:902:b213:: with SMTP id
 t19mr1480863plr.100.1644269723566;
        Mon, 07 Feb 2022 13:35:23 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 d15sm12653359pfu.127.2022.02.07.13.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 13:35:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] open-vm-tools: Fix build with musl
Date: Mon,  7 Feb 2022 13:35:21 -0800
Message-Id: <20220207213521.2924974-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Feb 2022 21:35:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95247

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ools-Correct-include-path-for-poll.h.patch | 36 +++++++++++++++++++
 .../open-vm-tools/open-vm-tools_11.3.5.bb     |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-open-vm-tools-Correct-include-path-for-poll.h.patch

diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-open-vm-tools-Correct-include-path-for-poll.h.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-open-vm-tools-Correct-include-path-for-poll.h.patch
new file mode 100644
index 0000000000..d9823bdd5f
--- /dev/null
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-open-vm-tools-Correct-include-path-for-poll.h.patch
@@ -0,0 +1,36 @@
+From 2cefed441753b012c385e2d3ea5374b4d67e5696 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 7 Feb 2022 13:32:32 -0800
+Subject: [PATCH] open-vm-tools: Correct include path for poll.h
+
+sys/poll.h is deprecated and musl calls it out explicitly.
+
+Fixes
+| In file included from ../../../../git/open-vm-tools/services/plugins/gdp/gdpPlugin.c:35:
+| /mnt/b/yoe/master/build/tmp/work/core2-32-yoe-linux-musl/open-vm-tools/11.3.5-r0/recipe-sysroot/usr/include/sys/poll.h:1:2: error: redirecting incorrect #include <sys/poll.h> to <poll.h> [-Werror,-W#warnings]
+| #warning redirecting incorrect #include <sys/poll.h> to <poll.h>
+|  ^
+| 1 error generated.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ open-vm-tools/services/plugins/gdp/gdpPlugin.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/open-vm-tools/services/plugins/gdp/gdpPlugin.c b/open-vm-tools/services/plugins/gdp/gdpPlugin.c
+index 2bba2937e..025339595 100644
+--- a/open-vm-tools/services/plugins/gdp/gdpPlugin.c
++++ b/open-vm-tools/services/plugins/gdp/gdpPlugin.c
+@@ -32,7 +32,7 @@
+ #include <sys/types.h>
+ #include <sys/socket.h>
+ #include <sys/eventfd.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <unistd.h>
+ #endif
+ 
+-- 
+2.35.1
+
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb
index 38034c304d..e37e9eee74 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb
@@ -43,6 +43,7 @@ SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https;branch=maste
            file://0013-misc-Do-not-print-NULL-string-into-logs.patch;patchdir=.. \
            file://0001-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch;patchdir=.. \
            file://0002-hgfsServerLinux-Consider-64bit-time_t-possibility.patch;patchdir=.. \
+           file://0001-open-vm-tools-Correct-include-path-for-poll.h.patch;patchdir=.. \
            "
 
 UPSTREAM_CHECK_GITTAGREGEX = "stable-(?P<pver>\d+(\.\d+)+)"
-- 
2.35.1


