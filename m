Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3418C6FA8B
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:35:04 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web08.11127.1662276868051937343
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Iwnn6Uc5;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id
 ck21-20020a17090afe1500b002003ba5b71cso943881pjb.0
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=E4J6JQ6OgxnE2QtqODuDtjIjpwUEQwpw5PzMxtCAvqE=;
        b=Iwnn6Uc5PZxx1A2guS1GkybKdIlW9Rq7lCvCS4m0fPkVp9Qfv55YWJwsoWE7lzyEQd
         G6S1c3YeIjlpqQuBVJyRGc+DnbuIXzZqqXZ5J78BpoI/1HTTmQfvZ2Y1Vpp1U5hiIFDe
         YlPupaIGb1rn3jWEjKzWLCswqdXhbPbIC7qN39gRs/U/IER0wswdEv14hPZjtO5PvyxY
         uDjKKZXTrAtbgmrvXQjE3nNhY9gE5cTfeO3VCcoMru/OivQPewdtg+dh3O2b32CQ6wrL
         hxAH5qaP1KHFqw8ke+iLb0MPTBOzU02o1Dm0tI4KCHSuQjKOtrtPdXt7UI2uPL1oTJ3t
         lBVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=E4J6JQ6OgxnE2QtqODuDtjIjpwUEQwpw5PzMxtCAvqE=;
        b=cQYfumSPn25qSy4VJwD+Y8oiV2IMBp3WAbK5b7vjVyRKvC81qMo0RPxgKgWq5BTuLj
         VPpRCIGPlDZYeawJxhDcfn3ShhUoUVefAfVVnYwwN55Y15kzO3NWImaWDLctLctt2f/X
         2eYCQnxhbYSW7DHAMBEYXAs9WeA7C+YwJOEKlctOAI63ONVKbff7kCkwnpZ8Kdu1hkZz
         fny09XYGrCOTTHJJepKPNrq25JiGwbKuCp1laQL73hbIv8gM6sC2/xnN2q23KxyEfMQV
         nLT9wVZWlKdUixyaUbDQwSv475DJXVmhQ3PDmDrOc9mfbOWAK4+ZsCctUPj5m4HY78Ff
         GC4A==
X-Gm-Message-State: ACgBeo1ZH5csre+TD8McgjGQ47q5J1z8PIAYBO7i1pN6nVABYT3uNY5s
	aqAXj6gmvx+r/eza/rz2UoWr3LzTm07BRw==
X-Google-Smtp-Source: 
 AA6agR7FrDfoY2wOOrMtBL6Tiihnp2I/iR690nFkwuuuqHIEmfM39VtPlIWBOykDHzaNLEurMVkdug==
X-Received: by 2002:a17:90b:1e0f:b0:1f5:37f5:159c with SMTP id
 pg15-20020a17090b1e0f00b001f537f5159cmr13455237pjb.189.1662276897803;
        Sun, 04 Sep 2022 00:34:57 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:34:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 36/63] sblim-sfcb: Add missing headers file for
 clang/musl
Date: Sun,  4 Sep 2022 00:33:50 -0700
Message-Id: <20220904073417.3251865-36-raj.khem@gmail.com>
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
 https://lists.openembedded.org/g/openembedded-devel/message/98630

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-include-missing-system-headers.patch | 151 ++++++++++++++++++
 .../sblim-sfcb/sblim-sfcb_1.4.9.bb            |   1 +
 2 files changed, 152 insertions(+)
 create mode 100644 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/0001-include-missing-system-headers.patch

diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/0001-include-missing-system-headers.patch b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/0001-include-missing-system-headers.patch
new file mode 100644
index 0000000000..c16e393f49
--- /dev/null
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/0001-include-missing-system-headers.patch
@@ -0,0 +1,151 @@
+From c5b15ae9636a3b73407372cce87eb40ea78a68ea Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 2 Sep 2022 15:51:31 -0700
+Subject: [PATCH] include missing system headers
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ brokerEnc.c         | 2 ++
+ brokerOs.c          | 1 +
+ mlog.c              | 1 +
+ mofc/backend_sfcb.c | 2 +-
+ sfcbdump.c          | 1 +
+ sfcbdumpP32onI32.c  | 1 +
+ sfcbsem.c           | 1 +
+ trace.c             | 3 ++-
+ trace.h             | 3 ++-
+ 9 files changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/brokerEnc.c b/brokerEnc.c
+index 9115e71..889afcd 100644
+--- a/brokerEnc.c
++++ b/brokerEnc.c
+@@ -25,6 +25,8 @@
+ #include "constClass.h"
+ #include <sfcCommon/utilft.h>
+ 
++#include <string.h> /* strcasecmp */
++
+ extern const char *opGetClassNameChars(const CMPIObjectPath * cop);
+ extern const char *opGetNameSpaceChars(const CMPIObjectPath * cop);
+ extern CMPIConstClass *getConstClass(const char *ns, const char *cn);
+diff --git a/brokerOs.c b/brokerOs.c
+index 8d73a0b..b1427fd 100644
+--- a/brokerOs.c
++++ b/brokerOs.c
+@@ -22,6 +22,7 @@
+ #include <pthread.h>
+ #include "native.h"
+ #include <stdlib.h>
++#include <string.h> /* strcmp */
+ 
+ static char    *
+ resolveFileName(const char *filename)
+diff --git a/mlog.c b/mlog.c
+index a2d9eb7..6d9cd29 100644
+--- a/mlog.c
++++ b/mlog.c
+@@ -26,6 +26,7 @@ const char     *_mlog_id =
+ #include <syslog.h>
+ #include <stdarg.h>
+ #include <stdio.h>
++#include <string.h> /* strcat */
+ #include <errno.h>
+ #include <signal.h>
+ #include "trace.h"              /* for setSignal() */
+diff --git a/mofc/backend_sfcb.c b/mofc/backend_sfcb.c
+index 614abcd..99d4061 100644
+--- a/mofc/backend_sfcb.c
++++ b/mofc/backend_sfcb.c
+@@ -29,7 +29,7 @@
+ #include "backend.h"
+ #include "objectpath.h"
+ #include <sys/utsname.h>
+-
++#include <string.h>
+ 
+ extern CMPIStatus sfcb_simpleArrayAdd(CMPIArray * array, CMPIValue * val, CMPIType type);
+ extern CMPIObjectPath *getObjectPath(char *path, char **msg);
+diff --git a/sfcbdump.c b/sfcbdump.c
+index 8a9c335..aa8559c 100644
+--- a/sfcbdump.c
++++ b/sfcbdump.c
+@@ -23,6 +23,7 @@
+ #include <errno.h>
+ #include <stddef.h>
+ #include <getopt.h>
++#include <string.h> /* strerror */
+ #include "objectImpl.h"
+ 
+ #define BINARY_NAME argv[0]
+diff --git a/sfcbdumpP32onI32.c b/sfcbdumpP32onI32.c
+index ccf87dc..3540751 100644
+--- a/sfcbdumpP32onI32.c
++++ b/sfcbdumpP32onI32.c
+@@ -22,6 +22,7 @@
+ #include <fcntl.h>
+ #include <errno.h>
+ #include <stddef.h>
++#include <string.h>
+ #include <getopt.h>
+ #include "objectImpl.h"
+ #include <byteswap.h>
+diff --git a/sfcbsem.c b/sfcbsem.c
+index 3f8de7f..1e6358b 100644
+--- a/sfcbsem.c
++++ b/sfcbsem.c
+@@ -21,6 +21,7 @@
+ 
+ /* includes */
+ #include <stdio.h>
++#include <string.h>
+ #include <getopt.h>
+ #include <errno.h>
+ 
+diff --git a/trace.c b/trace.c
+index 23597e1..c4f8011 100644
+--- a/trace.c
++++ b/trace.c
+@@ -25,6 +25,7 @@
+ #include "native.h"
+ #include <string.h>
+ #include <time.h>
++#include <pthread.h>
+ 
+ #include <sys/stat.h>
+ #include <sys/wait.h>
+@@ -50,7 +51,7 @@
+ 
+ char           *processName = NULL;
+ int             providerProcess = 0;
+-int             idleThreadId = 0;
++pthread_t       idleThreadId = 0;
+ int             terminating = 0;
+ int             colorTrace;
+ 
+diff --git a/trace.h b/trace.h
+index ea39850..52d408d 100644
+--- a/trace.h
++++ b/trace.h
+@@ -25,6 +25,7 @@
+ 
+ #include "mlog.h"
+ 
++#include <pthread.h>
+ extern unsigned long _sfcb_trace_mask;
+ /* use pointer indirect _sfcb_trace_mask to allow shared memory flag */
+ extern unsigned long *_ptr_sfcb_trace_mask;
+@@ -162,7 +163,7 @@ extern sigHandler *setSignal(int sn, sigHandler * sh, int flags);
+ 
+ extern char    *processName;
+ extern int      providerProcess;
+-extern int      idleThreadId;
++extern pthread_t      idleThreadId;
+ extern int      terminating;
+ 
+ #endif
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
index 5f398fb0d2..2a89a549d1 100644
--- a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
@@ -28,6 +28,7 @@ SRC_URI = "http://downloads.sourceforge.net/sblim/${BP}.tar.bz2 \
            file://sblim-sfcb-1.4.9-fix-sfcbinst2mof.patch \
            file://0001-Avoid-variable-definition-in-header-files.patch \
            file://0001-configure-Check-for-function-from-respective-library.patch \
+           file://0001-include-missing-system-headers.patch \
 "
 
 SRC_URI[md5sum] = "28021cdabc73690a94f4f9d57254ce30"
-- 
2.37.3


