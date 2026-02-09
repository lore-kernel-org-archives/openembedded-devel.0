Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A14E94607
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 20:56:39 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4944.1770670594038445746
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Feb 2026 12:56:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JUruZ3N1;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4807068eacbso1427605e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Feb 2026 12:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770670592; x=1771275392; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=AjrovmA4fFaWpRRWQDlVbabmbs9Hok8j99nJbBPMa/c=;
        b=JUruZ3N10vUNMFcBRgHQ0cXwTwQOP2BYp81UfiJnu0wAGnasph7R1NXlizQHp1jrk0
         c1EYBhbn0M0Xshs3P1IKPiIvdL9Iut7C4cCZ2wtSnBD6UaaG9Z3ioXbBPGZNW6lpYrIR
         nK07Mc2S0XLji89oTETD6cAX/Y0EAOl5kPRFcyLacAGPMPI6jAiC6Yqf1IEqb7MT9uf3
         cYKuJD5I1fUtUk5fqjXjbQxoLypZEJHsPcLKCdEpNqOK8t0BW9dMI914By0E9vvW5JbC
         ffrZwuqmBiih+U99WMUIeBFp8AivgKLKuJ6oh/SmCF9AUhINUsf9KAPQfKeAIjmif9lZ
         Yn7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770670592; x=1771275392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AjrovmA4fFaWpRRWQDlVbabmbs9Hok8j99nJbBPMa/c=;
        b=X21hlRSkT/YbcEF0+QkmJz9dv4QGv71naId1NYhw7m8sxezpjUIGL2b5iOPRYsUdwj
         j3CqSkWsLvJQIuNpNU/e9DenGLxPYKoJEtmRJCq1Qst3cBcoPQwDo7pPZM0Poz4Ilvck
         ONp2wriARZrs9QpM7sncstUfJsGH8tzprPHTr5slwWwP/iCKAeo2KAU5SXLOJTW5rnus
         zU8vIVJKFWDCo7UWo1WRgHbF1Esw0t38DAzBVehQ1dwoR0gk/8LMRrIpfsDpE+5bZq7b
         UkgBh5VDCSY/sNmZJfy4CO2bZruqGLHMTNtw4eYhtEUg5s9T0xZs3Xuu5WiKtPn3ahOj
         Cplg==
X-Gm-Message-State: AOJu0YyqEmP1B52f4U1DY4G1ESIIqWGwwIy8i8s45/ig4Kwq1jNsia3W
	mZUCzl3i+TS2grjzv7w49sgs7oEEZMjt0R47eNWu3JX3j92JzQfrPu/ku3JBcw==
X-Gm-Gg: AZuq6aIjlO+q502Q/v2O0KyVN4bHZG04JLaFZ+X4j+q1V1V56bErPjf5lrlQ10scaR2
	6ilz+vt9z6Gd7PzOg/QHUD6yRnod+qKamVtwFJhQ5eSmWUtbfETDHIMT2SwfKYzMiidkBlDwRV8
	v1ALPdC2dI1gKYNF7xf/o8jUcdafUiZYjvS79enWHKQnuCI8jcldHUe318ZcDBNdjZ3o4Rlaczh
	Q3OszyXFeydtrml7aHyrtwaUA8i2Pz+ors9KRe9T/bIXmzCTMyRu2ih/q/PQzI0Rz3FbiYXsqSd
	CaRQUIu/YGecfJ15dZUYSsCCsw+yBH58YEVgUaejwAL7JKI0gGbYXEFdp4oqsC/dpneahl/SGr7
	4eX1sRyFjcDjfoKNT5ReAhnXoBCqqKjtLsjHtOQ4qY44AblihuGXDrRHRmRU6ustPn1vFz94g0N
	58JzGT267C
X-Received: by 2002:a05:600c:3b85:b0:47e:e970:b4e4 with SMTP id 5b1f17b1804b1-4832021eac2mr185013395e9.29.1770670591954;
        Mon, 09 Feb 2026 12:56:31 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d7f09c1sm24585025e9.13.2026.02.09.12.56.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 12:56:31 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] nodejs: add missing native nghttp2 and libuv dependencies
Date: Mon,  9 Feb 2026 21:56:30 +0100
Message-ID: <20260209205630.3799621-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Feb 2026 20:56:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124313

In case nghttp2 and/or libuv PACKAGECONFIGs are enabled, nodejs
will build some binaries for the build system also, linking to
native binaries and using headers from the native sysroot.

However in case the dependencies are missing from the native sysroot,
then it falls back to the build system's sysroot, and use the files
that it can find there. If the build system doesn't have nghttp2/libuv
installed, then compilation fails:

libuv:
../tools/executable_wrapper.h:5:10: fatal error: uv.h: No such file or directory

ngtthp2:
<...snip...>/build/tmp/hosttools/ld: cannot find -lnghttp2: No such file or directory

To avoid falling back to the build system's sysroot, add the missing
libuv-native and nghttp2-native dependencies.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb
index 1ef01cc3b2..92556b062e 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb
@@ -74,8 +74,8 @@ PACKAGECONFIG ??= "ares brotli icu zlib"
 PACKAGECONFIG[ares] = "--shared-cares,,c-ares c-ares-native"
 PACKAGECONFIG[brotli] = "--shared-brotli,,brotli brotli-native"
 PACKAGECONFIG[icu] = "--with-intl=system-icu,--without-intl,icu icu-native"
-PACKAGECONFIG[libuv] = "--shared-libuv,,libuv"
-PACKAGECONFIG[nghttp2] = "--shared-nghttp2,,nghttp2"
+PACKAGECONFIG[libuv] = "--shared-libuv,,libuv libuv-native"
+PACKAGECONFIG[nghttp2] = "--shared-nghttp2,,nghttp2 nghttp2-native"
 PACKAGECONFIG[shared] = "--shared"
 PACKAGECONFIG[zlib] = "--shared-zlib,,zlib"
 

