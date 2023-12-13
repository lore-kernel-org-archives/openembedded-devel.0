Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A2BBC4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 11:55:32 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.33988.1702468527655509188
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Dec 2023 03:55:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=ZUJ3Qh/v;
 spf=pass (domain: mvista.com, ip: 209.85.210.171, mailfrom: vkumbhar@mvista.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6ce72faf1e8so4160275b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 03:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1702468526; x=1703073326; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wf3V800qKhWGg3UT9cT/ZYNmp/fjpYXAmSl9VOH4VmA=;
        b=ZUJ3Qh/v7Qax3djjLyfiQ/kY3BTdnq4CiclE29atytaeaqBNZMXEGxeJbP+beVaf+g
         5IgjfBtAnGpGx4+kNvDY9h60rQ9pNIMsERMN+fOkiHLzMsKmfHvXrh4B92L0v/RZWwDJ
         rDxiKLqGLdM0+t1Noyt3xSLsZq14zzDb1iqdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702468526; x=1703073326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wf3V800qKhWGg3UT9cT/ZYNmp/fjpYXAmSl9VOH4VmA=;
        b=apl6X5LbJqDHbPQhnJo15A8sBPk+JUNtRKgy4PCsGtanYolbOFKsyCCI+LE2j8RpSa
         aAAcsXdsWWGECEb8ZdDK2a1R3ncTIkyvg514BDw9m7iC+lmKPV9NixokshTmIJPvrnU7
         wXszAw4W+DIIGPODVye5I1o3CGqDwmuDfPp0McpeYuOmAVppELu9K8Jz9qOGI44tfXEo
         g65+jEDnNq4ysRK8Inpho4enU1ZpqChee7Jb/UVGrrCU2X+0WgbnMWU17erGmNGganpd
         vm+Zx5spR6tjmS7ncBss5wDGAiMUY7LWIP3revMIcCTlcfRf+mMbgxBcZ8LwfMizUOWY
         wGeg==
X-Gm-Message-State: AOJu0YwGUu2JAFWleMqOqk6oaV94SXGRNbVSrk/uNZcTU2qlrxSvnkGo
	maHjmGxfVSQtA91dakj0w72+ITCFNSynILStDOg=
X-Google-Smtp-Source: AGHT+IE9tvPk/I5K5dPR9/+MElEzDu0xsEcF+Ojbyu5RgLVvi26dVjz7MNsTSWu5MemM0WtDhl3Lbg==
X-Received: by 2002:a05:6a00:4b13:b0:6d0:93a7:dc09 with SMTP id kq19-20020a056a004b1300b006d093a7dc09mr2711328pfb.9.1702468526076;
        Wed, 13 Dec 2023 03:55:26 -0800 (PST)
Received: from vkumbhar-Latitude-3400.. ([116.74.239.230])
        by smtp.gmail.com with ESMTPSA id ff16-20020a056a002f5000b006ce65bf5376sm9832224pfb.75.2023.12.13.03.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 03:55:25 -0800 (PST)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [meta-oe][dunfell][PATCH] wireshark: fix CVE-2022-4345 multiple (BPv6, OpenFlow, and Kafka protocol) dissector infinite loops
Date: Wed, 13 Dec 2023 17:25:03 +0530
Message-Id: <20231213115503.1678810-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 11:55:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107393

Upstream-Status: Backport from https://gitlab.com/wireshark/wireshark/-/commit/39db474f80af87449ce0f034522dccc80ed4153f

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 .../wireshark/files/CVE-2022-4345.patch       | 52 +++++++++++++++++++
 .../wireshark/wireshark_3.2.18.bb             |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2022-4345.patch

diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2022-4345.patch b/meta-networking/recipes-support/wireshark/files/CVE-2022-4345.patch
new file mode 100644
index 0000000000..938b7cf772
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
+index f3bd0ef..96a3233 100644
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
diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb b/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
index b35c243284..7d99a1438b 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
@@ -20,6 +20,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
            file://CVE-2023-2906.patch \
            file://CVE-2023-3649.patch \
            file://CVE-2022-0585-CVE-2023-2879.patch \
+           file://CVE-2022-4345.patch \
            "
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-- 
2.40.1


