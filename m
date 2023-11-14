Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 088A4C4332F
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 05:44:29 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.7181.1699940664367648012
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 21:44:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=bffTR1g4;
 spf=pass (domain: mvista.com, ip: 209.85.128.172, mailfrom: hprajapati@mvista.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5a7af52ee31so60803747b3.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 21:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1699940663; x=1700545463; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fsyYyg+XI5wKvovy4d/eLzEvb+LKaNQZP0XmnS3gNR0=;
        b=bffTR1g413gL8vxBmYXM7dF7imAZJSmZS7GrqUPqZQ37jHw6+25+PBZrXPaGSVDjHw
         yvdBb62hZGAykHSOcSblhUrOhu1i9Wt46F5CLuI4WuhBwoIfehMZkHZ7S4OoYI9Qrrqj
         35geo8Q2UthaYmFF0HWg/BwkZ+iPjrXP4Xi4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699940663; x=1700545463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fsyYyg+XI5wKvovy4d/eLzEvb+LKaNQZP0XmnS3gNR0=;
        b=Vz1dDbvEWOjRT3bLS9MlLwrkuNGCKbzVPO7L40lo0tc1Y6NNDLMRFnXFjKm4t2dPWv
         0yY2UJOI2vTTiPNJC/ZCQ74cbvyMZuB+U625k24z4Z8wbR++D7AUyI7tzKN5nW5iWwYq
         gaDCMSbWI1bFiT+0lI2rFO5wsE5RaTpUF254A5X7whM9Z5MCdvWVzF/rUH1xYB2B+lot
         dN3rRMKkLuKFVsYmtF61QZcqt8Hc3Mu3InRcCozQITz6saGBgJPFsNr5Q00PIDUXvVIh
         +5y5guRameba2CMqFDP3ry5rsVOtMw5pKaKSMTuboFDWlwT4HZMuVBJKJtbyEwIkMjYQ
         5Ulg==
X-Gm-Message-State: AOJu0YxzJvdhNYsWuFBOXfcuwjNc3wLeUwDLJn6mJ3jClIFEZrZhMOxk
	g+SZ/31W1xFot1wtwgeL4+dArkJxGD34QnXWCCmX2Q==
X-Google-Smtp-Source: AGHT+IGb9rFNK4uCuaWXtmMaM5bfvzy2w6PNcH4A7VyPU2zdByI9zDKGHpQbvcbX6C1cboiYuqw+6Q==
X-Received: by 2002:a0d:e986:0:b0:5b3:4195:a259 with SMTP id s128-20020a0de986000000b005b34195a259mr7567264ywe.25.1699940663152;
        Mon, 13 Nov 2023 21:44:23 -0800 (PST)
Received: from MVIN00016.mvista.com ([103.250.136.221])
        by smtp.gmail.com with ESMTPSA id fh42-20020a056a00392a00b006c4d128b71esm473549pfb.98.2023.11.13.21.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 21:44:22 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networking][dunfell][PATCH] wireshark: Fix CVE-2022-0585-CVE-2023-2879
Date: Tue, 14 Nov 2023 11:14:16 +0530
Message-Id: <20231114054416.7376-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 05:44:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106698

Upstream-Status: Backport from https://gitlab.com/wireshark/wireshark/-/commit/8d3c2177793e900cfc7cfaac776a2807e4ea289f && https://gitlab.com/wireshark/wireshark/-/commit/118815ca7c9f82c1f83f8f64d9e0e54673f31677

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../files/CVE-2022-0585-CVE-2023-2879.patch   | 93 +++++++++++++++++++
 .../wireshark/wireshark_3.2.18.bb             |  1 +
 2 files changed, 94 insertions(+)
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2022-0585-CVE-2023-2879.patch

diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2022-0585-CVE-2023-2879.patch b/meta-networking/recipes-support/wireshark/files/CVE-2022-0585-CVE-2023-2879.patch
new file mode 100644
index 000000000..1fc4a5fe3
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/CVE-2022-0585-CVE-2023-2879.patch
@@ -0,0 +1,93 @@
+From 5a7a80e139396c07d45e70d63c6d3974c50ae5e8 Mon Sep 17 00:00:00 2001
+From: John Thacker <johnthacker@gmail.com>
+Date: Sat, 13 May 2023 21:45:16 -0400
+Subject: GDSDB: Make sure our offset advances.
+
+add_uint_string() returns the next offset to use, not the number
+of bytes consumed. So to consume all the bytes and make sure the
+offset advances, return the entire reported tvb length, not the
+number of bytes remaining.
+
+Fixup 8d3c2177793e900cfc7cfaac776a2807e4ea289f
+
+Fixes #19068
+
+Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/8d3c2177793e900cfc7cfaac776a2807e4ea289f && https://gitlab.com/wireshark/wireshark/-/commit/118815ca7c9f82c1f83f8f64d9e0e54673f31677]
+CVE: CVE-2022-0585 & CVE-2023-2879
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ epan/dissectors/packet-gdsdb.c | 23 ++++++++++++++++++++++-
+ 1 file changed, 22 insertions(+), 1 deletion(-)
+
+diff --git a/epan/dissectors/packet-gdsdb.c b/epan/dissectors/packet-gdsdb.c
+index 95fed7e..950d68f 100644
+--- a/epan/dissectors/packet-gdsdb.c
++++ b/epan/dissectors/packet-gdsdb.c
+@@ -15,6 +15,7 @@
+ #include "config.h"
+ 
+ #include <epan/packet.h>
++#include <epan/expert.h>
+ 
+ void proto_register_gdsdb(void);
+ void proto_reg_handoff_gdsdb(void);
+@@ -182,6 +183,8 @@ static int hf_gdsdb_cursor_type = -1;
+ static int hf_gdsdb_sqlresponse_messages = -1;
+ #endif
+ 
++static expert_field ei_gdsdb_invalid_length = EI_INIT;
++
+ enum
+ {
+ 	op_void                   = 0,
+@@ -474,7 +477,12 @@ static int add_uint_string(proto_tree *tree, int hf_string, tvbuff_t *tvb, int o
+ 						offset, 4, ENC_ASCII|ENC_BIG_ENDIAN);
+ 	length = dword_align(tvb_get_ntohl(tvb, offset))+4;
+ 	proto_item_set_len(ti, length);
+-	return offset + length;
++	int ret_offset = offset + length;
++	if (length < 4 || ret_offset < offset) {
++		expert_add_info_format(NULL, ti, &ei_gdsdb_invalid_length, "Invalid length: %d", length);
++		return tvb_reported_length(tvb);
++	}
++	return ret_offset;
+ }
+ 
+ static int add_byte_array(proto_tree *tree, int hf_len, int hf_byte, tvbuff_t *tvb, int offset)
+@@ -1407,7 +1415,12 @@ dissect_gdsdb(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, void *data _U
+ 								offset, 4, ENC_BIG_ENDIAN);
+ 
+ 		/* opcode < op_max */
++		int old_offset = offset;
+ 		offset = gdsdb_handle_opcode[opcode](tvb, pinfo, gdsdb_tree, offset+4);
++		if (offset <= old_offset) {
++			expert_add_info(NULL, ti, &ei_gdsdb_invalid_length);
++			return tvb_reported_length_remaining(tvb, old_offset);
++		}
+ 		if (offset < 0)
+ 		{
+ 			/* But at this moment we don't know how much we will need */
+@@ -2022,12 +2035,20 @@ proto_register_gdsdb(void)
+ 		&ett_gdsdb_connect_pref
+ 	};
+ 
++/* Expert info */
++	static ei_register_info ei[] = {
++		{ &ei_gdsdb_invalid_length, { "gdsdb.invalid_length", PI_MALFORMED, PI_ERROR,
++			"Invalid length", EXPFILL }},
++	};
++
+ 	proto_gdsdb = proto_register_protocol(
+ 		"Firebird SQL Database Remote Protocol",
+ 		"FB/IB GDS DB", "gdsdb");
+ 
+ 	proto_register_field_array(proto_gdsdb, hf, array_length(hf));
+ 	proto_register_subtree_array(ett, array_length(ett));
++	expert_module_t *expert_gdsdb = expert_register_protocol(proto_gdsdb);
++	expert_register_field_array(expert_gdsdb, ei, array_length(ei));
+ }
+ 
+ void
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb b/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
index b4425cb66..b35c24328 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
@@ -19,6 +19,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
            file://CVE-2023-0668.patch \
            file://CVE-2023-2906.patch \
            file://CVE-2023-3649.patch \
+           file://CVE-2022-0585-CVE-2023-2879.patch \
            "
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-- 
2.25.1


