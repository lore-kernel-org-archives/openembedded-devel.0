Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B74CC4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 04:38:20 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.13354.1702010298259002745
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Dec 2023 20:38:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=JEvWeWrF;
 spf=pass (domain: mvista.com, ip: 209.85.216.53, mailfrom: vkumbhar@mvista.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2886579d59fso1730550a91.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 20:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1702010297; x=1702615097; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D7fPNvCg13xruoTtb3RO2iDKtPfmLCbe1WsxFOr2FJ0=;
        b=JEvWeWrF9vN2AlowIU0Ymt+xVRDTT0IDpEOHNOPzrFnqjrrC9bBbzJDO4/HYCj0IsX
         qc0SRgrXSNvAKFKEc0GZjYuR3FnfV5KMAJfzxAxUXsI/HTnSiVh70qKNEkj4B2vB/7LS
         FQrVcehNi/1fdvmKnFEfsct862GGmihsybL6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702010297; x=1702615097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D7fPNvCg13xruoTtb3RO2iDKtPfmLCbe1WsxFOr2FJ0=;
        b=EHIk8VISL5MVWpLlQZyIKUaTmeBKmnyRHKsAF4eReY/L9HJjkWHJdxG/28vmat2oHK
         pxlN/rhP1C/AWadlTWvc3JPI1nK5IyshDOpPdsDRB7g7APYLhEusd6XI5J02P0JDyQFn
         +lM/O0Xd4/bDSh1u2Ds000ON2iBriIPhUy7AENCxGe/9p8pD1A3uXYXI8WTVcmI4HvGU
         ozbmsxr/2x3LQGSmQAXhmUthYQysu3vCT0xZMjFpEScX+FNcApUlLrPr3VygXFdP+YU3
         PF38SZj0916MwtEOLJcNreMyBeIYZzY4kHaIpk1890JEykmix/lIbsG7oUCp2ftIFh4T
         gE2Q==
X-Gm-Message-State: AOJu0YxUAFTzQQAbo0oTFBSSMc/M2ZT427RCdzruSl9fW4ZA8RRhhWjD
	dlGVNXAGgs3BNoB1DhOLEh8rMfD4vnMHly7vwbE=
X-Google-Smtp-Source: AGHT+IHRNMtGTMdE5sFKU2yWB6B6eG4LvvwXmrWGbEv0ibb1bJSNE9rtw14P9yloAoGM8oJXcBusLw==
X-Received: by 2002:a17:90b:3506:b0:285:8673:450d with SMTP id ls6-20020a17090b350600b002858673450dmr3246309pjb.40.1702010296770;
        Thu, 07 Dec 2023 20:38:16 -0800 (PST)
Received: from vkumbhar-Latitude-3400.. ([116.74.189.161])
        by smtp.googlemail.com with ESMTPSA id dj14-20020a17090ad2ce00b00286e8fe03c1sm774018pjb.22.2023.12.07.20.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 20:38:16 -0800 (PST)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [meta-oe][kirkstone][PATCH] wireshark: fix CVE-2023-1992 RPCoRDMA dissector crash
Date: Fri,  8 Dec 2023 10:08:06 +0530
Message-Id: <20231208043806.554858-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Dec 2023 04:38:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107301

Upstream-Status: Backport from https://gitlab.com/colin.mcinnes/wireshark/-/commit/3c8be14c827f1587da3c2b3bb0d9c04faff5741

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 .../wireshark/files/CVE-2023-1992.patch       | 61 +++++++++++++++++++
 .../wireshark/wireshark_3.4.12.bb             |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2023-1992.patch

diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2023-1992.patch b/meta-networking/recipes-support/wireshark/files/CVE-2023-1992.patch
new file mode 100644
index 0000000000..6bddf975d0
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/CVE-2023-1992.patch
@@ -0,0 +1,61 @@
+From 3c8be14c827f1587da3c2b3bb0d9c04faff57413 Mon Sep 17 00:00:00 2001
+From: John Thacker <johnthacker@gmail.com>
+Date: Sun, 19 Mar 2023 15:16:39 -0400
+Subject: [PATCH] RPCoRDMA: Frame end cleanup for global write offsets
+
+Add a frame end routine for a global which is assigned to packet
+scoped memory. It really should be made proto data, but is used
+in a function in the header (that doesn't take the packet info
+struct as an argument) and this fix needs to be made in stable
+branches.
+
+Fix #18852
+
+Upstream-Status: Backport [https://gitlab.com/colin.mcinnes/wireshark/-/commit/3c8be14c827f1587da3c2b3bb0d9c04faff5741]
+CVE: CVE-2023-1992
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ epan/dissectors/packet-rpcrdma.c | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/epan/dissectors/packet-rpcrdma.c b/epan/dissectors/packet-rpcrdma.c
+index 76085c7..9d57bae 100644
+--- a/epan/dissectors/packet-rpcrdma.c
++++ b/epan/dissectors/packet-rpcrdma.c
+@@ -24,6 +24,7 @@
+ #include <epan/addr_resolv.h>
+
+ #include "packet-rpcrdma.h"
++#include "packet-frame.h"
+ #include "packet-infiniband.h"
+ #include "packet-iwarp-ddp-rdmap.h"
+
+@@ -270,6 +271,18 @@ void rpcrdma_insert_offset(gint offset)
+     wmem_array_append_one(gp_rdma_write_offsets, offset);
+ }
+
++/*
++ * Reset the array of write offsets at the end of the frame. These
++ * are packet scoped, so they don't need to be freed, but we want
++ * to ensure that the global doesn't point to no longer allocated
++ * memory in a later packet.
++ */
++static void
++reset_write_offsets(void)
++{
++    gp_rdma_write_offsets = NULL;
++}
++
+ /* Get conversation state, it is created if it does not exist */
+ static rdma_conv_info_t *get_rdma_conv_info(packet_info *pinfo)
+ {
+@@ -1392,6 +1405,7 @@ dissect_rpcrdma(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, void* data
+             if (write_size > 0 && !pinfo->fd->visited) {
+                 /* Initialize array of write chunk offsets */
+                 gp_rdma_write_offsets = wmem_array_new(wmem_packet_scope(), sizeof(gint));
++                register_frame_end_routine(pinfo, reset_write_offsets);
+                 TRY {
+                     /*
+                      * Call the upper layer dissector to get a list of offsets
+--
+2.40.1
diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb b/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
index 19489a8bcb..f233b42532 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
@@ -25,6 +25,7 @@ SRC_URI += " \
     file://CVE-2023-0667.patch \
     file://CVE-2023-0668.patch \
     file://CVE-2023-2906.patch \
+    file://CVE-2023-1992.patch \
 "
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
-- 
2.40.1


