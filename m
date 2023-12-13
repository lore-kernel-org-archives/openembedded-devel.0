Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A459C4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 06:37:19 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web10.30716.1702449431626863163
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 22:37:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=d+hnHOCv;
 spf=pass (domain: mvista.com, ip: 209.85.167.175, mailfrom: vkumbhar@mvista.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3ba1be5ad0aso1085758b6e.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 22:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1702449430; x=1703054230; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7pOAiRehclVktWlD0o1TCzdKMC/bwRRLiq91ggrhRog=;
        b=d+hnHOCvbW0Li+nMhmaGSQovstlfSEfOEZsHUMMGNURnj1eGh3Lb9KzSmEOlTyky9Y
         QC1vbSAVLbASf22vrkPkXRPfNdegNdMBu6Rr7JJCkloZFZdXbZ3VJIo02sqiyWX0r1tN
         cIc6K9cioRbDv6HZ8qAJDLWf9GhsmPkcvKQxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702449430; x=1703054230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7pOAiRehclVktWlD0o1TCzdKMC/bwRRLiq91ggrhRog=;
        b=p/Hwr3SlOG3Xcd6OAkq/B2Nx+vTF/C8AwNJUVBYqRgtFJFEpHd7EiPKbBaVGAoRgC2
         a7uQF4ck5CoOwBfPRJAeWiAzpCAtwmXMC0EqrzVkNM+AFLUvT6Si8K/lV6acF180LwOn
         uOHQR9K9ee6L41AaDO7uQd+QppPr/o/f22D1xE9dHOLUkIBSCnn/0laMp27wda/6Q1mN
         3UURh8MtuBSH2OAs12+zRUW1weQnS6Fc0fE9jAYL+n/w7IofsEAhRcB3Ms5gxuDfb+2Q
         D/3Eg2CmWef9PZ0uXhAgsSt26Xcgif5J+B1kJw2nHpW3TUFuNVUEgkBBxkzH/lixmRSb
         NNnw==
X-Gm-Message-State: AOJu0YxlqFOkPz9+PLGgFAMlc7qfazbLWzAceo6TZjkIMyGfTJZNoDik
	AHWa1Z2SJ6YlVnZIdSN5qNTniKlR3jdzSv/u21E=
X-Google-Smtp-Source: AGHT+IG4Y12ua0K95hXYLSbyf1gI89Mp+YaJNfUaKhqo843dYU9l+gwmxu41qfSlekTzEI459oqA/g==
X-Received: by 2002:a05:6808:21a9:b0:3b9:e118:e423 with SMTP id be41-20020a05680821a900b003b9e118e423mr8539480oib.32.1702449429993;
        Tue, 12 Dec 2023 22:37:09 -0800 (PST)
Received: from vkumbhar-Latitude-3400.. ([116.74.239.230])
        by smtp.gmail.com with ESMTPSA id u23-20020a62d457000000b006ce781f6f85sm9577301pfl.43.2023.12.12.22.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 22:37:09 -0800 (PST)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [meta-oe][kirkstone][PATCH] wireshark: fix  CVE-2022-4345 multiple (BPv6, OpenFlow, and Kafka protocol) dissector infinite loops
Date: Wed, 13 Dec 2023 12:07:01 +0530
Message-Id: <20231213063701.1648648-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 06:37:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107347

Upstream-Status: Backport from https://gitlab.com/wireshark/wireshark/-/commit/39db474f80af87449ce0f034522dccc80ed4153f

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 .../wireshark/files/CVE-2022-4345.patch       | 52 +++++++++++++++++++
 .../wireshark/wireshark_3.4.12.bb             |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2022-4345.patch

diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2022-4345.patch b/meta-networking/recipes-support/wireshark/files/CVE-2022-4345.patch
new file mode 100644
index 0000000000..ccf04459e8
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/CVE-2022-4345.patch
@@ -0,0 +1,52 @@
+From 39db474f80af87449ce0f034522dccc80ed4153f Mon Sep 17 00:00:00 2001
+From: John Thacker <johnthacker@gmail.com>
+Date: Thu, 1 Dec 2022 20:46:15 -0500
+Subject: [PATCH] openflow_v6: Prevent infinite loops in too short ofp_stats
+
+The ofp_stats struct length field includes the fixed 4 bytes.
+If the length is smaller than that, report the length error
+and break out. In particular, a value of zero can cause
+infinite loops if this isn't done.
+
+
+(cherry picked from commit 13823bb1059cf70f401892ba1b1eaa2400cdf3db)
+
+Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/39db474f80af87449ce0f034522dccc80ed4153f]
+CVE: CVE-2022-4345
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ epan/dissectors/packet-openflow_v6.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/epan/dissectors/packet-openflow_v6.c b/epan/dissectors/packet-openflow_v6.c
+index 16016af..3e24d76 100644
+--- a/epan/dissectors/packet-openflow_v6.c
++++ b/epan/dissectors/packet-openflow_v6.c
+@@ -1118,17 +1118,23 @@ dissect_openflow_v6_oxs(tvbuff_t *tvb, packet_info *pinfo _U_, proto_tree *tree,
+ static int
+ dissect_openflow_stats_v6(tvbuff_t *tvb, packet_info *pinfo _U_, proto_tree *tree, int offset, guint16 length _U_)
+ {
++    proto_item *ti;
+     guint32 stats_length;
+     int oxs_end;
+     guint32 padding;
+ 
+     proto_tree_add_item(tree, hf_openflow_v6_stats_reserved, tvb, offset, 2, ENC_NA);
+ 
+-    proto_tree_add_item_ret_uint(tree, hf_openflow_v6_stats_length, tvb, offset+2, 2, ENC_BIG_ENDIAN, &stats_length);
++    ti = proto_tree_add_item_ret_uint(tree, hf_openflow_v6_stats_length, tvb, offset+2, 2, ENC_BIG_ENDIAN, &stats_length);
+ 
+     oxs_end = offset + stats_length;
+     offset+=4;
+ 
++    if (stats_length < 4) {
++        expert_add_info(pinfo, ti, &ei_openflow_v6_length_too_short);
++        return offset;
++    }
++
+     while (offset < oxs_end) {
+         offset = dissect_openflow_v6_oxs(tvb, pinfo, tree, offset, oxs_end - offset);
+     }
+-- 
+2.40.1
+
diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb b/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
index 19489a8bcb..9d4dee37bb 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
@@ -25,6 +25,7 @@ SRC_URI += " \
     file://CVE-2023-0667.patch \
     file://CVE-2023-0668.patch \
     file://CVE-2023-2906.patch \
+    file://CVE-2022-4345.patch \
 "
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
-- 
2.40.1


