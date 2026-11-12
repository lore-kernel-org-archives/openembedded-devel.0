Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8432.1794467641499279943
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 23:14:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Up6so4dD;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ccca948203aso1900552a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 23:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794467641; x=1795072441; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wOP29ozpki2ZcLEcdAReRlCMfqJh2G7tO+pqYnkedD4=;
        b=Up6so4dDxe3QkK/9b4v8Z8Eo0e8NnZA1s5CcuPwBaRFdypvRD0eQO4W3agQz/pEX8a
         BvSu51JI+DrAs0Tmwn8JFZQdJPQQV82B3fjYfleFhivjazRxOA9HR+rZDETmBMPwxWZX
         w/Tihovn0cYBUwURa9L1clT2TZjpum8TUS8fHcpjMu4varW9d3INVWOckXz81Ro6fA3r
         0ha5gv21Ounbf4LfzUNpqWewreJl03tWvFwBAQr0qrTeAVAlH0WIgHh6ekM8VP49fq4b
         BouY9uK64rdrsgG420y0iJH0aKmHe2W8O5kFxnrLDwlFfYpu6VdlWibRGhe9T4SiCp5S
         +naQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794467641; x=1795072441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wOP29ozpki2ZcLEcdAReRlCMfqJh2G7tO+pqYnkedD4=;
        b=nyVjc5WP/weT1MDpuBvz/kPzWev77PjszvhNU8xjv2AUVIPDi30fpsAgqfERrMV8vs
         A4vuMqL1ot/TAcaEbnuRUZ1S/o4T+gVrhE9/StGf7HEyIeCqji+6Ds9h2x8NJQrD5qN3
         0RCN1MFoubT6/vtFl/SnBwLT4C/wJWbby88yxGiC8b7MrqgL20W4AypSqxmkm/VNemOW
         xJjq2wCyZW4UNL0/kUZpqMQPvbs+hnWwtDKGYkUW8eH/n1AxP5VRlP5uJK3LDtrXanHc
         3Pp1O7ivM5+KBA8I53T0U+RFhsZiK+bLQltXC77aDqgh/ktVowvvPbm1tTHMiMLBSbOz
         mMNQ==
X-Gm-Message-State: APuU4Z+nqPu163XFhgADZi3VHhWOmSAykBL1twBZFY9WYRDIPnCZYswC
	/dxAl+jGR8PLSKSxZo/WUQ3++vUxMVdUZyEUk7GCu+fGajZ2ROE1H9vpK8yfug==
X-Gm-Gg: AYBFou0wORQ1WZ48yoUfQ4Jdg+k+jjFWIV2EwIDqfhBX8n/bEmjrZFpC9xLFsHEhdMq
	9k4Eq7BwNHeWpuolQOBlFXapRIAe2/InY4J6DMYlVNICVsDbABYlVgeEqxh3aabPD7YG8Gyr4a3
	pL5Rm9kUM4PcQATU8I5L5Q0uw6WOWs6VSFAt5L65R4FUUh3+q1zLW2EM8NZGA8I6ki250agwfpd
	ZdTESyCwwUfMJ4d951Z9UB2/orGe6gHmIur9gYplryvqD8Xe1BKcSmcXJ4Id4hecQRhLSxxExgh
	BuqrsvQvTp/xuWE130vod39WjzWBLidbBCXAFgDezKpQb6aDyoSfLYTo4Od9Xza+ESMHJFIeTzc
	JBHjL03yqtz1WubpDIhB/UCz0gW+dh8Ao+yd7exiN31tVSo+6M/i/lA8hITPdMv9J2C/xaSgP2L
	qHqPXjKtjF8mCrmMDwVbJXC9mfVIbY4+D7RScO5elpgrBfD3Ms9Gw4M1rEyUHv40bWBvvKeTsg1
	E2Q5QHSkvxnOp1EAW5ZH6QK//ereRmnfsqksTPA/EjzMe23+0B6682DzfMt7xL7XZz5nGhR/rxX
	7qrE2GcXtzFmLtFPGU2CEcLaDYFbx+30C0PKFKjHk6D5e5dZveQr+HKuAT9dRw==
X-Received: by 2002:a17:90b:2688:b0:3b0:9183:23ef with SMTP id 98e67ed59e1d1-3b182dea8bcmr4794379a91.3.1794467640681;
        Wed, 11 Nov 2026 23:14:00 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d7e062sm29018355ad.35.2026.11.11.23.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:14:00 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 2/6] apitrace: patch CVE-2026-126050
Date: Thu, 12 Nov 2026 20:13:44 +1300
Message-ID: <20261112071348.4144113-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112071348.4144113-1-ankur.tyagi85@gmail.com>
References: <20261112071348.4144113-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 07:14:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132201
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
