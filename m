Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24BB2C54F51
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 01:30:57 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2030.1785288651803805592
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2026 18:30:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=l2Jkejql;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cad8076b01so6427835ad.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 18:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785288651; x=1785893451; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l3q01Yw0EAcA25lDFthfJEjpb6QbMQ65C2dWF3wp3nI=;
        b=l2Jkejqlfo3Wz5WDdjkALlHaYSsBzREODv1eRyLh9LVnT4pjRR3BXWG7ImHyYhY6fw
         uejkrXlz7ELfLnD+YeU9Va88xZ8huDB0wIw3daq7vZy4ky8osG4l9TJQLQPW7DgsWZ7M
         ++fRHtsTegmClwX9ZybgP/GSPhc+7xmQWN/pUjjnUA3mdnV0YJtJhPx7/6Axq3PbpDRq
         jq6ZqK377MSi2Bq6LCQs2ysVZjSY9jspuij/ZeW2Xnx5J2rZvqamTR4DBKMnut/mCPcr
         ykZtLs7uTv1q8OZMzXYNBAIHMlpvXuq+47m6VKd7vi2KmRny/oWS7xVz5GXxn71u2Jf7
         nRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785288651; x=1785893451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l3q01Yw0EAcA25lDFthfJEjpb6QbMQ65C2dWF3wp3nI=;
        b=SrgWk9r/GmbH2H2bhru6MpO1eYQs0pE+Rw1WOB1m4DlJ2v6DLJpvSMzaBqizHE+j9H
         SAW5gZ9qeFf+qU4iIxvJjprTaJ+9k8AwipJ6u7i2aOIZHOudD1czCr5CxSGQWGbqiQRt
         Tb1JyEk+tPNWv0Z9ozbF6HnTstkAIN7y4ZWBkZ641rV1IQ/gWPcU27jGU98JJpgsiYB7
         7c53NMNh7DmhVk6fjXGq+ceFcT8khqCpAPJvvNtFGqJDd9LBOFFXJk26qCbziFubrG3e
         9QmG8tUcjjRhRvqinE30PrEwRgn3YON4yyQvXV4VTLt7yiX4JmKro5vLKRIr8TIMIr5R
         Z16g==
X-Gm-Message-State: AOJu0Yxys5klIzLOaBm87SOZ2/xjnjfKV2RzOPUsqd3snKWlQeTEqT1W
	5t/s0Qcyz4TDXFF3U9EJjtVio1GuCHVFcWOIKyONnfF3ZsGG519iiuz1EtW8HAh2
X-Gm-Gg: AR+sD13+sIcFpI3BuLOLSh12Sa1kYnoMKmB1cJnvh2pohZVUXE+IMdFZ5BrehwaYsmf
	6vdXjEbI+6XZQsmWRPbz7aeQJbz2nnevGCMv8q2A6ESDpkNGNyx7AON7inZisYO0XL5EBeH2qZ9
	xgjy9UfFMIKpejIBNO2sBTl57va4EUnHjDPtsjMdhZrBa2RGk0FbyMpk3DLdBvt8oO5/2Py/tle
	42i6c/Ua/B4aq0k8EidDEo3m7C8ENQ0GoaQ7boWwnd84lT9rp98ZRNK2xpOcd00zReHNZF70xkS
	SK1iDIIcCsU+UIX4QTXJf3R4a2xloKsZ88cb6zv04uEakggZujC5e41qfGxQtHJaTzYevXMNKli
	7N5xjDR61uKwcsBh2uL1M9N8eIEm34YHMAPJJw194/wgga9cSUQ+atfycFtQWnfBeIHPa+bB4A2
	V1o1GLMNgylB1OUixm1mxJsXEq+03TtHOl/uYtoGT90nMa5PhI5XDmLYY7PEoNUm+CmXy9Lccyf
	BQcvyfDrunXr5O7XeSVVZwnoLQ2eFg7f10LjUDI7btyfOpYg9S6qF/6CCGQQehrSo8Ov2bwdzbP
	NClJIem9dZvCWYfTjI0/OHdDD7do8CJ95AMKxE+K0XKiTif8oOb4xIfMpuefLLEE75FUFVS2KAp
	MrA==
X-Received: by 2002:a05:6a20:d48f:b0:3c1:a0c:ab85 with SMTP id adf61e73a8af0-3c8ba694d9amr5630465637.76.1785288650992;
        Tue, 28 Jul 2026 18:30:50 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7263cfd9sm5069596c88.4.2026.07.28.18.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 18:30:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-filesystems][PATCH] fuse-archive: Fix build with libarchive where RPM is a format
Date: Tue, 28 Jul 2026 18:30:47 -0700
Message-ID: <20260729013047.42869-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 01:30:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128516

From: Khem Raj <raj.khem@gmail.com>

oe-core carries a backport of libarchive PR #2846 (see
0003-Convert-RPM-reader-into-a-proper-format-supporting-b.patch, added
for RPM 6 support) which converts the RPM reader from a filter into a
proper format. That drops archive_read_support_filter_rpm() from the
public API in favour of archive_read_support_format_rpm(), and
fuse-archive fails to compile:

  lib/reader.cc:509:9: error: use of undeclared identifier
      archive_read_support_filter_rpm

Add a patch selecting the available entry point at compile time.
ARCHIVE_FORMAT_RPM is defined by archive.h only in versions providing
the new format, so it is an exact feature test and the recipe keeps
building against both stock and patched libarchive.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ibarchive-builds-where-RPM-is-a-form.patch | 49 +++++++++++++++++++
 .../fuse-archive/fuse-archive_1.22.bb         |  4 +-
 2 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 meta-filesystems/recipes-filesystems/fuse-archive/fuse-archive/0001-reader-Support-libarchive-builds-where-RPM-is-a-form.patch

diff --git a/meta-filesystems/recipes-filesystems/fuse-archive/fuse-archive/0001-reader-Support-libarchive-builds-where-RPM-is-a-form.patch b/meta-filesystems/recipes-filesystems/fuse-archive/fuse-archive/0001-reader-Support-libarchive-builds-where-RPM-is-a-form.patch
new file mode 100644
index 0000000000..ae6d681509
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/fuse-archive/fuse-archive/0001-reader-Support-libarchive-builds-where-RPM-is-a-form.patch
@@ -0,0 +1,49 @@
+From 2d7f7e39af9d68360997434c7680a644d7127987 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 28 Jul 2026 18:00:36 -0700
+Subject: [PATCH] reader: Support libarchive builds where RPM is a format
+
+libarchive is moving the RPM reader from a filter to a proper format
+(libarchive PR #2846), which drops archive_read_support_filter_rpm()
+from the public API in favour of archive_read_support_format_rpm().
+Distributions carrying that change (e.g. OpenEmbedded, which needs it
+for RPM 6 support) fail to build fuse-archive with:
+
+  lib/reader.cc:509:9: error: use of undeclared identifier
+      'archive_read_support_filter_rpm'
+
+Pick the available API at compile time. ARCHIVE_FORMAT_RPM is defined by
+archive.h only in versions that provide the new format entry point, so it
+is a reliable feature test.
+
+The new format appends the payload decompression filter itself based on
+the RPM PAYLOADCOMPRESSOR tag, so the remaining registrations are kept
+unchanged and stay harmless.
+
+Reported upstream - https://github.com/google/fuse-archive/issues/63
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/reader.cc | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/lib/reader.cc b/lib/reader.cc
+index f336fa0..5bc3708 100644
+--- a/lib/reader.cc
++++ b/lib/reader.cc
+@@ -506,7 +506,13 @@ void Reader::SetRarFormat() {
+
+ void Reader::SetRpmFormat() {
+   Archive* const a = archive.get();
++#ifdef ARCHIVE_FORMAT_RPM
++  // Newer libarchive handles RPM as a format rather than as a filter, and
++  // appends the payload decompression filter itself.
++  Check(archive_read_support_format_rpm(a));
++#else
+   Check(archive_read_support_filter_rpm(a));
++#endif
+   Check(archive_read_support_filter_gzip(a));
+   Check(archive_read_support_filter_lzip(a));
+   Check(archive_read_support_filter_lzma(a));
diff --git a/meta-filesystems/recipes-filesystems/fuse-archive/fuse-archive_1.22.bb b/meta-filesystems/recipes-filesystems/fuse-archive/fuse-archive_1.22.bb
index a4daa47c50..729062adef 100644
--- a/meta-filesystems/recipes-filesystems/fuse-archive/fuse-archive_1.22.bb
+++ b/meta-filesystems/recipes-filesystems/fuse-archive/fuse-archive_1.22.bb
@@ -6,7 +6,9 @@ SECTION = "base"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"

-SRC_URI = "git://github.com/google/fuse-archive.git;branch=main;protocol=https;tag=v${PV}"
+SRC_URI = "git://github.com/google/fuse-archive.git;branch=main;protocol=https;tag=v${PV} \
+           file://0001-reader-Support-libarchive-builds-where-RPM-is-a-form.patch \
+           "
 SRCREV = "e218685189aabebb95d33e2542e2a122ea81392d"

 DEPENDS = "boost fuse3 libarchive"

