Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E68E2ECAAD3
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:35:24 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.11320.1662276907483269508
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:35:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EDJu4GjG;
 spf=pass (domain: gmail.com, ip: 209.85.215.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 202so5581104pgc.8
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=8rtoT2e4yx4gbSaKEM5vqYokstMPjvfDG6Cx+oo1e+A=;
        b=EDJu4GjGai/+VM++mWTsE5NbKIM0xOl5OZiWIidsQvWVzwFzpO1DBJG1wVdd6zFsMZ
         acrgoYqxLRFAeGTpPcoTwZFkwryCq7pVvU/KXON0qUNgPnEUykRJreIw60uz+JQaEukN
         0iLH92t20m8VqgxpcVC1pRMtoSRCLRvul8mAZWFPbfvUdDrciZNrHO2PHbeTcIypYVfE
         /W7YCL5aaePb3DjN/GuW2vFsIuzyAGcUzrOr8wELdMO/Pu0Dkpn3OW9LzX+/zkt+FUUt
         cHwA9egjHqAgjGuSh5tnfFOCwjpXpeeuazv44qKL3rQS3JNiNqSKhdbfINHQ6Yw+pPuy
         HVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=8rtoT2e4yx4gbSaKEM5vqYokstMPjvfDG6Cx+oo1e+A=;
        b=L/+ZZzU6MISb16L6DO1QjQeOKMOTtfwfGY8l0uSC+kbECPfzww/FIpuszWtfv8zc0X
         cKJ0ZMqKVOJ47vGbIHPDfuJcSRFvxxO9VfTI/RNEscru7Gna6VidEouFlGpjshJQZ5Wt
         F2SLAlriUs1XB4Mtzz3QTWALed8/uP1wONGOB+B/6Hzuf42+Zy6fzIDwJkQ+DBakkW9X
         Pi3CkZ5ZNF3wMJjmipKZ9omDbzlbSwLaGCiBPiJCM91l+gbxbZhkHQQfyKK7khgPgQFO
         XOaoGI0zCgBVTahVCLaGOsgA+CtUvNKKCcS0dl7YPnS+6KyWpRZyGPwXr6CIVAc1pmBD
         aFig==
X-Gm-Message-State: ACgBeo1Kmg6N3tUxqWHQ8OcbJVvYS6Wx6TGHGdBXsxTYQzoTYZBct6p6
	iLKYv7et4U5ESmjHan8rIjY+U7u8DUdWOA==
X-Google-Smtp-Source: 
 AA6agR50VXyLUP78ZerKp1qKaX+t+P5L+A30REaKKHPGfka1OT81s5HVqy2SH+IitE1OibFYrVs5DA==
X-Received: by 2002:a05:6a00:1704:b0:537:2583:769f with SMTP id
 h4-20020a056a00170400b005372583769fmr44096013pfc.34.1662276915686;
        Sun, 04 Sep 2022 00:35:15 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:35:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 54/63] cdrkit: Add missing header for function
 prototypes
Date: Sun,  4 Sep 2022 00:34:08 -0700
Message-Id: <20220904073417.3251865-54-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:35:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98648

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../cdrkit/cdrkit_1.1.11.bb                   |  1 +
 ...checksum.h-and-md5.h-for-function-pr.patch | 44 +++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/cdrkit/files/0001-genisoimage-Add-checksum.h-and-md5.h-for-function-pr.patch

diff --git a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
index 757f99d1ff..9fd91114d7 100644
--- a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
+++ b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
@@ -12,6 +12,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/c/${BPN}/${BPN}_${PV}.orig.tar.gz \
            file://0002-Do-not-use-rcmd-on-build-with-musl.patch \
            file://0001-genisoimage-Add-missing-extern-definition.patch \
            file://0001-add-new-option-eltorito-platform.patch \
+           file://0001-genisoimage-Add-checksum.h-and-md5.h-for-function-pr.patch \
            "
 SRC_URI:append:class-nativesdk = " \
            file://0001-install-netscsid-to-bin-for-nativesdk.patch \
diff --git a/meta-oe/recipes-multimedia/cdrkit/files/0001-genisoimage-Add-checksum.h-and-md5.h-for-function-pr.patch b/meta-oe/recipes-multimedia/cdrkit/files/0001-genisoimage-Add-checksum.h-and-md5.h-for-function-pr.patch
new file mode 100644
index 0000000000..b999577265
--- /dev/null
+++ b/meta-oe/recipes-multimedia/cdrkit/files/0001-genisoimage-Add-checksum.h-and-md5.h-for-function-pr.patch
@@ -0,0 +1,44 @@
+From f28b8ec20c3485068f1617ff93b497bafe5264e1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 3 Sep 2022 00:50:17 -0700
+Subject: [PATCH] genisoimage: Add checksum.h and md5.h for function prototypes
+
+Needed for parse_checksum_algo and calculate_md5sum
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ genisoimage/genisoimage.c | 2 ++
+ genisoimage/jte.c         | 2 ++
+ 2 files changed, 4 insertions(+)
+
+diff --git a/genisoimage/genisoimage.c b/genisoimage/genisoimage.c
+index 84ac3c2..5c9f7f3 100644
+--- a/genisoimage/genisoimage.c
++++ b/genisoimage/genisoimage.c
+@@ -59,6 +59,8 @@
+ #include "udf.h"
+ #endif
+ 
++#include "checksum.h"
++
+ #ifdef	NEED_O_BINARY
+ #include <io.h>					/* for setmode() prototype */
+ #endif
+diff --git a/genisoimage/jte.c b/genisoimage/jte.c
+index 0dff289..1f03ad3 100644
+--- a/genisoimage/jte.c
++++ b/genisoimage/jte.c
+@@ -36,6 +36,8 @@
+ #include "vms.h"
+ #endif
+ 
++#include "md5.h"
++
+ /* Different types used in building our state list below */
+ #define JTET_FILE_MATCH 1
+ #define JTET_NOMATCH    2
+-- 
+2.37.3
+
-- 
2.37.3


