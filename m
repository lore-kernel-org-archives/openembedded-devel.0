Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F74C072A2
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 18:34:38 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.web11.21178.1700073273654946869
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Nov 2023 10:34:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=SVb7+Xc4;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=3020; q=dns/txt; s=iport;
  t=1700073273; x=1701282873;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Cov4d8VraboLmuj4cZZ+cDGzkqtm9+DQjb2mw1JePm8=;
  b=SVb7+Xc4VTY88DAjsdMNzgJWq4oa9ebcGilM36i8MD+Q4tGCec2qZjPU
   towkGeotz8vDNgJFCjRZuUPPHdsIDYhCNw04xmKUHO21Bre6L2cutWgDB
   ObIaBC/6gb1IK7UNZVLSFxs7/3CapCqCXPMBE0g4Gp0eaATb+dxELbQOy
   0=;
X-CSE-ConnectionGUID: 9+t/xw1ySa2PBCRpuZ7bAg==
X-CSE-MsgGUID: cZHbGjZvTuynXadTggBkIw==
X-IronPort-AV: E=Sophos;i="6.03,305,1694736000"; 
   d="scan'208";a="139751223"
Received: from rcdn-core-2.cisco.com ([173.37.93.153])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 18:34:32 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	by rcdn-core-2.cisco.com (8.15.2/8.15.2) with ESMTPS id 3AFIYWZo006602
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 15 Nov 2023 18:34:32 GMT
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id F294BCC1280; Wed, 15 Nov 2023 10:34:31 -0800 (PST)
From: Deepak Rathore <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com, deeratho@cisco.com
Subject: [meta-oe] [mickledore] [PATCH] wireshark: Fix CVE-2023-2906
Date: Wed, 15 Nov 2023 10:34:21 -0800
Message-Id: <20231115183421.2397194-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-core-2.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 18:34:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106766

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://gitlab.com/wireshark/wireshark/-/commit/44dc70cc5aadca91cb8ba3710c59c3651b7b0d4d

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Armin Kuster <akuster@mvista.com>
(cherry picked from commit 919a2074586ff957362ae2dbd3438fa648bb9bee)
Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2023-2906.patch b/meta-networking/recipes-support/wireshark/files/CVE-2023-2906.patch
new file mode 100644
index 000000000..fe2109728
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
index 025559193..ba91914f2 100644
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
2.35.6


