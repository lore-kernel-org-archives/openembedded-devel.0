Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1126FE77197
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 15:19:19 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.web11.21305.1736259517839905099
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 06:18:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=PyJ5SHNR;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: spushpka@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6241; q=dns/txt; s=iport;
  t=1736259518; x=1737469118;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Yk7g7RbacYs/NkrupHuKzzqH92vRMteSTbWY4/4bFEw=;
  b=PyJ5SHNRp49hCeQR63HyR2tMVLqPTM+4ORni6wUY6N8rQDc7BgMZMtTH
   pOW9wbzqSSq7lrpQOgCfltGZua+tS1wTNWoizcsL2Z1p4HJAOdBupXFmw
   mDx4lsEzdAs6ttHq7pqUY2J+gQbF6zHp5CiG/lcg8swS4XRv4CGQ/T0Vt
   s=;
X-CSE-ConnectionGUID: muq4wGhYRum9PWy9dbEuUQ==
X-CSE-MsgGUID: YnG9O9SmSdaSYwpd5GQN7A==
X-IPAS-Result: =?us-ascii?q?A0BXAAAiN31n/4//Ja1aHQEBAQEJARIBBQUBgX8IAQsBA?=
 =?us-ascii?q?YJJdllDSIxyiVGLdpIlgSUDVg8BAQEPOQsEAQGFB4p2AiY0CQ4BAgQBAQEBA?=
 =?us-ascii?q?wIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE4V7DUkBDAGGAwECASoLARgBG?=
 =?us-ascii?q?xIsAwECWiMhgwEBgmQDEQawaIF5M4EBgygBMQUJAkNO2TiBbYFIAY1JbwGEd?=
 =?us-ascii?q?ycbgUlEgRWBO4ItgQWBXAGIJQSEKoM/gWyLBx0vgi6OBUiBIQNZLAFVEw0KC?=
 =?us-ascii?q?wcFgXMDOAwLMBWBUUQ3gkZpSzcCDQI1gh58giuEXIRHYS8DAwMDgzyFaIIXg?=
 =?us-ascii?q?hmCbkADCxgNSBEsNxQbBj5uB5peATyCfXKBDgErgX0FKhERkn0aE5IMoQOEJ?=
 =?us-ascii?q?YwYlS4aM6pTmHyOBIoFjD6EZoFnPIFHCwdNIxWDIglJGQ+OLQsLg1iBf4MVr?=
 =?us-ascii?q?3wlMgIBOQIHCwEBAwmNQIQVAQE?=
IronPort-Data: A9a23:c/nhbq/4vY/YCRo4DoIfDrUD0H+TJUtcMsCJ2f8bNWPcYEJGY0x3x
 2RMDzzUOfbbNzP9c99xbti2/ExQ65/cz4cxHQpkqy5EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4E/rauW5xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4qoyyHjEAX9gWMsazpLs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kzIJRE5cl3MFtT8
 K0gFyFcYhqumt+PlefTpulE3qzPLeHxN48Z/3UlxjbDALN+H9bIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0Yn1lQ/UPrSmM+znmTkcyVboXqepLE85C7YywkZPL3FaouJJYTWFJwM9qqej
 lPA0DXeUyofD9CW8gua6n7xqdbpwgquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0KzRd9bA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBaCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:GUROkaBI9bCi5zDlHemn55DYdb4zR+YMi2TDGXofdfUzSL38qy
 nAppUmPHPP5Qr5O0tQ++xoRpPhfZq0z/cciuMs1NyZMjUO1lHFEGgb1/qA/9UlcBeOkdK0Es
 xbAsxDNOE=
X-Talos-CUID: 9a23:PmPoOGHw6Zo+xYh7qmJi6VdIBe8lQ0fAySboHF7pBWxEVYCsHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AaztMgAyiVbJs4NI20M5L+gCt/8GaqJWoJxEqwK4?=
 =?us-ascii?q?DgMWNDh1vIzvAow2RHaZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.12,295,1728950400"; 
   d="scan'208";a="294704911"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 07 Jan 2025 14:18:37 +0000
Received: from sjc-ads-5718.cisco.com (sjc-ads-5718.cisco.com [10.28.88.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id CD75118000253;
	Tue,  7 Jan 2025 14:18:36 +0000 (GMT)
Received: by sjc-ads-5718.cisco.com (Postfix, from userid 1839047)
	id 61309CC1280; Tue,  7 Jan 2025 06:18:36 -0800 (PST)
From: Shubham Pushpkar <spushpka@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	spushpka@cisco.com
Subject: [meta-openembedded] [scarthgap] [PATCH] wireshark 4.2.7: Fix CVE-2024-9781
Date: Tue,  7 Jan 2025 06:17:39 -0800
Message-Id: <20250107141739.1018688-1-spushpka@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
X-Outbound-SMTP-Client: 10.28.88.232, sjc-ads-5718.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 15:19:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114711

Upstream Repository: https://gitlab.com/wireshark/wireshark.git

Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2024-9781
Type: Security Fix
CVE: CVE-2024-9781
Score: 7.8
Patch: https://gitlab.com/wireshark/wireshark/-/commit/cad248ce3bf5

Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
---
 .../wireshark/files/CVE-2024-9781.patch       | 133 ++++++++++++++++++
 .../wireshark/wireshark_4.2.7.bb              |   1 +
 2 files changed, 134 insertions(+)
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2024-9781.patch

diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2024-9781.patch b/meta-networking/recipes-support/wireshark/files/CVE-2024-9781.patch
new file mode 100644
index 000000000..eb8c733da
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/CVE-2024-9781.patch
@@ -0,0 +1,133 @@
+From f32965be7c80ca6eb330d0e9b34f0c563db7d869 Mon Sep 17 00:00:00 2001
+From: Gerald Combs <gerald@wireshark.org>
+Date: Tue, 8 Oct 2024 11:56:28 -0700
+Subject: [PATCH] AppleTalk: Make sure we have valid addresses
+
+Make sure ATP, ZIP, and ASP have valid addresses. Use sizeof instead of
+a hard-coded value in a few places.
+
+Fixes #20114
+
+(cherry picked from commit 3de741321f85c205c0a8266c40f33cb0013bd1d2)
+
+Conflicts:
+	epan/dissectors/packet-atalk.c
+
+CVE: CVE-2024-9781
+Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/cad248ce3bf5]
+
+(cherry picked from commit cad248ce3bf53026cc837fedeaca65d0f20ea3b5)
+Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
+---
+ epan/dissectors/packet-atalk.c | 44 ++++++++++++++++++++++++----------
+ 1 file changed, 32 insertions(+), 12 deletions(-)
+
+diff --git a/epan/dissectors/packet-atalk.c b/epan/dissectors/packet-atalk.c
+index 396e7af519..065d6aedb6 100644
+--- a/epan/dissectors/packet-atalk.c
++++ b/epan/dissectors/packet-atalk.c
+@@ -232,9 +232,18 @@ static int hf_asp_attn_code     = -1;
+ static int hf_asp_seq           = -1;
+ static int hf_asp_size          = -1;
+ 
++/*
++ * Structure used to represent a DDP address; gives the layout of the
++ * data pointed to by an Appletalk "address" structure.
++ */
++struct atalk_ddp_addr {
++  guint16 net;
++  guint8 node;
++};
++
+ typedef struct {
+   guint32 conversation;
+-  guint8  src[4];
++  guint8  src[sizeof(struct atalk_ddp_addr)];
+   guint16 tid;
+ } asp_request_key;
+ 
+@@ -502,6 +511,10 @@ static const value_string asp_error_vals[] = {
+   {0,                   NULL } };
+ value_string_ext asp_error_vals_ext = VALUE_STRING_EXT_INIT(asp_error_vals);
+ 
++static bool is_ddp_address(address *addr) {
++  return addr->type == atalk_address_type && addr->len == sizeof(struct atalk_ddp_addr);
++}
++
+ /*
+  * hf_index must be a FT_UINT_STRING type
+  * Are these always in a Mac extended character set?  Should we have a
+@@ -744,6 +757,12 @@ dissect_atp(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, void* data _U_)
+   conversation_t  *conversation;
+   asp_request_val *request_val   = NULL;
+ 
++  // ATP is carried over DDP
++  if (!(is_ddp_address(&pinfo->src) && is_ddp_address(&pinfo->dst))) {
++    return 0;
++  }
++
++
+   col_set_str(pinfo->cinfo, COL_PROTOCOL, "ATP");
+ 
+   ctrlinfo = tvb_get_guint8(tvb, offset);
+@@ -770,7 +789,7 @@ dissect_atp(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, void* data _U_)
+     asp_request_key request_key;
+ 
+     request_key.conversation = conversation->conv_index;
+-    memcpy(request_key.src, (!atp_asp_dsi_info.reply)?pinfo->src.data:pinfo->dst.data, 4);
++    memcpy(request_key.src, (!atp_asp_dsi_info.reply)?pinfo->src.data:pinfo->dst.data, sizeof(struct atalk_ddp_addr));
+     request_key.tid = atp_asp_dsi_info.tid;
+ 
+     request_val = (asp_request_val *) wmem_map_lookup(atp_request_hash, &request_key);
+@@ -1018,7 +1037,7 @@ get_transaction(tvbuff_t *tvb, packet_info *pinfo, struct atp_asp_dsi_info *atp_
+   conversation = find_or_create_conversation(pinfo);
+ 
+   request_key.conversation = conversation->conv_index;
+-  memcpy(request_key.src, (!atp_asp_dsi_info->reply)?pinfo->src.data:pinfo->dst.data, 4);
++  memcpy(request_key.src, (!atp_asp_dsi_info->reply)?pinfo->src.data:pinfo->dst.data, sizeof(struct atalk_ddp_addr));
+   request_key.tid = atp_asp_dsi_info->tid;
+ 
+   request_val = (asp_request_val *) wmem_map_lookup(asp_request_hash, &request_key);
+@@ -1051,6 +1070,11 @@ dissect_asp(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, void *data)
+   if (data == NULL)
+     return 0;
+ 
++  // ASP is carried over ATP/DDP
++  if (!(is_ddp_address(&pinfo->src) && is_ddp_address(&pinfo->dst))) {
++    return 0;
++  }
++
+   col_set_str(pinfo->cinfo, COL_PROTOCOL, "ASP");
+   col_clear(pinfo->cinfo, COL_INFO);
+ 
+@@ -1183,15 +1207,6 @@ dissect_asp(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, void *data)
+ /* -----------------------------
+    ZIP protocol cf. inside appletalk chap. 8
+ */
+-/*
+- * Structure used to represent a DDP address; gives the layout of the
+- * data pointed to by an Appletalk "address" structure.
+- */
+-struct atalk_ddp_addr {
+-    guint16 net;
+-    guint8  node;
+-};
+-
+ 
+ static int atalk_str_len(const address* addr _U_)
+ {
+@@ -1241,6 +1256,11 @@ dissect_atp_zip(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, void* data)
+   if (data == NULL)
+     return 0;
+ 
++  // ATP ZIP is carried over DDP
++  if (!(is_ddp_address(&pinfo->src) && is_ddp_address(&pinfo->dst))) {
++    return 0;
++  }
++
+   col_set_str(pinfo->cinfo, COL_PROTOCOL, "ZIP");
+   col_clear(pinfo->cinfo, COL_INFO);
+ 
+-- 
+2.44.1
+
diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb b/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb
index b80710683..d68b082bb 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb
@@ -13,6 +13,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/wireshark-${PV}.tar.xz \
            file://0002-flex-Remove-line-directives.patch \
            file://0004-lemon-Remove-line-directives.patch \
            file://0001-UseLemon.cmake-do-not-use-lemon-data-from-the-host.patch \
+           file://CVE-2024-9781.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
-- 
2.35.6


