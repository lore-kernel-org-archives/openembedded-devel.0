Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40D0CC47074
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 11:14:18 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web10.9397.1704885248254443423
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jan 2024 03:14:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Wv5yTVtj;
 spf=pass (domain: mvista.com, ip: 209.85.167.174, mailfrom: asharma@mvista.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3bbd6e37a9bso3648543b6e.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jan 2024 03:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1704885247; x=1705490047; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9r8SUzVtHhDuiJrnM0BsLD+Sm7/RVKJMD02wxCcJX3E=;
        b=Wv5yTVtjaa7sWBmUqsBRnZA7W8ztKBmZcaPUfnV7L+CzGEYSSSOknCe+ipuMO0CpHn
         VqTgMaB8J6g1QxGGn4f5im2D11urbkOv/m3yKBa5o7Pz3tgycx6rBl7Z7QU7EFVbgzjH
         mtD9ZHYgPs72yyBs1O4zSTsbcrI/JEOVL4diw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704885247; x=1705490047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9r8SUzVtHhDuiJrnM0BsLD+Sm7/RVKJMD02wxCcJX3E=;
        b=SJP7NZQWys5hjdR2wlvly0BEbd2jn6Dr4sm/gFyTP53+qKtkadyM9x9BpmcRxRbq/H
         UXPhlgKr8Y9duaRWf9PFDH+/NDNBATJa3dCuQXi2NkGnCmVwO8HcI4dhpHFdL8rxyN2S
         6VGQayj9mNSJdhJ3I6YQCOPpYMqGk2P8NlH1/6/O409ByOtKLYXY5jwm3qi3H8kYRFq9
         v0iLL9S/QFZx/BU/r197Kt1YOaMPxQpDNbo4/DOcYrkYvWeSv1q6MRLACY2NmU7z3RkS
         jx6NEzmBexFYPfTsIybHNdsdgJWsO9xg5AjFWXWNK3DSt2B6zoD1PuoEV59UxE5MUkGs
         lu3Q==
X-Gm-Message-State: AOJu0YyxkoibCTFce2qu9lyCWfNWpi22U7gEYr1w5bpR5BpFtW8eQ1Qf
	1ql6xSrLCS0YTm+k6Qp9ZC3t69MN3Fv6P7Hj9Q3h1+bAEiw=
X-Google-Smtp-Source: AGHT+IFDD7JoZeef/6zswWoDGqUyt91TUwhYDvnVZ9NCMr++N3XKNcdPgFJoFrcEEUB/ctVaUJxTOQ==
X-Received: by 2002:a05:6808:1390:b0:3b9:fc7c:b585 with SMTP id c16-20020a056808139000b003b9fc7cb585mr1175649oiw.32.1704885246988;
        Wed, 10 Jan 2024 03:14:06 -0800 (PST)
Received: from asharma-Latitude-3400 ([223.190.84.213])
        by smtp.gmail.com with ESMTPSA id h20-20020a635314000000b005b7dd356f75sm3139031pgb.32.2024.01.10.03.14.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Jan 2024 03:14:06 -0800 (PST)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Wed, 10 Jan 2024 16:41:53 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [oe][meta-networking][dunfell][PATCH V2] wireshark: Backport fix for CVE-2023-1992
Date: Wed, 10 Jan 2024 16:41:51 +0530
Message-Id: <20240110111151.22531-1-asharma@mvista.com>
X-Mailer: git-send-email 2.24.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jan 2024 11:14:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108214

RPCoRDMA: Frame end cleanup for global write offsets

Upstream-Status: Backport from [https://gitlab.com/colin.mcinnes/wireshark/-/commit/3c8be14c827f1587da3c2b3bb0d9c04faff57413]
Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../wireshark/files/CVE-2023-1992.patch       | 62 +++++++++++++++++++
 .../wireshark/wireshark_3.2.18.bb             |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2023-1992.patch

diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2023-1992.patch b/meta-networking/recipes-support/wireshark/files/CVE-2023-1992.patch
new file mode 100644
index 0000000000..2fbef6bae0
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/CVE-2023-1992.patch
@@ -0,0 +1,62 @@
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
+---
+Upstream-Status: Backport from [https://gitlab.com/colin.mcinnes/wireshark/-/commit/3c8be14c827f1587da3c2b3bb0d9c04faff57413]
+CVE: CVE-2023-1992
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+ epan/dissectors/packet-rpcrdma.c | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/epan/dissectors/packet-rpcrdma.c b/epan/dissectors/packet-rpcrdma.c
+index 680187b2653..3f250f0ea1c 100644
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
+@@ -285,6 +286,18 @@ void rpcrdma_insert_offset(gint offset)
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
+@@ -1600,6 +1613,7 @@ dissect_rpcrdma(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, void* data
+             if (write_size > 0 && !pinfo->fd->visited) {
+                 /* Initialize array of write chunk offsets */
+                 gp_rdma_write_offsets = wmem_array_new(wmem_packet_scope(), sizeof(gint));
++                register_frame_end_routine(pinfo, reset_write_offsets);
+                 TRY {
+                     /*
+                      * Call the upper layer dissector to get a list of offsets
+-- 
+GitLab
+
diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb b/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
index 7d99a1438b..f77b68a03c 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
@@ -21,6 +21,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
            file://CVE-2023-3649.patch \
            file://CVE-2022-0585-CVE-2023-2879.patch \
            file://CVE-2022-4345.patch \
+           file://CVE-2023-1992.patch \
            "
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-- 
2.24.4


