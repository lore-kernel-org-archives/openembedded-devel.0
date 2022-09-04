Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A41AAC6FA8D
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:35:04 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.11379.1662276899603879891
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gN2FXF1M;
 spf=pass (domain: gmail.com, ip: 209.85.215.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id b196so5594050pga.7
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=96nREekOZG8aMq4wg2icZq1wyF2QohodHfRrXgtsZNc=;
        b=gN2FXF1M9tE2ZbPbajvL8wC4dFjnpiiiugq7xzcHw2jKj4FJj0/E+xEsdaQ79s3ShH
         Du8awrcYPhSF0xC7t0B/mD4uiJPKzMMx1CFq5gCqbCoV7PBj4DF8GInGp5syMys9Ez3q
         H7dVjg9PJMLbZkuoZ3DnRr6qael4twRnu7q5v3qp3AiYQYseHsRBM1yRK/5pwHx1rt5k
         JDkLdgyU3ck7gkr9X2IyIEzMGeVGHJjd1o2OovKFOmgfnkuZA46rixKeWjesr5Zodsan
         370LANlEpOgOSCkA4r9OE6vEqwdCpfDrI8Mc41bK5IZgzhKIGfx2Y09meHJI7L1b3OZJ
         7Wfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=96nREekOZG8aMq4wg2icZq1wyF2QohodHfRrXgtsZNc=;
        b=Ar4hay6z1mBD0F2tqgKYQXxSI+9pASNbuq/ycRH2Ia58AdUuFi2ufHdUCYmw6nDMTW
         brEnLTKzB82u+3GfKjCArBmVSO8nbYTU4MhpjxbJaywFBHRfWtQUxHs1CcNylb3QSn3F
         W3mqAVO2dYaCbt5DsstW3/aVvLwE05PatI7Z4EYh1GZVl1hcz/fUnaVeM9iNtfmYv3Fi
         jTcx4xAcE/eWF2L6Vy3hMFV4AABti6TEJOnXwtdNVSbwhqrHx37uITR5vv5tkqa8G8g3
         g4pyw322Xwc6AKzkOQDfc6Nww4qaSBViXA5087Rh99rRWagrctQryriaFIE3l2TT9ErD
         t/cg==
X-Gm-Message-State: ACgBeo1pkoeqCTuwCdQqQTpCsLn3aJwccxbPxRDmVK64M15Og+nPnvAr
	Ryh7z+dShCItxpCaGkyttjbr4/PxAz6szQ==
X-Google-Smtp-Source: 
 AA6agR7HewzHfA52/PpvUz2xD4zrxIrMlorfa4X/AveJN1Rh2tZU6If1hPz7uJ/Q4u3X3rjhi86HUA==
X-Received: by 2002:aa7:8054:0:b0:53b:59ba:2b27 with SMTP id
 y20-20020aa78054000000b0053b59ba2b27mr9503319pfm.0.1662276898750;
        Sun, 04 Sep 2022 00:34:58 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:34:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 37/63] sanlock: Add missing prototype for mem*
 functions
Date: Sun,  4 Sep 2022 00:33:51 -0700
Message-Id: <20220904073417.3251865-37-raj.khem@gmail.com>
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
 https://lists.openembedded.org/g/openembedded-devel/message/98631

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-add-missing-system-header-string.h.patch | 41 +++++++++++++++++++
 .../recipes-extended/sanlock/sanlock_3.8.4.bb |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-oe/recipes-extended/sanlock/sanlock/0001-add-missing-system-header-string.h.patch

diff --git a/meta-oe/recipes-extended/sanlock/sanlock/0001-add-missing-system-header-string.h.patch b/meta-oe/recipes-extended/sanlock/sanlock/0001-add-missing-system-header-string.h.patch
new file mode 100644
index 0000000000..5878847113
--- /dev/null
+++ b/meta-oe/recipes-extended/sanlock/sanlock/0001-add-missing-system-header-string.h.patch
@@ -0,0 +1,41 @@
+From 272f9838f3495f5e419f77e000762c420754c96d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 2 Sep 2022 15:57:32 -0700
+Subject: [PATCH] add missing system header string.h
+
+This is needed for mem* function prototypes used in these sources
+
+Upstream-Status: Submitted [https://pagure.io/sanlock/issue/8]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/sanlock_sock.c | 1 +
+ wdmd/wdmd_sock.c   | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/src/sanlock_sock.c b/src/sanlock_sock.c
+index b83f9ae..e206f88 100644
+--- a/src/sanlock_sock.c
++++ b/src/sanlock_sock.c
+@@ -12,6 +12,7 @@
+ #include <stdio.h>
+ #include <stdint.h>
+ #include <stddef.h>
++#include <string.h>
+ #include <sys/socket.h>
+ #include <sys/un.h>
+ 
+diff --git a/wdmd/wdmd_sock.c b/wdmd/wdmd_sock.c
+index 45d9d9b..110ce9f 100644
+--- a/wdmd/wdmd_sock.c
++++ b/wdmd/wdmd_sock.c
+@@ -12,6 +12,7 @@
+ #include <stdio.h>
+ #include <stdint.h>
+ #include <stddef.h>
++#include <string.h>
+ #include <sys/socket.h>
+ #include <sys/un.h>
+ 
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-extended/sanlock/sanlock_3.8.4.bb b/meta-oe/recipes-extended/sanlock/sanlock_3.8.4.bb
index a59a5c41df..3b4ae318c6 100644
--- a/meta-oe/recipes-extended/sanlock/sanlock_3.8.4.bb
+++ b/meta-oe/recipes-extended/sanlock/sanlock_3.8.4.bb
@@ -16,6 +16,7 @@ PV .= "+git${SRCPV}"
 SRC_URI = "git://pagure.io/sanlock.git;protocol=http;branch=master \
            file://0001-sanlock-Replace-cp-a-with-cp-R-no-dereference-preser.patch \
            file://setuptools.patch \
+           file://0001-add-missing-system-header-string.h.patch \
           "
 SRCREV = "a181e951376d49a82eef17920c8ebedec80b4823"
 
-- 
2.37.3


