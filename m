Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA5FEC3DA6E
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 09:06:14 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.19966.1704445574061578463
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Jan 2024 01:06:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=X/ume4Q8;
 spf=pass (domain: mvista.com, ip: 209.85.214.172, mailfrom: asharma@mvista.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1d3e6c86868so9819865ad.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Jan 2024 01:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1704445573; x=1705050373; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8QsBdyrw6800HQwFi0fS79FhjFN1qw6fszI4WDfPkfk=;
        b=X/ume4Q8BQCwAYFO99wEaywrgObpRvlDpL3+vSbM31M63U0s4c1Z6eXVNntd63eG8P
         /im6nCwPO5HvsHJ6ZtKtrplkl+IQMvqo1vo+RkGO3jcsruGcME8YHoUt0NN9p2UQ38J7
         Glt78dYfvmhRujvugbrbmozQbn6Vr3syOC9vo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704445573; x=1705050373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8QsBdyrw6800HQwFi0fS79FhjFN1qw6fszI4WDfPkfk=;
        b=SlsgAtLUC5AxRXWtCULIANjn1Tim4HKrcKULXfJ9O7SFVjZF9O2e0LmpZn7Q5hi1vi
         uXxmJzHQyaKW60AfLs1bG/fwJQz5PQQyJmERgvM/3Ox2bEp62/6y/3gMV5T0s04AtvOg
         sRVSS8PVhemMJcTmSSy5NaB326YtFVS2XON/+83IgIxRyzvws+mRuOmwfyIkPoZXNT9t
         lWnu/DA8kzZhN5W+NP8TXKC5oYHq5eValNp+SUU+NPsnJ79cdymuAo4ORiLQIYFqI7mO
         WDiq1UxXGb/AY1yPuRVjjo2kr6lIbnz8lBzfnPpEHbOWwYFF6a3VzAD51dGHKQ90dZsr
         T60w==
X-Gm-Message-State: AOJu0YzWsQlSyJLQdrJsuym5+wxiY2IFQYd1i6HaJhIxkDk7+2MjF+a+
	v9VAzaX5cry9VdGFaLWnuNs4pliy3w6CZQa0CX6mZRgar5U=
X-Google-Smtp-Source: AGHT+IFJFahVc0XJ+vLdFEHC/EQKxRPxoQJojm3mtpjIUNTEh6XzFGeayR77hZvIHMM42U8onFvq4g==
X-Received: by 2002:a17:902:b204:b0:1d4:97a:7f5a with SMTP id t4-20020a170902b20400b001d4097a7f5amr1490941plr.95.1704445573219;
        Fri, 05 Jan 2024 01:06:13 -0800 (PST)
Received: from asharma-Latitude-3400 ([2401:4900:1c31:5de7:4157:95f9:a303:a15c])
        by smtp.gmail.com with ESMTPSA id j5-20020a170902da8500b001d3e3704d2fsm929602plx.31.2024.01.05.01.06.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 01:06:13 -0800 (PST)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Fri, 05 Jan 2024 14:36:07 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [oe][meta-networking][dunfell][PATCH] wireshark: Backport fix for CVE-2023-1992 RPCoRDMA: Frame end cleanup for global write offsets
Date: Fri,  5 Jan 2024 14:36:06 +0530
Message-Id: <20240105090606.16197-1-asharma@mvista.com>
X-Mailer: git-send-email 2.24.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Jan 2024 09:06:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108044

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
index 64e436df38..eb43574f9f 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
@@ -18,6 +18,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
            file://CVE-2023-0667.patch \
            file://CVE-2023-0668.patch \
            file://CVE-2023-2906.patch \
+           file://CVE-2023-1992.patch \
            "
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-- 
2.24.4


