Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96747CCF9EE
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 14:16:05 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.34154.1761574563509611991
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Oct 2025 07:16:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QDEvUX1v;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4711b95226dso58638825e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 07:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761574562; x=1762179362; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8vT2TTLpjnE3LuM9czMgLMTrFgZDcCycPUN73j8om70=;
        b=QDEvUX1vaPFu8IN8wge24EW9E7ovEEF84uddvhibZBtUf0RfLezF2H5Zv81lTUbsR8
         zodqb5Q+P5MRdhkvPFO7wj0pgJ7myugidNoVW1PmEY231TknQXdb3UM6N5QQFLUQqJU3
         /SRuzb8D9Mp65Z7P5CvfwKZQfNzRzDZJDfBEgsBi7UmNbVztgh5STah//URzNcTfh/gp
         /ZGd/GFxFuYVKrnOnq7ludc6Dv5im6K79UZqpewKVbXmOjRiOrDgH2837xUCCcSU4QWt
         XJ3uDpwyyRQJqkLT/1yL5RVFdtpQk6yceX2G0I6bEWT+dsaw0qtZolgQetOA3DGFdZ6t
         /MVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761574562; x=1762179362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8vT2TTLpjnE3LuM9czMgLMTrFgZDcCycPUN73j8om70=;
        b=fRU/D2JO8ieFHupweSGvbNbBYMrl+D8hC6Rk2j/cYzIgZk1yn2ld2NaPnzj3uc/Y5w
         9TNE2AZi6P1L5X1Acm07hc4lthbd6tP6Xcj5nRGXl9bk45SuXxkauxHdgrS99pxWrNAR
         Rjj/SFVdg2PD1nT1YaJeYW7SeGYZZHtzemNgznvNDlTZ813dPhkwjmOi+rCa3NfwUxb5
         oWQo4EJcRH7uu1NIQ6G+cKimn6aM85epgKISF0eV5vQfGqqfXA0oJta9BQ2Utnbhxsyd
         aORjoajc2JkSvXynV52Jpqvp8sTBTA9hAPCzNGMmtxOaVhKvYFoqt7fT9ApNYf+aOUR6
         ZMKA==
X-Gm-Message-State: AOJu0YwKTwlvZ0xLGUZBUUkDBbHB7iLSj4KWrCnNEhMHfa1lh/T7x1UM
	DGSy9oOqElsXeQ7suESisPsS/iwo42REGgw4hYra+AvLXWRrwJoS3HfAKR8WaA==
X-Gm-Gg: ASbGnctLM/xuhrNuGhtk3wOC9uCE9xSMjdXLmeUss8uh2jdTwthCrXA9zhIfAtUss8R
	kJ5KmshIpxKOQZBrv1Qvkk5cM1hQcJxd1WTSUsqPITnfISn46l3jywl4Ep0VNw1Ktl8bA77OYHT
	ayo3/9MUOq6RWKtrLQImkRZZVpV3LbuEa2ZBHSiXb9ADpb/YEdkH9pECbnsynfpwlEZripldGRq
	HvPXIUgGsfTgPCtDJ1nOmfRNzjEWIY43zdih4jqR5yTQUf+1dR9d+gClPDM7maldn7Mw4EHYYIi
	yaJo64fIe/W8IQUBVm8y57KXSM7ByHSvwC4L65vWgpczoBlqkoynnzLNl0bC1JyNEPgWQu4tFnK
	W2LYB2M8kergu8d8JgzxicNvouhu3sJTs5guPOBAjTuR9fVBqPB8/Cnf8mZE4Fr2dtqXqs+PHQd
	T4R/42pdJi
X-Google-Smtp-Source: AGHT+IEwIHgMZJxACAWFJVo992UCzm/DUL6gVuvv3LcuUZ3BhHA4WMgPqi5RuV5ti+3glFuRgZ5Xvw==
X-Received: by 2002:a05:600c:870e:b0:46e:37a7:48d1 with SMTP id 5b1f17b1804b1-4711791f94dmr359130835e9.34.1761574560855;
        Mon, 27 Oct 2025 07:16:00 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952db80fsm14164067f8f.31.2025.10.27.07.16.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 07:16:00 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-initramfs][kirkstone][PATCH 03/10] klibc: patch CVE-2021-31872
Date: Mon, 27 Oct 2025 15:15:50 +0100
Message-ID: <20251027141557.1893563-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251027141557.1893563-1-skandigraun@gmail.com>
References: <20251027141557.1893563-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 14:16:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121043

Details: https://nvd.nist.gov/vuln/detail/CVE-2021-31872

Pick the patch mentioned by the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../klibc/files/CVE-2021-31872.patch          | 70 +++++++++++++++++++
 .../recipes-devtools/klibc/klibc.inc          |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta-initramfs/recipes-devtools/klibc/files/CVE-2021-31872.patch

diff --git a/meta-initramfs/recipes-devtools/klibc/files/CVE-2021-31872.patch b/meta-initramfs/recipes-devtools/klibc/files/CVE-2021-31872.patch
new file mode 100644
index 0000000000..dd9a0f2fcf
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/files/CVE-2021-31872.patch
@@ -0,0 +1,70 @@
+From 5e8b9d0c9cef6194b3588b12f04afd617de3587d Mon Sep 17 00:00:00 2001
+From: Ben Hutchings <ben@decadent.org.uk>
+Date: Wed, 28 Apr 2021 05:16:34 +0200
+Subject: [PATCH] cpio: Fix possible integer overflow on 32-bit systems
+
+The maximum name and file sizes in the "new" header format are 32-bit
+unsigned values.  However, the I/O functions mostly use long for sizes
+and offsets, so that sizes >= 2^31 are handled wrongly on 32-bit
+systems.
+
+The current GNU cpio code doesn't seem to have this problem, but the
+divergence between this version and that is large enough that I can't
+simply cherry-pick a fix for it.
+
+As a short-term fix, in read_in_new_ascii(), fail if c_namesize or
+c_filesize is > LONG_MAX.
+
+CVE-2021-31872
+
+CVE: CVE-2021-31872
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/libs/klibc/klibc.git/commit/?id=9b1c91577aef7f2e72c3aa11a27749160bd278ff]
+
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ usr/utils/cpio.c | 18 ++++++++++++++++++
+ 1 file changed, 18 insertions(+)
+
+diff --git a/usr/utils/cpio.c b/usr/utils/cpio.c
+index a13c876..9b0b6ae 100644
+--- a/usr/utils/cpio.c
++++ b/usr/utils/cpio.c
+@@ -17,6 +17,7 @@
+ 
+ #include <errno.h>
+ #include <fcntl.h>
++#include <limits.h>
+ #include <malloc.h>
+ #include <stdbool.h>
+ #include <stdio.h>
+@@ -904,6 +905,15 @@ static void read_in_new_ascii(struct new_cpio_header *file_hdr, int in_des)
+ 		file_hdr->c_hdr[i] = strtoul(hexbuf, NULL, 16);
+ 		ah += 8;
+ 	}
++
++	/* Sizes > LONG_MAX can currently result in integer overflow
++	   in various places.  Fail if name is too large. */
++	if (file_hdr->c_namesize > LONG_MAX) {
++		fprintf(stderr, "%s: name size out of range\n",
++			progname);
++		exit(1);
++	}
++
+ 	/* Read file name from input.  */
+ 	free(file_hdr->c_name);
+ 	file_hdr->c_name = (char *)xmalloc(file_hdr->c_namesize);
+@@ -914,6 +924,14 @@ static void read_in_new_ascii(struct new_cpio_header *file_hdr, int in_des)
+ 	   is rounded up to the next long-word, so we might need to drop
+ 	   1-3 bytes.  */
+ 	tape_skip_padding(in_des, file_hdr->c_namesize + 110);
++
++	/* Fail if file is too large.  We could check this earlier
++	   but it's helpful to report the name. */
++	if (file_hdr->c_filesize > LONG_MAX) {
++		fprintf(stderr, "%s: %s: file size out of range\n",
++			progname, file_hdr->c_name);
++		exit(1);
++	}
+ }
+ 
+ /* Return 16-bit integer I with the bytes swapped.  */
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index ccf4a56953..87ca00b857 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -23,6 +23,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/klibc/2.0/klibc-${PV}.tar.xz \
            file://0001-workaround-for-overlapping-sections-in-binary.patch \
            file://CVE-2021-31870.patch \
            file://CVE-2021-31871.patch \
+           file://CVE-2021-31872.patch \
            "
 
 ARMPATCHES ?= ""

