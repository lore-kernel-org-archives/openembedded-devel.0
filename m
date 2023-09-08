Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93722EE57FC
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 11:44:36 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.36843.1694173469131048163
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Sep 2023 04:44:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=D1gZvo7c;
 spf=pass (domain: mvista.com, ip: 209.85.210.178, mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-68a3082c771so1411050b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 08 Sep 2023 04:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1694173468; x=1694778268; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R71EGgkz2I8E3/C+gzjWWuU2wy8n/q30NQrAvnN5LH4=;
        b=D1gZvo7c93+aZWFiJzbhnSUcjiZo5tQ1p7pmXPWStclCRhTjJVOZjYDIJsDLtKUix6
         oZgIWWVlB4vKWAYxTuOLjdYMbn7BBEbctS9Zoju7+71QcP7OiRYjQlrQF/tWJ/syB1vZ
         yLXY4B2gyo3CLgJBSTwWhlCDdk48CBn4VZamY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694173468; x=1694778268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R71EGgkz2I8E3/C+gzjWWuU2wy8n/q30NQrAvnN5LH4=;
        b=nL5867DxDh4Pr2ryQ0ctXPwBe/q4iz60dVOWIof16/tYKwq6HTEGGD1yMGDyeAJ3Fs
         p5HV8Vf55jv/7Co+6ieDf7NMOoID9VL1ZdofrW68/ufn4LUqb1GcnSrv5+guIiw9odQb
         5NsDB1Yf011LXnQzDgg25HgVbSRybs7cd4v3tt5RIe/mMeN5WROBXV8VEB07J7EeI5wG
         yADyLk6vs5eY6U+IucSyTjDGkhlgwN6FpcIOzYYdIrugjwlKUDMnSAw3G1/AtajkdDWF
         JBpNjiG6x151owBtFD8QenENM90OTepFC+fLtSzlax+9T/7A+a/vAMQoXsXgST+8p+db
         kOqA==
X-Gm-Message-State: AOJu0YwBHycsO5TwBYjt74wI7ZHrVOWyewBtPKkV3O9jkP5IOK82kRzW
	mjgX6gE+KexOsGFe7LW6vphEdSl4zTkA6aXDnQHxJQ==
X-Google-Smtp-Source: AGHT+IHCjTuKoFcS7gEurweAE340vQWmPTm0gLU5btcSEHUiGOVuzZe+WSFlsW1rjY3gcH0MfY4TYQ==
X-Received: by 2002:a05:6a00:2995:b0:68e:38cf:9de8 with SMTP id cj21-20020a056a00299500b0068e38cf9de8mr6381660pfb.9.1694173468174;
        Fri, 08 Sep 2023 04:44:28 -0700 (PDT)
Received: from MVIN00016.mvista.com ([103.250.136.128])
        by smtp.gmail.com with ESMTPSA id x8-20020aa79188000000b0068a4cd8b530sm1176359pfa.139.2023.09.08.04.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Sep 2023 04:44:27 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networking][kirkstone][PATCH] wireshark: Fix CVE-2023-2906
Date: Fri,  8 Sep 2023 17:14:20 +0530
Message-Id: <20230908114420.203126-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Sep 2023 11:44:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104803

Upstream-Status: Backport from https://gitlab.com/wireshark/wireshark/-/commit/44dc70cc5aadca91cb8ba3710c59c3651b7b0d4d

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../wireshark/files/CVE-2023-2906.patch       | 38 +++++++++++++++++++
 .../wireshark/wireshark_3.4.12.bb             |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2023-2906.patch

diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2023-2906.patch b/meta-networking/recipes-support/wireshark/files/CVE-2023-2906.patch
new file mode 100644
index 0000000000..fe21097286
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
+index 30f53f8..70fe033 100644
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
diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb b/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
index ec6e11edd2..19489a8bcb 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
@@ -24,6 +24,7 @@ SRC_URI += " \
     file://CVE-2023-0666.patch \
     file://CVE-2023-0667.patch \
     file://CVE-2023-0668.patch \
+    file://CVE-2023-2906.patch \
 "
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
-- 
2.25.1


