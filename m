Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3AC5EE57DF
	for <webhook@archiver.kernel.org>; Mon, 11 Sep 2023 06:48:47 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web10.52847.1694414926421740074
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Sep 2023 23:48:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Fo2IV1bx;
 spf=pass (domain: mvista.com, ip: 209.85.161.52, mailfrom: hprajapati@mvista.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-57325fcd970so2599233eaf.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 10 Sep 2023 23:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1694414925; x=1695019725; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0YpdBeK9UD24EnNaCBmd6hYDXeGm+f/bjzqHsJj+YI4=;
        b=Fo2IV1bxliwbPN5xk3k2ViOnJf2wdc3o/oaWX1CVeWgcOMVMzAwQdR0r3Oqr31LK7G
         XAoRcI8fEHLtOWxU52TVij4z1389m5Gd3srCdW7pDNvfF+HjLXsDg6ExWFZ7qt8rNCQZ
         V0Qehdj4f9W/N2Ub7BpGXMIoUeWkzP38EPDfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694414925; x=1695019725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0YpdBeK9UD24EnNaCBmd6hYDXeGm+f/bjzqHsJj+YI4=;
        b=LtAun+fPrwDpbwnQhslDprZg5rCAp7POxkZO+Wgr1Wlr1o3zC0wmchrLr0zjUsE50D
         XKjgEyuu4CxB5l6WB0sQKDUSJmxx2gexB9j2y0KI4Im25qarsBvnkR82/yccJ07Elblg
         By9HxP7mMxvJ+JPu1kDTt2mFbBBjzOC1RovezpRqSH/1wC7xAb8+aclT8lK8GB13J/ey
         xHOzvwDXROMmQWV6QHMbu6yv2e5hMgVFfZn/r4f5SJh72WBtFNZsAyBBvaOGawwfpAze
         fcIX8E1yI+hmxPWSsRPo0l1fwXj0taFedANZeVZzt5QUzJiZJ8dqEAMMC+B8Kd9cSv/Y
         fcmw==
X-Gm-Message-State: AOJu0YywjJWbXs5wn/J4W8XwxQSxNfU6NQk5Omvx7CCdxjfT3Hbu0+yV
	Y4onuc7nbRbkpzRjlEYoWkYQA9BZDNuxHvgDmMacWQ==
X-Google-Smtp-Source: AGHT+IHpTSdEodyA2Kyxzgqnn41bvypSciweAYt0dXjYAR/BIO+k6d+d3e7/In7R6964w6soQNrdrQ==
X-Received: by 2002:a05:6358:fac9:b0:140:f2fd:e9d7 with SMTP id ts9-20020a056358fac900b00140f2fde9d7mr4406343rwb.4.1694414925548;
        Sun, 10 Sep 2023 23:48:45 -0700 (PDT)
Received: from MVIN00016.mvista.com ([103.250.136.128])
        by smtp.gmail.com with ESMTPSA id k12-20020aa7820c000000b00687ce7c6540sm5012168pfi.99.2023.09.10.23.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Sep 2023 23:48:45 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networking][dunfell][PATCH] wireshark: Fix CVE-2023-2906
Date: Mon, 11 Sep 2023 12:18:39 +0530
Message-Id: <20230911064839.236275-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Sep 2023 06:48:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104833

Upstream-Status: Backport from https://gitlab.com/wireshark/wireshark/-/commit/44dc70cc5aadca91cb8ba3710c59c3651b7b0d4d

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../wireshark/files/CVE-2023-2906.patch       | 38 +++++++++++++++++++
 .../wireshark/wireshark_3.2.18.bb             |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2023-2906.patch

diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2023-2906.patch b/meta-networking/recipes-support/wireshark/files/CVE-2023-2906.patch
new file mode 100644
index 000000000..3a81a3c71
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/CVE-2023-2906.patch
@@ -0,0 +1,38 @@
+From 44dc70cc5aadca91cb8ba3710c59c3651b7b0d4d Mon Sep 17 00:00:00 2001
+From: Jaap Keuter <jaap.keuter@xs4all.nl>
+Date: Thu, 27 Jul 2023 20:21:19 +0200
+Subject: [PATCH] CP2179: Handle timetag info response without records
+
+Fixes #19229
+
+Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/44dc70cc5aadca91cb8ba3710c59c3651b7b0d4d]
+CVE: CVE-2023-2906
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ epan/dissectors/packet-cp2179.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/epan/dissectors/packet-cp2179.c b/epan/dissectors/packet-cp2179.c
+index 142cac3..9fc9a47 100644
+--- a/epan/dissectors/packet-cp2179.c
++++ b/epan/dissectors/packet-cp2179.c
+@@ -721,11 +721,14 @@ dissect_response_frame(tvbuff_t *tvb, proto_tree *tree, packet_info *pinfo, int
+                     proto_tree_add_item(cp2179_proto_tree, hf_cp2179_timetag_numsets, tvb, offset, 1, ENC_LITTLE_ENDIAN);
+ 
+                     num_records = tvb_get_guint8(tvb, offset) & 0x7F;
++                    offset += 1;
++
++                    if (num_records == 0 || numberofcharacters <= 1)
++                        break;
++
+                     recordsize = (numberofcharacters-1) / num_records;
+                     num_values = (recordsize-6) / 2;      /* Determine how many 16-bit analog values are present in each event record */
+ 
+-                    offset += 1;
+-
+                     for (x = 0; x < num_records; x++)
+                     {
+                         cp2179_event_tree = proto_tree_add_subtree_format(cp2179_proto_tree, tvb, offset, recordsize, ett_cp2179_event, NULL, "Event Record # %d", x+1);
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb b/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
index 361123d1c..64e436df3 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
            file://CVE-2023-0667-pre1.patch \
            file://CVE-2023-0667.patch \
            file://CVE-2023-0668.patch \
+           file://CVE-2023-2906.patch \
            "
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-- 
2.25.1


