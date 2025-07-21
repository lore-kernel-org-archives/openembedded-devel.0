Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12624C87FC5
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 04:00:40 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.32328.1753070434283621764
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Jul 2025 21:00:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ReT+e6GU;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7490702fc7cso2337155b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Jul 2025 21:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753070433; x=1753675233; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=09PmA/SQkc+m7/+BuIm3uzTEdVhOG9HKyOeCkkw79fk=;
        b=ReT+e6GU8M+Yt2Z+eEQFLrtYFNkkbYXrPSR1t2lJ3kwxMXPHcUHQaYTyvTQOfzlX4Z
         U+heatIlAmNZSVCifqpDbgneRSNGNLkSCWLHpWDi8aUt8unmjmRLsbcMMio5YmLfm9cX
         ccAG0a2IJ65cBAPTvYESirldKwGnThoeOqJqDEcD5dV3s6q3p1xHUHz84cm0u8Abw1+K
         6zwIRLrLEo03vEEb1Amd8AX24ODjhLr5WsQW2yKhUWafv3Ft82b9UNqYqrp0aaQ5kWp2
         sVt2VkpBYIc+WKXwa2prBP+Gtdrcb1hq6QlwS7cBSEQA987b2jPJOZMZvgVOC5UY8vPL
         N29Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753070433; x=1753675233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=09PmA/SQkc+m7/+BuIm3uzTEdVhOG9HKyOeCkkw79fk=;
        b=gvPvhsLpCohx+TAW3Ix+Si12Ia6T6rA3vtui9je35MPlT03Kt/mjyX2DyDvTNjPgCF
         p8Y4F44u1ymvPHu9ODJOkhtCY2tBTaBr53eRgFCp3kh8UyqTSN/XSdIyZCA6pCovpzj7
         xYEDXtn2udQR8zogBQZ2XrnxgA9NqDClyYlxctcJzeJSfJG2G+OTnhDeiPwshuWmRPLq
         kIxiElbUpK+vU04tBHtsXmtDmjgUz35FS1DqPZ5IjwS2JpvBeBTpV3YKFu4KgCrbZ7sF
         A+RyN+ByjctfWdiPC4VNkRcLZE+X2ktV4S39Sr5ITVUH2csouRrLMsrxcOEGDl+M4i8r
         Gapw==
X-Gm-Message-State: AOJu0YxcAcd7CY1+UDCe9UN45LeQ5mxPySC7NqXDL6nWYtBYWPl/cBFO
	dU+8/nklSsCuftupzCPPl/XrQpyQ0q38k6mQQOnQcyDwBcxEuJwPl9chO4oJh1Tm6g0=
X-Gm-Gg: ASbGncuJuS2XBGvIV8mHTS+Wqz4HHtfEaqB+n/CtCFf0aArp/PlnS5EOAsG+6CRchcK
	DSRa7pXC2ATwc35Tn007dUcG++9VFyegDQMnvFmXMvHsI9cC6X1KLjkaE/OEFqUcOmumhPCOyeY
	cTvPe5Cfg5hgcoiQjXo1+05QQDUJv6USeFR8ah1kiOlslW1uTg+gll2jZFiXvsrwhKOud57Ikef
	qILVAHRXm6/EE8pPTm+jFtaZvYJgFVf8fQdR023xfHHWwHYpwRIOhhI+9uSfqMZ7I06kq7Aqxe5
	CCRQN5P5EGyb72SMUkQXzznx9kLaitmoweKhtpTEL+Kz/9puIDIUqvOShLkF4xIQ4hY0d5l1uNg
	csYNMcAtLyR6xdg==
X-Google-Smtp-Source: AGHT+IGhCww51Bpp5QcLrHlbJ2wlGlpX1sGnUa6m6kJQY/t5vZapQwzr825OJGxwfpx5weLz9eB+nQ==
X-Received: by 2002:a05:6a00:21cb:b0:74e:ab26:aa81 with SMTP id d2e1a72fcca58-756e99fd67dmr27303806b3a.13.1753070432951;
        Sun, 20 Jul 2025 21:00:32 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::b985])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759c89d5e73sm4812987b3a.59.2025.07.20.21.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 21:00:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/7] ostree: Always use libgcc for runtime with clang on x86
Date: Sun, 20 Jul 2025 21:00:24 -0700
Message-ID: <20250721040030.641212-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Jul 2025 04:00:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118644

compiler-rt does not have 128-bit int support for 32bit x86

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/ostree/ostree_2024.10.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2024.10.bb b/meta-oe/recipes-extended/ostree/ostree_2024.10.bb
index c33624987a..8d3b1cd32e 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2024.10.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2024.10.bb
@@ -118,6 +118,9 @@ SYSROOT_DIR = "${STAGING_DIR_TARGET}"
 SYSROOT_DIR:class-native = "${STAGING_DIR_NATIVE}"
 do_configure[vardeps] += "SYSROOT_DIR"
 
+# i686-yoe-linux-ld.lld: error: undefined symbol: __unordtf2
+LDFLAGS:append:libc-glibc:toolchain-clang:x86 = " --rtlib=libgcc --unwindlib=libgcc"
+
 do_configure:prepend() {
     # this reflects what autogen.sh does, but the OE wrappers for autoreconf
     # allow it to work without the other gyrations which exist there

