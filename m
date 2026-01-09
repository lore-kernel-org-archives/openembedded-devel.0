Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4DB8D232E4
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 05:59:05 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4601.1767938338421060993
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jan 2026 21:58:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=GvaCb8Ra;
 spf=pass (domain: mvista.com, ip: 209.85.216.48, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-34c2f52585fso2492092a91.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 21:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1767938337; x=1768543137; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NdL19+jhBl4Oy7ztyPonp9/FoEur9UFhJsfqr3k5HP8=;
        b=GvaCb8RaEuLDny5I1n90CyT0sLNdwBUX5yLkc/VmF9Ds/gvwPdkfy43M+ZAduEiphL
         di11ZphqHksVCtRlD0qX+MdRGybS3aAeRQtz7FKCQ56tL41jYrvChXaIi3wqZomhLFVg
         xFDnODahv/fabPUUUp8WAOWBD0HIWhH+8MBpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767938337; x=1768543137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NdL19+jhBl4Oy7ztyPonp9/FoEur9UFhJsfqr3k5HP8=;
        b=pLTnfcESAqZzMPVneZ9XiwEoZTfeL9P27Z0LA2gczK44vrQAR1QFUVRR2kWHMMi5Mt
         bIsh5eg714iK1aLc9/ouLIi9SfJb1vc0d/D0efRUleb4bMPEhxEIA44pWHC7vLrExG0J
         xFGnmeJh3irv0rZI+bMju3HoW73Mvd7Y+hIZxHbqf/2Z6djzxkcyvih24SSQCdiAkDb2
         ri71ilCc0cwosUm7TSSdvcaO0bSMc7OaqUiVh4ykZWpJ6CGk3cbUOLdP+F4YnxEMTPQ+
         5fCnsz97luwvxqFAFNDYOWGd8oQ/L0BTe8N6kyYINtRn1M6WD/GUI560AlqIEJVmZ4oh
         SU9Q==
X-Gm-Message-State: AOJu0YzjxWLbauJFw1a/xm4aWzVUKGuZk/pxozh0SV0+C1GW02U5IV1M
	T/fJAmntXPtccr3tkadNmPgIpwFfYD2Y/CerrbAkTPhWI6fTRE0W+uJMcY87QA1eiP2uIbSeIsv
	ivV3x
X-Gm-Gg: AY/fxX4m1as11wxNRfHgNMq2Qs1AVfwhGu2vTnmbFyh1qvKaBLFRFF77LDUBikwgFs7
	dtrP2P02HQxZZ19GLf/pLtRgloDzBFH/2wYGOnSC+XlQrM8+m8DX1O2kfRPI43KjJo8s4Fy108+
	IU1L7gdBpcNNKp6uFhC3fN1tpNg7QVvzR92lDmMD6CIEzxsbphGWXPbMc+7YKouBBI0ndK6UhSP
	4DqION1augGIQbBsEr99+o/J2kKX171msnHG92HfWg5ZdOfwjw/gxumtRacV3gJRQ2YSfPu2r2G
	KRz2BljBwaf/0iMzaek/WFA6v977vz+d8FIZ9mAJ0z5iKQTk1Onwsh4yGsAnvNFrZH5A86fSaYQ
	v8rm3wUqJf44RElqOqoTnPdMft4NnRZFVKW4pFNhlBlYsWsuqpMcqBbiPbKJVsDtwRGFIVx3abh
	ZMO09C/l/wv/gmZzYH06tKKomS
X-Google-Smtp-Source: AGHT+IET79+Z6vvm5oPQ3u9rOaTIrIWEJbvTrk7imoAZQC/9oqK53xXckmrI9gH+YfoVrM+7A2+UaQ==
X-Received: by 2002:a17:90b:4a03:b0:34c:7183:e290 with SMTP id 98e67ed59e1d1-34f68cb9059mr7987559a91.31.1767938337340;
        Thu, 08 Jan 2026 21:58:57 -0800 (PST)
Received: from MVIN00013.mvista.com ([150.129.170.218])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f7b1cc1sm9568178a91.2.2026.01.08.21.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 21:58:56 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networking][kirkstone][PATCH] wireshark: fix CVE-2025-11626
Date: Fri,  9 Jan 2026 11:28:43 +0530
Message-ID: <20260109055843.239206-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 05:59:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123275

Upstream-Status: Backport from https://gitlab.com/wireshark/wireshark/-/commit/513e5d49724f4a0695c5d2a08ce422c09cb999c8

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../wireshark/files/CVE-2025-11626.patch      | 99 +++++++++++++++++++
 .../wireshark/wireshark_3.4.12.bb             |  1 +
 2 files changed, 100 insertions(+)
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2025-11626.patch

diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2025-11626.patch b/meta-networking/recipes-support/wireshark/files/CVE-2025-11626.patch
new file mode 100644
index 0000000000..e5b3e6c0ac
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/CVE-2025-11626.patch
@@ -0,0 +1,99 @@
+From 4c79e54f4294b49a6549ae52b7b0a56b27540a40 Mon Sep 17 00:00:00 2001
+From: John Thacker <johnthacker@gmail.com>
+Date: Mon, 22 Sep 2025 21:41:00 -0400
+Subject: [PATCH] Mongo: Avoid infinite loop in dissect_op_msg_section
+
+If the size of a a OP_MSG data section is indicated as -1, that
+leads to advancing the offset by section_len + 1, or zero, which
+causes an infinite loop.
+
+The total message and section lengths in Mongo are signed int32s;
+it is impossible for them to be negative, and impossible for the
+section length to be INT_MAX (since the message length includes
+the length of the four byte headers and flag bits.)
+
+Throw an error to avoid the offset moving backwards, an infinite loop,
+or signed integer overflow.
+
+Also update some URLs to their new locations.
+
+Fix #20724.
+
+(backported from commit 1ec4709cab382f7077ba66d2e382c2e75ce335c1)
+
+CVE: CVE-2025-11626
+Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/513e5d49724f4a0695c5d2a08ce422c09cb999c8]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ epan/dissectors/packet-mongo.c | 20 ++++++++++++++++----
+ 1 file changed, 16 insertions(+), 4 deletions(-)
+
+diff --git a/epan/dissectors/packet-mongo.c b/epan/dissectors/packet-mongo.c
+index 44cfde8..8290275 100644
+--- a/epan/dissectors/packet-mongo.c
++++ b/epan/dissectors/packet-mongo.c
+@@ -12,17 +12,19 @@
+ 
+ /*
+  * See Mongo Wire Protocol Specification
+- * http://www.mongodb.org/display/DOCS/Mongo+Wire+Protocol
++ * https://www.mongodb.com/docs/manual/reference/mongodb-wire-protocol/
+  * See also BSON Specification
+- * http://bsonspec.org/#/specification
++ * http://bsonspec.org/spec.html
+  */
+ 
+ #include "config.h"
+ 
++#include <stdint.h>
+ #include <epan/packet.h>
+ #include <epan/exceptions.h>
+ #include <epan/expert.h>
+ #include <epan/proto_data.h>
++#include <epan/exceptions.h>
+ #include "packet-tcp.h"
+ #include "packet-tls.h"
+ #ifdef HAVE_SNAPPY
+@@ -278,6 +280,7 @@ static gint ett_mongo_doc_sequence= -1;
+ 
+ static expert_field ei_mongo_document_recursion_exceeded = EI_INIT;
+ static expert_field ei_mongo_document_length_bad = EI_INIT;
++static expert_field ei_mongo_section_size_bad = EI_INIT;
+ static expert_field ei_mongo_unknown = EI_INIT;
+ static expert_field ei_mongo_unsupported_compression = EI_INIT;
+ static expert_field ei_mongo_too_large_compressed = EI_INIT;
+@@ -784,13 +787,21 @@ dissect_op_msg_section(tvbuff_t *tvb, packet_info *pinfo, guint offset, proto_tr
+   gint section_len = -1;   /* Section length */
+ 
+   e_type = tvb_get_guint8(tvb, offset);
+-  section_len = tvb_get_letohl(tvb, offset+1);
+ 
+-  ti = proto_tree_add_item(tree, hf_mongo_msg_sections_section, tvb, offset, 1 + section_len, ENC_NA);
++  ti = proto_tree_add_item(tree, hf_mongo_msg_sections_section, tvb, offset, 1, ENC_NA);
+   section_tree = proto_item_add_subtree(ti, ett_mongo_section);
+   proto_tree_add_item(section_tree, hf_mongo_msg_sections_section_kind, tvb, offset, 1, ENC_LITTLE_ENDIAN);
+   offset += 1;
+ 
++  section_len = tvb_get_letohil(tvb, offset);
++  /* The section length must be strictly smaller than the total message size,
++   * both signed int32s. This prevents signed integer overflow. */
++  if (section_len < 0 || section_len == INT32_MAX) {
++    proto_tree_add_expert_format(section_tree, pinfo, &ei_mongo_section_size_bad, tvb, offset, 4, "Bogus Mongo message section size: %i", section_len);
++    THROW(ReportedBoundsError);
++  }
++  proto_item_set_len(ti, 1 + section_len);
++
+   switch (e_type) {
+     case KIND_BODY:
+       dissect_bson_document(tvb, pinfo, offset, section_tree, hf_mongo_msg_sections_section_body);
+@@ -1445,6 +1456,7 @@ proto_register_mongo(void)
+   static ei_register_info ei[] = {
+      { &ei_mongo_document_recursion_exceeded, { "mongo.document.recursion_exceeded", PI_MALFORMED, PI_ERROR, "BSON document recursion exceeds", EXPFILL }},
+      { &ei_mongo_document_length_bad, { "mongo.document.length.bad",  PI_MALFORMED, PI_ERROR, "BSON document length bad", EXPFILL }},
++     { &ei_mongo_section_size_bad, { "mongo.msg.sections.section.size.bad",  PI_MALFORMED, PI_ERROR, "Bogus Mongo message section size", EXPFILL }},
+      { &ei_mongo_unknown, { "mongo.unknown.expert", PI_UNDECODED, PI_WARN, "Unknown Data (not interpreted)", EXPFILL }},
+      { &ei_mongo_unsupported_compression, { "mongo.unsupported_compression.expert", PI_UNDECODED, PI_WARN, "This packet was compressed with an unsupported compressor", EXPFILL }},
+      { &ei_mongo_too_large_compressed, { "mongo.too_large_compressed.expert", PI_UNDECODED, PI_WARN, "The size of the uncompressed packet exceeded the maximum allowed value", EXPFILL }},
+-- 
+2.50.1
+
diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb b/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
index 0cc0dfa3d7..afee5561c4 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
@@ -32,6 +32,7 @@ SRC_URI += " \
     file://CVE-2023-6175.patch \
     file://CVE-2024-2955.patch \
     file://CVE-2025-13499.patch \
+    file://CVE-2025-11626.patch \
 "
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
-- 
2.50.1


