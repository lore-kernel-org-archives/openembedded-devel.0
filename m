Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC2D6CCF2D6
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 10:05:39 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32275.1768817137882199416
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 02:05:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h3qRNtUX;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a09d981507so31229555ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 02:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768817137; x=1769421937; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CpNB+dWmqT/dnZeYPXdkaLWuLKOlkPsoQafAiVGRSn4=;
        b=h3qRNtUXlOVVN6hD1Ha6gk44nDc/T4uxApAYxWQE45rRA0kP2vMNIZsQ3iXZLUXbIM
         3ilftLRar4Hf1rGIFGhYMUNyG45aWrLpoZReKJfvu+KMCpN5MBvLKOBV0R+t/bt4RiZj
         olq2NDDtU0xEG9WsJeItzqfg3w5WEdcPuZfMA5XA1BFbbRphfwpkDHPBalMd/rd7pedq
         gpeZXYQmiPZFphhlGMOz5CXFYrE6yjMoU1iT0/NKLZaNH4bwExsIT4/KhvHRCz9O0Pqw
         kBPoW/odBJJOjoK2eFYrbmqTE3qVwQpvwG+akBlIFvE9v2tvxq8XgWmBMT7U6cIruNQ3
         oL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768817137; x=1769421937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CpNB+dWmqT/dnZeYPXdkaLWuLKOlkPsoQafAiVGRSn4=;
        b=WeRMEf4qBnqQ+DXaLFXyuYvLPtUCf8KstzBgMyNCY5h0vTeOe40kmUi4v9NyOrp784
         nCNPj+sey9H9wQko9z5bP3kX8gLv1zm1vcyrH27/0Eal5uURFVHmTWMAw+lY0lOD5j24
         6ReXrs8NPMvdUC1GXI6kvzYQIQoE532YwuqT5XcyNP7pU63hzY2aV8+1f8U471vcbv5D
         Ugg/deNsau1Jyuit6UQ2AoaS0Xt+f2+pUcSIC2e7tH+H7eFgSmJmbRNfmB76Vi77GzZC
         du/QBHSYVn/cJ0ucMJQrp0neTDYCKxUvMW14/lndwpOrW281ku5y5KVeVkXVk+7Isa2Z
         KR5Q==
X-Gm-Message-State: AOJu0Yy1zOkXEW/dKqtjwLioyCaCcWCM0X9OcDOTsTc2XvY1PWXiE5F9
	vZ61/ukF7p4XEfNs1+hXYFkDlbfn0cNxUsFeB4GY7GiBETOPU/3jv/RonYHveA==
X-Gm-Gg: AZuq6aJShz1ZHGDmDSGK54Hgyw9DbD7TJWJyDUrFMbZFuu8KqlDEC8mxekJH3I8TQz+
	cMZ389TTGjnqyuuKElNGAdI0OWSeUCTKolGCTIAusK+vnxaZlc0xF374BkSNNLJ4+Hn975SaIDk
	iEodCj3+cBXrONlfE66QWeP8Qi/Z5smvBLJbGFIChrhBnc7Oat9PUvwKSomFbEwp7YW3IWGzFKe
	rJm0UF/iuTPXcxM5eRHUm+smz4f/1LOIe9X1YUFaUv4d5idqh0nSOHDGwOUdh4mU10jWC9OFv2O
	ih3McgE4IgIKm0avjZYFBwfmgSzDS9qb/lD2qVLM5xux9aSMAPduAgkWAc7OfecrCa+Qgl/ietO
	5PnjZFwcMjITbd/ZrGZlIdDUoN+8uhjgiyF0ZFxERFeM/S6L7Jxsc/D2etMjfAV5yvvtwZr1Acz
	vvGQpGebMvep7fsZxqv63zRJ4=
X-Received: by 2002:a17:903:244d:b0:2a0:971b:151 with SMTP id d9443c01a7336-2a71754641cmr116844635ad.2.1768817136914;
        Mon, 19 Jan 2026 02:05:36 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a718f79f40sm90109935ad.0.2026.01.19.02.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:05:36 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][whinlatter][PATCH 2/5] dante: upgrade 1.4.3 -> 1.4.4
Date: Mon, 19 Jan 2026 23:05:12 +1300
Message-ID: <20260119100515.95275-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119100515.95275-1-ankur.tyagi85@gmail.com>
References: <20260119100515.95275-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 10:05:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123626

From: Gyorgy Sarvari <skandigraun@gmail.com>

License-Update: copyright year bump

Changelog:
- Fix potential security issue CVE-2024-54662, related to "socksmethod"
  use in client/hostid-rules.
- Add a missing call to setgroups(2).
- Patch to fix compilation with libminiupnp 2.2.8.
- Client connectchild optimizations.
- Client SIGIO handling improvements.
- Various configure/build fixes.
- Updated to support TCP_EXP1 version of TCP hostid format.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9f12c5fbc63143c33d6c68139cccac770817b4eb)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../dante/{dante_1.4.3.bb => dante_1.4.4.bb}                  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-protocols/dante/{dante_1.4.3.bb => dante_1.4.4.bb} (90%)

diff --git a/meta-networking/recipes-protocols/dante/dante_1.4.3.bb b/meta-networking/recipes-protocols/dante/dante_1.4.4.bb
similarity index 90%
rename from meta-networking/recipes-protocols/dante/dante_1.4.3.bb
rename to meta-networking/recipes-protocols/dante/dante_1.4.4.bb
index 901167f1b3..7aa1103855 100644
--- a/meta-networking/recipes-protocols/dante/dante_1.4.3.bb
+++ b/meta-networking/recipes-protocols/dante/dante_1.4.4.bb
@@ -9,11 +9,11 @@ what could be described as a non-transparent Layer 4 router."
 HOMEPAGE = "http://www.inet.no/dante/"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=edd508404db7339042dfc861a3a690ad"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b3a8e7dc09bb720460f28c9d3796afa5"
 
 SRC_URI = "https://www.inet.no/dante/files/dante-${PV}.tar.gz \
           "
-SRC_URI[sha256sum] = "418a065fe1a4b8ace8fbf77c2da269a98f376e7115902e76cda7e741e4846a5d"
+SRC_URI[sha256sum] = "1973c7732f1f9f0a4c0ccf2c1ce462c7c25060b25643ea90f9b98f53a813faec"
 
 # without --without-gssapi, config.log will contain reference to /usr/lib
 # as a consequence of GSSAPI path being set to /usr by default.

