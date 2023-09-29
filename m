Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D746FE71D21
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 12:27:47 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.15910.1695990463483130938
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Sep 2023 05:27:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DnUTVYLT;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5334d78c5f6so17763626a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 05:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695990461; x=1696595261; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RFltwZuNvV4kqCPjT+mjegmA1Q3EAsyd8xd9OC4BOMY=;
        b=DnUTVYLT/dZWubPMZqIlKYWShZxtUsjb1sglcNRenf4l15JrEfU3zroBzp1HT9Xzat
         VhPBVY7Agf7nzZvq3RDhAuf+5aqDN0gpDjaZX0FoKynAoFlPYPaijGegcw7bHfoLeNiQ
         VtkyzJkNfJth8dgy2qew/0RZ0pXpZqzuf7exxRLWxJRcBKUKjvbADukx4xE9AYLMbDsu
         CGjVg7xhUnQDrnDWY6fDPBkdtpbTU9zmRIq7xYRVwx2wvnSOXOCWKb7qVe299kmh66E9
         SmWYyar7rKr1i2Bwr4sYIt4bHlgZdzAnqd+ELsyAtu12Z1/JiTmZLcOsaIANr4yfSiYH
         BTOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695990461; x=1696595261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RFltwZuNvV4kqCPjT+mjegmA1Q3EAsyd8xd9OC4BOMY=;
        b=lP4eIip6w93QJ1uzkvfdXCsumH2xaCgC1IbN26oO6FH7a7fSHuHie/j8HywgpYjpJo
         Qb9rUBGBlxnZShlyHIXhWJ67MontedxFpCq3vXJ9cLq8rSfzluCJKfzYa9k/tGDN9P9p
         xYswG3elOSiX/Nf5L2j9T3u+3Z3Y+9tgQalxiGfoS5p6EjDB9t062RWkoHxxTM29gAHQ
         28S4vKaoBrIvsPEdMyQ3H1rUTpd0nep8bc/XQIT8uPfcKIV2jasvb3BxdpxlOK0F+l+R
         s4v49K4ns/zZbHhrNryruqRVe4ge64XntqU5vxiCJSNzeCs6qkmXfN3ml1/SNbKVvbqS
         VS6g==
X-Gm-Message-State: AOJu0YwYfnDbN6rjlLbVFeG2xx/XAvdtg8A+lvnXFpoYODfZh8bYi0TK
	xZ2cagQ8WwGr9Y+Nluf/5EXjtgT0rmdiWg==
X-Google-Smtp-Source: AGHT+IGRQO/C1xzmF8C2nb1hB+4Up9oRJzZLB2AsrABOWOopBc4PhRNuh6A9LSJ2WBTUpYrIiL0I0g==
X-Received: by 2002:a05:6402:385:b0:52f:2a38:1f3 with SMTP id o5-20020a056402038500b0052f2a3801f3mr3323517edv.2.1695990461267;
        Fri, 29 Sep 2023 05:27:41 -0700 (PDT)
Received: from Unimatrix08-Jammy.Abinsula ([151.58.174.15])
        by smtp.gmail.com with ESMTPSA id x18-20020aa7d6d2000000b0052febc781bfsm11051272edr.36.2023.09.29.05.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 05:27:40 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH 2/2] dlt-daemon: also enable experimental coredumphandler feature
Date: Fri, 29 Sep 2023 14:27:33 +0200
Message-Id: <20230929122733.712422-2-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929122733.712422-1-costamagnagianfranco@yahoo.it>
References: <20230929122733.712422-1-costamagnagianfranco@yahoo.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 12:27:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105240

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../dlt-daemon/dlt-daemon/544.patch           | 80 +++++++++++++++++++
 .../dlt-daemon/dlt-daemon_2.18.10.bb          |  3 +
 2 files changed, 83 insertions(+)
 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch
new file mode 100644
index 000000000..550493351
--- /dev/null
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch
@@ -0,0 +1,80 @@
+Upstream-Status: Submitted [https://github.com/COVESA/dlt-daemon/pull/544]
+
+From 5db28a4b85cf0ec3e128cfc7c9b71d12ec543695 Mon Sep 17 00:00:00 2001
+From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
+Date: Thu, 28 Sep 2023 12:54:23 +0200
+Subject: [PATCH] Add common dlt_cdh_cpuinfo.c to unblock build on non amd64
+ and i386 arcs
+
+---
+ src/core_dump_handler/dlt_cdh.h         |  2 ++
+ src/core_dump_handler/dlt_cdh_cpuinfo.c | 33 +++++++++++++++++++++++++
+ src/core_dump_handler/dlt_cdh_crashid.c |  2 +-
+ 3 files changed, 36 insertions(+), 1 deletion(-)
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
+index 00000000..d6fc3905
+--- /dev/null
++++ b/src/core_dump_handler/dlt_cdh_cpuinfo.c
+@@ -0,0 +1,33 @@
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
++/*    struct user_regs_struct *ptr_reg = (struct user_regs_struct *)prstatus->pr_reg;
++
++    registers->pc = ptr_reg->pc; /* [REG_PROC_COUNTER]; */
++*/
++}
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
index 3811772a7..1522d02c2 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
@@ -17,6 +17,7 @@ DEPENDS = "zlib gzip-native json-c"
 SRC_URI = "git://github.com/COVESA/${BPN}.git;protocol=https;branch=master \
            file://0002-Don-t-execute-processes-as-a-specific-user.patch \
            file://0004-Modify-systemd-config-directory.patch \
+           file://544.patch \
            "
 SRCREV = "0f2d4cfffada6f8448a2cb27995b38eb4271044f"
 
@@ -47,6 +48,8 @@ PACKAGECONFIG[dlt-console] = "-DWITH_DLT_CONSOLE=ON,-DWITH_DLT_CONSOLE=OFF"
 
 inherit autotools gettext cmake pkgconfig systemd
 
+# -DWITH_DLT_COREDUMPHANDLER=ON this feature is too experimental, disable for now
+#FILES:${PN} += "${libdir}/sysctl.d"
 EXTRA_OECMAKE += "-DWITH_DLT_LOGSTORAGE_GZIP=ON -DWITH_EXTENDED_FILTERING=ON -DSYSTEMD_UNITDIR=${systemd_system_unitdir}"
 
 PACKAGES += "${PN}-systemd"
-- 
2.34.1


