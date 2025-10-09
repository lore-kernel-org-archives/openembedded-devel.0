Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C8ADCCD183
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 19:00:39 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.8525.1760036429735200922
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Oct 2025 12:00:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ATC2xQtU;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-631df7b2dffso3197618a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 12:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760036428; x=1760641228; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hNrIw5hRtBZspuvrL+1Yp8J4PwnNOkpNm1Y9VuU9PJQ=;
        b=ATC2xQtUh0zJbLAifqpY5kpwc6iGOzyG7uhsbpOMlfqZFwL7KkiRZrsf5YVD/lUa4M
         yOuDMExh4nrFILrvSBKi9f6l4O0vYreLMnurjoAsY+E4SoEao0TCk8jG87enQSYU9mVQ
         seyMHD0hPW+c9OjoM7Lbfzoitvz8gmAsgABsYKhaaFgCQoDAd4CX4lD5Dq2aqnnMvyrC
         vpKWsMEZTXfN+wHiqLJ9EQPtAfP95f5HsQlknn7JahLV9/HFsVwzOvzXS/D5y2v2MkLD
         xMkCOPM1iIp445t6/C0Tb3/el5DepRWSn7qqP4oYX4OmysxOBO2kyQ9cMRxOdLuUB8dW
         sxbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760036428; x=1760641228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hNrIw5hRtBZspuvrL+1Yp8J4PwnNOkpNm1Y9VuU9PJQ=;
        b=TIdCbbdUdbRJc4p8npOAagati+zlSXIn4Hv1/JyvjEgtXwnk3fzJHEzUFABDXWNb0Q
         yopc96i3lHHaQtj5jDolSl/ryrdmSkzps9E8azVoJVhkUiCMLu1dZpxJIdt0ob5vW/lH
         VJuyhMdwA0vP/lwpaQVvsQcHWI9HqUxGHmYXZT47xn89CFPHtfYYzUOg+HQ1BCkMQfmZ
         l2+N5jV29VSfjvhoJ3fUIXFpLQLKCotKe8ZXOtxpl9fyarsY+noCoXL+BWzySycv7wuO
         c3wTbh/jY0FqXRxr6SUKjYUSb4kLf8leHA8+aN1DFdU+9ARL9EmB6KO01rUNoJVQxq5w
         ts2g==
X-Gm-Message-State: AOJu0Yz3p256lLIN3/ZbGOny2pXjlFhx5rjcLsGuNiD+R1aLNiVivKmS
	c4Y1Rrl1MsqNU4jFdvDwXqmyg0Ba5Rzr1wzcL4UYlIgSq+sztJCyPCsytqW+gw==
X-Gm-Gg: ASbGnctJmlmil6R7p5reZroPODttt8J+PIfaR8BXj1BXTODSXLYBimoZcs6L9zgOy0m
	gZkr5nZEOd07TIFBIjEGpmV0uhKk8fv+YwOFzFofBSM0Vq/ugCclmBzZ+e7WZHpSnpbgmwh3Mcu
	cZek4VMvzYgybW4K9k17flIlTyoiPb2V5R5piuuN15UW4UsounzJyYEf/snWJs5CkUJqBmapPag
	ZhDA6yh4pIyXMIoBrbgfIxkUOf3jXZvuzdFPXAZ2G+lfzDkDr791qKp0YGEiW78csUZEQsXP2CP
	Ys5S6FSSUBAh/x2zHBobSFeZJ0zuilwwhH3ypi8b34qtr8VlNg4f5pd3XAWA3lT1NfinffZmTti
	usTlXJ+ZXOylpzCI8W8lLGzz7QlSOZ7WOnuLA5V/LAHmkCqBvtqf5thE=
X-Google-Smtp-Source: AGHT+IGss3o1/331Aso38gSFE/jtDV/vzmf/4mpFvcKpn22OsAKDX1ravXrtApXtOYlWesx4ce5JsQ==
X-Received: by 2002:a05:6402:26d3:b0:639:e580:6341 with SMTP id 4fb4d7f45d1cf-639e58069b6mr6663219a12.8.1760036427850;
        Thu, 09 Oct 2025 12:00:27 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5c323423sm356821a12.42.2025.10.09.12.00.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 12:00:27 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][walnascar][PATCH] libavif: patch CVE-2025-48174
Date: Thu,  9 Oct 2025 21:00:26 +0200
Message-ID: <20251009190026.1548202-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 19:00:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120448

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
index 0000000000..13cfb9339a
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libavif/libavif/0001-Add-integer-overflow-check-to-makeRoom.patch
@@ -0,0 +1,27 @@
+From b6fc69afc6e1156455c70ebd2227b82fc4f1769f Mon Sep 17 00:00:00 2001
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

