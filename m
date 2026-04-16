Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3574F433FB
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 05:51:19 +0000 (UTC)
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6941.1776318669704232321
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 22:51:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=koawemwx;
 spf=pass (domain: gmail.com, ip: 74.125.82.53, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1273349c56bso10336343c88.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 22:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776318669; x=1776923469; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EQTDPHyEFufFlXEfyLKRt6VytEcEbAdfHtA8PSsOaEI=;
        b=koawemwxcnvwzOxoZ6IxkKh8DgWDu3RMGlWrmU9dfHL83OeOJOdfx9hu8e0LUw/ZVM
         mXOTspFGIqXY/xihO1IF0ylbgJ/MlzZBBX7A6TXdJ4OdZ04FZQUrcPYGS/ZW+2Pvb1HR
         9xSbm8nDWGlS1DgvvCSP5LeawC5rghOpxEI+d0xeI7+rZVPkhyIEzen094HQ8XYn2BDY
         4pO4zqUu/xOGBSSerq1HUB4oHyrL94q2S2Oi+wY2/izO9iYV79DBqFwZjkdzPZ0DLuYx
         n7puelLviNRGxbA8UDDR9tExyrW7nlkIOWIftjKf1JPwK4o/I8p6AcaNsS5r4I2tbepq
         +p0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776318669; x=1776923469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EQTDPHyEFufFlXEfyLKRt6VytEcEbAdfHtA8PSsOaEI=;
        b=QIGy5Vwh8pBEk5SLbLIK45V8UYXLe0uHelh7Bj6j7AqXglF5zt4DQ5AQb3riuryBdq
         Xgy751AKAjBYm8q30HnJ8xOuFt5JWjAxj1MHyKoBh54sjSkxjNclkUmam21riwq/+YBQ
         kLHBdBABWORWZM0U3soN+uxom9592XUd5rrjTHr8IYjpC4hoEzIFeA2fbImmkuCcYhtN
         a/ZiDKCwwmegYsf68+iednCk9gWBC+W0/q1O8wG/N1WI8G3yIWZRJhHNLrxE6LHUYNap
         B4Pu5K6s4jYBajB1Wo3rFDkYX+7aDJ58S+ZiqPVd8yO4/rGr8/TpXeLawdLa7dKcQIdJ
         YtoA==
X-Gm-Message-State: AOJu0YzKm7ZyJUF4fGoLPGYfMLmaFJ0gRDqifAUtezPSBQKjtNCh3PNs
	LLZnrBKUG+9iVNY916ajtHocjfWEP/Ihznmu36TDVN9FNhIsu5ct3+THDVh+WcJ3
X-Gm-Gg: AeBDietos4O4U2wD+pomyNFXkNMns2r+QNk20yp0w8EblublCzFQ3H+iM8cy6xCFm1J
	XldfHccC/un4qms0Kd2zC1PqGzzltQkqvOBo8ouG3kOxZSK57SbDhx0gEQQgwQ6XcnGUuYcywoI
	IhmRnG2HVCdcAaFs+bFzoTPuZaT7vFFMkp2oXNAb2kDuHRZkxqcI1wBkCXQ4ruThG6NazepikBP
	irYz5CCCGGoCT0l/HYbfQ4zkHvNd7g/uLnV8DD31aNmiPgr2cd/Ok86kcYsCpj3/Q2Sj08h+FzZ
	jQjvm/T/yrj0u2fUJWT6c9wutBUAo7Xka7LpjzIusTixqk40PokjZR5SRVUofzSwSkPzzdMTPna
	71EAtJSRqw+HaoCVDGzkp81dVpA2SVsOwbf8JoFOx06ITT6/myDSOf6sTr3TfZlV2a+qQdHyJu5
	DOzBK6oU5RxXxzxkSwm2BHbFkJ8kkBtUBSE0DrIrR7Jz6kzx4seANvER0O/FLhHM1B2MB6C22Qe
	Xi9I/6fdyF7bimBHgqYbFCvgnX5ruzUW1xLG+MjfeRKvW9AanEUFB7H7Sw03VhFWS93CSuiNVid
	Yc7sLWEd3K/w2s6YgSrWgEhxu0seDFO/47oonmXpjvfXD+wrwhY=
X-Received: by 2002:a05:7022:2393:b0:12c:34b9:61bc with SMTP id a92af1059eb24-12c34e8f1e2mr12629002c88.5.1776318668768;
        Wed, 15 Apr 2026 22:51:08 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5e61db6bsm4810182c88.1.2026.04.15.22.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 22:51:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 07/18] ruli: disable C23 support to fix build
Date: Wed, 15 Apr 2026 22:50:47 -0700
Message-ID: <20260416055058.792189-7-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416055058.792189-1-khem.raj@oss.qualcomm.com>
References: <20260416055058.792189-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 05:51:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126386

Avoid potential build failures as the package
is not yet fully ported to support C23 standard.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-support/ruli/ruli_0.36.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ruli/ruli_0.36.bb b/meta-networking/recipes-support/ruli/ruli_0.36.bb
index 0526f842a8..972184ae2c 100644
--- a/meta-networking/recipes-support/ruli/ruli_0.36.bb
+++ b/meta-networking/recipes-support/ruli/ruli_0.36.bb
@@ -20,7 +20,7 @@ SRC_URI[sha256sum] = "11d32def5b514748fbd9ea8c88049ae99e1bb358efc74eb91a4d268a39

 # -shared is passed via CFLAGS, clang complains since its used during linking
 # and not compiling
-CFLAGS:append:toolchain-clang = " -Wno-error=unused-command-line-argument"
+CFLAGS:append:toolchain-clang = " -std=gnu11 -Wno-error=unused-command-line-argument"

 EXTRA_OEMAKE = 'CC="${CC}" CPPFLAGS="${CFLAGS}" OOP_BASE_DIR="${STAGING_EXECPREFIXDIR}" \
                 INSTALL_BASE_DIR="${D}${exec_prefix}" \

