Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5BCBC6FA8C
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:35:04 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web08.11127.1662276868051937343
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:35:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cMSgump+;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id
 ck21-20020a17090afe1500b002003ba5b71cso943960pjb.0
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=4gfnI6wSO6tmx3xVblnuElMDwccxgz+vIfTNMVR3QA0=;
        b=cMSgump+r0QhjMQrfCmOH5K/565vx3RDCt+ZbnlCS3eEqwDBKazHuhC1FXZADhJooK
         kh2P/OT2phSdPlVlEcy+MMsis5+QR1SWd45PFgWXszYdUz+aJFBGlNIQc9oai4qkVflB
         EtqdIxcx25w8bXrenj5YBNlxse24WHbQIbW3HZOWdksASxrezctrgZGgqikT0oBQK4B/
         DaD5BLPFcwevaTesTtNFgiIExFTBPapreGWmt2hSlbisfwCdF/8fwvluHJiYZhFmyt/p
         8+NpuqCNUgIqysWkzxTDKQQRTOHULciw38MXC+4ZvT1vr4ROeXTsgUDZmKs/Yde//Bes
         NUBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=4gfnI6wSO6tmx3xVblnuElMDwccxgz+vIfTNMVR3QA0=;
        b=w/kXUSl25hsSLOx7/twBW2Zd26uWu1ldttCBswfVmRz1aMGmaWeCX4AjLdb96y7WTJ
         aSUNmKALzgJHFcUN3gJRXG1lNWW5LQC1Z/qJ6ML4dmOuQpaz0ncuFeJj83W1E71HwTmO
         cBS1HUG6xwDi68YMc3UHZiOJskJRhZLIR5tb0bUSCHtX2sVRzGIlvfTkq5L0IqQzqp5g
         p96CCD7zR/KCOZLnqDOQFXFjS0oZBjc3ymiQRMbKYLdXFCJ2nljeUQ7i9imoAUsmedMO
         o63G/+SN2EfK5lc+PjkecC5Ue6R6Nk74ofucVp9MvAu15UxB6pdMSXVKzD+spystjYgo
         deLQ==
X-Gm-Message-State: ACgBeo3nvuJAajnXwpZuzESPUeSAP+Fn4qZcNZ95wfP43AHRU5tK6q8t
	gwF47hlOKVeyTS+8BJ+GS2LOnXGMrzaZMw==
X-Google-Smtp-Source: 
 AA6agR5ySdEp29baTt7VtmYKuiPiIXf8E2AJMNcLB9DSfCikKK1cUFk/KnaAgYh4NuJaGWQxk+CUqA==
X-Received: by 2002:a17:90b:4f44:b0:1fa:f63c:ea1b with SMTP id
 pj4-20020a17090b4f4400b001faf63cea1bmr14012811pjb.30.1662276903691;
        Sun, 04 Sep 2022 00:35:03 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:35:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 42/63] con2fbmap: Include string.h for strerror
Date: Sun,  4 Sep 2022 00:33:56 -0700
Message-Id: <20220904073417.3251865-42-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:35:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98636

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...bmap-Add-missing-include-on-string.h.patch | 28 +++++++++++++++++++
 .../recipes-bsp/con2fbmap/con2fbmap_git.bb    |  4 ++-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-bsp/con2fbmap/con2fbmap/0001-con2fbmap-Add-missing-include-on-string.h.patch

diff --git a/meta-oe/recipes-bsp/con2fbmap/con2fbmap/0001-con2fbmap-Add-missing-include-on-string.h.patch b/meta-oe/recipes-bsp/con2fbmap/con2fbmap/0001-con2fbmap-Add-missing-include-on-string.h.patch
new file mode 100644
index 0000000000..d1b75f1c54
--- /dev/null
+++ b/meta-oe/recipes-bsp/con2fbmap/con2fbmap/0001-con2fbmap-Add-missing-include-on-string.h.patch
@@ -0,0 +1,28 @@
+From 0a948d8d91b789e9c9b60136fada75b1d464af63 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 2 Sep 2022 18:31:27 -0700
+Subject: [PATCH] con2fbmap: Add missing include on string.h
+
+strerror() is from string.h therefore include it to fix -Wimplicit-function-declaration
+warnings
+
+Upstream-Status: Submitted [https://gitlab.com/pibox/con2fbmap/-/merge_requests/1]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/con2fbmap.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/con2fbmap.c b/src/con2fbmap.c
+index 7831931..7a2e870 100644
+--- a/src/con2fbmap.c
++++ b/src/con2fbmap.c
+@@ -1,5 +1,6 @@
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <string.h> /* for strerror */
+ #include <unistd.h>
+ #include <fcntl.h>
+ #include <sys/ioctl.h>
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-bsp/con2fbmap/con2fbmap_git.bb b/meta-oe/recipes-bsp/con2fbmap/con2fbmap_git.bb
index 5d1c5ba7e4..302a61e8a8 100644
--- a/meta-oe/recipes-bsp/con2fbmap/con2fbmap_git.bb
+++ b/meta-oe/recipes-bsp/con2fbmap/con2fbmap_git.bb
@@ -9,7 +9,9 @@ SECTION = "console/utils"
 DEPENDS = ""
 
 SRCREV = "61ed2f28b294b1ebeb767df8cb5fcd391709c8e2"
-SRC_URI = "git://gitlab.com/pibox/con2fbmap.git;protocol=https;branch=master"
+SRC_URI = "git://gitlab.com/pibox/con2fbmap.git;protocol=https;branch=master \
+           file://0001-con2fbmap-Add-missing-include-on-string.h.patch \
+           "
 
 S = "${WORKDIR}/git"
 
-- 
2.37.3


