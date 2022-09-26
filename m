Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E24E0C07E9D
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 11:41:06 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web12.27619.1664192463995146947
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Sep 2022 04:41:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=LLLYj9/a;
 spf=pass (domain: mvista.com, ip: 209.85.210.177,
 mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f177.google.com with SMTP id i6so2231065pfb.2
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Sep 2022 04:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=y87+YeR9pxjF1DfUIXyvr6MBAbENzBjzuFjOMEH0KwA=;
        b=LLLYj9/a6B39gtMQcMadOQ6TN7yDTScNZ1M+Agc/ObecDBEP4/IXZ/k/SUHNlxlpfL
         TNRSb6xQl3QYpRZ7zyXIysIsCZebpBDGDyx+TzYiPZ/9u7OCDl+55+2Ptg6lboBCuCbP
         nLQm1u/ncInBnbrtHSE6RMNETqoDYi/IdPrrk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=y87+YeR9pxjF1DfUIXyvr6MBAbENzBjzuFjOMEH0KwA=;
        b=Kajxm4UWZSnPIFqaOL4/9jp3yhylc433+ijVOP+U9NME/m/GbPIv4Dx1N+D/mLuACY
         VuA2aymTmZRf6EJZIYyeawggUj5lscYgOqm1iOkmlrEbH6hyG/ZHFMuYNTuwEimJjtPt
         OuUJmlUFie/sgapcQkuSFyKMpzxfg6ge1DwcR3QnPNvedb1oDEU3v4ueYwUpzM8FWYAr
         k5x569NCGYH1kj5YCeOaJ9MTY2xTVca1IE64pafj38FPbic+cD8mRURVzKiBInC6bkLq
         yFK0VUv0KYiiatCq2ncWAnVHN5nOtymMKqa9CYI0SKYBJNMJroV5ZxDiOxVPeGDPKrCc
         DsDA==
X-Gm-Message-State: ACrzQf0/TU5Mq67cK0Q9qvjavOAQye68DiOObThx0xYuzy5YF4vFo1Ns
	yNiGh1PDChyXknYWO3eQdtJ1EShFu1ri3g==
X-Google-Smtp-Source: 
 AMsMyM6LA1+PEBW9t5b3O4PXiqfGyIcDbcBmGd4M/LO+ieCNPZCGP2+wWXjPXOXIcxjtxJhrduarPA==
X-Received: by 2002:a63:5246:0:b0:42b:e4a5:7252 with SMTP id
 s6-20020a635246000000b0042be4a57252mr19155199pgl.566.1664192462770;
        Mon, 26 Sep 2022 04:41:02 -0700 (PDT)
Received: from MVIN00024 ([150.129.170.219])
        by smtp.gmail.com with ESMTPSA id
 12-20020a630a0c000000b0041a6638b357sm10458043pgk.72.2022.09.26.04.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 04:41:02 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation);
 Mon, 26 Sep 2022 17:10:57 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networking][kirkstone][PATCH] wireshark: CVE-2022-3190 Infinite
 loop in legacy style dissector
Date: Mon, 26 Sep 2022 17:10:55 +0530
Message-Id: <20220926114055.4607-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Sep 2022 11:41:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98953

Source: https://gitlab.com/wireshark/wireshark/-/commit/67326401a595fffbc67eeed48eb6c55d66a55f67
MR: 122044
Type: Security Fix
Disposition: Backport from https://gitlab.com/wireshark/wireshark/-/commit/67326401a595fffbc67eeed48eb6c55d66a55f67
ChangeID: 13f833dfbd8f76db1ea01984441b212f08e6e4f5
Description:
          CVE-2022-3190 wireshark: Infinite loop in legacy style dissector.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../wireshark/files/CVE-2022-3190.patch       | 145 ++++++++++++++++++
 .../wireshark/wireshark_3.4.12.bb             |   1 +
 2 files changed, 146 insertions(+)
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2022-3190.patch

diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2022-3190.patch b/meta-networking/recipes-support/wireshark/files/CVE-2022-3190.patch
new file mode 100644
index 0000000000..0b987700f5
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/CVE-2022-3190.patch
@@ -0,0 +1,145 @@
+From 4585d515b962f3b3a5e81caa64e13e8d9ed2e431 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Mon, 26 Sep 2022 12:47:00 +0530
+Subject: [PATCH] CVE-2022-3190
+
+Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/67326401a595fffbc67eeed48eb6c55d66a55f67]
+CVE : CVE-2022-3190
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ epan/dissectors/packet-f5ethtrailer.c | 108 +++++++++++++-------------
+ 1 file changed, 56 insertions(+), 52 deletions(-)
+
+diff --git a/epan/dissectors/packet-f5ethtrailer.c b/epan/dissectors/packet-f5ethtrailer.c
+index ed77dfd..b15b0d4 100644
+--- a/epan/dissectors/packet-f5ethtrailer.c
++++ b/epan/dissectors/packet-f5ethtrailer.c
+@@ -2741,69 +2741,73 @@ dissect_dpt_trailer(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, void *d
+ static gint
+ dissect_old_trailer(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, void *data)
+ {
+-    proto_tree *type_tree   = NULL;
+-    proto_item *ti          = NULL;
+     guint offset            = 0;
+-    guint processed         = 0;
+-    f5eth_tap_data_t *tdata = (f5eth_tap_data_t *)data;
+-    guint8 type;
+-    guint8 len;
+-    guint8 ver;
+ 
+     /* While we still have data in the trailer.  For old format trailers, this needs
+      * type, length, version (3 bytes) and for new format trailers, the magic header (4 bytes).
+      * All old format trailers are at least 4 bytes long, so just check for length of magic.
+      */
+-    while (tvb_reported_length_remaining(tvb, offset)) {
+-        type = tvb_get_guint8(tvb, offset);
+-        len = tvb_get_guint8(tvb, offset + F5_OFF_LENGTH) + F5_OFF_VERSION;
+-        ver = tvb_get_guint8(tvb, offset + F5_OFF_VERSION);
+-
+-        if (len <= tvb_reported_length_remaining(tvb, offset) && type >= F5TYPE_LOW
+-            && type <= F5TYPE_HIGH && len >= F5_MIN_SANE && len <= F5_MAX_SANE
+-            && ver <= F5TRAILER_VER_MAX) {
+-            /* Parse out the specified trailer. */
+-            switch (type) {
+-            case F5TYPE_LOW:
+-                ti        = proto_tree_add_item(tree, hf_low_id, tvb, offset, len, ENC_NA);
+-                type_tree = proto_item_add_subtree(ti, ett_f5ethtrailer_low);
+-
+-                processed = dissect_low_trailer(tvb, pinfo, type_tree, offset, len, ver, tdata);
+-                if (processed > 0) {
+-                    tdata->trailer_len += processed;
+-                    tdata->noise_low = 1;
+-                }
+-                break;
+-            case F5TYPE_MED:
+-                ti        = proto_tree_add_item(tree, hf_med_id, tvb, offset, len, ENC_NA);
+-                type_tree = proto_item_add_subtree(ti, ett_f5ethtrailer_med);
+-
+-                processed = dissect_med_trailer(tvb, pinfo, type_tree, offset, len, ver, tdata);
+-                if (processed > 0) {
+-                    tdata->trailer_len += processed;
+-                    tdata->noise_med = 1;
+-                }
+-                break;
+-            case F5TYPE_HIGH:
+-                ti        = proto_tree_add_item(tree, hf_high_id, tvb, offset, len, ENC_NA);
+-                type_tree = proto_item_add_subtree(ti, ett_f5ethtrailer_high);
+-
+-                processed =
+-                    dissect_high_trailer(tvb, pinfo, type_tree, offset, len, ver, tdata);
+-                if (processed > 0) {
+-                    tdata->trailer_len += processed;
+-                    tdata->noise_high = 1;
+-                }
+-                break;
++    while (tvb_reported_length_remaining(tvb, offset) >= F5_MIN_SANE) {
++        /* length field does not include the type and length bytes.  Add them back in */
++        guint8 len = tvb_get_guint8(tvb, offset + F5_OFF_LENGTH) + F5_OFF_VERSION;
++        if (len > tvb_reported_length_remaining(tvb, offset)
++            || len < F5_MIN_SANE || len > F5_MAX_SANE) {
++            /* Invalid length - either a malformed trailer, corrupt packet, or not f5ethtrailer */
++            return offset;
++        }
++        guint8 type = tvb_get_guint8(tvb, offset);
++        guint8 ver = tvb_get_guint8(tvb, offset + F5_OFF_VERSION);
++
++        /* Parse out the specified trailer. */
++        proto_tree *type_tree   = NULL;
++        proto_item *ti          = NULL;
++        f5eth_tap_data_t *tdata = (f5eth_tap_data_t *)data;
++        guint processed = 0;
++
++        switch (type) {
++        case F5TYPE_LOW:
++            ti        = proto_tree_add_item(tree, hf_low_id, tvb, offset, len, ENC_NA);
++            type_tree = proto_item_add_subtree(ti, ett_f5ethtrailer_low);
++
++            processed = dissect_low_trailer(tvb, pinfo, type_tree, offset, len, ver, tdata);
++            if (processed > 0) {
++                tdata->trailer_len += processed;
++                tdata->noise_low = 1;
+             }
+-            if (processed == 0) {
+-                proto_item_set_len(ti, 1);
+-                return offset;
++            break;
++        case F5TYPE_MED:
++            ti        = proto_tree_add_item(tree, hf_med_id, tvb, offset, len, ENC_NA);
++            type_tree = proto_item_add_subtree(ti, ett_f5ethtrailer_med);
++
++            processed = dissect_med_trailer(tvb, pinfo, type_tree, offset, len, ver, tdata);
++            if (processed > 0) {
++                tdata->trailer_len += processed;
++                tdata->noise_med = 1;
++            }
++            break;
++        case F5TYPE_HIGH:
++            ti        = proto_tree_add_item(tree, hf_high_id, tvb, offset, len, ENC_NA);
++            type_tree = proto_item_add_subtree(ti, ett_f5ethtrailer_high);
++
++            processed =
++                dissect_high_trailer(tvb, pinfo, type_tree, offset, len, ver, tdata);
++            if (processed > 0) {
++                tdata->trailer_len += processed;
++                tdata->noise_high = 1;
+             }
++            break;
++        default:
++            /* Unknown type - malformed trailer, corrupt packet, or not f5ethtrailer - bali out*/
++            return offset;
++        }
++        if (processed == 0) {
++            /* couldn't process trailer - bali out */
++            proto_item_set_len(ti, 1);
++            return offset;
+         }
+         offset += processed;
+     }
+-return offset;
++    return offset;
+ } /* dissect_old_trailer() */
+ 
+ /*---------------------------------------------------------------------------*/
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb b/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
index 38fdbce892..1a4aedc139 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
@@ -15,6 +15,7 @@ SRC_URI += " \
     file://0002-flex-Remove-line-directives.patch \
     file://0003-bison-Remove-line-directives.patch \
     file://0004-lemon-Remove-line-directives.patch \
+    file://CVE-2022-3190.patch \
 "
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
-- 
2.25.1


