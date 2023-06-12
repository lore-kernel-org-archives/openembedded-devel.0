Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8573C7EE25
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 11:28:22 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.56306.1686569294143387720
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jun 2023 04:28:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=FbJsv8BF;
 spf=pass (domain: mvista.com, ip: 209.85.210.172, mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-65292f79456so3169397b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jun 2023 04:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1686569293; x=1689161293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bva93SO5usjotaZRHxCAKp75GgTS0TjkPoNEHj/ccVI=;
        b=FbJsv8BFjz8wQLqK8RM4aIHdjD8Md7jpxR//EaFNCZ/VjvwJPW8ibI2VIkvspd7Irp
         5nJSJXPR8zcU9P7szvWOTIS8yJCVU0zWExq9Lj1e9ZMyeUbJPdwqSEuasXcA013w0gjl
         gIjUdWec8wv49j8aCVnx+Khs4SeCEcugI4L08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686569293; x=1689161293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bva93SO5usjotaZRHxCAKp75GgTS0TjkPoNEHj/ccVI=;
        b=daz9mlaEe7KqRJJx4NdyaHZrlNyN/4UwtOcFruYOZ8plVoLlLEtRR6h+VyOCfhL0MU
         zxjJNyRgm/cV0B84kPjT0/XbkZ9m2o28DCv+IY0+RmVEd+E/VJ0Y2i8Nwl56jpP62iZi
         ALY4NkROKcaHqN7k7gg6pQbOJivVOWyjAvgpklGSQyQudUHtSe3AcPDfs5+ift1eXEPG
         ssTZ/dudkg0QElZ42P34fIAyVMeFWSp/rW/d1pCEK7ay8bu21AErxIryo5jWSm5IGGhy
         etGeL/cjr33pioZCIH3I/imhEk6YIEMQZ0PIGNIoA6zOdWUUT/c+/CA+HD39adTljcfy
         Rw1w==
X-Gm-Message-State: AC+VfDwYx6btJfU4tQ2ZZQguhf1RuEYps8BsQLRDok7B1rljvP9sRN0D
	WWCuvKn9iwhPyZUAyVYAHyRXWXzrKS7xvKEwmXs=
X-Google-Smtp-Source: ACHHUZ5zI/tXQM6XTt69wuW2mIH3XkPfOmPtaT/x1W/9PfNjNOdO+Qb+odyF7IrZ1R3jV73ri7yUDQ==
X-Received: by 2002:a05:6a21:164d:b0:10a:dd89:420f with SMTP id no13-20020a056a21164d00b0010add89420fmr8280091pzb.6.1686569293278;
        Mon, 12 Jun 2023 04:28:13 -0700 (PDT)
Received: from MVIN00024 ([103.250.136.163])
        by smtp.gmail.com with ESMTPSA id h21-20020a631215000000b0052858b41008sm7275452pgl.87.2023.06.12.04.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 04:28:12 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Mon, 12 Jun 2023 16:58:07 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networking][mickledore][PATCH] wireshark: CVE-2023-2952 XRA dissector infinite loop
Date: Mon, 12 Jun 2023 16:58:06 +0530
Message-Id: <20230612112806.10324-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jun 2023 11:28:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103213

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
index 693a16793..7d49c3c27 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
@@ -16,6 +16,7 @@ SRC_URI += " \
     file://0003-bison-Remove-line-directives.patch \
     file://0004-lemon-Remove-line-directives.patch \
     file://CVE-2022-3190.patch \
+    file://CVE-2023-2952.patch \
 "
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
-- 
2.25.1


