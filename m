Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA912CE8D76
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 19:45:36 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6779.1763149528022722555
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Nov 2025 11:45:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m9YEpYF/;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42b3669ca3dso1391897f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 11:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763149526; x=1763754326; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fwuR/us2Bg+r9YHrgdzMgcm3R/jycXdqSUXEHI9x4ho=;
        b=m9YEpYF/s05MmAhZpLIJCFoAyAxAFZ3JWqLAqiX1DRvGzoEhSTwcxUQtkqEpR6TNvB
         rbTSyLVWE/SM+FGY1X3TixGReXnp62WAMyI0fBzJFe8kdFpMYF+95ZSiPy1AsfJB/XEp
         qqMVUkkPWoq4ahWEhyifzSMa0rEMJQQskZdMKOz5aFGCkxhwqK2c651nSrFqg4U01Kkk
         cBTuOu78l5dtJpXb+U2FFo98lUf4bv60+SKhHLL6GDd5w0ithc7bqfFR639KQluM6cvq
         POaWmIzSCqT/PRwddrulpEvQeSOdPQuuHvQu+e2FvIasCTb/Ojqz5uO9WJJ1e4KzuIdT
         +icQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763149526; x=1763754326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fwuR/us2Bg+r9YHrgdzMgcm3R/jycXdqSUXEHI9x4ho=;
        b=KcADU1Enz+HDh4pQc3u9RaWPddThyuG3IZuGP1vcdmAqBId3+20T8BJq6vfOaaaAF0
         LRizLCQ9/2qEFueBCxxw71vdB2r1Scm+BrBV6mmUYA/EpDMTpRshN80Af7z1n9DhKMYJ
         aTbWHdctk02n23psVmaUcPjvMTAICQz3Cah6L9uKjRHl3u0bdxTbc7sPgNCsDWXnZVFR
         gThFOObP5g+HWWbGBHK6gbEAJr+y5lopq/EUyU92nIsoyD4zYbARV1Xunwy0KX0sLZ54
         M0OR38nxjSp+lPRS6cjILsyOsg38DHS4IHzMxjvUWvSoe7sHZ0BrwMNulGJO/MA0cKS7
         EZbA==
X-Gm-Message-State: AOJu0Yy2+wS9TxHuULi3klqlLWwCC1CXjqRxaXJGVnGZ1mECrxDZpy0u
	iPYL1l+W/JAOd2nqTcKuKahT5Nea6u8LMeCy0OM3peZBkhsR8W4zUZGjQRU7IsiE
X-Gm-Gg: ASbGncsM++szneM+CoiK0sm0E4dCBM3dHTHtwV74c8pjJNNpR/A9o1jV94sUZxmWWan
	IcliAvIf6u2+iCJdU0afYo23WNfMziC8hSNHRCRM3rFEdRSkvY9UCTR9uabjtTet+eGEVRZoAeA
	SIMzzsh7/N4jNw5CH5BRNbnQQOyK6ZICWT99ou0NG3+GR77eCuXEzw55lHHzBXOm17NZUetiQuL
	/HL8+Y6aCkTvGXsMJma7i5y8Z87Ph84aiHplOsg7nswtRTd9W0Mmq5DQwPAhNmKcAT+Igv+cOM4
	YRqWIgr0r9oeoMwgFOviN0rm781deXzN3cwAjQP6MFl8MYdLjoP8RUBnpDqpWuyCNtljbbUnRko
	qAqSvazE5D1pbXfQopkHxDw4SJ3HDTsB+y/+eG4KzvgZdvNORXhlW8/OxV/BEH+mCEulkqiF5CI
	jfpODSV3L6Hdk5VyU+RGU=
X-Google-Smtp-Source: AGHT+IF5tw0JpLGAx+/qXr8NHQXoLyI9yqpD7Ut0oeXV26Sf7wroBRWCfvagtkYRrXbWRpFmnRBC9w==
X-Received: by 2002:a05:6000:1a87:b0:429:d66b:508f with SMTP id ffacd0b85a97d-42b595a498bmr3936380f8f.30.1763149526344;
        Fri, 14 Nov 2025 11:45:26 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f17cbfsm11561514f8f.35.2025.11.14.11.45.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 11:45:26 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 4/5] usbredir: patch CVE-2021-3700
Date: Fri, 14 Nov 2025 20:45:21 +0100
Message-ID: <20251114194522.643069-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114194522.643069-1-skandigraun@gmail.com>
References: <20251114194522.643069-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 19:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121714

Details: https://nvd.nist.gov/vuln/detail/CVE-2021-3700

Pick the patch mentioned in the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../spice/usbredir/CVE-2021-3700.patch        | 74 +++++++++++++++++++
 .../recipes-support/spice/usbredir_0.9.0.bb   |  4 +-
 2 files changed, 77 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/spice/usbredir/CVE-2021-3700.patch

diff --git a/meta-networking/recipes-support/spice/usbredir/CVE-2021-3700.patch b/meta-networking/recipes-support/spice/usbredir/CVE-2021-3700.patch
new file mode 100644
index 0000000000..4804e740b5
--- /dev/null
+++ b/meta-networking/recipes-support/spice/usbredir/CVE-2021-3700.patch
@@ -0,0 +1,74 @@
+From 4851f8d4538e0a25992619ad96a2366c1632e46e Mon Sep 17 00:00:00 2001
+From: Michael Hanselmann <public@hansmi.ch>
+Date: Sun, 8 Aug 2021 15:35:58 +0200
+Subject: [PATCH] Avoid use-after-free in serialization
+
+Serializing parsers with large amounts of buffered write data (e.g. in case of
+a slow or blocked write destination) would cause "serialize_data" to reallocate
+the state buffer whose default size is 64kB (USBREDIRPARSER_SERIALIZE_BUF_SIZE).
+The pointer to the position for the write buffer count would then point to
+a location outside the buffer where the number of write buffers would be written
+as a 32-bit value.
+
+As of QEMU 5.2.0 the serializer is invoked for migrations. Serializations for
+migrations may happen regularily such as when using the COLO feature[1].
+Serialization happens under QEMU's I/O lock. The guest can't control the state
+while the serialization is happening. The value written is the number of
+outstanding buffers which would be suceptible to timing and host system system
+load. The guest would have to continously groom the write buffers. A useful
+value needs to be allocated in the exact position freed during the buffer size
+increase, but before the buffer count is written. The author doesn't consider it
+realistic to exploit this use-after-free reliably.
+
+[1] https://wiki.qemu.org/Features/COLO
+
+Signed-off-by: Michael Hanselmann <public@hansmi.ch>
+
+CVE: CVE-2021-3700
+Upstream-Status: Backport [https://gitlab.freedesktop.org/spice/usbredir/-/commit/03c519ff5831ba]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ usbredirparser/usbredirparser.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/usbredirparser/usbredirparser.c b/usbredirparser/usbredirparser.c
+index ba8edb4..ccd3078 100644
+--- a/usbredirparser/usbredirparser.c
++++ b/usbredirparser/usbredirparser.c
+@@ -20,6 +20,7 @@
+ */
+ #include "config.h"
+ 
++#include <stddef.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <stdarg.h>
+@@ -1594,8 +1595,9 @@ int usbredirparser_serialize(struct usbredirparser *parser_pub,
+     struct usbredirparser_priv *parser =
+         (struct usbredirparser_priv *)parser_pub;
+     struct usbredirparser_buf *wbuf;
+-    uint8_t *write_buf_count_pos, *state = NULL, *pos = NULL;
++    uint8_t *state = NULL, *pos = NULL;
+     uint32_t write_buf_count = 0, len, remain = 0;
++    ptrdiff_t write_buf_count_pos;
+ 
+     *state_dest = NULL;
+     *state_len = 0;
+@@ -1640,7 +1642,7 @@ int usbredirparser_serialize(struct usbredirparser *parser_pub,
+                        parser->data, parser->data_read, "packet-data"))
+         return -1;
+ 
+-    write_buf_count_pos = pos;
++    write_buf_count_pos = pos - state;
+     /* To be replaced with write_buf_count later */
+     if (serialize_int(parser, &state, &pos, &remain, 0, "write_buf_count"))
+         return -1;
+@@ -1655,7 +1657,7 @@ int usbredirparser_serialize(struct usbredirparser *parser_pub,
+         wbuf = wbuf->next;
+     }
+     /* Patch in write_buf_count */
+-    memcpy(write_buf_count_pos, &write_buf_count, sizeof(int32_t));
++    memcpy(state + write_buf_count_pos, &write_buf_count, sizeof(int32_t));
+ 
+     /* Patch in length */
+     len = pos - state;
diff --git a/meta-networking/recipes-support/spice/usbredir_0.9.0.bb b/meta-networking/recipes-support/spice/usbredir_0.9.0.bb
index edd8aeb9c3..bf0d87065e 100644
--- a/meta-networking/recipes-support/spice/usbredir_0.9.0.bb
+++ b/meta-networking/recipes-support/spice/usbredir_0.9.0.bb
@@ -9,7 +9,9 @@ DEPENDS = "libusb1"
 
 SRCREV = "bca484fc6f206ab9da2f73e8a0118fad45374d4e"
 
-SRC_URI = "git://gitlab.freedesktop.org/spice/usbredir;branch=main;protocol=https"
+SRC_URI = "git://gitlab.freedesktop.org/spice/usbredir;branch=main;protocol=https \
+           file://CVE-2021-3700.patch \
+           "
 
 S = "${WORKDIR}/git"
 

