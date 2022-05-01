Return-Path: <stephensportia@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DF96C433F5
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 03:46:14 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.29960.1651376771859263134
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 20:46:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=No8HVFGh;
 spf=pass (domain: gmail.com, ip: 209.85.214.172,
 mailfrom: stephensportia@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id i1so4040728plg.7
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 20:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XOVyS3hw5w7DZEsulbFcKQhLpOB7DJiQcidjC2SebH4=;
        b=No8HVFGhfnYNPaTffQe8W2BWRWCqksSKdKlfmGCGkilzRnnCAgpbxrplVchGK6OR+1
         jAJNTVmpiD+fw98MXX/8JnEmC0UC/uH8ZMt5wCI7M4xvukc8fTwd7jiSQFByCrcKNk6c
         aQnMv4X8zKA2g0Zl93P4xqnVDM5xpGzFaKBmumQzjQKLdca2Z5YVck4uJ8LfNyD1CBtP
         tayYHClN55ADeH9GC9hb4+3kAGqUepnxwpsO3qPgyjd/UHxAByaxL3k0MPWNAiUdhrll
         S37O9TNQtpYf2g5IjRixExCfLB/+5BHOgmbCKNrfqAlzXcN/lTjEWDTsd+RQ4vWE62u7
         jikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XOVyS3hw5w7DZEsulbFcKQhLpOB7DJiQcidjC2SebH4=;
        b=bCHuaoinpWchft3OKTgsFbVahl1oM0FFgYeZm8ST9Ec/FRhKlx5bXUFeyqvvKKNmW7
         DoexJ9SGeRcpZASDR4nNoc7f59IC5ObSCfPz+OeIXrWCxohhPOouAe3EZmZOqHS/lSSP
         SakrBG02CyRTFQ23JkroD2cqS+i10xDgeDfWYasri79nx1i8pFxnlh7B3Fbdk3SXnm0+
         KE8HAI/jDOCfDUVAaW+kLkKieALTR/T7ds5b2YKj3u0mIzjA3y+PXWo0EBq9p5hSTvbg
         cgBHMV4ajnqWpnYCEgeVKaygn2wowa0VgvoYBu7oNRitqZWM915+HMYAOeU7yADBLbhu
         3HZw==
X-Gm-Message-State: AOAM53110FB1V6E1MzJyF3PiSPs3Sr8Q9T5O3Ko8e1ZA7SKIKRc8Ibvu
	b3Aoq1S1CA477cS02rOlBxC8E7zgRhI=
X-Google-Smtp-Source: 
 ABdhPJx4yM/RzPAwyYG4QSyTZ0n7uWH1siyJ49qIgKxXE+LIdwx4A3UgxPzJ2mMYzRmV0EoYxdBi/g==
X-Received: by 2002:a17:902:a583:b0:15d:197b:9259 with SMTP id
 az3-20020a170902a58300b0015d197b9259mr6322676plb.51.1651376770969;
        Sat, 30 Apr 2022 20:46:10 -0700 (PDT)
Received: from fembot.alistair23.me
 (2403-580b-97e8--3fb3-217a-1f80-90f1.ip6.aussiebb.net.
 [2403:580b:97e8:0:3fb3:217a:1f80:90f1])
        by smtp.gmail.com with ESMTPSA id
 a37-20020a634d25000000b003c14af505ecsm9010130pgb.4.2022.04.30.20.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 20:46:10 -0700 (PDT)
From: Portia <stephensportia@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Portia <stephensportia@gmail.com>,
	Bassem Boubaker <bassem.boubaker@actia.fr>
Subject: [meta-oe][PATCH] cpulimit: introduce support for this package
Date: Sun,  1 May 2022 13:45:33 +1000
Message-Id: <20220501034533.8342-1-stephensportia@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 May 2022 03:46:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96908

Now, cpulimit recipe is put under recipes-support. Binary will be
installed  by the recipe under /usr/sbin

         # cpulimit -h
         Usage: cpulimit [OPTIONS...] TARGET
                 OPTIONS
                 -l, --limit=N          percentage of cpu allowed from 0
to 100
(required)
                 -v, --verbose          show control statistics
                 -z, --lazy             exit if there is no target
process, or
if it dies
                 -i, --include-children limit also the children
processes
                 -h, --help             display this help and exit
                 TARGET must be exactly one of these:
                 -p, --pid=N            pid of the process (implies -z)
                 -e, --exe=FILE         name of the executable program
file or
path name
                 COMMAND [ARGS]         run this command and limit it
(implies
-z)

                 Report bugs to <marlon...@hotmail.com>.

Signed-off-by: Bassem Boubaker <bassem.boubaker@actia.fr>
[ Changes by Portia
 - Fix build issue, deprecated and missing includes
 - Add branch to git repo in SRC_URI
 - Update LICENSE to GPL-2.0-or-later
]
Signed-off-by: Portia <stephensportia@gmail.com>
---
 ...l.h-and-add-missing-libgen.h-include.patch | 41 +++++++++++++++++++
 .../recipes-support/cpulimit/cpulimit_0.2.bb  | 22 ++++++++++
 2 files changed, 63 insertions(+)
 create mode 100644 meta-oe/recipes-support/cpulimit/cpulimit/0001-Remove-sys-sysctl.h-and-add-missing-libgen.h-include.patch
 create mode 100644 meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb

diff --git a/meta-oe/recipes-support/cpulimit/cpulimit/0001-Remove-sys-sysctl.h-and-add-missing-libgen.h-include.patch b/meta-oe/recipes-support/cpulimit/cpulimit/0001-Remove-sys-sysctl.h-and-add-missing-libgen.h-include.patch
new file mode 100644
index 000000000..50d0342ec
--- /dev/null
+++ b/meta-oe/recipes-support/cpulimit/cpulimit/0001-Remove-sys-sysctl.h-and-add-missing-libgen.h-include.patch
@@ -0,0 +1,41 @@
+From 41cfba0840f58555593fd4bee07db77221043e0b Mon Sep 17 00:00:00 2001
+From: Portia <stephensportia@gmail.com>
+Date: Sun, 1 May 2022 12:43:35 +1000
+Subject: [PATCH] Remove sys/sysctl.h and add missing libgen.h include
+
+- sys/sysctl.h has been deprecated and should be removed
+- Adds missing libgen.h include when calling basename()
+
+Upstream-Status: Inactive-Upstream [2015]
+Signed-off-by: Portia <stephensportia@gmail.com>
+---
+ src/cpulimit.c      | 1 -
+ src/process_group.c | 1 +
+ 2 files changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/cpulimit.c b/src/cpulimit.c
+index 50eabea..5b0ec49 100644
+--- a/src/cpulimit.c
++++ b/src/cpulimit.c
+@@ -38,7 +38,6 @@
+ #include <string.h>
+ #include <sys/stat.h>
+ #include <sys/time.h>
+-#include <sys/sysctl.h>
+ #include <sys/resource.h>
+ #include <sys/types.h>
+ #include <sys/wait.h>
+diff --git a/src/process_group.c b/src/process_group.c
+index 06d73a6..d4f6fab 100644
+--- a/src/process_group.c
++++ b/src/process_group.c
+@@ -24,6 +24,7 @@
+ #include <limits.h>
+ #include <sys/time.h>
+ #include <signal.h>
++#include <libgen.h>
+
+ #include <assert.h>
+
+--
+2.25.1
diff --git a/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb b/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb
new file mode 100644
index 000000000..3ee2b5c23
--- /dev/null
+++ b/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb
@@ -0,0 +1,22 @@
+SUMMARY = "cpulimit is a tool which limits the CPU usage of a process"
+HOMEPAGE = "http://cpulimit.sourceforge.net"
+LICENSE = "GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=86c1c0d961a437e529db93aa3bb32dc4"
+SRCREV ?= "f4d2682804931e7aea02a869137344bb5452a3cd"
+
+SRC_URI = "git://g...@github.com/opsengine/cpulimit.git;protocol=https;branch=master \
+           file://0001-Remove-sys-sysctl.h-and-add-missing-libgen.h-include.patch \
+           "
+
+S = "${WORKDIR}/git"
+
+do_compile() {
+    oe_runmake all
+}
+do_install() {
+    install -d ${D}${sbindir}
+    install -m 0755 ${B}/src/${PN} ${D}${sbindir}/
+}
+
+CFLAGS += "${LDFLAGS}"
+
-- 
2.25.1


