Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50C4DE7FDEA
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 21:14:10 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1613.1770066849449615290
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Feb 2026 13:14:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lFj/KzYD;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4801c2fae63so37469915e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 13:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770066848; x=1770671648; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MUzv2raovme3wCTIkYEIifXF9lsdD2hGhxW58dQ1MRI=;
        b=lFj/KzYDWdBVZRFtAd5XRcbNRD9fTgD2cPIDWQzzd7eu8MwdM9gdBmqazBqdfsO1aB
         j28zFqERua3R03ATT+w2VaAs0xl8YPb5FEhQ9vxup7f3T1Svzg+8CaUB0ltSJtj30V0c
         ERyonnfzvWnBr3xOQx1Igqbcs4+FNtrPrXOlh3U8tjUUhVRTtTtXty9qi8XXiDA/SSoR
         RTpdFiUPRtVmlis6WbwtAAjnk5wTjT3GLa8sdeLS8oNmjdgyEh91qh24b3dKMhNqOq3s
         +zLCz+rXrFqxJmahUxYkj0SCetHDqjMw/RBCwAkCbIXKwqpqq37P6BLhTCMkYTm36ocj
         S36Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770066848; x=1770671648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MUzv2raovme3wCTIkYEIifXF9lsdD2hGhxW58dQ1MRI=;
        b=JLREVfcNpYeCrZ023/ZrQLk97aHYsFSZh8FfktVko4prGDglXUhyWoUE24gDJ2fKdZ
         iZfqky3xRkiEk56kTO+wx6PQCfWOfOKlcNN9TmpIvIocCo27scx2KERNALXOalatoQwR
         Oxp+sAA6yw0kSxZz0XamVyspu8wGQww5UX70+5X+dOPjqFfoOf/P746g9HXs1tzEHQCr
         YB0MEAj2MKRetK+D+x9UYek8SVyKBwE6+taxRPh1Pk3mMXt358OBNCL4+HNMsGk3k8nW
         aDOcXdOTIXMlzKCHSWbbsJtbvkIoWKYZg5nBYWCEeeavIPDtMhmrBbCMx2GMjf70F01X
         wUoA==
X-Gm-Message-State: AOJu0YwnMKRUlxwgxzXorexxI12cuy4SUGRo+3/lkhmQmzZDfuPcPKff
	MW+9idZPN+wzT+zwGWOK+kemZ9TQTIrwbE7FcgBNTK7HcDzY0KA18DxooggEnw==
X-Gm-Gg: AZuq6aIPajTefdL43chODYAy48SS/h1NhsoofQ2RxfVTwTWm6TFdFQiGIYxWSuvnoVh
	NOLyLnDe4PxQMRvjrVU/Ep6MTTVJ6iwlf22/1jJnQC0Fl5PbYRzuph3feiIYGubnYxfpgIyNoRw
	UFprNbLJ5C9aktXCOEAmObnW8QLiRqLdN78UQXyFirWtsdvhpfvV2G4L0HPFrzyD9dncTJBScDA
	1iR8q4/F2VU7r+D7uBE16Od6VFr6W+MdRAZnj0LHP5edOspxN5e046FDwct+WBdVkQleDPN8cZB
	6yUs3EpObPBY0llP4VtDpvD8ipRCX5aCBaF4AnZhrWVWXwdH7vRsSPurDCkdYbXp/du9RMAnTFr
	LAvIY/Fc3tZakNI2H0qnnhl4yTZcPPuDaxCoRPZ8gU/JXxHoeQjWJQG+UG4Nz0qG7VuXBlltbJv
	4vmrho7oZv
X-Received: by 2002:a05:600c:4591:b0:477:9cdb:e337 with SMTP id 5b1f17b1804b1-482db4477a4mr166778035e9.7.1770066847670;
        Mon, 02 Feb 2026 13:14:07 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce64sm48756747f8f.26.2026.02.02.13.14.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 13:14:07 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 08/15] gpsd: patch CVE-2025-67269
Date: Mon,  2 Feb 2026 22:13:54 +0100
Message-ID: <20260202211401.1287664-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202211401.1287664-1-skandigraun@gmail.com>
References: <20260202211401.1287664-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 21:14:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124081

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-67269

Backport the patch that is referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../gpsd/gpsd/CVE-2025-67269.patch            | 158 ++++++++++++++++++
 .../recipes-navigation/gpsd/gpsd_3.26.1.bb    |   1 +
 2 files changed, 159 insertions(+)
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/CVE-2025-67269.patch

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd/CVE-2025-67269.patch b/meta-oe/recipes-navigation/gpsd/gpsd/CVE-2025-67269.patch
new file mode 100644
index 0000000000..1c6e2b58e7
--- /dev/null
+++ b/meta-oe/recipes-navigation/gpsd/gpsd/CVE-2025-67269.patch
@@ -0,0 +1,158 @@
+From 5c8490b32eb8e8d78e054851300cdebefd1c2e5a Mon Sep 17 00:00:00 2001
+From: "Gary E. Miller" <gem@rellim.com>
+Date: Wed, 3 Dec 2025 19:04:03 -0800
+Subject: [PATCH] gpsd/packet.c: Fix integer underflow is malicious Navcom
+ packet
+
+Causes DoS.  Fix issue 358
+
+CVE: CVE-2025-67269
+Upstream-Status: Backport [https://gitlab.com/gpsd/gpsd/-/commit/ffa1d6f40bca0b035fc7f5e563160ebb67199da7]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ gpsd/packet.c | 64 ++++++++++++++++++++++++++++++++++++++-------------
+ 1 file changed, 48 insertions(+), 16 deletions(-)
+
+diff --git a/gpsd/packet.c b/gpsd/packet.c
+index f9a7db8..0c23500 100644
+--- a/gpsd/packet.c
++++ b/gpsd/packet.c
+@@ -1141,18 +1141,22 @@ static bool nextstate(struct gps_lexer_t *lexer, unsigned char c)
+ #endif  // SIRF_ENABLE || SKYTRAQ_ENABLE
+ #ifdef SIRF_ENABLE
+     case SIRF_LEADER_2:
+-        // first part of length
+-        lexer->length = (size_t) (c << 8);
++        // first part of length, MSB
++        lexer->length = (c & 0x7f) << 8;
++        if (lexer->length > MAX_PACKET_LENGTH) {
++            lexer->length = 0;
++            return character_pushback(lexer, GROUND_STATE);
++        } // else
+         lexer->state = SIRF_LENGTH_1;
+         break;
+     case SIRF_LENGTH_1:
+         // second part of length
+         lexer->length += c + 2;
+-        if (lexer->length <= MAX_PACKET_LENGTH) {
+-            lexer->state = SIRF_PAYLOAD;
+-        } else {
++        if (lexer->length > MAX_PACKET_LENGTH) {
++            lexer->length = 0;
+             return character_pushback(lexer, GROUND_STATE);
+-        }
++        } // else
++        lexer->state = SIRF_PAYLOAD;
+         break;
+     case SIRF_PAYLOAD:
+         if (0 == --lexer->length) {
+@@ -1194,6 +1198,7 @@ static bool nextstate(struct gps_lexer_t *lexer, unsigned char c)
+             return character_pushback(lexer, GROUND_STATE);
+         }
+         if (MAX_PACKET_LENGTH < lexer->length) {
++            lexer->length = 0;
+             return character_pushback(lexer, GROUND_STATE);
+         }
+         lexer->state = SKY_PAYLOAD;
+@@ -1376,14 +1381,29 @@ static bool nextstate(struct gps_lexer_t *lexer, unsigned char c)
+         }
+         break;
+     case NAVCOM_LEADER_3:
++        // command ID
+         lexer->state = NAVCOM_ID;
+         break;
+     case NAVCOM_ID:
+-        lexer->length = (size_t)c - 4;
++        /* Length LSB
++         * Navcom length includes command ID, length bytes. and checksum.
++         * So for more than just the payload length.
++         * Minimum 4 bytes */
++        if (4 > c) {
++            return character_pushback(lexer, GROUND_STATE);
++        }
++        lexer->length = c;
+         lexer->state = NAVCOM_LENGTH_1;
+         break;
+     case NAVCOM_LENGTH_1:
++        // Length USB.  Navcom allows payload length up to 65,531
+         lexer->length += (c << 8);
++        // don't count ID, length and checksum  in payload length
++        lexer->length -= 4;
++        if (MAX_PACKET_LENGTH < lexer->length) {
++            lexer->length = 0;
++            return character_pushback(lexer, GROUND_STATE);
++        }  // else
+         lexer->state = NAVCOM_LENGTH_2;
+         break;
+     case NAVCOM_LENGTH_2:
+@@ -1510,11 +1530,11 @@ static bool nextstate(struct gps_lexer_t *lexer, unsigned char c)
+         lexer->length += 2;     // checksum
+         // 10 bytes is the length of the Zodiac header
+         // no idea what Zodiac max length really is
+-        if ((MAX_PACKET_LENGTH - 10) >= lexer->length) {
+-            lexer->state = ZODIAC_PAYLOAD;
+-        } else {
++        if ((MAX_PACKET_LENGTH - 10) < lexer->length) {
++            lexer->length = 0;
+             return character_pushback(lexer, GROUND_STATE);
+-        }
++        }  // else
++        lexer->state = ZODIAC_PAYLOAD;
+         break;
+     case ZODIAC_PAYLOAD:
+         if (0 == --lexer->length) {
+@@ -1549,6 +1569,7 @@ static bool nextstate(struct gps_lexer_t *lexer, unsigned char c)
+             lexer->state = UBX_LENGTH_2;
+         } else {
+             // bad length
++            lexer->length = 0;
+             return character_pushback(lexer, GROUND_STATE);
+         }
+         break;
+@@ -1604,6 +1625,7 @@ static bool nextstate(struct gps_lexer_t *lexer, unsigned char c)
+         lexer->length += (c << 8);
+         if (MAX_PACKET_LENGTH <= lexer->length) {
+             // bad length
++            lexer->length = 0;
+             return character_pushback(lexer, GROUND_STATE);
+         }  // else
+ 
+@@ -1841,16 +1863,16 @@ static bool nextstate(struct gps_lexer_t *lexer, unsigned char c)
+         lexer->state = GEOSTAR_MESSAGE_ID_2;
+         break;
+     case GEOSTAR_MESSAGE_ID_2:
+-        lexer->length = (size_t)c * 4;
++        lexer->length = c * 4;
+         lexer->state = GEOSTAR_LENGTH_1;
+         break;
+     case GEOSTAR_LENGTH_1:
+         lexer->length += (c << 8) * 4;
+-        if (MAX_PACKET_LENGTH >= lexer->length) {
+-            lexer->state = GEOSTAR_LENGTH_2;
+-        } else {
++        if (MAX_PACKET_LENGTH < lexer->length) {
++            lexer->length = 0;
+             return character_pushback(lexer, GROUND_STATE);
+-        }
++        }  // else
++        lexer->state = GEOSTAR_LENGTH_2;
+         break;
+     case GEOSTAR_LENGTH_2:
+         lexer->state = GEOSTAR_PAYLOAD;
+@@ -2160,6 +2182,16 @@ static bool nextstate(struct gps_lexer_t *lexer, unsigned char c)
+ #endif  // STASH_ENABLE
+     }
+ 
++    /* Catch length overflow.  Should not happen.
++     * length is size_t, so underflow looks like overflow too. */
++    if (MAX_PACKET_LENGTH <= lexer->length) {
++        GPSD_LOG(LOG_WARN, &lexer->errout,
++                 "Too long: %zu state %u %s c x%x\n",
++                 lexer->length, lexer->state, state_table[lexer->state], c);
++        // exit(255);
++        lexer->length = 0;
++        return character_pushback(lexer, GROUND_STATE);
++    }
+     return true;        // no pushback
+ }
+ 
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.26.1.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.26.1.bb
index 6462d7b6f2..91ae0ad20f 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.26.1.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.26.1.bb
@@ -10,6 +10,7 @@ HOMEPAGE = "https://gpsd.io/"
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://gpsd.init \
            file://CVE-2025-67268.patch \
+           file://CVE-2025-67269.patch \
            "
 SRC_URI[sha256sum] = "dc7e465968c1540e61bc57c7586d6a57a0047212a014efdad348f907bc2e0990"
 

