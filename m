Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1888.1795113452447908361
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:37:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=hHBZaq/z;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8b904d10882so71347b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113452; x=1795718252; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wOP29ozpki2ZcLEcdAReRlCMfqJh2G7tO+pqYnkedD4=;
        b=hHBZaq/zJuAk83W5bBw43MY6GC2gZKhaHq/KrBllqLAswDDLt2+H3SbCMjVajucFN2
         WCTpRfOjtpTiZa9qoUD6G7hwyZiqcHBHmQB/T8qN1Dfa+LLaPTu/ZcixaW+qvj46vjhD
         EnDKhmhqxXkmQKKimxg1AKrrxNAOQxG2jWLBT8GGqtGRs4pKxEIixIQBxRWr13syMRJg
         HqRBfYg/8kjCtEwc0pY5TZnKkySbp0jELYLCjF6ZXVxdf09WB3pxBq9nBiqknvsH22Oc
         Ri8knsgOD88NZbsw51sRZe6D6dUiJOXiGuV3mcR45fAid2aSvCX8yMV6UQRrZ8PcTRpT
         CcYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113452; x=1795718252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wOP29ozpki2ZcLEcdAReRlCMfqJh2G7tO+pqYnkedD4=;
        b=v9lLiwRgrgnYq0BOts/ALRMW+MkLzFP3WyQKPnsL/GpxxaZkc8gdUQC1PPCuxprcwA
         mco/hkNKY3pq7GTgnv0JWEUevwd0jdoVbYWu3l0GiQ/SZlMhtUKFeVLoZpWEv1NaOwNr
         pVE4SduI6A6IPzPY653XbqW0MYAHgroAkb9UT0xSP1f0OBgNwxD6yVcsR6qShLRJ4Wxu
         MRfcKiB0ghg4sFsU44/ePEwQv4WzZYlISpQt7ucNdqvfxnBiq0d8+u1oXaeXUCan3CPl
         d/CqxF8HnaLplpx+ikL6uNWhTNArPDPMK+J1ZvtzvsSKNdijskRkt5Esb4+A+VVx1VI+
         qtfA==
X-Gm-Message-State: APuU4Z9s6M0LVocv/afMZr/zfoe4YCIRMexW3Cnv3TRINZTpokKYbSw7
	fKqEAIx65VPJkIh6miGzXzsmIXv0AhyhdrBCKYvW2iGzOU9jFXh5pqCLh7jiIw==
X-Gm-Gg: AYBFou1FvfCKgLuXGGReOGp6IpV2E41y9/HtTG0r55dMhxf2hc0/GkpVyWCoGZi5MH/
	6YvR2SWo7HOsyMME2ZCqnHbQwcfIU8beXOP5KoYyIOfWRGEr3HJr/UfOMnPx9H+9CgQsX0iEhJm
	0BV+AMLeBj/2FJJIgdVppQT86UB4PXulvceksnAg2SfMXRW9QHa+l7/IgtLWyHsRFaEMjF3COrV
	qP5/V+s0TreoWuQtwBzNf3KNV2Cy0o2z9TtCmfv/HmrQcRWNHlGPmKbYbzzWbAMjM5OoqHI2Fwx
	3F4WdqDbZYi131gnkWFYDkk7aAzFx7LqcT9Nv9xVnOUptMvRoi/UR2y7/MepK3QYx08yYnqbHrg
	FTAJNtMnVdf1Y2Ve/yo1kj170omfo05mAppBznzvqG41A0nN1UEfspsmcaM0MV6GukvHEh8sJz/
	ZwJi915eVm21kJSiyI0ZNw7flDK//zpRGLOvhw5S+y+kv/NlCDTEJ0XWlNSs4BPQxgAzGLtxoDt
	n20X6TQWl3+VLC3/wABGMP7jnWeHcP1nmtBnsGeBhZLTjAM8m4WctKQXANufPcLGx1wwpBwfOcK
	1nxhaxI5WZ0oRz4N0kscjnDbIAbum3pVyWc85tKiIMqTkjbi3b9Entcf0sn8Lw==
X-Received: by 2002:a05:6a00:94fb:b0:891:3049:8ef8 with SMTP id d2e1a72fcca58-8c87d5169c8mr406662b3a.47.1795113451736;
        Thu, 19 Nov 2026 10:37:31 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:37:31 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 38/64] apitrace: patch CVE-2026-126050
Date: Fri, 20 Nov 2026 07:33:06 +1300
Message-ID: <6c648c710a18f8d4d2a4ca79d5a94b06209e25dc.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:37:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132728
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-126050

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../apitrace/apitrace/CVE-2026-126050.patch   | 39 +++++++++++++++++++
 .../apitrace/apitrace_14.0.bb                 |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/apitrace/apitrace/CVE-2026-126050.patch

diff --git a/meta-oe/recipes-devtools/apitrace/apitrace/CVE-2026-126050.patch b/meta-oe/recipes-devtools/apitrace/apitrace/CVE-2026-126050.patch
new file mode 100644
index 0000000000..4b0d3b2768
--- /dev/null
+++ b/meta-oe/recipes-devtools/apitrace/apitrace/CVE-2026-126050.patch
@@ -0,0 +1,39 @@
+From a7c7db06b56f22235eeea2da608ef84dd401f3b6 Mon Sep 17 00:00:00 2001
+From: Deus Rex research team <research@deusrex.ai>
+Date: Tue, 10 Nov 2026 13:05:32 +0000
+Subject: [PATCH] trace: Fix heap out-of-bounds write in
+ SnappyFile::flushReadCache().
+
+The Snappy trace reader takes each chunk's compressed length from a
+4-byte field in the file and reads that many bytes into
+m_compressedCache, a heap buffer allocated once with a fixed size of
+snappy::MaxCompressedLength(1 MiB) = 1223370 bytes.  The length is never
+compared with that size, so a .trace file that declares and supplies a
+longer chunk makes the read write past the end of the buffer.
+
+(cherry picked from commit 3890c5a448addfd75ccbe1bd09e3075de6fb3395)
+CVE: CVE-2026-126050.patch
+Upstream-Status: Backport [https://github.com/apitrace/apitrace/commit/3890c5a448addfd75ccbe1bd09e3075de6fb3395]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ lib/trace/trace_file_snappy.cpp | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/lib/trace/trace_file_snappy.cpp b/lib/trace/trace_file_snappy.cpp
+index 5b60ec9d..9b0a681d 100644
+--- a/lib/trace/trace_file_snappy.cpp
++++ b/lib/trace/trace_file_snappy.cpp
+@@ -224,6 +224,13 @@ void SnappyFile::flushReadCache(size_t skipLength)
+         return;
+     }
+ 
++    if (compressedLength > snappy::MaxCompressedLength(SNAPPY_CHUNK_SIZE)) {
++        std::cerr << "error: invalid compressed chunk length in trace\n";
++        m_stream.setstate(std::ios_base::failbit);
++        createCache(0);
++        return;
++    }
++
+     m_stream.read((char*)m_compressedCache, compressedLength);
+     if (m_stream.fail()) {
+         std::cerr << "warning: unexpected end of file while reading trace\n";
diff --git a/meta-oe/recipes-devtools/apitrace/apitrace_14.0.bb b/meta-oe/recipes-devtools/apitrace/apitrace_14.0.bb
index cb5ee92e04..7c51f45842 100644
--- a/meta-oe/recipes-devtools/apitrace/apitrace_14.0.bb
+++ b/meta-oe/recipes-devtools/apitrace/apitrace_14.0.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=aeb969185a143c3c25130bc2c3ef9a50 \
 SRCREV = "18cfd388ac47a9e00978b34d6c20341f3e2cdb56"
 SRC_URI = "gitsm://github.com/${BPN}/${BPN}.git;branch=master;protocol=https;tag=${PV} \
            file://0001-zstd-disable-the-x86-64-BMI2-assembly-fast-loops.patch \
+           file://CVE-2026-126050.patch \
            "
 
 DEPENDS += "zlib libpng python3-native"
