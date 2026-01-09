Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ABDCD1A619
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 13:05:18 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9455.1767963915212043182
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jan 2026 05:05:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F7/D5zTo;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42fb4eeb482so2362337f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 05:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767963913; x=1768568713; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=sVAffkYMGO7hTdfB9gMihERzNBV0owVoho+yGwmnqI0=;
        b=F7/D5zTocqFJRII+KwnyyfaIrgM/pEQEYC0Bkf4hyVurWUcpX74KMHZY7PWQfvnhQe
         XBZEsnCZ8nOoZIlE57aC4hmbBfXmMhKVMOYYCNwKlE4ZewvA6CFD16lbqvDIQtldiP+Z
         iT1YNRasoT7PUxmXHKjxnrzksEJmdnNcnuCWQ1kVFGBQXeq0xyWcXCqKs2riiCRUP0Qj
         UV+5QHv4oftnAH0oz/kQid49qJIOvqeCrQfz8JrgemwNdJQTacaqeZexlhGnstFu92hO
         cj65LEqV4l+9aR8AizEk70QyG52MTlfIPXE8At9sur5hhfBu1uICvQYjv2OzbQmU665Y
         4/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767963913; x=1768568713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sVAffkYMGO7hTdfB9gMihERzNBV0owVoho+yGwmnqI0=;
        b=sw4y1d3+PuGzs9DlSXAHrvXUDeAVCt6ZIuxkYu1smUn+QhZdfp037btkIgMjauCaya
         vkqjdDf7cLmojJr6Zb0Mq8JgpvKyzB8C/Q1Wb7LgQsiQC6ClxkBLOXyR1UHYhcXbrTxb
         fCKkQlNyGkZIVkOPuL+SwvdMBOLOgVnO0EhZ/caiPqrG1rLGKfWaeZsXUL9fjSC5gi7J
         nfE+lcYummu/zmJsPv7+9ntXX1b5mxgP9fFEiygW/g8mM/FHBa2opjSfBNslHQnx/Iog
         6EKLMwsZyvKUL1oTOVm19G5betCHx8zy9DSFzGMpcPjnoiHwtafsp8qoc7ZhUCs6kLOU
         lFwA==
X-Gm-Message-State: AOJu0YwvJ6dLz4EOxWRfdRSCkP2D8gJbKLHIG8kF+1z6Rkz/0g9eAInc
	y0gB8P0DdvTpuDv0/KyIOA3/cRsUME4bLzYtOJGEVG2jdllT5bXHY31H76lYxw==
X-Gm-Gg: AY/fxX7RbZCZhDhme2jneBnJlLU82dI9tP6Bwj2sGgGBiBibOojesFKczzwFYJF9l5X
	KMkH83AhHn4fyloqR4n2B12nZ0xH88DdxyadijUtniSgUWWcrVVxsGrIBdbpQyROpcDqPiNHUk6
	YIB+WBwzQH2bs9JNcBEuQuOinyEwVT0hzQPh7JwVtTd4IBXk11R0ct9mMc7TJvp0H+8Y7TlLf4B
	HFQRHGB+jU2N/NsBaO8n01x/5DQg84bAGqLFiDIi1503uSYwW05sqdQZMT6dJ0MoqQC8WHUzSKh
	sv/+VIpwwhZCYyQQLR0u+NDVqB81lT2CbqZqwZtEAKTxFABsL40rS2vfiVHHBsCREwSSyQmcqKr
	j3QvBZvtJDJEyrRrBk9I0YGpGeyfLX1XEupbkHaEyDco1AaE4haDo96Ogtd8av2dXKEJC9eht7s
	hjfJSEHCb6
X-Google-Smtp-Source: AGHT+IEbrGuSHKng+bKCFMP2RQMMBNWs2kUoc5x/GitEFwN7ycVAhqLmQWzCq9At+hLJY3Ni8w+uuA==
X-Received: by 2002:a05:6000:24c8:b0:431:2cb:d335 with SMTP id ffacd0b85a97d-432c375b114mr11107519f8f.34.1767963913316;
        Fri, 09 Jan 2026 05:05:13 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee870sm22363067f8f.36.2026.01.09.05.04.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 05:04:49 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 1/3] wireshark: upgrade 3.4.12 -> 3.4.16
Date: Fri,  9 Jan 2026 14:04:15 +0100
Message-ID: <20260109130417.1591074-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 13:05:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123300

These are all bugfix releases.

Drop CVE-2022-3190.patch, as it is included in 3.4.16.

Changelogs:
3.4.13: https://www.wireshark.org/docs/relnotes/wireshark-3.4.13.html
3.4.14: https://www.wireshark.org/docs/relnotes/wireshark-3.4.14.html
3.4.15: https://www.wireshark.org/docs/relnotes/wireshark-3.4.15.html
3.4.16: https://www.wireshark.org/docs/relnotes/wireshark-3.4.16.html

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../wireshark/files/CVE-2022-3190.patch       | 145 ------------------
 ...ireshark_3.4.12.bb => wireshark_3.4.16.bb} |   3 +-
 2 files changed, 1 insertion(+), 147 deletions(-)
 delete mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2022-3190.patch
 rename meta-networking/recipes-support/wireshark/{wireshark_3.4.12.bb => wireshark_3.4.16.bb} (96%)

diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2022-3190.patch b/meta-networking/recipes-support/wireshark/files/CVE-2022-3190.patch
deleted file mode 100644
index 0b987700f5..0000000000
--- a/meta-networking/recipes-support/wireshark/files/CVE-2022-3190.patch
+++ /dev/null
@@ -1,145 +0,0 @@
-From 4585d515b962f3b3a5e81caa64e13e8d9ed2e431 Mon Sep 17 00:00:00 2001
-From: Hitendra Prajapati <hprajapati@mvista.com>
-Date: Mon, 26 Sep 2022 12:47:00 +0530
-Subject: [PATCH] CVE-2022-3190
-
-Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/67326401a595fffbc67eeed48eb6c55d66a55f67]
-CVE : CVE-2022-3190
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- epan/dissectors/packet-f5ethtrailer.c | 108 +++++++++++++-------------
- 1 file changed, 56 insertions(+), 52 deletions(-)
-
-diff --git a/epan/dissectors/packet-f5ethtrailer.c b/epan/dissectors/packet-f5ethtrailer.c
-index ed77dfd..b15b0d4 100644
---- a/epan/dissectors/packet-f5ethtrailer.c
-+++ b/epan/dissectors/packet-f5ethtrailer.c
-@@ -2741,69 +2741,73 @@ dissect_dpt_trailer(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, void *d
- static gint
- dissect_old_trailer(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, void *data)
- {
--    proto_tree *type_tree   = NULL;
--    proto_item *ti          = NULL;
-     guint offset            = 0;
--    guint processed         = 0;
--    f5eth_tap_data_t *tdata = (f5eth_tap_data_t *)data;
--    guint8 type;
--    guint8 len;
--    guint8 ver;
- 
-     /* While we still have data in the trailer.  For old format trailers, this needs
-      * type, length, version (3 bytes) and for new format trailers, the magic header (4 bytes).
-      * All old format trailers are at least 4 bytes long, so just check for length of magic.
-      */
--    while (tvb_reported_length_remaining(tvb, offset)) {
--        type = tvb_get_guint8(tvb, offset);
--        len = tvb_get_guint8(tvb, offset + F5_OFF_LENGTH) + F5_OFF_VERSION;
--        ver = tvb_get_guint8(tvb, offset + F5_OFF_VERSION);
--
--        if (len <= tvb_reported_length_remaining(tvb, offset) && type >= F5TYPE_LOW
--            && type <= F5TYPE_HIGH && len >= F5_MIN_SANE && len <= F5_MAX_SANE
--            && ver <= F5TRAILER_VER_MAX) {
--            /* Parse out the specified trailer. */
--            switch (type) {
--            case F5TYPE_LOW:
--                ti        = proto_tree_add_item(tree, hf_low_id, tvb, offset, len, ENC_NA);
--                type_tree = proto_item_add_subtree(ti, ett_f5ethtrailer_low);
--
--                processed = dissect_low_trailer(tvb, pinfo, type_tree, offset, len, ver, tdata);
--                if (processed > 0) {
--                    tdata->trailer_len += processed;
--                    tdata->noise_low = 1;
--                }
--                break;
--            case F5TYPE_MED:
--                ti        = proto_tree_add_item(tree, hf_med_id, tvb, offset, len, ENC_NA);
--                type_tree = proto_item_add_subtree(ti, ett_f5ethtrailer_med);
--
--                processed = dissect_med_trailer(tvb, pinfo, type_tree, offset, len, ver, tdata);
--                if (processed > 0) {
--                    tdata->trailer_len += processed;
--                    tdata->noise_med = 1;
--                }
--                break;
--            case F5TYPE_HIGH:
--                ti        = proto_tree_add_item(tree, hf_high_id, tvb, offset, len, ENC_NA);
--                type_tree = proto_item_add_subtree(ti, ett_f5ethtrailer_high);
--
--                processed =
--                    dissect_high_trailer(tvb, pinfo, type_tree, offset, len, ver, tdata);
--                if (processed > 0) {
--                    tdata->trailer_len += processed;
--                    tdata->noise_high = 1;
--                }
--                break;
-+    while (tvb_reported_length_remaining(tvb, offset) >= F5_MIN_SANE) {
-+        /* length field does not include the type and length bytes.  Add them back in */
-+        guint8 len = tvb_get_guint8(tvb, offset + F5_OFF_LENGTH) + F5_OFF_VERSION;
-+        if (len > tvb_reported_length_remaining(tvb, offset)
-+            || len < F5_MIN_SANE || len > F5_MAX_SANE) {
-+            /* Invalid length - either a malformed trailer, corrupt packet, or not f5ethtrailer */
-+            return offset;
-+        }
-+        guint8 type = tvb_get_guint8(tvb, offset);
-+        guint8 ver = tvb_get_guint8(tvb, offset + F5_OFF_VERSION);
-+
-+        /* Parse out the specified trailer. */
-+        proto_tree *type_tree   = NULL;
-+        proto_item *ti          = NULL;
-+        f5eth_tap_data_t *tdata = (f5eth_tap_data_t *)data;
-+        guint processed = 0;
-+
-+        switch (type) {
-+        case F5TYPE_LOW:
-+            ti        = proto_tree_add_item(tree, hf_low_id, tvb, offset, len, ENC_NA);
-+            type_tree = proto_item_add_subtree(ti, ett_f5ethtrailer_low);
-+
-+            processed = dissect_low_trailer(tvb, pinfo, type_tree, offset, len, ver, tdata);
-+            if (processed > 0) {
-+                tdata->trailer_len += processed;
-+                tdata->noise_low = 1;
-             }
--            if (processed == 0) {
--                proto_item_set_len(ti, 1);
--                return offset;
-+            break;
-+        case F5TYPE_MED:
-+            ti        = proto_tree_add_item(tree, hf_med_id, tvb, offset, len, ENC_NA);
-+            type_tree = proto_item_add_subtree(ti, ett_f5ethtrailer_med);
-+
-+            processed = dissect_med_trailer(tvb, pinfo, type_tree, offset, len, ver, tdata);
-+            if (processed > 0) {
-+                tdata->trailer_len += processed;
-+                tdata->noise_med = 1;
-+            }
-+            break;
-+        case F5TYPE_HIGH:
-+            ti        = proto_tree_add_item(tree, hf_high_id, tvb, offset, len, ENC_NA);
-+            type_tree = proto_item_add_subtree(ti, ett_f5ethtrailer_high);
-+
-+            processed =
-+                dissect_high_trailer(tvb, pinfo, type_tree, offset, len, ver, tdata);
-+            if (processed > 0) {
-+                tdata->trailer_len += processed;
-+                tdata->noise_high = 1;
-             }
-+            break;
-+        default:
-+            /* Unknown type - malformed trailer, corrupt packet, or not f5ethtrailer - bali out*/
-+            return offset;
-+        }
-+        if (processed == 0) {
-+            /* couldn't process trailer - bali out */
-+            proto_item_set_len(ti, 1);
-+            return offset;
-         }
-         offset += processed;
-     }
--return offset;
-+    return offset;
- } /* dissect_old_trailer() */
- 
- /*---------------------------------------------------------------------------*/
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb b/meta-networking/recipes-support/wireshark/wireshark_3.4.16.bb
similarity index 96%
rename from meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
rename to meta-networking/recipes-support/wireshark/wireshark_3.4.16.bb
index afee5561c4..4835a72d76 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.4.16.bb
@@ -15,7 +15,6 @@ SRC_URI += " \
     file://0002-flex-Remove-line-directives.patch \
     file://0003-bison-Remove-line-directives.patch \
     file://0004-lemon-Remove-line-directives.patch \
-    file://CVE-2022-3190.patch \
     file://CVE-2023-2855.patch \
     file://CVE-2023-2856.patch \
     file://CVE-2023-2858.patch \
@@ -37,7 +36,7 @@ SRC_URI += " \
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[sha256sum] = "881a13303e263b7dc7fe337534c8a541d4914552287879bed30bbe76c5bf68ca"
+SRC_URI[sha256sum] = "6acb3155b89b65bcdbcdac7a9e6a59013a6e21d8ae6a8249a9af4fe9ce3d91ba"
 
 PE = "1"
 

