Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 189B3C02181
	for <webhook@archiver.kernel.org>; Sun, 26 Jan 2025 11:35:13 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.28664.1737891310945611806
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Jan 2025 03:35:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ATxjdh/e;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-386329da1d9so1834088f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Jan 2025 03:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737891309; x=1738496109; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B6OY7MNVZgkIo31/jHS9+KNdc5+FFmzGpiPEDZvwTkk=;
        b=ATxjdh/elUa63FPSXk/US0O0gtU10bQqRwDbdxheUhDwbQs4kzW6ssfKqtTFMYgU5V
         Y8Hcsv/DfPLqICuGlDmAZEZ7qsG2ja7Y0ju0WhBYj99Nhea71xlw/3QnEE5f8kfm181F
         FTB+fL+zz3N3/vYJ4375p7u8pBUtW9AW/9UYs+/ST6a4XBcbiEPn03b//KCgvR7QvtBO
         yrSCUdFQI2hsfgVQZ3q2RucDt69yzc2roTC91rpry9FWuoeuCbALh/KYcOHFY/w9AvGz
         5+eARQHQill52/JGpVwjRS1L6DD6MTd9duvueZHwmQUw3YAZcoCByiNpY9NkbqNCvTjE
         0BDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737891309; x=1738496109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B6OY7MNVZgkIo31/jHS9+KNdc5+FFmzGpiPEDZvwTkk=;
        b=N0EdF2W381YNt3654znz2MobdJXrm0mbX3FYA80VxPKCuQet+bv7PMsuj1e+ktMsA8
         nV+Ugaa2XTv9jiOFsJQ0lPWbvVC2eWAfuMtkZR8NyFv6dAB/FseuSF6YHjqjx25nYW3h
         l6VdS+pQOQLcb0eTaF3ya8FRAnJOhHymbwaotUl71jldnXkiLIA7+S8V6IqziO8jHxVW
         CRbeRcXc0Kl79syBRInpRTD1GQgnpQ86YoV9gedAHQ9BpEmLRMkkUAYJzQE/yQGzL4lx
         YmBpMTWSKmSCsjtVW9SrCwOMNNrr6JSZvUZnbUR8A5K5ENI3Jglc80+3zwx9RvFAgMjS
         0sjA==
X-Gm-Message-State: AOJu0YxPbnRnbtAGee06g9zlyoHAjZdMZU4whqz4lCCIDk4wMZftO8Mp
	Unz/9kQiJFJoGRMg4p0Iw1w/j18v7OYhhgdHRfERnm2LIqmow7JT1VC8uw==
X-Gm-Gg: ASbGncsI1m/0SP99Wg4WVict2mpJjeC0dHkyWMAH4TJVB+d1FkiRGWnntqE8o37vICt
	Ma9CeoveiVIsX/ftz5+ZAAg7difjq721k+qwihPjmy2Es3HW/DhBV5khoJATFyfBU3sidcYXzca
	5PFdfnFvTD3K4c0cFOCA1qDYc/EvC53vCweHljDsw7aRmOyM+dsrsem6HtQN6fdvMVLt02MtPQ9
	YiFtI9nX4GN8xQ4zaGZa+PU0X1g0NjBCDNIWrzbk2WMqt5wmoVFvqPmjR+ers9D0zxel109Eh59
	+RjieN5ACkTwDCMaeVlU
X-Google-Smtp-Source: AGHT+IE3V46rMqq5vsdq3fQwmpM2Byyy3Z1sSU5bU2L9p0SioAkhULk1e5hvaCIgaPVNSp7QDSOyyw==
X-Received: by 2002:a5d:648a:0:b0:38b:f44b:8663 with SMTP id ffacd0b85a97d-38bf57c0ac9mr31359841f8f.55.1737891308852;
        Sun, 26 Jan 2025 03:35:08 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a176449sm8012540f8f.11.2025.01.26.03.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 03:35:08 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [meta-oe][PATCH] uutils-coreutils: remove TMPDIR from build output
Date: Sun, 26 Jan 2025 12:35:04 +0100
Message-ID: <20250126113504.679854-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 26 Jan 2025 11:35:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115100

BUILD_LDFLAGS is primarily (but not exclusively) defined by bitbake.conf.
Beside other things, it adds STAGING_LIBDIR_NATIVE and STAGING_BASE_LIBDIR_NATIVE
as both rpath and rpath-link arguments to this variable.

Usually this shouldn't matter for class-target compilation, as it's normally
expected to use only TARGET_* variables, not BUILD_* ones.

This is not always the case with Rust - some crates are compiled for the host
target even when the recipe target is class-target, e.g. for some compiler
plugins, and I'm sure there are other reasons also. This makes some BUILD_*
variables to be used in the this process, making the rpath variables from BUILD_LDFLAGS
ending up in the final binary.

From the manpage of ld(1): "The difference between -rpath and -rpath-link is that
directories specified by -rpath options are included in	the executable and used at
runtime, whereas the -rpath-link option is only effective at link time."

Based on this, it should be safe to remove these options from BUILD_LDFLAGS:
these folders don't exist during runtime, but since they are present as rpath-link
also in BUILD_LDFLAGS, they can be still used link-time, if needed.

This allows generating reproducible binaries for this recipe.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-core/uutils-coreutils/uutils-coreutils_0.0.28.bb  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.28.bb b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.28.bb
index 5608b0347..c2bc9ca34 100644
--- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.28.bb
+++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.28.bb
@@ -72,5 +72,5 @@ python __anonymous() {
         d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('sbindir'), prog))
 }
 
-ERROR_QA:remove = "buildpaths"
-WARN_QA:append = " buildpaths"
+BUILD_LDFLAGS:remove:class-target = " -Wl,-rpath,${STAGING_LIBDIR_NATIVE}  \
+                                      -Wl,-rpath,${STAGING_BASE_LIBDIR_NATIVE} "

