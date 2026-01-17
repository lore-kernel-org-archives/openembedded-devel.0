Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1CD9C9831C
	for <webhook@archiver.kernel.org>; Sat, 17 Jan 2026 09:46:18 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5749.1768643169006280964
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Jan 2026 01:46:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ETQMnUxI;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a58f2e514eso18566565ad.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Jan 2026 01:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768643168; x=1769247968; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v4K350E8BYvzp0VtXTGBuYi5Mtbo/yGH+/XPWF/LfNw=;
        b=ETQMnUxIzCRANuCPOArQJsSWBkeMGgMlSU22nfyfA3ptO7/0P9ADPWVB+aPeAuhLul
         FLlhgk+qbP3I7gG6XiTRMYG+48amXACNTtZsgQBmeEsALXMba50Lm4v3wc3VwX9znTBy
         CuiZq1NEb9AOmhQgDzIRupuGVCWSyFQUXsXcCAoASzTRUvcIiEXyEfbSxK3q8s0dA7zV
         JNG2XYL7QrfFvy9p3Z+n/LczOP73Wrxg6FkP+z2zZQj1esabEBPqhtwPANtqln51swR1
         zCePsva3RVF6TEshySoEkLiOLuGQDIjA2siePNiLjtwQm08r1kb6FOWj2Rreol6YDRTq
         zHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768643168; x=1769247968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v4K350E8BYvzp0VtXTGBuYi5Mtbo/yGH+/XPWF/LfNw=;
        b=tckGUlIetneAA5GmgfQ49MvGgKL1EaKzwS4t++/UL0Mf766bn3KffulPDHLLGG5hil
         O9faUZiyVnhh4JHExisFB3aKtaG9h7RXUOAsaS86aWb8awhojdqo68X/BdF/rBKV3RAp
         fqxxj2z2RDhBM2DcAIqn4T2yCZ0M+O+/7Zv9pOJ9nIbDRJAqXoifokH8aHwR8MPzvAMU
         dO3GvI0xONuIbaRW+9ezZ2SRfOrTOgM1e+kG5Ga5hb8fxGSs5rkJkti6uMhOGt8AeakK
         1q6hlyKGK9iJ1x7USej+X3jQFhgVtxTX/otXazNfDA/mtKj1DNj18B69MV4fTonoCL0i
         RzVQ==
X-Gm-Message-State: AOJu0Yz9wD5U9mR5/FJ1y5TgC6aLJvj8nAzHZcTQBgTBHftIv7l9AFUn
	iuzNqhHFlefRyqqxnt/4ZOjm+3LzHznDTip5q7yGC+e6ozcHKC91A2Pha3TeT91S
X-Gm-Gg: AY/fxX6p7bP54pGBpquDSqYvTsPVw4oBB+dfADhc9omR8jfQ3heZoR71zFtoeuTfB2e
	fmFwnQWqqyLD/Vi3wqdznvGT3OeJhGTdwCOZSiWPMrCu+Py+ZQuk/EtrNwfiXPH2/wTD+2Uifkz
	mho5H+3h+vVb2mKYEvuF3eRaHnyrpbZsQ7dklI7gVjdsR0hTolmmnyJj6gQBwPKxijAHj62w8Ai
	aFzb1GVf+tTzC6xHRYK1wOPlEm/+gD937sf0/VDxxQHnJekitd6909VxX7rgY8o99P9+jf60vjy
	DKBRZsYgYyS10mC4fc7Abx9NGrhb4nz8SbPnw3w+HTeLRGELoJexUTlQobgeA7FPKiumaL/1v9V
	glY3ezn9hgTZoqxtyhfbuH5QMwE9R03mwEQq4izQWLUhUOZF+pktsKSjXaQjiwRbTVWE67m/Uim
	UXR7B6H9agUIbl1S2zqio9Nnc=
X-Received: by 2002:a17:903:2451:b0:2a1:325d:8219 with SMTP id d9443c01a7336-2a7188fd7a0mr46933275ad.38.1768643168123;
        Sat, 17 Jan 2026 01:46:08 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190c9ee9sm42289845ad.22.2026.01.17.01.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 01:46:07 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 2/6] gpsd: patch CVE-2025-67269
Date: Sat, 17 Jan 2026 22:45:31 +1300
Message-ID: <20260117094535.4191231-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260117094535.4191231-1-ankur.tyagi85@gmail.com>
References: <20260117094535.4191231-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Jan 2026 09:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123548

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-67269

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../gpsd/gpsd/CVE-2025-67269.patch            | 150 ++++++++++++++++++
 meta-oe/recipes-navigation/gpsd/gpsd_3.24.bb  |   1 +
 2 files changed, 151 insertions(+)
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/CVE-2025-67269.patch

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd/CVE-2025-67269.patch b/meta-oe/recipes-navigation/gpsd/gpsd/CVE-2025-67269.patch
new file mode 100644
index 0000000000..6967f2ba12
--- /dev/null
+++ b/meta-oe/recipes-navigation/gpsd/gpsd/CVE-2025-67269.patch
@@ -0,0 +1,150 @@
+From 0a0448c7d5dabe0eef940108c6e85de16e45e757 Mon Sep 17 00:00:00 2001
+From: "Gary E. Miller" <gem@rellim.com>
+Date: Wed, 3 Dec 2025 19:04:03 -0800
+Subject: [PATCH] gpsd/packet.c: Fix integer underflow is malicious Navcom
+ packet
+
+Causes DoS.  Fix issue 358
+
+CVE: CVE-2025-67269
+Upstream-Status: Backport [https://gitlab.com/gpsd/gpsd/-/commit/ffa1d6f40bca0b035fc7f5e563160ebb67199da7]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ gpsd/packet.c | 63 ++++++++++++++++++++++++++++++++++++++-------------
+ 1 file changed, 47 insertions(+), 16 deletions(-)
+
+diff --git a/gpsd/packet.c b/gpsd/packet.c
+index 8e14a17ff..51c51ced9 100644
+--- a/gpsd/packet.c
++++ b/gpsd/packet.c
+@@ -947,18 +947,22 @@ static bool nextstate(struct gps_lexer_t *lexer, unsigned char c)
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
+@@ -1000,6 +1004,7 @@ static bool nextstate(struct gps_lexer_t *lexer, unsigned char c)
+             return character_pushback(lexer, GROUND_STATE);
+         }
+         if (MAX_PACKET_LENGTH < lexer->length) {
++            lexer->length = 0;
+             return character_pushback(lexer, GROUND_STATE);
+         }
+         lexer->state = SKY_PAYLOAD;
+@@ -1182,14 +1187,29 @@ static bool nextstate(struct gps_lexer_t *lexer, unsigned char c)
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
+@@ -1316,11 +1336,11 @@ static bool nextstate(struct gps_lexer_t *lexer, unsigned char c)
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
+@@ -1356,6 +1376,7 @@ static bool nextstate(struct gps_lexer_t *lexer, unsigned char c)
+             lexer->state = UBX_LENGTH_2;
+         } else {
+             // bad length
++            lexer->length = 0;
+             return character_pushback(lexer, GROUND_STATE);
+         }
+         break;
+@@ -1502,16 +1523,16 @@ static bool nextstate(struct gps_lexer_t *lexer, unsigned char c)
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
+@@ -1823,6 +1844,16 @@ static bool nextstate(struct gps_lexer_t *lexer, unsigned char c)
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
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.24.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.24.bb
index 3833b4179b..171060044c 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.24.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.24.bb
@@ -8,6 +8,7 @@ PROVIDES = "virtual/gpsd"
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://gpsd.init \
            file://CVE-2025-67268.patch \
+           file://CVE-2025-67269.patch \
            "
 SRC_URI[sha256sum] = "00ee13f615655284874a661be13553abe66128e6deb5cd648af9bc0cb345fe5c"
 

