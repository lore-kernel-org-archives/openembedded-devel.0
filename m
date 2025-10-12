Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42136CCD184
	for <webhook@archiver.kernel.org>; Sun, 12 Oct 2025 18:36:03 +0000 (UTC)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.web10.24039.1760294154463076314
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Oct 2025 11:35:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c6aZ6rTt;
 spf=pass (domain: gmail.com, ip: 74.125.224.53, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-63bc1aeb427so3523698d50.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Oct 2025 11:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760294153; x=1760898953; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D/gE6ql8zegXgIJlUwPWBN5r46Ix/ogIA7LXFCFpEik=;
        b=c6aZ6rTtzzqBarIqcwR1PmmhFap5RjpDo3C2oKKNZrKY1zXFaYsGTm0+rDiY3C+VRq
         2KWXqn8JRs8W6+jTGb9SbfajESiR7uZbOD0b+PMbtX86oELzpgI1EAQvsYs7IHq8qlmW
         LOlkwJPqNqO60nJKMtFx/Tz6yMxfjsfRVNbmQWwewU6/4inaroI5zQGTGIA4QG+KWWmV
         sAQjqU1pMzQk+CKq39Iwtjl6X28iAFuL4zsbY2WVaRgae890tl/4z60aT22lvdnqx93J
         BjZLWJE0AG/832Jz90cLuN1PiyIru3wMm5Hft7VF/6z8qDknbfTJAvh5zrX4hiKugN8A
         b9rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760294153; x=1760898953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D/gE6ql8zegXgIJlUwPWBN5r46Ix/ogIA7LXFCFpEik=;
        b=KRqWJtJ0d8k07pLooloXZsWnhXuJrIbj1K1+y0sfql9lgxxCxwPFUrbvx0uA2S6GkR
         ut1hkE8RXEb/NAarvQtaflcEPub2HYIPnyNDUFqPRi4p8CvnzcWgKsh0GnA1xKxEUJl5
         DHnDcU1u6/sPm+xSFWCyFHDh5yTRqwHWqCUCNOjk8MxqzFWOxtdYSFUu1YSfOfTIQDoq
         wzar/KIyvondrRoGf7pSP/ID1rYAAMOBCo4uEQU7gxauqIGj1osV72n5qF03wkwQ4X/c
         50yb5fJJKb/SDD3PcIROtIL64H5Pkp3dFPxVHcid/zPoLDhKjpxnt09JvjCmq7i+t7bm
         RPaQ==
X-Gm-Message-State: AOJu0Yy8g42NE6M1LsHWAyb4cqGxK1jCDyEJFDw7rjWfdjEmD8YgGRfu
	3GL9tgPqwSFZbaNf4JNaVIchoL4J6m22xbneD7EsQLAmWWKEzHo6liKIf6OF3z0U
X-Gm-Gg: ASbGncufPxvck7IrCAv7/aD0tr9VO8qieGuGN80bBSc8JkPWSEoAIfLuuzcC3LBlSQ4
	VYdWGU3XZGRte9oiiPhqIb6AUbuvbLMF51+luDn4TR8EW/qz3rXqnyEvXjF8Uvh3gR9Ql4wYk/o
	zORxxO+0OE2N68sSHKPYnY74yaVIV8YvEM2UWqeo/XFTwPVLRiofWQUUQBDQjFwV0384QBPapjY
	68C1gmeZ6TK3B2nXCsDHq2SJkvEx19eBAcRdkAMFWc3ScrvXzTwswPbOJE2ZIhzcXDyM7eIeKd5
	4Qij/3m/xXQTqctcJDQownH0H3TxftdXlyLSE3Bq8ynxw7cMxrhMttV5XcJpFUBsENMXuOeOCiV
	fvwgNCU/Hok2ojF6VApOGRxYlx3gPuY2k1Olkr7+D+wKPe76Zu4uQdWTyE68cYa8DjKkZUzPcxx
	BiCokhN5DBNQ==
X-Google-Smtp-Source: AGHT+IHasSK2JsHmvvk9jMh5tv+BZvinP0VZc+taPlaA7jXvesiHQE3mMxz+cL96oIHkZLkq8OnhtQ==
X-Received: by 2002:a05:690e:2549:b0:635:4ece:20a2 with SMTP id 956f58d0204a3-63ccb8f48d5mr15609737d50.39.1760294152995;
        Sun, 12 Oct 2025 11:35:52 -0700 (PDT)
Received: from localhost.localdomain (71-208-12-94.ftmy.qwest.net. [71.208.12.94])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7810724444bsm20912227b3.43.2025.10.12.11.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 11:35:52 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] nss: upgrade 3.116 -> 3.117
Date: Sun, 12 Oct 2025 14:34:46 -0400
Message-ID: <20251012183447.97493-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Oct 2025 18:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120521

Update homepage to location where it is being redirected.

Changelog: https://firefox-source-docs.mozilla.org/security/nss/releases/nss_3_117.html

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-support/nss/{nss_3.116.bb => nss_3.117.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/nss/{nss_3.116.bb => nss_3.117.bb} (97%)

diff --git a/meta-oe/recipes-support/nss/nss_3.116.bb b/meta-oe/recipes-support/nss/nss_3.117.bb
similarity index 97%
rename from meta-oe/recipes-support/nss/nss_3.116.bb
rename to meta-oe/recipes-support/nss/nss_3.117.bb
index cc115c4329..5e81441219 100644
--- a/meta-oe/recipes-support/nss/nss_3.116.bb
+++ b/meta-oe/recipes-support/nss/nss_3.117.bb
@@ -5,7 +5,7 @@ security-enabled client and server applications. \
 Applications built with NSS can support SSL v2 and v3, \
 TLS, PKCS 5, PKCS 7, PKCS 11, PKCS 12, S/MIME, X.509 \
 v3 certificates, and other security standards."
-HOMEPAGE = "http://www.mozilla.org/projects/security/pki/nss/"
+HOMEPAGE = "https://firefox-source-docs.mozilla.org/security/nss/index.html"
 SECTION = "libs"
 
 DEPENDS = "sqlite3 nspr zlib nss-native"
@@ -20,7 +20,7 @@ LIC_FILES_CHKSUM = "file://nss/COPYING;md5=3b1e88e1b9c0b5a4b2881d46cce06a18 \
 
 VERSION_DIR = "${@d.getVar('BP').upper().replace('-', '_').replace('.', '_') + '_RTM'}"
 
-SRC_URI = "http://ftp.mozilla.org/pub/security/nss/releases/${VERSION_DIR}/src/${BP}.tar.gz \
+SRC_URI = "https://ftp.mozilla.org/pub/security/nss/releases/${VERSION_DIR}/src/${BP}.tar.gz \
            file://nss.pc.in \
            file://blank-cert9.db \
            file://blank-key4.db \
@@ -33,7 +33,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/security/nss/releases/${VERSION_DIR}/src/$
            file://0006-Fix-nss-multilib-build-on-openSUSE-11.x-32bit.patch \
            file://0007-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            "
-SRC_URI[sha256sum] = "3938611de4ad1e3b71f27f3cd5ea717a5b5f83bffc9cd427e6d929dc67f2bb73"
+SRC_URI[sha256sum] = "5786b523a2f2e9295ed10d711960d2e33cd620bb80d6288443eda43553a51996"
 
 UPSTREAM_CHECK_URI = "https://ftp.mozilla.org/pub/security/nss/releases/"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>\d+(\_\d+)+)"
-- 
2.43.0


