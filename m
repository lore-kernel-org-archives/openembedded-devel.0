Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47681CCD183
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 19:06:09 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.8691.1760036759250809633
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Oct 2025 12:05:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kNSwVWCr;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6394b4ff908so2427851a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 12:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760036758; x=1760641558; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rpPFSg6ssXK0QxXAhqD6/rW7W8DYcr+BXrk/JdOMeGE=;
        b=kNSwVWCrLU7/cqTRUjEo9SA672IckJiYIIvzmhu6eI1xJrSakFSe1beQFqQ38gtVp0
         OV2JgULgxM5YzQPjWthX4aLWBJWZf99APPOHypkuY0WNnDporXHOnztN3rjWo77jcRFA
         4g0ZyjMBqIiJbA44EVWJ5ivUYlYtS/Pwvqsz9d2EoHeEXvnG5uBVmhLl+b6Tsc9GdBT3
         zVC6v6WNB9h9lcZrGKfXDaMN/whgNCATY2ow0YglzqGwBGeyyN2h+IijWC0B0NfhkPaJ
         EfF6SyFKSvwJPWXmVUCqOjv66eNtzWsrZN/64TQ5513EPptbAhDeV3rkQcbNJFFu6Qb+
         Bxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760036758; x=1760641558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rpPFSg6ssXK0QxXAhqD6/rW7W8DYcr+BXrk/JdOMeGE=;
        b=bRG2zjpsnxxMUwJWg5o53wdYy4ccvd2+xMRfwZ57FdaO3OiLFC2tWirXDs0vBUPhB7
         JZJb/nyf8ictXV6NNGz7CW8uq3Tfmstqb7cffZ27ohnRBlSuihcz5SLZaDfk3Z3dt7Tq
         vT3GbGTBK2KTBzdQ1c0nAjCOd2ImyDM7nrCEH3rpjbehd4D9p/O1Wid3Q3QSpkrNSrTj
         SzuHfJurkTRjzkEPqneEtlq/5WbAWIojYbYycZ9nyD9AMJDPJv2KGlzupQTKn1fOJohU
         m0yYHu2eIrb6ZYo8cKi2fh7k+r6+nr8C0wBnyFCO04vOrvOb7PPup8A3DMGeQC9puedm
         tH4Q==
X-Gm-Message-State: AOJu0YyfczFC4DKIdt39q7NnCZLj55Rqp5MhiKnqy5sMMG1PyDMMviof
	hHFKyL8cNBoSEkxs6m596IZqpXRt3bab3pFAIdWaR4KfHmht45xPBzqILLAx1Q==
X-Gm-Gg: ASbGncsPsA5Js74y9XDKDUY8Dr5KapjjH9PqwRobil/tZNw/WnbhVACQn1VMde9qGgG
	U8o2Vhhp9FYxNA9pvBFMh1Y/KVimJumD9Q9arDTZ1J05I2ZIoGAaiT2pWJowhcLJ5EEbt6EkQ+2
	XAxm9KQrNvmlp3o7d/z1pgbEFtMks5CMojrTWeJprkp/iDgV9+nIk5R4NBvyw8mJ/hnrKWN8+B4
	tvFgolY+EUwe8LT9anZ+ygzT4jeA5mYulxy9h9N/vsCrrTzfv3mweVBdFXnSY8bIhtFIDgItIIM
	bZh2q4lmoUEr/mvETSlkfugtKTR9hZOWniMs9U/KKvo028GpXg5KELKrdesZdtB+iZ+ZBt3eupX
	w4u6sAaZcmcyybdTWjw/xdabgk/cKxYVUvm+1z5PCWuWjqM9mctKBYfZsZVH766PyXQ==
X-Google-Smtp-Source: AGHT+IHiIOEjnN0sH1z0Mtx1A/5TXpeOGBp4SiwAAgz8zUJgrjuUewQhi6LHG4CDEOff/gWUmIYG0g==
X-Received: by 2002:a05:6402:848:b0:637:8faa:9e0a with SMTP id 4fb4d7f45d1cf-639d5c5a3d4mr7713304a12.30.1760036757484;
        Thu, 09 Oct 2025 12:05:57 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5235e924sm407511a12.3.2025.10.09.12.05.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 12:05:57 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][scarthgap][PATCH] libavif: patch CVE-2025-48174
Date: Thu,  9 Oct 2025 21:05:56 +0200
Message-ID: <20251009190556.1552672-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 19:06:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120449

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-48174

Backport the pull request mentioned in the details of the CVE.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...d-integer-overflow-check-to-makeRoom.patch | 27 +++++++++++++++++++
 .../libavif/libavif_1.0.1.bb                  |  4 ++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/libavif/libavif/0001-Add-integer-overflow-check-to-makeRoom.patch

diff --git a/meta-multimedia/recipes-multimedia/libavif/libavif/0001-Add-integer-overflow-check-to-makeRoom.patch b/meta-multimedia/recipes-multimedia/libavif/libavif/0001-Add-integer-overflow-check-to-makeRoom.patch
new file mode 100644
index 0000000000..7d16cefa49
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libavif/libavif/0001-Add-integer-overflow-check-to-makeRoom.patch
@@ -0,0 +1,27 @@
+From 240256b05f9ff4c6d0afbcd6d4c9059037227e56 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Thu, 9 Oct 2025 20:50:57 +0200
+Subject: [PATCH] Add integer overflow check to makeRoom.
+
+CVE: CVE-2025-48174
+Upstream-Status: Backport [https://github.com/AOMediaCodec/libavif/pull/2768]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/stream.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/stream.c b/src/stream.c
+index c85ca31b..b38c93c6 100644
+--- a/src/stream.c
++++ b/src/stream.c
+@@ -319,6 +319,9 @@ avifBool avifROStreamReadAndEnforceVersion(avifROStream * stream, uint8_t enforc
+ #define AVIF_STREAM_BUFFER_INCREMENT (1024 * 1024)
+ static avifResult makeRoom(avifRWStream * stream, size_t size)
+ {
++    if (size > SIZE_MAX - stream->offset) {
++        return AVIF_RESULT_OUT_OF_MEMORY;
++    }
+     size_t neededSize = stream->offset + size;
+     size_t newSize = stream->raw->size;
+     while (newSize < neededSize) {
diff --git a/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb b/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb
index 885758b6a4..fa1c166eef 100644
--- a/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb
+++ b/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb
@@ -4,7 +4,9 @@ SECTION = "libs"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c528b75b07425b5c1d2e34de98c397b5"
 
-SRC_URI = "git://github.com/AOMediaCodec/libavif.git;protocol=https;branch=v1.0.x"
+SRC_URI = "git://github.com/AOMediaCodec/libavif.git;protocol=https;branch=v1.0.x \
+           file://0001-Add-integer-overflow-check-to-makeRoom.patch \
+           "
 
 S = "${WORKDIR}/git"
 SRCREV = "d1c26facaf5a8a97919ceee06814d05d10e25622"

