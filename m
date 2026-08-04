Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 365C9C55822
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 19:40:21 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24964.1785872416857516167
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 12:40:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Od+jF12q;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38e3617ba36so207836a91.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 12:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785872416; x=1786477216; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9V0pJCb61n5y+4Z6nQB4HHYmrM7pGItCqd6DsPoLemE=;
        b=Od+jF12qvbuq44nB4QOGVyu4QqJdisUIVjGaAI2gvjR+FHKJ9zlp0dPkHwtoz1M/zl
         6e58KnV2Q1fWCV7eu+RGw2NMpZBAnrludzm2m1uuK5tFSicbtFT7ttJcBRN1b3sF8fbT
         7ClM2Xbkx57xN466DdOt0kmFLR/3Y4B/FHl9OgZM2L/EI583/pTkS5A724m29dvbqg21
         hufVJgbxaQ/iZjlVCd2jCaikF5RH3HyPf4LfeOYb7hYBxaN0MyEv46Twk4XJhGwdlVRY
         vssKGWBj3hids/c5He5ehfIMRWz92XLkYxHPBhQmRuSLJ7V1VJvvJ1iGPRvB+IXlw+12
         xWow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785872416; x=1786477216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9V0pJCb61n5y+4Z6nQB4HHYmrM7pGItCqd6DsPoLemE=;
        b=PysXcxBrdQ40oFGRBHAOZmbgPcEKjvOZ+JUL11r2lZn77MJRJJV2er4ABmJJeA7sGx
         iKOXBj+fa0b4PgOQb3CvSJF8XYeYDNr5w3F+TJyCipdE8VmDLjLUH8o9ClNXqNwfz8FU
         gPfALynbENgcfPqNu87yRdXO5qUfhT9Nheh2P4liFe6/Mxs4xyXZgxXf2fbrRM5okRXm
         xLjWgF4O8ndUqtuXXW8FC3HwGRuKJOoFYzzpQQOJGG3Abt2sFwAc9aT3ttfrjL8K5wJZ
         NES1BKN1NU+OEEQ35oJ76FrQV+sgRf2AAGyx8pKsYwmKwJ0jWa5U6fRo8bVn+Dt6w5Jh
         H2xw==
X-Gm-Message-State: AOJu0YwcPhWJDqToM5QA3OvayolRhZQGWPRpfaDW+o6VOsCUCNFKOJeX
	LXBrLULPUetsKdwhZIa3guTJH+Dz16vPQpEX6S3OqiFr/5LOyK8Ax2KOf1rA45km
X-Gm-Gg: AR+sD1223/kfOfXSgNdX0awFBatlERjUsWnmZ5VlbwLYKM1m2gdi4vPcghgvjeETIs/
	cP5gykz6yTIVnNfQYnTcFxVI1fprB0goxeDmyNXZhNegPDB0xOcTNP8/KSuXPbQhlYYWgbkbxPc
	ujZurMYaENWOq31ew4tqGIRpFU9/zoPaTb724emfDszOxYj5DZIdbRIaAPAk+iQQYJQJ5YZh365
	SqmZmaH5HFy5Br0dAjjo+UfPtGheYxpPvCctC6N62ulR9YgEtU91+xNqDOCIoMUziHcV0j8b0dY
	974MY3BR4xraRdc1qlF2+l6Kz1tp/2UtpO7VTCANFxdsHmxS7cN/jRID2/+oc+Ws2ixPHHZOfk5
	9XD3lPNw2SZvNTODAZpof0hX6Uu1NFG9n79vdgserpnKojVD4FnoioAKuZK3A1cdJANlIQCYgKL
	Tuy3w5A0S7FrZyIhJ6rJZ4kXy/+GEylZytor3oK9+C+Yu9Toa/05qQodq/h1hhA7AtYQIMvsPJb
	NA=
X-Received: by 2002:a17:90a:da83:b0:38e:2c8f:a01a with SMTP id 98e67ed59e1d1-3903c5d2f8bmr1059923a91.11.1785872416035;
        Tue, 04 Aug 2026 12:40:16 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673b7f4sm8156417eec.17.2026.08.04.12.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:40:15 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][wrynose][PATCH 2/36] bluealsa: upgrade 4.3.0 -> 4.3.1
Date: Wed,  5 Aug 2026 07:39:29 +1200
Message-ID: <20260804194003.3158916-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
References: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 19:40:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128749

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

