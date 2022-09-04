Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44201C6FA83
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:34:34 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web08.11127.1662276868051937343
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MTf0cbwR;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id
 ck21-20020a17090afe1500b002003ba5b71cso943411pjb.0
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=PefLegcPwQlphx1i/Uu8nYOu1CUdB5952H4OtD2Lrr8=;
        b=MTf0cbwRH5qDSxikRYCFmeHQXodN4XOxgXoJnEIqCVgCmPNOTKSlfAPg0ODVLR7U6d
         +h01ZV8u5jowt+i4vHAXB7SwTcD3SewH63qYswy9sFsIcOY2f+RK0/kxQVz+r0UgsxoQ
         xFC6C5MupooF4s5hj33lhVk8BWkzpr3HV4T2XHRPnzowQlVA1vhvMWV2EQRYjrIMWtX7
         Mh7XiISzyH+O7+eaWvedJNfj79tKb7Y4kD9rJpBp3CX/cCd7LDl8m5gqsW84cEQEqLfB
         KT4tn1ZT3dxJSvXhpV7N0wbTOVL6D5A4QbudFdzGReMh0G1pzalibVdQsKPtTkbP0Wyh
         pOvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=PefLegcPwQlphx1i/Uu8nYOu1CUdB5952H4OtD2Lrr8=;
        b=bz6rJ/vyh65ZBzm7GZBQnEFUHJBfCScSErEvp/9YOXOsLJGZGaH5G7civgImBPGWrg
         //82mc4iv7qRnt4Oo4fExySFkiXpg0eP3qiAV2km0aNDNrbEoRNall6Y2gN+35ziqW/8
         rW3SdcxsWjZkrwhifFuNuRT3lHR9lPZkph1Pr6FG0P4kjevrkW+KVIbqALrWVDK8Qp8B
         RnJZJwQb40/o21zrZIx3tf7UplQaPFmEJjCiZyzgdFFl/+bo2v5f8Qyvl9+zoQgNsyMn
         Ty67bHPT3Mg+gy2sf+2s2e0qLvJoeNe/xy9lZCuVE2rrMjn9CPmdwTIhmnWjFZmTez2m
         6nWw==
X-Gm-Message-State: ACgBeo3yaREZ+Wwmrl7yTvcVvka5We+ifhhNsi4LM8t/TUdiz6Q7PB4l
	W6sAlPsTIXGpT9a2wn4q12/u9uRzGJS6Xg==
X-Google-Smtp-Source: 
 AA6agR7Okt4rhkHtie2DHiH5xxzTu5KTc56teaEUVqCIvZUvK4mX7I3Z7cFYymkdswOFMzRZEwMkvA==
X-Received: by 2002:a17:90b:4ac3:b0:1fd:ded0:ea80 with SMTP id
 mh3-20020a17090b4ac300b001fdded0ea80mr13227231pjb.142.1662276867146;
        Sun, 04 Sep 2022 00:34:27 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:34:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 06/63] hddtemp: Add missing prototype for
 ata_get_powermode in sata.c
Date: Sun,  4 Sep 2022 00:33:20 -0700
Message-Id: <20220904073417.3251865-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:34:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98600

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Declare-ata_get_powermode-prototype.patch | 33 +++++++++++++++++++
 .../hddtemp/hddtemp_0.3-beta15.bb             |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-support/hddtemp/hddtemp/0001-sata.c-Declare-ata_get_powermode-prototype.patch

diff --git a/meta-oe/recipes-support/hddtemp/hddtemp/0001-sata.c-Declare-ata_get_powermode-prototype.patch b/meta-oe/recipes-support/hddtemp/hddtemp/0001-sata.c-Declare-ata_get_powermode-prototype.patch
new file mode 100644
index 0000000000..5703d3c241
--- /dev/null
+++ b/meta-oe/recipes-support/hddtemp/hddtemp/0001-sata.c-Declare-ata_get_powermode-prototype.patch
@@ -0,0 +1,33 @@
+From c5ca31940d1d1889ef2cc6974c18ff24ab406748 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 31 Aug 2022 16:42:23 -0700
+Subject: [PATCH] sata.c: Declare ata_get_powermode prototype
+
+Fixes build warnings/errors
+
+sata.c:127:10: error: call to undeclared function 'ata_get_powermode'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
+|   switch(ata_get_powermode(dsk->fd))
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/sata.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/sata.c b/src/sata.c
+index d67621f..4172245 100644
+--- a/src/sata.c
++++ b/src/sata.c
+@@ -52,7 +52,8 @@
+                 (((u16)(__x) & (u16)0xff00U) >> 8) )); \
+ })
+ 
+- 
++extern enum e_powermode ata_get_powermode(int device);
++
+ static int sata_probe(int device) {
+   int bus_num;
+   unsigned char cmd[4] = { WIN_IDENTIFY, 0, 0, 1 };
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb b/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb
index b4be39feb5..e9d30977fe 100644
--- a/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb
+++ b/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb
@@ -10,6 +10,7 @@ SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/hddtemp/hddtemp-0.3-beta15.tar.bz2 \
            file://hddtemp-0.3-beta15-autodetect-717479.patch \
            file://0001-backtrace-Replace-struct-ucontext-with-ucontext_t.patch \
            file://0001-configure.ac-Rename-to-configure.ac-and-use-external.patch \
+           file://0001-sata.c-Declare-ata_get_powermode-prototype.patch \
            file://hddtemp.db \
            file://init \
 "
-- 
2.37.3


