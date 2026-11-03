Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1470.1793731020430326833
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 10:37:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=r+JsyKtW;
 spf=pass (domain: gmail.com, ip: 74.125.82.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-14394530ec6so6016807c88.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 10:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793731020; x=1794335820; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vv+qq1xGI2tbBnqb00T86xWIH/IIIPqzmiMY+KKRtBA=;
        b=r+JsyKtWVw0m47henD5hfP1h2dBL+5dEIi1GeJb6ckDFWrSXct20DwBvhrVGv1aWhb
         3GaXya7zCELM6XIQO0TzGYUI4RLUVgWyWIwW+/q6iayz5cUo7j1fgRPUaiktMsSwgxB2
         qmyNJDbrVyAFbk4is356F32VLhA384Q0a2ETnA5ZqhdEBaFlPbc6kThHO5jCNMcZtr/Z
         SIxKETEUzjBv6LWYoVMabf+ucQmADv6aJlZ906TSesE8pMLr5LtL1H7PtjRY4FePZuD6
         drCG/4hnf0k54ftAlyWCg780tfFq3OVRgU4Id3J3yFNaa3NMKtlAB5ucWZC3rrSE0vSr
         Hb3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793731020; x=1794335820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vv+qq1xGI2tbBnqb00T86xWIH/IIIPqzmiMY+KKRtBA=;
        b=q7dKOx1EabxAFb7kYXOni8Uip3Nu+UX0ZApFN0Ll22vth+rRVrBk3IrwJwBqJDiXIO
         dAhix6VCI6lLacDNog1E4JUNEZK+dJra3oTK6gUyaLCZCyATH8TVbDVxwMyvT9af6E0J
         4GIdVqQiAjFq19XmC2kjdvPFo6zvDcJuE6VexBqn0ttwtbS7Jz5q6vw55xlU1ViIGf2F
         /7V033bLaC9M0LVA7VmpHWPseBq8pTWOR1plc49MFDz4I89ZU8Fy3YUpOC+mGp3WSOUQ
         Q0QXUh/EEOVqcw2V3arK0uPBwtsTbtKl+fZI52FCc3KpgEw9nt7Jx6JvpPo8cKg+r+Sv
         RWTQ==
X-Gm-Message-State: APuU4Z8QrGwYf/UBtc7o16hv2b0gIFCsSC7GzpMpSKKTJwOFLbeddRp9
	qa0VoWVQCV+UIYjyGIuLbenGnzxvuZPX58iIkINBbuUPxiIfP8KU2CxTwjQNyw==
X-Gm-Gg: AYBFou2Vz6Nqk8y3kTeCncM85dHtXs9KQTxxqqRGMh/MENxnt69QrXMIgsZ6AP6Z+g5
	PiYxxU3ga9OnO8OaxhmrMDaRpsW02yIAhTb7e28rAOv4J/5EEqjdHbuKom70mIUVqdMnkGg0hv6
	G9hcmwh2jP6OIPLWZHs9mDPhL0AtnyPxNQ3IppEPV8Q0VL4HdunLWwUs+E6rhr9MbLmDjPiwmTm
	uAlHUbfn9QMbIh3W2rlu6VqIPQprHlV/huPlcMMUr2pkL5Et7llZhyiN8gxbp4nVNBu/sxxeRat
	FugvnGtmIvWWGDt/TDH6UVXdtVkepX9opVgGwRYaGGfeneuOA+0ERxpv/U8U7TnagCpPQ7oNSU/
	LVs3jUxn4p5Ykal3yxwHL1Ml5zvnee6Sr0a/wV+HSSTIfc4dOqN5Bmck6gManoKPheRpqZbqd5O
	RcIiykalfbO01/9OKv3j7NiUig+2/4CIizKMMKLQFNByiFSgqTksUhSCNqHOd67dCFW3hyVThJo
	oi/8Rr7bOs0aOCk7lm9tVxW1wVcN6tdjQtvWNMr9gCK5YJO+M8YnxdwOOVdozN9+PDmKiO4zIh+
	0nyjdqn6sUv87WOu5zlWgx4xT1LZq7MOVUM2WK61UHVXa4BU1s0DNc99ecYD1w==
X-Received: by 2002:a05:701b:260b:b0:1b0:20:6444 with SMTP id a92af1059eb24-1b000206470mr15185343c88.39.1793731019531;
        Tue, 03 Nov 2026 10:36:59 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4f83fsm1192887c88.17.2026.11.03.10.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:36:59 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 7/20] ngtcp2: upgrade 1.25.0 -> 1.26.0
Date: Wed,  4 Nov 2026 07:36:27 +1300
Message-ID: <20261103183640.919438-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103183640.919438-1-ankur.tyagi85@gmail.com>
References: <20261103183640.919438-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 18:37:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131805
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Dropped patch that is part of the upstream version.

Changelog:
https://github.com/ngtcp2/ngtcp2/releases/tag/v1.26.0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...Do-not-truncate-file-sizes-on-32-bit.patch | 63 -------------------
 .../{ngtcp2_1.25.0.bb => ngtcp2_1.26.0.bb}    |  3 +-
 2 files changed, 1 insertion(+), 65 deletions(-)
 delete mode 100644 meta-networking/recipes-protocols/ngtcp2/ngtcp2/0001-examples-server-Do-not-truncate-file-sizes-on-32-bit.patch
 rename meta-networking/recipes-protocols/ngtcp2/{ngtcp2_1.25.0.bb => ngtcp2_1.26.0.bb} (86%)

diff --git a/meta-networking/recipes-protocols/ngtcp2/ngtcp2/0001-examples-server-Do-not-truncate-file-sizes-on-32-bit.patch b/meta-networking/recipes-protocols/ngtcp2/ngtcp2/0001-examples-server-Do-not-truncate-file-sizes-on-32-bit.patch
deleted file mode 100644
index 746663dc20..0000000000
--- a/meta-networking/recipes-protocols/ngtcp2/ngtcp2/0001-examples-server-Do-not-truncate-file-sizes-on-32-bit.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From: Khem Raj <khem.raj@oss.qualcomm.com>
-Date: Wed, 21 Oct 2026 09:00:00 -0700
-Subject: [PATCH] examples/server: Do not truncate file sizes on 32-bit
- targets
-
-FileEntry::len is a uint64_t, but it is used for mmap() and as the size
-of the resp_data std::span, both of which take a size_t. On targets
-where size_t is 32 bits, such as riscv32, clang rejects the narrowing in
-the span initializer:
-
-  examples/server.cc:236:54: error: non-constant-expression cannot be
-  narrowed from type 'uint64_t' (aka 'unsigned long long') to
-  'size_type' (aka 'unsigned int') in initializer list [-Wc++11-narrowing]
-
-The value is already truncated earlier, where st_size is cast to size_t
-before mmap(), so a file larger than the address space would be served
-with the wrong length.
-
-Store the length as a size_t, and fail open_file() with
-Error::INTEGER_OVERFLOW when the file is too large to map, instead of
-truncating its size.
-
-Upstream-Status: Submitted [https://github.com/ngtcp2/ngtcp2/pull/2330]
-Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
----
- examples/server.cc | 7 +++++++
- examples/server.h  | 2 +-
- 2 files changed, 8 insertions(+), 1 deletion(-)
-
---- a/examples/server.cc
-+++ b/examples/server.cc
-@@ -31,6 +31,8 @@
- #include <memory>
- #include <fstream>
- #include <iomanip>
-+#include <limits>
-+#include <utility>
- 
- #include <unistd.h>
- #include <getopt.h>
-@@ -216,6 +218,11 @@
-     close(fd);
-   } else {
-     fe.fd = fd;
-+    // A file larger than the address space cannot be mapped.
-+    if (std::cmp_greater(st.st_size, std::numeric_limits<size_t>::max())) {
-+      close(fd);
-+      return std::unexpected{Error::INTEGER_OVERFLOW};
-+    }
-     fe.len = static_cast<size_t>(st.st_size);
-     if (fe.len) {
-       fe.map = mmap(nullptr, fe.len, PROT_READ, MAP_SHARED, fd, 0);
---- a/examples/server.h
-+++ b/examples/server.h
-@@ -68,7 +68,7 @@
- };
- 
- struct FileEntry {
--  uint64_t len{};
-+  size_t len{};
-   void *map{};
-   int fd{};
-   uint8_t flags{};
diff --git a/meta-networking/recipes-protocols/ngtcp2/ngtcp2_1.25.0.bb b/meta-networking/recipes-protocols/ngtcp2/ngtcp2_1.26.0.bb
similarity index 86%
rename from meta-networking/recipes-protocols/ngtcp2/ngtcp2_1.25.0.bb
rename to meta-networking/recipes-protocols/ngtcp2/ngtcp2_1.26.0.bb
index a9d834a1b2..a11b510d10 100644
--- a/meta-networking/recipes-protocols/ngtcp2/ngtcp2_1.25.0.bb
+++ b/meta-networking/recipes-protocols/ngtcp2/ngtcp2_1.26.0.bb
@@ -5,9 +5,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=de0966c8ff4f62661a3da92967a75434"
 
 SRC_URI = "gitsm://github.com/ngtcp2/ngtcp2;protocol=https;branch=main;tag=v${PV} \
-           file://0001-examples-server-Do-not-truncate-file-sizes-on-32-bit.patch \
            "
-SRCREV = "f9e9ff01ad2c8116bc09de4f644b0028a61486a6"
+SRCREV = "6a22a4d7a111f6b52391910e40ad3681a09cfb9c"
 
 DEPENDS = "brotli libev nghttp3"
 
