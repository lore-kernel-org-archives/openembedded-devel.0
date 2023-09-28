Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1830FE732E2
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 15:04:58 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.15618.1695913495237177050
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Sep 2023 08:04:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Syv+174i;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-530c9980556so16113808a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 28 Sep 2023 08:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695913493; x=1696518293; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c8fiw1ouMcEEBkqAwwR7fCXjOudqbJxPoN0bQtzISVk=;
        b=Syv+174i5ANGU6gQz8CnpnHq6+OhyIyMfy8rL29cYzEFjPwnwhhZQYtjG0jSLS/4Vv
         aHVK2UmUiCZZrlADKQj5grYDMMIiEFQjMXmoU7/hJwAgOwtrdFPGrlgcc1rEdojanek8
         kdIkQH/GIMmt7053ll33o7RcoElOpvVFGDLPTMDoovKG6Km7arptter7G2p51DwSj9Eu
         Hbg4EWAbqpKM9GxvBmIv38CWpS/ORWsOtaAEW5BnfkB6/c7kqSUb8k5RWBpg0pNrmtiM
         3MlFQhNgR57NKsAHwhnoenGdtxH4Hfen/m0Izk+AlBMWUv1yLPjTQKLUujzDQCkAWgja
         vrdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695913493; x=1696518293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c8fiw1ouMcEEBkqAwwR7fCXjOudqbJxPoN0bQtzISVk=;
        b=aG1ljItS968qrJWBCTFfoySiPw8ZBbBZjuwXhAbQ4Ro+JQUgaSEYQrq+rNS20NTRSs
         SH1SigXA9eX356+BYVFzGlfshtUe3ScYWn43dXvVHizrhHZACBZUZ86+9/J92B7i+hSf
         dLRwKYpoLWfuA0wDk7BDphTuzaEE5cdivsvyA+N7YV8LUFBdsx/jvxpRyMxACH1Y8PEy
         Lq9h1xNhCorqC6/4J5P3D1W1s6T/vIGbIiPYuDZjTQFq2JXD8THuT30nljevoVTmvbNo
         2AV81816sLeEAW9XR/iJhM6dyxzFt3/okWanHDZEHMrLrqLWBlQe9dSqYet6ekNd1Pcm
         DSMA==
X-Gm-Message-State: AOJu0YzGs+CpJhc23P1Nio587nemWfPcA4ApYqSmCXcLmYTYXfHVKqIR
	ZJ6tYOu98ZCyUAvis43dag52uD984aCB3A==
X-Google-Smtp-Source: AGHT+IHEEYf8Oo1c/NztfY13Jup7qaSTg6y4uP8vGf67bzjt6RXWRm9vK0g74GnPNi9AYt6+I1Rh8w==
X-Received: by 2002:aa7:cd73:0:b0:531:287d:3232 with SMTP id ca19-20020aa7cd73000000b00531287d3232mr1659219edb.34.1695913492733;
        Thu, 28 Sep 2023 08:04:52 -0700 (PDT)
Received: from Unimatrix08-Jammy.Abinsula (mob-5-90-41-13.net.vodafone.it. [5.90.41.13])
        by smtp.gmail.com with ESMTPSA id f5-20020aa7d845000000b005364b54a4basm91281eds.80.2023.09.28.08.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 08:04:52 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] dlt-daemon: add a new patch to unblock build on arm
Date: Thu, 28 Sep 2023 17:04:47 +0200
Message-Id: <20230928150447.551150-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Sep 2023 15:04:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105225

---
 .../dlt-daemon/dlt-daemon/544.patch           | 88 +++++++++++++++++++
 .../dlt-daemon/dlt-daemon_2.18.10.bb          |  2 +
 2 files changed, 90 insertions(+)
 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch
new file mode 100644
index 000000000..cf52371a0
--- /dev/null
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch
@@ -0,0 +1,88 @@
+Upstream-Status: Submitted [https://github.com/COVESA/dlt-daemon/pull/544]
+
+From ca7011239a6e7d7fd366e0312d0ae19ac30e2cb7 Mon Sep 17 00:00:00 2001
+From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
+Date: Thu, 28 Sep 2023 12:54:23 +0200
+Subject: [PATCH 1/2] Add common dlt_cdh_cpuinfo.c to unblock build on non
+ amd64 and i386 arcs
+
+---
+ src/core_dump_handler/dlt_cdh.h         |  2 ++
+ src/core_dump_handler/dlt_cdh_cpuinfo.c | 32 +++++++++++++++++++++++++
+ 2 files changed, 34 insertions(+)
+ create mode 100644 src/core_dump_handler/dlt_cdh_cpuinfo.c
+
+diff --git a/src/core_dump_handler/dlt_cdh.h b/src/core_dump_handler/dlt_cdh.h
+index d572ecf3..8608c6c4 100644
+--- a/src/core_dump_handler/dlt_cdh.h
++++ b/src/core_dump_handler/dlt_cdh.h
+@@ -55,6 +55,8 @@ typedef struct
+     uint64_t pc;
+     uint64_t ip;
+     uint64_t lr;
++    uint64_t sp;
++    uint64_t fp;
+ 
+ } cdh_registers_t;
+ 
+diff --git a/src/core_dump_handler/dlt_cdh_cpuinfo.c b/src/core_dump_handler/dlt_cdh_cpuinfo.c
+new file mode 100644
+index 00000000..a9fc5df3
+--- /dev/null
++++ b/src/core_dump_handler/dlt_cdh_cpuinfo.c
+@@ -0,0 +1,32 @@
++/*
++ * SPDX license identifier: MPL-2.0
++ *
++ * Copyright (C) 2011-2015, BMW AG
++ *
++ * This file is part of COVESA Project DLT - Diagnostic Log and Trace.
++ *
++ * This Source Code Form is subject to the terms of the
++ * Mozilla Public License (MPL), v. 2.0.
++ * If a copy of the MPL was not distributed with this file,
++ * You can obtain one at http://mozilla.org/MPL/2.0/.
++ *
++ * For further information see http://www.covesa.org/.
++ */
++
++/*!
++ * \author Gianfranco Costamagna <locutusofborg@debian.org>
++ *
++ * \copyright Copyright © 2011-2015 BMW AG. \n
++ * License MPL-2.0: Mozilla Public License version 2.0 http://mozilla.org/MPL/2.0/.
++ *
++ * \file dlt_cdh_cpuinfo.c
++ */
++
++#include "dlt_cdh_cpuinfo.h"
++
++void get_registers(prstatus_t *prstatus, cdh_registers_t *registers)
++{
++    struct user_regs_struct *ptr_reg = (struct user_regs_struct *)prstatus->pr_reg;
++
++    registers->pc = ptr_reg->pc; /* [REG_PROC_COUNTER]; */
++}
+
+From 124b3dc395eb47a0f780021efa620138adc3f804 Mon Sep 17 00:00:00 2001
+From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
+Date: Thu, 28 Sep 2023 13:03:44 +0200
+Subject: [PATCH 2/2] Fix include
+
+---
+ src/core_dump_handler/dlt_cdh_crashid.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/core_dump_handler/dlt_cdh_crashid.c b/src/core_dump_handler/dlt_cdh_crashid.c
+index bca44e0e..8dd98d70 100644
+--- a/src/core_dump_handler/dlt_cdh_crashid.c
++++ b/src/core_dump_handler/dlt_cdh_crashid.c
+@@ -30,7 +30,7 @@
+ #include <stdio.h>
+ #include <string.h>
+ #include <errno.h>
+-#include <asm/prctl.h>
++#include <sys/prctl.h>
+ #include <inttypes.h>
+ 
+ #include "dlt_cdh.h"
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
index c70f63e8d..adfc2d412 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
@@ -17,6 +17,7 @@ DEPENDS = "zlib gzip-native json-c"
 SRC_URI = "git://github.com/COVESA/${BPN}.git;protocol=https;branch=master \
            file://0002-Don-t-execute-processes-as-a-specific-user.patch \
            file://0004-Modify-systemd-config-directory.patch \
+           file://544.patch \
            "
 SRCREV = "0f2d4cfffada6f8448a2cb27995b38eb4271044f"
 
@@ -62,6 +63,7 @@ SYSTEMD_SERVICE:${PN}-systemd = " \
 "
 SYSTEMD_AUTO_ENABLE:${PN}-systemd = "disable"
 
+FILES:${PN} += "${libdir}/sysctl.d"
 FILES:${PN}-doc += "${datadir}/dlt-filetransfer"
 
 do_install:append() {
-- 
2.34.1


