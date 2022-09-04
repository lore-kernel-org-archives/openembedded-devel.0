Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6583C6FA8B
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:35:14 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.11315.1662276892601882509
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:35:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N1B/q73T;
 spf=pass (domain: gmail.com, ip: 209.85.214.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d12so5775555plr.6
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=OEF7p/VwCaCqZ6DJdnkO7D9gownAN3fYeAIgYQIWQdA=;
        b=N1B/q73TCLa09BUYg/OrE2Tv9PxMUQXl6GrxvHh8vLdEwylb9ddpOo3MpHSKvmpUQP
         FHcM0yUH8r6H62z+ON7V9sdBxecE8voHjImSqndsRM8XP5wEFzvqFmOc4B0nrnUuk/cq
         afIKbNooHsZx6fFHnQNgFeycpXRfByU1OkUnpdgEQGRYdi0CXDEj7w/ySuTKavbcdtzZ
         jy933FroryHDV+u7+2OV2j5PyfYoIt4FtN1gKQrok2ThDUK5MY0Snh9+M9ucrclLGSJW
         /Q9QJQqhFOHIkDrPARW4g1wZ812cBVpiENF70TFVhTS9uP/NI0OwoIF8PQGi2cVKcmR/
         DhHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=OEF7p/VwCaCqZ6DJdnkO7D9gownAN3fYeAIgYQIWQdA=;
        b=hV2XwXjgd8TGFabFBybA4Mzpz/4EixFw9+FKAYUwBG+TFzV1YYVmyMHyXOtsERR7qi
         oQNph5Oe6ve0XoCQ8cRqf9PVD2V041uYHIOahlk7DxJT4TIpsyPFaQihtC0Rl4a8LfCZ
         NwIGnZC6d7uvgJZdjGBBR0ndONz24dT5Vx6DSXpI4Cs8hvLl69AB3sPcdXmASfBDDAKn
         J9BrEYTqXlQX8AI+q3tg8OPqRJIOyU4pGq3wb2AVqYyi147pvq6iwG9fmpFEGiICtRgn
         AB9tAptwE2Sv3sEbkCrfJMKR9cTnNE8MdIxmPu5B96slSH4OyblCcOr2jalEj3zWEHeP
         ua/A==
X-Gm-Message-State: ACgBeo3m2F+eh/EVZ95ppIOmVg4nDwd+oAa7aydjvBEk4eocxCiFSQbu
	4upQUjhaP5RwpRqoGxTMSwmDBXUL0smq9Q==
X-Google-Smtp-Source: 
 AA6agR5TUJfAlfzUk8fBxVY30UoY4P7V0y/SSWVw7Q5W3E/iuxYsMBzQtGvrq9eu0Rle8RcXFcupqA==
X-Received: by 2002:a17:902:cf0e:b0:172:60b7:777c with SMTP id
 i14-20020a170902cf0e00b0017260b7777cmr44152240plg.132.1662276905613;
        Sun, 04 Sep 2022 00:35:05 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:35:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 44/63] uml-utilities: Add missing headers for exit
 and str+ functions
Date: Sun,  4 Sep 2022 00:33:58 -0700
Message-Id: <20220904073417.3251865-44-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:35:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98638

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...andard-headers-for-str-and-exit-APIs.patch | 64 +++++++++++++++++++
 .../uml-utilities/uml-utilities_20040406.bb   |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/0001-Add-missing-standard-headers-for-str-and-exit-APIs.patch

diff --git a/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/0001-Add-missing-standard-headers-for-str-and-exit-APIs.patch b/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/0001-Add-missing-standard-headers-for-str-and-exit-APIs.patch
new file mode 100644
index 0000000000..9fce51a593
--- /dev/null
+++ b/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/0001-Add-missing-standard-headers-for-str-and-exit-APIs.patch
@@ -0,0 +1,64 @@
+From a1c4716ceaed6333f8be01b5d4d971e64babcdd7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 2 Sep 2022 18:57:42 -0700
+Subject: [PATCH] Add missing standard headers for str* and exit APIs
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ jail/jail_uml             | Bin 19120 -> 19120 bytes
+ jail/jail_uml.c           |   1 +
+ port-helper/port-helper.c |   1 +
+ uml_router/port.c         |   1 +
+ uml_router/uml_switch.c   |   1 +
+ watchdog/uml_watchdog.c   |   1 +
+ 6 files changed, 5 insertions(+)
+
+--- a/jail/jail_uml.c
++++ b/jail/jail_uml.c
+@@ -1,5 +1,6 @@
+ #include <stdio.h>
+ #include <unistd.h>
++#include <stdlib.h> /* for exit */
+ #include <errno.h>
+ 
+ static void Usage(void)
+--- a/port-helper/port-helper.c
++++ b/port-helper/port-helper.c
+@@ -12,6 +12,7 @@ for read and write, and the console is f
+ 
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <string.h> /* memset */
+ #include <signal.h>
+ #include <errno.h>
+ #include <unistd.h>
+--- a/uml_router/port.c
++++ b/uml_router/port.c
+@@ -1,5 +1,6 @@
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <string.h> /* memcmp */
+ #include <unistd.h>
+ #include <errno.h>
+ #include <sys/socket.h>
+--- a/uml_router/uml_switch.c
++++ b/uml_router/uml_switch.c
+@@ -5,6 +5,7 @@
+ #include <stdio.h>
+ #include <errno.h>
+ #include <stdlib.h>
++#include <string.h> /* strcmp */
+ #include <signal.h>
+ #include <fcntl.h>
+ #include <stdint.h>
+--- a/watchdog/uml_watchdog.c
++++ b/watchdog/uml_watchdog.c
+@@ -1,5 +1,6 @@
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <string.h> /* strcmp */
+ #include <unistd.h>
+ #include <signal.h>
+ #include <errno.h>
diff --git a/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb b/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
index 663a145ef7..35ae5f777d 100644
--- a/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
+++ b/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
@@ -7,6 +7,7 @@ SRC_URI = "http://downloads.sourceforge.net/project/user-mode-linux/tools/1/uml_
            file://fix-ldflags.patch \
            file://unstrip.patch \
            file://0001-include-required-system-header-files-for-fd_set-and-.patch \
+           file://0001-Add-missing-standard-headers-for-str-and-exit-APIs.patch \
            "
 SRC_URI[md5sum] = "2c1ccd9efacbfb39e42d482b89b2550a"
 SRC_URI[sha256sum] = "4f179b1db021ef15ac7e9b2eed57c525db127a754c574f591c367460cded9f41"
-- 
2.37.3


