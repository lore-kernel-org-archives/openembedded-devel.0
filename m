Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40FEDF531F1
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 05:58:01 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12519.1776146272727320477
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Apr 2026 22:57:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Quw/UIEQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso60193705e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 22:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776146271; x=1776751071; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0hhzWKQgWmedUUZ/y6SwAzyZTB/mx7XhgIX2ZXZd1TU=;
        b=Quw/UIEQAMAY9mMIhugXc4cSmwUj6E70JH5nSN8W6ePertDKlBPM33RVJ5D1D0QkPv
         4ybrIRYoOsBKm6lmcGxqDMkA0GEcBEJFh6eHA53NRjHf6m1qj1uDWvCEuUkc9E+b1K7m
         1cAgeOWP2SUW1Ap8xDqKZmyM3hIO0lEq6iLb/jM6SliGw5qdVJ+G1K8aRsyVM9IREqug
         +r+3ZUBcR1LvlqkDpc7HNhBdOGqWgrcz62fF1+vPHvwx6CY3ShQPpKyltWRU0xvA6Xka
         dqqLZy2e7n4BlqayBfGYrnvRzd9t3+hOSAnD45xB8AhYVj8SRmKR9gO1/gXlX/28cFCx
         VSTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776146271; x=1776751071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0hhzWKQgWmedUUZ/y6SwAzyZTB/mx7XhgIX2ZXZd1TU=;
        b=la9jdlry5e7hNpB4jHgq7rXgT8F1QBpvqSYh6oz9+4UCG+wImRQhYbM4SJU2xQd4DS
         uL7Ntbst9/2odj3zFqmpsAVD2gfobP8Dy/GBt4dQq9u0SLCmisZNmv3GQEyw3jezHRy0
         y48C31vw8/S/pdVE2BYuqRlldCd9Hn24OYQooCD8JhWS2GOSMBO0nOCbw8ENQtephkTc
         cADQYB7NJj3G6zDNywVdE6JxaUlylja4Q3Hz8jZvD9e5Zbf1kInb5mfpwREveW22EFAh
         YNQltln+pNJh3mBHSm2C/yeT9ea//yHjHid6AVzDKiqogSQ7tRgYwmOM1XMzGaoZM5Ap
         Ovrg==
X-Gm-Message-State: AOJu0YztgM6G4napYkXLbqPvWxCTh9XFbN8fN7KKOeH69GnbH7EWUICC
	nGx0op7ImU2GKcDX6rjKZvcDYR82moT4EShavuWbeQZs7yJa7exOdx0KKs0Nyg==
X-Gm-Gg: AeBDieskQHfPxaam7jE3rRP++X7YQ9BGTD4WzlgabAnYdv65czbdLmEA8gGDqqSbr23
	tlhfAIAgFzReyoORHm7CKmo2tPgY8VRepaoPRGg1f5dV+0Yjt33Me3mIlDDa88rRsEU4IuKkDUP
	5s+x/mWIPz8+d8xO3RdbH38gqh4VgICgF41K0wWza0nXZfOunALKx9cRdL1+nB+69Dgjkboghe1
	xAbqu2EU+ZZZPQsors4Ldo9FeA1rRClmHuJFyOYoHQvwGZ1LaJOxwoy4u4vnJxUDVJQKlCoR5P6
	1gkHm+JCLwP4IDXjQ6YuH9pva4flaJnOx3Pgy0CXy3JaOATnbWgAdAVeX9KMbJDKY0YSd/cE/2a
	+yWBonYVJxKzy/H4vyCHTccFOGvVEQHEHOR6k4uVxfzEFWElHPU7yQ+7ngjMKoI0otgRt9ZCj3w
	zJrS/qvUJ0qZg0/4TVi45+iX6vbKTtYcU=
X-Received: by 2002:a05:600d:9:b0:488:b4e3:aeca with SMTP id 5b1f17b1804b1-488d67bf177mr174120765e9.1.1776146270542;
        Mon, 13 Apr 2026 22:57:50 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5dcf845sm113184355e9.11.2026.04.13.22.57.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 22:57:50 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] wolfssl: upgrade 5.9.0 -> 5.9.1
Date: Tue, 14 Apr 2026 07:57:48 +0200
Message-ID: <20260414055749.1163036-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 05:58:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126295

Contains many CVE fixes.
Changelog: https://github.com/wolfSSL/wolfssl/releases/tag/v5.9.1-stable

There are a number of fixed CVEs in this version that are tracked without
version by NVD - mark them as patched explicitly.

Ptests passed:
Test script returned: 0
unit_test: Success for all configured tests.
PASS: Wolfssl

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../wolfssl/{wolfssl_5.9.0.bb => wolfssl_5.9.1.bb}    | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_5.9.0.bb => wolfssl_5.9.1.bb} (76%)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
similarity index 76%
rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.0.bb
rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
index 7a481e7325..22ab04a02c 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.0.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
@@ -17,7 +17,7 @@ SRC_URI = " \
     file://run-ptest \
 "
 
-SRCREV = "922d04b3568c6428a9fb905ddee3ef5a68db3108"
+SRCREV = "1d363f3adceba9d1478230ede476a37b0dcdef24"
 
 
 inherit autotools ptest
@@ -51,3 +51,12 @@ CVE_STATUS[CVE-2026-0819] = "fixed-version: fixed in 5.9.0"
 CVE_STATUS[CVE-2026-2646] = "fixed-version: fixed in 5.9.0"
 CVE_STATUS[CVE-2026-3503] = "fixed-version: fixed in 5.9.0"
 CVE_STATUS[CVE-2026-3548] = "fixed-version: fixed in 5.9.0"
+CVE_STATUS[CVE-2026-5194] = "fixed-version: fixed in 5.9.1"
+CVE_STATUS[CVE-2026-5263] = "fixed-version: fixed in 5.9.1"
+CVE_STATUS[CVE-2026-5264] = "fixed-version: fixed in 5.9.1"
+CVE_STATUS[CVE-2026-5446] = "fixed-version: fixed in 5.9.1"
+CVE_STATUS[CVE-2026-5503] = "fixed-version: fixed in 5.9.1"
+CVE_STATUS[CVE-2026-5504] = "fixed-version: fixed in 5.9.1"
+CVE_STATUS[CVE-2026-5507] = "fixed-version: fixed in 5.9.1"
+CVE_STATUS[CVE-2026-5772] = "fixed-version: fixed in 5.9.1"
+CVE_STATUS[CVE-2026-5778] = "fixed-version: fixed in 5.9.1"

