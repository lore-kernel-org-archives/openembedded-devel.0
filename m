Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3E76C282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 09:16:58 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.48039.1742203010251729922
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Mar 2025 02:16:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=EASROPBS;
 spf=pass (domain: mvista.com, ip: 209.85.214.178, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22548a28d0cso112314175ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Mar 2025 02:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1742203009; x=1742807809; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WdX5m2E3Wwwq9X1FE+KIB9iDZaxthMU/UKPiP9I8yzs=;
        b=EASROPBSSQ23r79I/I6LhptnWQkzo6yueRHEbusOzL5KEV/jqMQ1uOtCMLkHgzrWK/
         NavGQaD13+Xm+2DaJ6II4iL6Z+i7dRBw7fOWqHRQMDDjkSN6f/QCmm/oPDIJT1nA/Mo8
         N/arNAbDG0rwYExOTZjpRldwiW2RaKiHcPhCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742203009; x=1742807809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WdX5m2E3Wwwq9X1FE+KIB9iDZaxthMU/UKPiP9I8yzs=;
        b=SD3ySQrTHD3Q9xEtXL+/ZFSR8dYmCynBn0gFmKfAlJwxGBEF4tyFcq5FX7EV3Hw2Vi
         aY9TwMcB2nu7R/QlASEAlaG9TM3NtaSlPc+jfvAgz0mBpY1jYgkE4XCax038e/soed5N
         3yDSx653rCXTTxyfuqaxDSLywIBHVGVcFJRGEmzCqIr2O6QwbwyIHwlDmxGkxU3hgM24
         O2IJp3Ume7UW9xn0vXM+OPJ+ewDGmBRiiDu0Y+4nBFwhsujESLAbPEXBuWCzRb3ewUQg
         6t3zK4IFsyuBqGXePcOG1uWzpXnh2VhTJffC2jckFG/rjx/a7KXDMHCmQEBmvhsfQ+5Z
         WHtg==
X-Gm-Message-State: AOJu0YyCa26+gz3iHUbGz5S9+lOZtQLe0OZeoXlHgoi931DnW/RNPa3p
	ZNVLebGygncY4n1AfkVUcY+6+DK9RQ63JblZjxXAkr+qtyTIoLN21M+ECNQJwQUdpM8A7aoXUJl
	VE6M=
X-Gm-Gg: ASbGncueqAJ1Rp9vF/DqsDcPy1BOGkX++eiGIu1TWAJoTnc33NkRDbA69y59k+lzgIw
	j9hq1yk3OC16TpvGk6Ub/SHseHP/F4iMl8i0AbJ32NJaWNHMxUxJ7mGnOhYMjevVPsUMDr+cekx
	UIpOKX/9bqALH/ThDyJn7Ixwjt9r69wgns2gn8BjfxtzGzsObPGSCGgo1B9TKRF3uodi8ErXyfs
	ue1HX7bpt/LcshEl9ed3HvQwhUebYSYSwZLRthxyTTJ4dQgs/1YPXcxBYssXzKbl/QQTm6N8TQO
	sOD0Puj0vgXDWgMhm1QTHF2TXP0WGpXPVJV8P6SL0p1TIX6ZqUyj8CQ=
X-Google-Smtp-Source: AGHT+IHRrbaKIr0HqPSyb153e/2WiE1zdubOqaxInmQrAHc1d8s6dUGZLUc83p1fS9QwjnzMbzLlqQ==
X-Received: by 2002:a05:6a21:394c:b0:1f5:a3e8:64d3 with SMTP id adf61e73a8af0-1f5c118e786mr15659741637.21.1742203008989;
        Mon, 17 Mar 2025 02:16:48 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.233.26])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7371152931bsm7091964b3a.3.2025.03.17.02.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 02:16:48 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-networking][scarthgap][PATCH] wireshark: upgrade 4.2.7 -> 4.2.9
Date: Mon, 17 Mar 2025 14:46:38 +0530
Message-Id: <20250317091638.64066-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Mar 2025 09:16:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116022

From: Vijay Anusuri <vanusuri@mvista.com>

Fixes CVE-2024-11595 CVE-2024-11596
Removed CVE-2024-9781.patch which is already fixed in 4.2.8 version

Release notes:
https://www.wireshark.org/docs/relnotes/wireshark-4.2.8.html
https://www.wireshark.org/docs/relnotes/wireshark-4.2.9.html

Reference:
https://www.wireshark.org/security/wnpa-sec-2024-15.html
https://www.wireshark.org/security/wnpa-sec-2024-14.html
https://www.wireshark.org/security/wnpa-sec-2024-13.html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../wireshark/files/CVE-2024-9781.patch       | 133 ------------------
 ...{wireshark_4.2.7.bb => wireshark_4.2.9.bb} |   3 +-
 2 files changed, 1 insertion(+), 135 deletions(-)
 delete mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2024-9781.patch
 rename meta-networking/recipes-support/wireshark/{wireshark_4.2.7.bb => wireshark_4.2.9.bb} (96%)

diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2024-9781.patch b/meta-networking/recipes-support/wireshark/files/CVE-2024-9781.patch
deleted file mode 100644
index eb8c733da7..0000000000
--- a/meta-networking/recipes-support/wireshark/files/CVE-2024-9781.patch
+++ /dev/null
@@ -1,133 +0,0 @@
-From f32965be7c80ca6eb330d0e9b34f0c563db7d869 Mon Sep 17 00:00:00 2001
-From: Gerald Combs <gerald@wireshark.org>
-Date: Tue, 8 Oct 2024 11:56:28 -0700
-Subject: [PATCH] AppleTalk: Make sure we have valid addresses
-
-Make sure ATP, ZIP, and ASP have valid addresses. Use sizeof instead of
-a hard-coded value in a few places.
-
-Fixes #20114
-
-(cherry picked from commit 3de741321f85c205c0a8266c40f33cb0013bd1d2)
-
-Conflicts:
-	epan/dissectors/packet-atalk.c
-
-CVE: CVE-2024-9781
-Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/cad248ce3bf5]
-
-(cherry picked from commit cad248ce3bf53026cc837fedeaca65d0f20ea3b5)
-Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
----
- epan/dissectors/packet-atalk.c | 44 ++++++++++++++++++++++++----------
- 1 file changed, 32 insertions(+), 12 deletions(-)
-
-diff --git a/epan/dissectors/packet-atalk.c b/epan/dissectors/packet-atalk.c
-index 396e7af519..065d6aedb6 100644
---- a/epan/dissectors/packet-atalk.c
-+++ b/epan/dissectors/packet-atalk.c
-@@ -232,9 +232,18 @@ static int hf_asp_attn_code     = -1;
- static int hf_asp_seq           = -1;
- static int hf_asp_size          = -1;
- 
-+/*
-+ * Structure used to represent a DDP address; gives the layout of the
-+ * data pointed to by an Appletalk "address" structure.
-+ */
-+struct atalk_ddp_addr {
-+  guint16 net;
-+  guint8 node;
-+};
-+
- typedef struct {
-   guint32 conversation;
--  guint8  src[4];
-+  guint8  src[sizeof(struct atalk_ddp_addr)];
-   guint16 tid;
- } asp_request_key;
- 
-@@ -502,6 +511,10 @@ static const value_string asp_error_vals[] = {
-   {0,                   NULL } };
- value_string_ext asp_error_vals_ext = VALUE_STRING_EXT_INIT(asp_error_vals);
- 
-+static bool is_ddp_address(address *addr) {
-+  return addr->type == atalk_address_type && addr->len == sizeof(struct atalk_ddp_addr);
-+}
-+
- /*
-  * hf_index must be a FT_UINT_STRING type
-  * Are these always in a Mac extended character set?  Should we have a
-@@ -744,6 +757,12 @@ dissect_atp(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, void* data _U_)
-   conversation_t  *conversation;
-   asp_request_val *request_val   = NULL;
- 
-+  // ATP is carried over DDP
-+  if (!(is_ddp_address(&pinfo->src) && is_ddp_address(&pinfo->dst))) {
-+    return 0;
-+  }
-+
-+
-   col_set_str(pinfo->cinfo, COL_PROTOCOL, "ATP");
- 
-   ctrlinfo = tvb_get_guint8(tvb, offset);
-@@ -770,7 +789,7 @@ dissect_atp(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, void* data _U_)
-     asp_request_key request_key;
- 
-     request_key.conversation = conversation->conv_index;
--    memcpy(request_key.src, (!atp_asp_dsi_info.reply)?pinfo->src.data:pinfo->dst.data, 4);
-+    memcpy(request_key.src, (!atp_asp_dsi_info.reply)?pinfo->src.data:pinfo->dst.data, sizeof(struct atalk_ddp_addr));
-     request_key.tid = atp_asp_dsi_info.tid;
- 
-     request_val = (asp_request_val *) wmem_map_lookup(atp_request_hash, &request_key);
-@@ -1018,7 +1037,7 @@ get_transaction(tvbuff_t *tvb, packet_info *pinfo, struct atp_asp_dsi_info *atp_
-   conversation = find_or_create_conversation(pinfo);
- 
-   request_key.conversation = conversation->conv_index;
--  memcpy(request_key.src, (!atp_asp_dsi_info->reply)?pinfo->src.data:pinfo->dst.data, 4);
-+  memcpy(request_key.src, (!atp_asp_dsi_info->reply)?pinfo->src.data:pinfo->dst.data, sizeof(struct atalk_ddp_addr));
-   request_key.tid = atp_asp_dsi_info->tid;
- 
-   request_val = (asp_request_val *) wmem_map_lookup(asp_request_hash, &request_key);
-@@ -1051,6 +1070,11 @@ dissect_asp(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, void *data)
-   if (data == NULL)
-     return 0;
- 
-+  // ASP is carried over ATP/DDP
-+  if (!(is_ddp_address(&pinfo->src) && is_ddp_address(&pinfo->dst))) {
-+    return 0;
-+  }
-+
-   col_set_str(pinfo->cinfo, COL_PROTOCOL, "ASP");
-   col_clear(pinfo->cinfo, COL_INFO);
- 
-@@ -1183,15 +1207,6 @@ dissect_asp(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, void *data)
- /* -----------------------------
-    ZIP protocol cf. inside appletalk chap. 8
- */
--/*
-- * Structure used to represent a DDP address; gives the layout of the
-- * data pointed to by an Appletalk "address" structure.
-- */
--struct atalk_ddp_addr {
--    guint16 net;
--    guint8  node;
--};
--
- 
- static int atalk_str_len(const address* addr _U_)
- {
-@@ -1241,6 +1256,11 @@ dissect_atp_zip(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, void* data)
-   if (data == NULL)
-     return 0;
- 
-+  // ATP ZIP is carried over DDP
-+  if (!(is_ddp_address(&pinfo->src) && is_ddp_address(&pinfo->dst))) {
-+    return 0;
-+  }
-+
-   col_set_str(pinfo->cinfo, COL_PROTOCOL, "ZIP");
-   col_clear(pinfo->cinfo, COL_INFO);
- 
--- 
-2.44.1
-
diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb b/meta-networking/recipes-support/wireshark/wireshark_4.2.9.bb
similarity index 96%
rename from meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb
rename to meta-networking/recipes-support/wireshark/wireshark_4.2.9.bb
index d68b082bb3..c561179c68 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.2.9.bb
@@ -13,12 +13,11 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/wireshark-${PV}.tar.xz \
            file://0002-flex-Remove-line-directives.patch \
            file://0004-lemon-Remove-line-directives.patch \
            file://0001-UseLemon.cmake-do-not-use-lemon-data-from-the-host.patch \
-           file://CVE-2024-9781.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[sha256sum] = "2c5de08e19081bd666a2ce3f052c023274d06acaabc5d667a3c3051a9c618f86"
+SRC_URI[sha256sum] = "62c2b6652d7f9a50668867bd57b21609c9a9b6950f26e7f30a24b2de0e72ded3"
 
 PE = "1"
 
-- 
2.25.1


