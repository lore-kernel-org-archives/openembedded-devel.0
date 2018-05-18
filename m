Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f43.google.com (mail-pg0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 36EE475049
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 20:05:55 +0000 (UTC)
Received: by mail-pg0-f43.google.com with SMTP id n9-v6so3753063pgq.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 13:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=DOGjgy+fU5CafLKd6tuU8OssG83MW3ye8/tG8Zv0WTU=;
	b=fYTjF0mx4VkwyyLxJXTrH6uqgDx0T/x5aF/FNuo97uOmd6iiTutzSfTk55z3zT/370
	rEjCDagf58bqwxSIG1IeBevx6FAUhs3qDt4PUraotx+RByK/YeF3wlqS2+wp3WgyfoKS
	DWt2x9RPpSrmr2N1JpKdf0As3+Fl0s7uKj4kCssTqXiB6YTL8JdwIXjrsrh6gD7iOjFh
	cNMgqcVXgXDEdW6NopEheiU9UjZS1R3S5huOUUI9Etgo0SZ4OyM8MDIyuFkRTzGReIvT
	debWDpCq0biqqKtQSzkFa2m3gwGcC9bWPefi9RqqiUyOvwvVec410JuzneH76bASpfXp
	1vFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DOGjgy+fU5CafLKd6tuU8OssG83MW3ye8/tG8Zv0WTU=;
	b=kLSBgzEkktzS0vojji5KnIYyhhz5lS77P51oiZtXK0aqHCoW5vElvdcVnmWoTKkfe7
	e0fl/3G7NdJ7YzPOt9nT/G679GVxRB5JbmfQ+oAuimMyHjgyeA/A/am2j7/hnD7Ex4P+
	rB4emRKrJg5g2Sd1YrJ2TdynNyDrqX1yqgWdWff4Fn178hPuqYkKqH3ZkHWDVnKEDbuh
	+xQWY7pqjDE3/m1wb9ZijVb9k5JyEOsoaBXFVXdtIh2PfNHN2DXrKygvBORIyKigEsdv
	oq6JtufV6xbu6jpR0uA3HkzMtSr/2FAdeVuCHVL2DRQ+UYMxnj462cABmDS6w9TWffxq
	Z1kw==
X-Gm-Message-State: ALKqPwew8sqlF3FN1W4alQsj0HnUKkB/1+WfDR93ONWwmej/zCnlhxI8
	gJmKHkwuf5rjHCF4j5hIRNl5Yg==
X-Google-Smtp-Source: AB8JxZrWWM9ciSHNYlitjHpEvl6AXU4cLxAevx/5b06hAEZQk/X9ArdYKGe/IXpCHq5U/zDyXKtQ1w==
X-Received: by 2002:a62:c103:: with SMTP id
	i3-v6mr10704661pfg.148.1526673956599; 
	Fri, 18 May 2018 13:05:56 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	q19-v6sm77888pgv.78.2018.05.18.13.05.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 May 2018 13:05:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 May 2018 13:05:53 -0700
Message-Id: <20180518200554.30205-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [meta-oe][PATCH] iperf3: Drop redundant patch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 May 2018 20:05:56 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...dint.h-for-various-std-c99-int-types.patch | 25 -------------------
 .../recipes-benchmark/iperf3/iperf3_3.2.bb    |  1 -
 2 files changed, 26 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/0001-include-stdint.h-for-various-std-c99-int-types.patch

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3/0001-include-stdint.h-for-various-std-c99-int-types.patch b/meta-oe/recipes-benchmark/iperf3/iperf3/0001-include-stdint.h-for-various-std-c99-int-types.patch
deleted file mode 100644
index 599ee1dfb7..0000000000
--- a/meta-oe/recipes-benchmark/iperf3/iperf3/0001-include-stdint.h-for-various-std-c99-int-types.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From be653711fb92d2430b3ecc546b4e3ad927d19ec5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 14 Jul 2017 12:59:42 -0700
-Subject: [PATCH 1/2] include stdint.h for various std c99 int types
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/timer.h | 1 +
- 1 file changed, 1 insertions(+)
-
-diff --git a/src/timer.h b/src/timer.h
-index 0f9c5eb..0b195be 100644
---- a/src/timer.h
-+++ b/src/timer.h
-@@ -31,6 +31,7 @@
- #define __TIMER_H
- 
- #include <sys/time.h>
-+#include <stdint.h>
- 
- /* TimerClientData is an opaque value that tags along with a timer.  The
- ** client can use it for whatever, and it gets passed to the callback when
--- 
-2.13.3
-
diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.2.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.2.bb
index 4d1b0c4370..2ed08110f4 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.2.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.2.bb
@@ -15,7 +15,6 @@ DEPENDS = "openssl"
 
 SRC_URI = "git://github.com/esnet/iperf.git \
            file://automake-foreign.patch \
-           file://0001-include-stdint.h-for-various-std-c99-int-types.patch \
            file://0002-Remove-pg-from-profile_CFLAGS.patch \
            "
 
-- 
2.17.0


