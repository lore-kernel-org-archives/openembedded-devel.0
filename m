Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81E32C531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 07:45:14 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26030.1785138309491745682
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2026 00:45:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OlZ1Y3l9;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cc61541f8cso38314025ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Jul 2026 00:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785138309; x=1785743109; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9V0pJCb61n5y+4Z6nQB4HHYmrM7pGItCqd6DsPoLemE=;
        b=OlZ1Y3l9EwxhcVuPRXK9HuRws+Q64HJryicdc2FjxbfBu16Q9lAQyMoMDpTVNN7GDx
         Q5WJSt8FQeWispNAs6krmgK67us35VMnEkNjw/A0ZFA9TZgwGNrPIM9d5KS+Nm98n09Z
         LornN3Hc3f5roavphUT3Gpc8v0zoQULDeVnXQmrI32ISvuEYd3L+BVkcnxECVswaA5Tv
         eHK5HRFjKajoXx26GuMZsMJTZEx8qQz29ibibRDBigXRecVZTzeAKU7Z2+uY7PpJjE5w
         6yCgk9JfLXd0uUu1YuuQHwnW2GrydCz5z0J475p1HVu/F65C5mPXRvvGda3GHxUkhSWl
         gd5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785138309; x=1785743109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9V0pJCb61n5y+4Z6nQB4HHYmrM7pGItCqd6DsPoLemE=;
        b=B19KYVhEFJguGgbsUoMMvcJakgkog2fm/cbKmtF+NbhWUzjypuycRqRhSrMc2Z9/BX
         3sTk6BpzoDmlvdzye9VCYlRtAU403ey4qBtVJUeY4SMYrEXSVRRLCGStRfZSgH5AYV+u
         Un4RMWGPwcNkojNYaVDIeFMaxWCDWK0gXJP29c+qZUVMWBhg4DB4vhraTEElCbE1t7xG
         uS96llN7ELlHpf0z3eNXj1DA4yVYMN1bCaqNTFPZzldpYk/kMRv1FDhUOuOEvwWL1wdk
         6cMjuo/hUoHoOaAhwStnLqX7ixMw4HDjBUdK/SF9T0n0EjhZKEsb6PAWxx+aBo7ksJoD
         HgVQ==
X-Gm-Message-State: AOJu0YyE6fC5U0VTNHK3EH17H1F0+/VVGy1Wc/EECNj6FG/ktXVgKtnS
	gjNESHwJGCLO0qJo8melJ92jvijHFTSRJHIsaYC3AqePZszC3UJHmHq8+4oDlQ==
X-Gm-Gg: AR+sD10AC5OcFwv7x/cyrogoT4vsR54rnIcGCTAHHhzTN+Q2R1aAfytbIsP/Wx0nLcu
	GWqf5uZXG0++WFfSdnpli1hKYEbaRLDs2yX28rnwHgSkdmRNo4fqfNO82f1CD5+RjQ+s5HaVTpt
	cK0XjwKnDADPZ7lNaYNT7Tc9BZX87Wi5Vvb+Y95xbSKAPMM3g21wJM8l04bXKc+75C5nSB1Zwzm
	FgE/idjzgwWSyo2+Ydn3zXz3FaXx/wr+ll98qORkKp06C9+DlihtvZGldKVE6NYKFcxle20FNTx
	dAt0d4svLnAHb1p5EhBLyHUWmrjS3MSpSaRYmyQygYgA0/ZFVSpYpD1gzz+o6LSd6aFgQbEF55J
	4R3ysgpK6J3r/0rFZqE1dDlclsB2P4e4R/401DlA/FKAxLFnsqhOtMCXmPErcFexVG2gaXt0h4/
	7VQe9YVuf+55ISqAI=
X-Received: by 2002:a17:903:17cc:b0:2c9:d56d:afa3 with SMTP id d9443c01a7336-2cfd717a2a5mr91558735ad.15.1785138308785;
        Mon, 27 Jul 2026 00:45:08 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cffa9243fcsm8648945ad.64.2026.07.27.00.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 00:45:08 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 1/6] bluealsa: upgrade 4.3.0 -> 4.3.1
Date: Mon, 27 Jul 2026 19:44:56 +1200
Message-ID: <20260727074501.3707659-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Jul 2026 07:45:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128455

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Included tag in the SRC_URI and dropped the patch which is now merged in
the upstream version.

Changes:
- fix crash when playing audio with more than 2 channels
- fix AAC configuration selection for low sampling rates

https://github.com/arkq/bluez-alsa/blob/v4.3.1/NEWS

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...asename-implementation-from-glib-2.0.patch | 88 -------------------
 .../{bluealsa_4.3.0.bb => bluealsa_4.3.1.bb}  |  5 +-
 2 files changed, 2 insertions(+), 91 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/bluealsa/bluealsa/0001-Use-basename-implementation-from-glib-2.0.patch
 rename meta-multimedia/recipes-multimedia/bluealsa/{bluealsa_4.3.0.bb => bluealsa_4.3.1.bb} (96%)

diff --git a/meta-multimedia/recipes-multimedia/bluealsa/bluealsa/0001-Use-basename-implementation-from-glib-2.0.patch b/meta-multimedia/recipes-multimedia/bluealsa/bluealsa/0001-Use-basename-implementation-from-glib-2.0.patch
deleted file mode 100644
index fbd145e6b5..0000000000
--- a/meta-multimedia/recipes-multimedia/bluealsa/bluealsa/0001-Use-basename-implementation-from-glib-2.0.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From 070ed35ac5cef8138ed4760582bb72e8d3e136e2 Mon Sep 17 00:00:00 2001
-From: Arkadiusz Bokowy <arkadiusz.bokowy@gmail.com>
-Date: Sun, 25 Aug 2024 08:42:39 +0200
-Subject: [PATCH] Fix compilation on strict POSIX platforms
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Submitted [https://github.com/arkq/bluez-alsa/commit/070ed35ac5cef8138ed4760582bb72e8d3e136e2]
----
- src/main.c            | 2 +-
- test/mock/mock.c      | 2 +-
- utils/aplay/aplay.c   | 1 +
- utils/cli/cli.c       | 1 +
- utils/rfcomm/rfcomm.c | 1 +
- 5 files changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/src/main.c b/src/main.c
-index 96a66aee..eeb80165 100644
---- a/src/main.c
-+++ b/src/main.c
-@@ -13,13 +13,13 @@
- #endif
- 
- #include <getopt.h>
-+#include <libgen.h>
- #include <sched.h>
- #include <signal.h>
- #include <stdbool.h>
- #include <stdint.h>
- #include <stdio.h>
- #include <stdlib.h>
--#include <string.h>
- #include <strings.h>
- #include <syslog.h>
- #include <time.h>
-diff --git a/test/mock/mock.c b/test/mock/mock.c
-index 947211a3..0a2f6091 100644
---- a/test/mock/mock.c
-+++ b/test/mock/mock.c
-@@ -20,12 +20,12 @@
- #include <assert.h>
- #include <errno.h>
- #include <getopt.h>
-+#include <libgen.h>
- #include <signal.h>
- #include <stdbool.h>
- #include <stdint.h>
- #include <stdio.h>
- #include <stdlib.h>
--#include <string.h>
- #include <strings.h>
- #include <sys/stat.h>
- #include <unistd.h>
-diff --git a/utils/aplay/aplay.c b/utils/aplay/aplay.c
-index 3de77902..36843e95 100644
---- a/utils/aplay/aplay.c
-+++ b/utils/aplay/aplay.c
-@@ -15,6 +15,7 @@
- #include <assert.h>
- #include <errno.h>
- #include <getopt.h>
-+#include <libgen.h>
- #include <math.h>
- #include <poll.h>
- #include <pthread.h>
-diff --git a/utils/cli/cli.c b/utils/cli/cli.c
-index aeeabe58..0338b9e2 100644
---- a/utils/cli/cli.c
-+++ b/utils/cli/cli.c
-@@ -13,6 +13,7 @@
- #endif
- 
- #include <getopt.h>
-+#include <libgen.h>
- #include <stdarg.h>
- #include <stdbool.h>
- #include <stdint.h>
-diff --git a/utils/rfcomm/rfcomm.c b/utils/rfcomm/rfcomm.c
-index d01f0810..3dacfd67 100644
---- a/utils/rfcomm/rfcomm.c
-+++ b/utils/rfcomm/rfcomm.c
-@@ -15,6 +15,7 @@
- #include <ctype.h>
- #include <errno.h>
- #include <getopt.h>
-+#include <libgen.h>
- #include <poll.h>
- #include <stdbool.h>
- #include <stdint.h>
diff --git a/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_4.3.0.bb b/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_4.3.1.bb
similarity index 96%
rename from meta-multimedia/recipes-multimedia/bluealsa/bluealsa_4.3.0.bb
rename to meta-multimedia/recipes-multimedia/bluealsa/bluealsa_4.3.1.bb
index 4f15465371..f94600e8b2 100644
--- a/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_4.3.0.bb
+++ b/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_4.3.1.bb
@@ -16,10 +16,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=143bc4e73f39cc5e89d6e096ac0315ba"
 
 DEPENDS += "alsa-lib bluez5 dbus glib-2.0-native python3-packaging-native sbc"
 
-SRC_URI = "git://github.com/Arkq/bluez-alsa.git;protocol=https;branch=master \
-           file://0001-Use-basename-implementation-from-glib-2.0.patch"
+SRC_URI = "git://github.com/Arkq/bluez-alsa.git;protocol=https;branch=master;tag=v${PV}"
 
-SRCREV = "959573c2cccef5cf074f5b2fa7941abbd699c5f4"
+SRCREV = "f11569451b98a765adf9abc081632bb013f89f57"
 
 
 PACKAGECONFIG ??= "aplay cli hcitop ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"

