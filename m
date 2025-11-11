Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65FC2CCFA1E
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 04:31:35 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10091.1762835494357748431
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Nov 2025 20:31:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lpbqkuiK;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-295ceaf8dacso38823105ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Nov 2025 20:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762835493; x=1763440293; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qgaISQU6anN6Ruwunmnt6Hnp2Pj/PKdDwyNMvsZ4D8s=;
        b=lpbqkuiKkNCGppqvciG9wnjE90pIOn939E3nmdG7R6Sr7Jgyfpi6UNf6aCkPiDTaZ1
         V+kxZ9Yh07IhXa9ZANIHAvE/9cuQBrPtShVwOMoBT/ai+R13fZVuwqaHrtSxLEbc2Drl
         KkL4/fON2nUjoSoWSY8yzZWYwxgcJqnAw2n8pQYGB6Ecehwh6h4f3stqRleY/fRc9RHb
         WymM7mgrFm5YA6/6/of+lLv1Wd5H/NqKbBQodCaozaUVgD2hII/QpkxDHVlBsJx8Q6SR
         YOdVH979rFViIdH+03WSRs4wdrHxv+am5B5S7RRYrZGfCFKYkgB76uhU12Kj4Ls2xP3j
         LWMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762835493; x=1763440293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qgaISQU6anN6Ruwunmnt6Hnp2Pj/PKdDwyNMvsZ4D8s=;
        b=BQx1I8Nf06wROhAwpCLWi5LlkSkxjNEanSVbbyYyb0IDPuWlcegYS/adncHbN5cG/T
         6TSfylazmo0R9aC8Gne8SnU3Sxt1QkoEC80ZZmYDOtIdkk/WNP5t+wp+x3FsttBGGP9a
         L9Pzx4rcypPbzHV8N2utbTPa7bYiXIk6BW6ReZTMoV1gC9DYxiiZe6skRIbzt2Pojy2a
         eam2DWlMJp2G7d+JmLKR/+VRln5edW/U9M4QZJ0WEtQHcBWxvtHugmFZ5xqY0OF265XJ
         Qe44FTFuJ6VE/F3w1+3qRuYmmKITrE76k3xjyL1zCEb7NfGv7czMGVYAHglFQbilsfN8
         prZg==
X-Gm-Message-State: AOJu0YynDSnoQ1qC1a/be23rymYejE5L75eG+U3pQDQVVeIdEFjfbhK7
	aRTRUKMkqMz8pj/hERc7JcrPnb4cr9QX0sK8m21ytkZx1lYpwZz2p1h/6QSu5T6AHmc=
X-Gm-Gg: ASbGnctNAcn5MN1AP3HR4CCtahPxs5PJI9WNYRDuX+P3hSL+JO9Dq+OLZPtwjXcs3gL
	05PJRvnAxeaw/YaDB0cH968B46knUswN8MIc242pvL2Pev0ZQudLpq6vEsJjOk1C3C/JpLhzltj
	4sgWxY+yg9ybfnxeFbuDfEQhchfT8H27LdwsC190KFX1wA2YhTdZse1ND6p2TTSJfRIUv4o993k
	UTa70yTuePXhg+FcmifymOjxxaoEM84eL5laoNTjx5BQVEcu33/25FEYmYqAmLn0DYEXq4IA4d/
	RtDusz7UXNzwjSZEfGh0GjxUCRBSzO8j4Jd/4iqGLU/aExYEXKIl7pz2YcquGcFfE/0KLoCMT2B
	wpjsyO6eO00gwqqipjYH6Jekj+ttZIwo4bbNLFXHJoqCv6mt+dF7cOA4IjzCAbI91FkegjbKaEH
	sIsWNPs9RhaMMJq7tXQYD3kl3N9Itw8xEO8AgsctlY960G1ngWyziDdNMzRl4+2I1TBHAoEbGO
X-Google-Smtp-Source: AGHT+IGt1eWC/gr3TKTnnotkl9JTD3Frr2m94JQlierWascSWMFZu+kcB5jhwk35vREQUaugvQh8pw==
X-Received: by 2002:a17:902:d491:b0:295:5668:2f27 with SMTP id d9443c01a7336-297e54131d2mr123934465ad.9.1762835493430;
        Mon, 10 Nov 2025 20:31:33 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651ca1b8csm167771415ad.85.2025.11.10.20.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 20:31:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 3/4] snort3: Upgrade to 3.9.7.0
Date: Mon, 10 Nov 2025 20:31:26 -0800
Message-ID: <20251111043128.3063095-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251111043128.3063095-1-raj.khem@gmail.com>
References: <20251111043128.3063095-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 04:31:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121476

Fix build with C23 glibc while here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../snort/snort3/0001-Fix-build-on-c23.patch  | 43 +++++++++++++++++++
 .../{snort3_3.9.1.0.bb => snort3_3.9.7.0.bb}  |  8 ++--
 2 files changed, 48 insertions(+), 3 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/snort/snort3/0001-Fix-build-on-c23.patch
 rename meta-networking/recipes-connectivity/snort/{snort3_3.9.1.0.bb => snort3_3.9.7.0.bb} (85%)

diff --git a/meta-networking/recipes-connectivity/snort/snort3/0001-Fix-build-on-c23.patch b/meta-networking/recipes-connectivity/snort/snort3/0001-Fix-build-on-c23.patch
new file mode 100644
index 0000000000..884a4b8fe6
--- /dev/null
+++ b/meta-networking/recipes-connectivity/snort/snort3/0001-Fix-build-on-c23.patch
@@ -0,0 +1,43 @@
+From ae5566a7df4851bd47081ef0e00e2a0513b7f331 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 10 Nov 2025 19:41:16 -0800
+Subject: [PATCH] Fix build on c23
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+C23/glibc is now including once_init in stdlib.h
+
+https://patchwork.sourceware.org/project/glibc/patch/78061085-f04a-0c45-107b-5a8a15521083@redhat.com/#213088
+
+This is a name collision with the new C once_flag/call_once that
+glibc exposes (via <stdlib.h>) and C++’s std::once_flag/std::call_once
+
+Upstream-Status: Submitted [https://github.com/snort3/snort3/pull/431]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/loggers/alert_fast.cc | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/loggers/alert_fast.cc b/src/loggers/alert_fast.cc
+index 7b5deab2..3f88bff6 100644
+--- a/src/loggers/alert_fast.cc
++++ b/src/loggers/alert_fast.cc
+@@ -53,7 +53,7 @@ using namespace std;
+ #define FAST_BUF (4*K_BYTES)
+
+ static THREAD_LOCAL TextLog* fast_log = nullptr;
+-static once_flag init_flag;
++static std::once_flag init_flag;
+
+ #define S_NAME "alert_fast"
+ #define F_NAME S_NAME ".txt"
+@@ -319,7 +319,7 @@ void FastLogger::set_buffer_ids(Inspector* gadget)
+ const BufferIds& FastLogger::get_buffer_ids(Inspector* gadget, Packet* p)
+ {
+     // lazy init required because loggers don't have a configure (yet)
+-    call_once(init_flag, set_buffer_ids, gadget);
++    std::call_once(init_flag, set_buffer_ids, gadget);
+
+     InspectionBuffer buf;
+     const std::vector<unsigned>& idv =
diff --git a/meta-networking/recipes-connectivity/snort/snort3_3.9.1.0.bb b/meta-networking/recipes-connectivity/snort/snort3_3.9.7.0.bb
similarity index 85%
rename from meta-networking/recipes-connectivity/snort/snort3_3.9.1.0.bb
rename to meta-networking/recipes-connectivity/snort/snort3_3.9.7.0.bb
index 598b1f4dfb..64a63ce918 100644
--- a/meta-networking/recipes-connectivity/snort/snort3_3.9.1.0.bb
+++ b/meta-networking/recipes-connectivity/snort/snort3_3.9.7.0.bb
@@ -7,11 +7,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=78fa8ef966b48fbf9095e13cc92377c5"

 DEPENDS = "flex-native hwloc libdaq libdnet libpcap libpcre libtirpc libunwind luajit zlib"

-SRC_URI = "git://github.com/snort3/snort3.git;protocol=https;branch=master \
+SRC_URI = "git://github.com/snort3/snort3.git;protocol=https;branch=master;tag=${PV} \
            file://0001-cmake-Check-for-HP-libunwind.patch \
-           file://0001-cmake-Pass-noline-flag-to-flex.patch"
+           file://0001-cmake-Pass-noline-flag-to-flex.patch \
+		   file://0001-Fix-build-on-c23.patch \
+		  "

-SRCREV = "6730d53f99f3714654804d07203f33e6b1b8a107"
+SRCREV = "892f9f3b04d604797851d60e89d6cfe640a047cd"

 PACKAGES =+ "${PN}-scripts"


