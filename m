Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10097.1794999718687507620
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2026 03:01:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=cmgUOFbu;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: awais.belal@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso12652295e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 03:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794999717; x=1795604517; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kxXKHDCCCkkAEG5UGnwnFJNsyIq3mKsYWjCqEOEjRAY=;
        b=cmgUOFbuBRSrNTSd9y/UlRaaWVae6j+eeNmpk1XlJtsFRPTJy/oDrOhremBOsE5fNE
         EE64KoJJEYY2GoofZpZRWoEuR5X1gD7TfuHES2zIXMLky7+Q8VarlVfSAIsSQsGo+Y1+
         6q/JwhbJdklwszNMdehfUpvyXWl9T8yYK2zYBjnl2WvXkqVBQIhXp1m4Rxg96dtcWG4l
         2vo4G5dVpzwENJO4vCcjH0cRamUTV++zEywIXnTvX40P3biaNJLfDlHbrqzbO23rOKUE
         5UQfAgQXHbbSS98iAat2yPSOStGtnjpiQP3eXXg0rmQQEE6pc8IcOmnh+AeROF3nKxHB
         UsKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794999717; x=1795604517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kxXKHDCCCkkAEG5UGnwnFJNsyIq3mKsYWjCqEOEjRAY=;
        b=bNgfQg8atArMJAcJ0kwuFlP8g0cWTlWo36p75ev2cCxX4oJT+7nXgm4VWMwa2sgLLo
         sAxQ4NqIJe60J9xhH99jLyJgLc4IukdfBS9l90fKieUtFjpVFt8rdY23P/TmQi7JMypE
         +oewF5xT9loodAihblKV8odgUqY2ytJjTrX8XVR4AeWPnaZFtS1beApptCfCAEnKbHxy
         R0j+1cRYPj+e/qQkst1qAMruHvE0Sn+3RK6ia0tUhAcMSHSTqpkUz5VXlPDj+giQiaFl
         TpmugHrKDKAwAP2JPDTCLTsKLeg7qHjU1kQ7arRY37jFtBQVneD9XWBOQTyk2812frEB
         EzEw==
X-Gm-Message-State: APuU4Z80y+kkZ1loqWbOdO8wE8YTmCRD2lv3c6OYSFz2U/UvG8stix8v
	PYTUq09ow47LfmsMcL0EfQlBHL2RbKtG+KWvoPCvWv8c4/v4uMr8RKwgdR08FIfZ
X-Gm-Gg: AYBFou0p5aArVZgAGQqP3uzFaVoiwWjaXvEM/xpt5aCwv4hMgAi7vNbqOZ7W7xLmXQg
	HSf4Vu3k04P4/xGzv9SoCrvXPlLVFbdA8s6g/rcSughkCRyak0L4f88a1X6Fh7X7Rt6nPI43Pry
	5sc575FLxXiUmCEOGce+Efx5LoOM2B8lsjkR+IiRL4ZQpYeWJGvUPWk7DWAGP7PfEYA2ptO7HeL
	XIm39iYDBWBHDXmOVEyRVOVEw/3zdY/3rqbBk+yDuM2YU/encqYXS56ur4UreL4ahLuj4CZPNti
	UIXBb7TIgNV5kKfA7Qb+ldj1+s2kvB078Fv/jpvZSyc+z4IhzJSlg32riSh/ELg9a2UwU+ZLPcN
	EgiZU3/5svv2iZBULynhVAZxp9wsA8zxQiYuj3Oupg/30RzJNU7FT0Ho9LCQcpFNezlDIzKmdV9
	dL4C8Ky4GOMSGEhWg/1lbne04gNZEbnKBCWr+YsxNxQr7fLGidDqfh+T8KdDwiMxwleJlJWU5HQ
	haublIE+8kg84+ORGi9oH9EJ22nAkUFqcmfrO/Ws/uYKWxmIjRjWhg0H0/wKB0PAs8UfBzWishn
	8qfVwtokYSs0DdGFRx7zwMSCRWXEivy/UpPtKiGY1uauYIqN1AMOMH6LkYBDgaQHNlpX5MUQSTc
	=
X-Received: by 2002:a05:600c:1d0f:b0:4bb:6fff:9fe7 with SMTP id 5b1f17b1804b1-4bb7da22416mr40322435e9.5.1794999716317;
        Wed, 18 Nov 2026 03:01:56 -0800 (PST)
Return-Path: <awais.belal@gmail.com>
Received: from elitebook.tailad32a6.ts.net ([101.53.238.142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7e57f6f9sm23139885e9.2.2026.11.18.03.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:01:55 -0800 (PST)
From: Awais Belal <awais.belal@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Awais Belal <awais.belal@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Awais B <awais.b@rufilla.com>
Subject: [meta-oe][wrynose][PATCH 2/7] mongodb: update to 4.4.29
Date: Wed, 18 Nov 2026 16:01:15 +0500
Message-Id: <20261118110120.3913031-3-awais.belal@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118110120.3913031-1-awais.belal@gmail.com>
References: <20261118110120.3913031-1-awais.belal@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 11:02:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132639
Content-Type: text/plain; charset="utf-8"

Move on to 4.4.29 and drop a patch that is not applicable anymore.

Signed-off-by: Awais Belal <awais.belal@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 245b2dceb256932c62e762839adb57c0dec32edf)
Signed-off-by: Awais B <awais.b@rufilla.com>
---
 ...001-free_mon-Include-missing-cstdint.patch | 28 -------------------
 .../recipes-dbs/mongodb/mongodb_git.bb        |  7 ++---
 2 files changed, 3 insertions(+), 32 deletions(-)
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-free_mon-Include-missing-cstdint.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-free_mon-Include-missing-cstdint.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-free_mon-Include-missing-cstdint.patch
deleted file mode 100644
index 8cee14889f..0000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-free_mon-Include-missing-cstdint.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 5d8218b8a1b5bc71e2a0cf543a000e194daba599 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 29 Jan 2023 17:15:30 -0800
-Subject: [PATCH] free_mon: Include missing <cstdint>
-
-gcc 13 moved some includes around and as a result <cstdint> is no
-longer transitively included [1]. Explicitly include it
-for uintXX_t.
-
-[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
----
- src/mongo/db/free_mon/free_mon_options.h | 1 +
- 1 file changed, 1 insertion(+)
-
---- a/src/mongo/db/free_mon/free_mon_options.h
-+++ b/src/mongo/db/free_mon/free_mon_options.h
-@@ -29,6 +29,7 @@
- 
- #pragma once
- 
-+#include <cstdint>
- #include <string>
- #include <vector>
- 
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index 0f4a5c4423..339bb38a2b 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -11,9 +11,9 @@ DEPENDS = "openssl libpcap zlib boost curl python3 \
 
 inherit scons dos2unix siteinfo python3native systemd useradd
 
-PV = "4.4.24"
-#v4.4.24
-SRCREV = "0b86b9b7b42ad9970c5f818c527dd86c0634243a"
+PV = "4.4.29"
+#v4.4.29
+SRCREV = "89d6ffe6fc67b36fd47aff6425087003966588e3"
 SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.4;protocol=https \
            file://0001-Tell-scons-to-use-build-settings-from-environment-va.patch \
            file://0001-Use-long-long-instead-of-int64_t.patch \
@@ -32,7 +32,6 @@ SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.4;protocol=https \
            file://0001-add-explict-static_cast-size_t-to-maxMemoryUsageByte.patch \
            file://0001-server-Adjust-the-cache-alignment-assumptions.patch \
            file://0001-The-std-lib-unary-binary_function-base-classes-are-d.patch \
-           file://0001-free_mon-Include-missing-cstdint.patch \
            file://0001-apply-msvc-workaround-for-clang-16.patch \
            file://0001-Fix-type-mismatch-on-32bit-arches.patch \
            file://0001-Fix-build-on-32bit.patch \
-- 
2.34.1

