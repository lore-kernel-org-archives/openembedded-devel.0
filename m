Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6455E77197
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 19:48:55 +0000 (UTC)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
 by mx.groups.io with SMTP id smtpd.web11.1492.1736279331170556650
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 11:48:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hnI89qBF;
 spf=pass (domain: gmail.com, ip: 209.85.217.43, mailfrom: schonm@gmail.com)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4affab62589so4245119137.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 11:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736279330; x=1736884130; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vwwmV639zW3cH5qv0DgQgUta0Wy72FCGOnvz02skdEc=;
        b=hnI89qBFIAFBWNP1jqYgKfUdTEKmZFVYr36GaKzOxyGITI39MwF50AiXGP+gW7oxCk
         E7M6h1E2zcISJhiqDnmcBSkDE8pnHr766vLVUHMcRxOU012G0QyUKouVws7R+ORUxiZO
         wrMdfzhr9OaQ9X7UjqDa44e6yznqcU+D4aO1ngSCAP1q4H1xnctl0+LJTFlTgt2J2GFV
         DIubO03RvWRGei54AIfAOS0bKgbnrUyVg3N1HKISbkkmVjnzo8Izq7goApP+S96anD/y
         4s2YrBW0pPnVTX4NEHi05yogDsw9gRd0jbLLoRxgYPqgPPkwlyviBoktwGIYALNnlQ8n
         O59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736279330; x=1736884130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vwwmV639zW3cH5qv0DgQgUta0Wy72FCGOnvz02skdEc=;
        b=EnABJJgRxxQ4O9+/by7HAgP1MsmyDLoudu4+LQuiPWjp9pAO0HeEM+AMaL56BakibX
         1M5ud2fUas6VW/GR7UKlSkNCXXCcOXDcu6jJZyv+MUpLaaaPpem0UwbRH8boXX+tQoas
         EeDsfaVySbvAb5nq6vn+98Zxz5xajazYC586o22MvaYnWozdz1RJHxznYEPIdd+OpaoM
         DgkWgAtGJZFyjhsWP94V5FMnHG7aUUhL9VynknSiVjp1S7h8C9Nojx6XJ2G0bhF2WoJP
         gh91msYmqSIMWpuQcrkcwZVXIOsw03+7OPCiRgbxflA9Ai4mjcZN4sbZT6Q24BdWQwDw
         vXpA==
X-Gm-Message-State: AOJu0Yx82QETgvtnwv241n7TsKcH34JkH7EfnhTp4Mp2TS7gIHe3kY7I
	XVN6r+0aZCe7U7PZCnUH2YX1Iwv6459xl3w93GisBzaJFAIdiip1Wa4q0KGk
X-Gm-Gg: ASbGncuOT4aXURaSUpX8+PKlC+Mziurdxx1CuqNuuFlTuLl34VH4F+KLTpnGckkl84P
	HimIGhP3QA7qFUf42SrCuhLxhSoa4vwWiz02GOS7xfIFA80Hhhge+MAhKYlOUFLEdxCLLlceKzs
	UX3VfsgxsFkHuswtpmDlSh97cXSOrbz0zI8G/Bwr2dpBBfEc21rnAdA5O21uWkipRXAO/GVN3mB
	3o9PVSU0hO0qHIXbMrLua4TL62ZO6jSVMR/Tm99DqvTcGFsoUpHQhebnwYJy6I=
X-Google-Smtp-Source: AGHT+IFrnPPDGnWg30MDrWa8vJPlL6gj7NVdC2nuK12ipTS/zBU+TIwhjc74LuRuJH1B7wxDFQLvfw==
X-Received: by 2002:a05:6102:e10:b0:4af:c519:4e7f with SMTP id ada2fe7eead31-4b3d10485b5mr321958137.18.1736279329644;
        Tue, 07 Jan 2025 11:48:49 -0800 (PST)
Received: from localhost.localdomain ([71.215.2.167])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ad582cdsm8087187241.32.2025.01.07.11.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 11:48:49 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] c-ares: upgrade 1.28.1 -> 1.29.0
Date: Tue,  7 Jan 2025 14:48:06 -0500
Message-ID: <20250107194806.19811-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 19:48:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114725

Changelog : https://github.com/c-ares/c-ares/releases/tag/cares-1_29_0

Features:

    When using ARES_OPT_EVENT_THREAD, automatically reload system configuration
    when network conditions change. PR #759
    Apple: reimplement DNS configuration reading to more accurately pull DNS
    settings. PR #750
    Add observability into DNS server health via a server state callback, invoked
    whenever a query finishes. PR #744
    Add server failover retry behavior, where failed servers are retried with
    small probability after a minimum delay. PR #731

Changes:

    Mark ares_channel_t * as const in more places in the public API. PR #758

Bugfixes:

    Due to a logic flaw dns name compression writing was not properly implemented
    which would result in the name prefix not being written for a partial match.
    This could cause issues in various record types such as MX records when using
    the deprecated API. Regression introduced in 1.28.0. Issue #757
    Revert OpenBSD SOCK_DNS flag, it doesn't do what the docs say it does and
    causes c-ares to become non-functional. PR #754
    ares_getnameinfo(): loosen validation on salen parameter. Issue #752
    cmake: Android requires C99. PR #748
    ares_queue_wait_empty() does not honor timeout_ms >= 0. Issue #742

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../c-ares/{c-ares_1.28.1.bb => c-ares_1.29.0.bb}           | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/c-ares/{c-ares_1.28.1.bb => c-ares_1.29.0.bb} (84%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.28.1.bb b/meta-oe/recipes-support/c-ares/c-ares_1.29.0.bb
similarity index 84%
rename from meta-oe/recipes-support/c-ares/c-ares_1.28.1.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.29.0.bb
index bfb46a54b..80a9a1b69 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.28.1.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.29.0.bb
@@ -1,13 +1,13 @@
 # Copyright (c) 2012-2014 LG Electronics, Inc.
 SUMMARY = "c-ares is a C library that resolves names asynchronously."
-HOMEPAGE = "http://daniel.haxx.se/projects/c-ares/"
+HOMEPAGE = "https://c-ares.org/"
 SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fdbc58a6da11a9f68aa73c453818decc"
 
-SRC_URI = "https://github.com/c-ares/c-ares/releases/download/cares-1_28_1/${BPN}-${PV}.tar.gz \
+SRC_URI = "https://github.com/c-ares/c-ares/releases/download/cares-1_29_0/${BPN}-${PV}.tar.gz \
            file://run-ptest"
-SRC_URI[sha256sum] = "675a69fc54ddbf42e6830bc671eeb6cd89eeca43828eb413243fd2c0a760809d"
+SRC_URI[sha256sum] = "0b89fa425b825c4c7bc708494f374ae69340e4d1fdc64523bdbb2750bfc02ea7"
 
 PACKAGECONFIG ?= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[manpages] = ""
-- 
2.43.0


