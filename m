Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A59FFEB64DA
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 11:46:02 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.6366.1686915953284137307
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Jun 2023 04:45:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=XTWuSLBQ;
 spf=pass (domain: mvista.com, ip: 209.85.216.53, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-25e89791877so451801a91.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jun 2023 04:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1686915952; x=1689507952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gKvIlpOFtOCXByDqgNDvarOdDgxhaLKYvEeC+CyfdHQ=;
        b=XTWuSLBQntX4A9iKLQeB0yCC/kJVeYfiIWBDhmnTvIE4yr4E1Eq8CCV3/3QoUGDNOS
         bBWCSOmAUPF/RhxeGhFN7OB10WT2nCKIiEKkGS1jaVTbrZDQ61zIt/EgdJwggKybUQLx
         hwKUTTJID4UBqU1Onxuzt3kKm78b3tr/gif+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686915952; x=1689507952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gKvIlpOFtOCXByDqgNDvarOdDgxhaLKYvEeC+CyfdHQ=;
        b=lmA8DCdr00Vj6m093+gN4hDCWr/FK4aV8J9vH6bQNtVg8QzSdv3AvrIwTx3QiDoe8l
         WZpHQnlp/cUQLJ9Iuu1hbEM0xcfBl9RK59RhJgEMTMFO7VTtCL6qgDqXcAvj3QPelwmv
         2KdoYDqBb2xZV1D6iBz+8vbejxzvY+Sm/62FtXr2LJLb62XG4fNwnfxXTGKo+OQqbimh
         g0d+KIUy1aU0BVJRce4n7cEwu0Y4HjIAH2WKc+NpIGBePYylBL10Ao53D+9fjMlZagtf
         HhvuqmVDPud1lesiNRbgwXVcH05JYreSc4t4iiCiFjg2XewUIkTdrxdRkwu/wBrwUGYG
         qZKw==
X-Gm-Message-State: AC+VfDw9h2pq2W3AZJAIV55G9i/ZpbHJbq3wXWj/8H54aL9xXSGpxQxi
	doA9xpzFpFn9+atd/CXvgEzCdVx0GXtIYElxbr4=
X-Google-Smtp-Source: ACHHUZ6ZrfGXy9H/UbOK0EbL5Mu5MyZKO455GiE8F/iqIk+GctZQ+5QS5AxkweLRbBfIHZ2PLOd9FA==
X-Received: by 2002:a17:90a:fb52:b0:25b:b4c6:d13e with SMTP id iq18-20020a17090afb5200b0025bb4c6d13emr1397404pjb.8.1686915952473;
        Fri, 16 Jun 2023 04:45:52 -0700 (PDT)
Received: from MVIN00024 ([152.58.39.145])
        by smtp.gmail.com with ESMTPSA id qa2-20020a17090b4fc200b0025bf0d7c186sm1210647pjb.29.2023.06.16.04.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 04:45:52 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Fri, 16 Jun 2023 17:13:37 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networking][mickledore][PATCHv2] wireshark: CVE-2023-2952 XRA dissector infinite loop
Date: Fri, 16 Jun 2023 17:13:34 +0530
Message-Id: <20230616114334.37929-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Jun 2023 11:46:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103339

Upstream-Status: Backport from https://gitlab.com/wireshark/wireshark/-/commit/e18d0e369729b0fff5f76f41cbae67e97c2e52e5

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../wireshark/files/CVE-2023-2952.patch       | 98 +++++++++++++++++++
 .../wireshark/wireshark_3.4.12.bb             |  1 +
 2 files changed, 99 insertions(+)
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2023-2952.patch

diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2023-2952.patch b/meta-networking/recipes-support/wireshark/files/CVE-2023-2952.patch
new file mode 100644
index 000000000..41b02bb3f
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/CVE-2023-2952.patch
@@ -0,0 +1,98 @@
+From ce87eac0325581b600b3093fcd75080df14ccfda Mon Sep 17 00:00:00 2001
+From: Gerald Combs <gerald@wireshark.org>
+Date: Tue, 23 May 2023 13:52:03 -0700
+Subject: [PATCH] XRA: Fix an infinite loop
+
+C compilers don't care what size a value was on the wire. Use
+naturally-sized ints, including in dissect_message_channel_mb where we
+would otherwise overflow and loop infinitely.
+
+Fixes #19100
+
+Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/e18d0e369729b0fff5f76f41cbae67e97c2e52e5]
+CVE: CVE-2023-2952
+
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ epan/dissectors/packet-xra.c | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/epan/dissectors/packet-xra.c b/epan/dissectors/packet-xra.c
+index 68a8e72..6c7ab74 100644
+--- a/epan/dissectors/packet-xra.c
++++ b/epan/dissectors/packet-xra.c
+@@ -478,7 +478,7 @@ dissect_xra_tlv_cw_info(tvbuff_t * tvb, proto_tree * tree, void* data _U_, guint
+   it = proto_tree_add_item (tree, hf_xra_tlv_cw_info, tvb, 0, tlv_length, ENC_NA);
+   xra_tlv_cw_info_tree = proto_item_add_subtree (it, ett_xra_tlv_cw_info);
+ 
+-  guint32 tlv_index =0;
++  unsigned tlv_index = 0;
+   while (tlv_index < tlv_length) {
+     guint8 type = tvb_get_guint8 (tvb, tlv_index);
+     ++tlv_index;
+@@ -533,7 +533,7 @@ dissect_xra_tlv_ms_info(tvbuff_t * tvb, proto_tree * tree, void* data _U_, guint
+   it = proto_tree_add_item (tree, hf_xra_tlv_ms_info, tvb, 0, tlv_length, ENC_NA);
+   xra_tlv_ms_info_tree = proto_item_add_subtree (it, ett_xra_tlv_ms_info);
+ 
+-  guint32 tlv_index =0;
++  unsigned tlv_index = 0;
+   while (tlv_index < tlv_length) {
+     guint8 type = tvb_get_guint8 (tvb, tlv_index);
+     ++tlv_index;
+@@ -567,7 +567,7 @@ dissect_xra_tlv_burst_info(tvbuff_t * tvb, proto_tree * tree, void* data _U_, gu
+   it = proto_tree_add_item (tree, hf_xra_tlv_burst_info, tvb, 0, tlv_length, ENC_NA);
+   xra_tlv_burst_info_tree = proto_item_add_subtree (it, ett_xra_tlv_burst_info);
+ 
+-  guint32 tlv_index =0;
++  unsigned tlv_index = 0;
+   while (tlv_index < tlv_length) {
+     guint8 type = tvb_get_guint8 (tvb, tlv_index);
+     ++tlv_index;
+@@ -607,7 +607,7 @@ dissect_xra_tlv(tvbuff_t * tvb, packet_info * pinfo, proto_tree * tree, void* da
+   it = proto_tree_add_item (tree, hf_xra_tlv, tvb, 0, tlv_length, ENC_NA);
+   xra_tlv_tree = proto_item_add_subtree (it, ett_xra_tlv);
+ 
+-  guint32 tlv_index =0;
++  unsigned tlv_index = 0;
+   tvbuff_t *xra_tlv_cw_info_tvb, *xra_tlv_ms_info_tvb, *xra_tlv_burst_info_tvb;
+ 
+   while (tlv_index < tlv_length) {
+@@ -751,7 +751,7 @@ dissect_message_channel_mb(tvbuff_t * tvb, packet_info * pinfo, proto_tree* tree
+   if(packet_start_pointer_field_present) {
+     proto_tree_add_item_ret_uint (tree, hf_plc_mb_mc_psp, tvb, 1, 2, FALSE, &packet_start_pointer);
+ 
+-    guint16 docsis_start = 3 + packet_start_pointer;
++    unsigned docsis_start = 3 + packet_start_pointer;
+     while (docsis_start + 6 < remaining_length) {
+       /*DOCSIS header in packet*/
+       guint8 fc = tvb_get_guint8(tvb,docsis_start + 0);
+@@ -760,7 +760,7 @@ dissect_message_channel_mb(tvbuff_t * tvb, packet_info * pinfo, proto_tree* tree
+         docsis_start += 1;
+         continue;
+       }
+-      guint16 docsis_length = 256*tvb_get_guint8(tvb,docsis_start + 2) + tvb_get_guint8(tvb,docsis_start + 3);
++      unsigned docsis_length = 256*tvb_get_guint8(tvb,docsis_start + 2) + tvb_get_guint8(tvb,docsis_start + 3);
+       if (docsis_start + 6 + docsis_length <= remaining_length) {
+         /*DOCSIS packet included in packet*/
+         tvbuff_t *docsis_tvb;
+@@ -830,7 +830,7 @@ dissect_ncp_message_block(tvbuff_t * tvb, proto_tree * tree) {
+ static int
+ dissect_plc(tvbuff_t * tvb, packet_info * pinfo, proto_tree * tree, void* data _U_) {
+ 
+-  guint16 offset = 0;
++  int offset = 0;
+   proto_tree *plc_tree;
+   proto_item *plc_item;
+   tvbuff_t *mb_tvb;
+@@ -890,7 +890,7 @@ dissect_plc(tvbuff_t * tvb, packet_info * pinfo, proto_tree * tree, void* data _
+ 
+ static int
+ dissect_ncp(tvbuff_t * tvb, proto_tree * tree, void* data _U_) {
+-  guint16 offset = 0;
++  int offset = 0;
+   proto_tree *ncp_tree;
+   proto_item *ncp_item;
+   tvbuff_t *ncp_mb_tvb;
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb b/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
index 758c5e57d..96603710f 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
@@ -20,6 +20,7 @@ SRC_URI += " \
     file://CVE-2023-2856.patch \
     file://CVE-2023-2858.patch \
     file://CVE-2023-2879.patch \
+    file://CVE-2023-2952.patch \
 "
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
-- 
2.25.1


