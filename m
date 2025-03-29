Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20CE1C28B20
	for <webhook@archiver.kernel.org>; Sat, 29 Mar 2025 02:40:03 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.4121.1743216000664272550
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Mar 2025 19:40:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Cpp91+OH;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-223a7065ff8so22750285ad.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Mar 2025 19:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743216000; x=1743820800; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SCU+k1cU294IF49QclAMArjCRba75S4jTR0jiXEDTcg=;
        b=Cpp91+OHSkh1h2HGYIX95dyCngr1cU+rrHVich/lJ/RFaSVGCW5eXHy0maPYIhk+/+
         HC4iLexRcOtONukOQWsXkeini956Mw4Zo7mkflJbPGIquqvQCFbWrO2B+dSqZj4WXz1E
         RXci4zaqG2B1hb+QAUj9XZ9h8dN0iEL7eTBQKzLKSrRksT+MqQQh1me67CBd/QjG6Nwo
         SaKWsCxYKhgXqaffhAW2H+Nueq1ZJiZaoA7GYxPEMvnfHg9MO+XStQDrBTlkkZ1tNVT/
         29Dx0tyKuaA7FfGWYgdSwxbnRYFpklhpIUFRiaqS69rbjSoMGOMJlpGdDPD1hPFPG81u
         fwJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743216000; x=1743820800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SCU+k1cU294IF49QclAMArjCRba75S4jTR0jiXEDTcg=;
        b=teF2+Pw3Uk+3LQ+4NMlQpRpFslFA3UWmz8tBdynSiHIGLiY64w1Q2NJULR7S6s6Vfg
         xlPGyNU6xHl9bwga4lGDfEj+li6a522COeiAgH8zHLugMTLs6rjpqjeorFXsPE4PHq7Z
         lrQd83GmorCHrki09j3JLAdGodFESWVqDbMhYSQrMmlLBsSwxvdZ8Mu79m3fead23zJP
         tlrJ5uEP+K1pjV5gLze6CrN+H0kRGlxZ96z424gyWT+26AadB1r5vmbsQ0xbnOv/ngxi
         JFK7+Wm2zjoeoAvQMPJ8ngbdJuUyV9UZd3HPX7q5ntUNX9jaXN9exqStONVVQPT4Qw8z
         OHGg==
X-Gm-Message-State: AOJu0Ywgp6dKsNcib+vEdsacBPjVvUDzC/8adHj6EkvWAdgbktm0bjuF
	2nx+ttK1Lk56B4c4iFnqJQ7cvMlFXi41sPNSnDEU705Sj9xrnF75GXy/WAdP
X-Gm-Gg: ASbGnctYRAzQy6XiWKSU5iVrd5DjiaQYsC7lLQV82mME4TotYnNRs9+fGzJcT0LJme0
	X3TK0/fZHJuQFjrITBxxtcIkkevB/Uw6uDy102rohRLiRNIVN19y9KxEEk4rfwkshRfRLjwSrMQ
	f/ZpWQxzKjFzFQHVghF8toUuNoJypb/3dUkmXhozJEc3Z53LcredOCA+ogY1hHDKZ2r8EhYTKTd
	krYBTEz1qwr5ovs+r4xzQe4NeWU8ng3WerQ2cNkkOY4VWI0qqThmfAQqDUaTmnyNjcyky1z4gjX
	9TDN14QzbyoFmJ8zRIZKXIeKhuWrlN7Eu2hO
X-Google-Smtp-Source: AGHT+IEIhSu39GB8iGGXAHyklAYy3GRc1KK6oTKzso1GEADaewdL/obqTZ32p3kLZnzfuXPofx9fZw==
X-Received: by 2002:a17:903:2b07:b0:21f:7e12:5642 with SMTP id d9443c01a7336-2292f95bd73mr20996525ad.18.1743215999519;
        Fri, 28 Mar 2025 19:39:59 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::f147])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1f5fb5sm25756025ad.212.2025.03.28.19.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 19:39:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Randy MacLeod <Randy.MacLeod@windriver.com>
Subject: [meta-oe][PATCH v2] iperf2: Add _GNU_SOURCE in checksums.c
Date: Fri, 28 Mar 2025 19:39:56 -0700
Message-ID: <20250329023956.2726224-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Mar 2025 02:40:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116364

glibc defines struct udphdr as a union where members have aliased names

uh_sport -> source
uh_dport -> uh_dport
uh_dport -> len
check -> check

But musl only defines the aliases if _GNU_SOURCE is defined, ideally
iperf2 should be using uh_* names of the members so it is portable across
musl and glibc but thats for upstream to consider.

Fixes
| ../../iperf-2.2.1/src/checksums.c:175:19: error: no member named 'check' in 'struct udphdr'
|   175 |     if (!udp_hdr->check) {
|       |          ~~~~~~~  ^
| 1 error generated.
| make[2]: *** [Makefile:539: checksums.o] Error 1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Randy MacLeod <Randy.MacLeod@windriver.com>
---
v2: Use a backport

 ...-buildroot-linux-breakage-ticket-342.patch | 26 +++++++++++++++++++
 .../recipes-benchmark/iperf2/iperf2_2.2.1.bb  |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/iperf2/iperf2/0001-fix-for-buildroot-linux-breakage-ticket-342.patch

diff --git a/meta-oe/recipes-benchmark/iperf2/iperf2/0001-fix-for-buildroot-linux-breakage-ticket-342.patch b/meta-oe/recipes-benchmark/iperf2/iperf2/0001-fix-for-buildroot-linux-breakage-ticket-342.patch
new file mode 100644
index 0000000000..0a6bc7150b
--- /dev/null
+++ b/meta-oe/recipes-benchmark/iperf2/iperf2/0001-fix-for-buildroot-linux-breakage-ticket-342.patch
@@ -0,0 +1,26 @@
+From a25566dd66fb0ca951b3b6f6fa5a4bfaac276c71 Mon Sep 17 00:00:00 2001
+From: Robert McMahon <rjmcmahon@rjmcmahon.com>
+Date: Tue, 12 Nov 2024 12:06:54 -0800
+Subject: [PATCH] fix for buildroot linux breakage, ticket 342
+
+Upstream-Status: Backport [https://sourceforge.net/p/iperf2/code/ci/a25566dd66fb0ca951b3b6f6fa5a4bfaac276c71/]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/checksums.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/checksums.c b/src/checksums.c
+index 852f1952..d7a8109e 100644
+--- a/src/checksums.c
++++ b/src/checksums.c
+@@ -47,6 +47,9 @@
+  * by Robert J. McMahon (rjmcmahon@rjmcmahon.com, bob.mcmahon@broadcom.com)
+  * -------------------------------------------------------------------
+  */
++#ifndef _GNU_SOURCE
++#define _GNU_SOURCE
++#endif
+ #include "headers.h"
+ 
+ /*
diff --git a/meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb b/meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb
index a439616ba4..c353ce02e1 100644
--- a/meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb
+++ b/meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb
@@ -5,6 +5,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e136a7b2560d80bcbf0d9b3e1356ecff"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/iperf-${PV}.tar.gz \
+           file://0001-fix-for-buildroot-linux-breakage-ticket-342.patch \
 "
 
 SRC_URI[sha256sum] = "754ab0a7e28033dbea81308ef424bc7df4d6e2fe31b60cc536b61b51fefbd8fb"

