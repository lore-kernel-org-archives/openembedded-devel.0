Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47747F46C56
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 15:50:49 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.58215.1775490648582177866
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2026 08:50:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=grBg2cp5;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso40813955e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 08:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775490647; x=1776095447; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EetRcmscTjuYhdhrxQktaUgnd8DBi2/LoaMslrvvbh8=;
        b=grBg2cp5Zlb9zkb9RUxakhSA8WEEaH3BhOYHdW4Sht2jLcdHmerfSierFGFvFDZ+hN
         3I2w3CObvEHy4z9bpTUDkPYcw5ODeCS+cG9LohZUKXGpLDAUOHrvJIQMdhZPVG0gHLCm
         +Xw2I+Cgh+zx2eJmKoLrWeKsmaJJ3SUxhyaTqP2mIhc4I75jLDNkpvzy74ZR/jnOuoyG
         320QPahhjUQc6dLnY0PAu2jUFJdlHuF6hmtfdYgZsGLDfZizjKauF2cDzGTzbg+TiOb2
         AMCgYDByT9oGZX581ypoXjBZLLnLQyXThoScXiZVxW1UwZTQtB1i+cs283AF4izpNd0T
         sWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775490647; x=1776095447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EetRcmscTjuYhdhrxQktaUgnd8DBi2/LoaMslrvvbh8=;
        b=qZTZbQQz8Ql1+oZ0ZROzGE2zi79wVeNaijGLeRGMrT03IKcadCsxPEXTTSx27rih21
         KzuNni5DjpQQt9OXsRvfa1CvFi3Gxt/l+TjN51WWj9StyCqjvDtsZIGBKh/SwSheMUJg
         d3sgAsmNZ622kOWfrDeW8F08mG9cIdb0Ubi8WmTErpAfPgbka7+JW8VMrqY4Hsni7k9C
         XSZZXeBVlf5Gfo5849QUYe9gAZ/j/A/zJEEd4PhgAmZAkIU15p43mrhYdAVjSV2jTqtN
         LQYaJMvKzHAXADx7WrEoNTx3PY+CjNCF9dig+Ug+1W9NK5uUzDSiCPUk5QAvWE2AhCpU
         dwcQ==
X-Gm-Message-State: AOJu0Yyk70jaB5Ro0yzyIfEV82P0DtCpZuNlVRKFS/lkWiMbqxNLKgxR
	UhOJKyumUY76pIp/kytunCkM3uTAlpY3/xs+5ESQdqfBM1C7xy9pVnLpTfaQ2w==
X-Gm-Gg: AeBDieude/ig127sH5N1wPZVWwjodubDSkY9ViW3ea/sBm7STn1b31ngXS4lggjO9a9
	xCRuYS0wet2tp4KGyQt5ASDEv90FglLQfqrPdSLf0RuSEQkf19AQ1OCTYxhW9r7kTm/OBrDUP9u
	RAbiW/QYMIxPlmxO/wb7wJ0314xDJ580172l6EUuOk+PMpfSGZFTnnJ7jck/o2/LRbS+FDOWIDx
	wh7oL922KVnvyUjUqpQfbU4/I4WhhM9mrm4ZoAMdM7jBEQ4M+JaXAx0CEA7wcM4SERzEo/200l/
	aEYP0+1FSAyD/mQuZm2BzA5jtBTAGt/P7BYmLFchOS1iqG31Vsh4EU5hg6FR/MjEROk8IYerovY
	O4Gh+F0s1TkuRmZOLa7aqk31Dq4zhZbLL1f25ec72TLRdZmZqLOnfwHQLwaatrvmV6oCRktFm0U
	btmKfLxKp54r6oZJHNfW8L
X-Received: by 2002:a05:600c:3549:b0:483:64b4:79da with SMTP id 5b1f17b1804b1-488997d5e84mr175759145e9.26.1775490646933;
        Mon, 06 Apr 2026 08:50:46 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a616sm871341915e9.2.2026.04.06.08.50.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 08:50:45 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/2] wolfssl: ignore fixed CVEs
Date: Mon,  6 Apr 2026 17:50:44 +0200
Message-ID: <20260406155044.3662500-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406155044.3662500-1-skandigraun@gmail.com>
References: <20260406155044.3662500-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 15:50:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126052

These CVEs are tracked without a version by NVD, but all of them
have been fixed in the current recipe version.

The relevant fixes (from the NVD reports):

CVE-2026-0819: https://github.com/wolfSSL/wolfssl/commit/2d3941056b6b961828947a2f159200df7f7d1cb2
CVE-2026-2646: https://github.com/wolfSSL/wolfssl/commit/7245ad02bb1a41235d923288fd640d40c1ecb2ea
  and https://github.com/wolfSSL/wolfssl/commit/67abcc6f2d0cc45f918325c4ae6fe2b8d5bc8f72
CVE-2026-3503: https://github.com/wolfSSL/wolfssl/commit/cc2fdda54cd6387e554b444eb2844fa840bd9d5d
CVE-2026-3548: https://github.com/wolfSSL/wolfssl/commit/84ca4a05fac9c6c055a514f05880c448ecbbed56
  and https://github.com/wolfSSL/wolfssl/commit/b3f08f33b845d2d6bb523f0f38d191ca25635e1c

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-connectivity/wolfssl/wolfssl_5.9.0.bb            | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.0.bb
index a2d6455d93..7a481e7325 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.0.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.0.bb
@@ -46,3 +46,8 @@ do_install_ptest() {
     cp -rf ${S}/certs  ${D}${PTEST_PATH}
     cp -rf ${S}/tests  ${D}${PTEST_PATH}
 }
+
+CVE_STATUS[CVE-2026-0819] = "fixed-version: fixed in 5.9.0"
+CVE_STATUS[CVE-2026-2646] = "fixed-version: fixed in 5.9.0"
+CVE_STATUS[CVE-2026-3503] = "fixed-version: fixed in 5.9.0"
+CVE_STATUS[CVE-2026-3548] = "fixed-version: fixed in 5.9.0"

