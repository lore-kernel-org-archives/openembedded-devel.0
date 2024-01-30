Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55BB0C46CD2
	for <webhook@archiver.kernel.org>; Tue, 30 Jan 2024 05:18:14 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.12132.1706591885571845485
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jan 2024 21:18:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=HfxmXtJD;
 spf=pass (domain: mvista.com, ip: 209.85.214.171, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1d70b0e521eso25240285ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Jan 2024 21:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1706591884; x=1707196684; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VkVossqiaveparkFnkXnhd9PoxcPbwz7FZNgUGdL/3M=;
        b=HfxmXtJDyuab4ARJel8xDEb74NDEKzb2NyVLxuxvYFoarPCxx2hQQtMxX8zaUhTkh4
         uDao1G8oLGmcpxzrWha5gN8C/lHexFkkxXLasBbHHqLkiIQnlvfCTyI54wwOmK9mmg6W
         o/GpA7uPbUg/RPGrmzKme5t7otBOOHE6qlVNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706591884; x=1707196684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VkVossqiaveparkFnkXnhd9PoxcPbwz7FZNgUGdL/3M=;
        b=FnCXzk7lMgVZDnpFYsr/2wiRCptaUF+oGuAeVXKQq74+wg13+0lUjmPU/4fPSY40Ix
         NzthxGBIZ5tf1CZzDJ4KeyjHdFStJiDL2r6P+iKbcQpVt3jQVXQt+hq4Tcx1tQo0MF1y
         qGt5bP3BTCxjVADBxvsow9EMIp1kleEseK5J5NYmLOE7OrioDitFHj1o5z7sAstluDHR
         rFT3CCthD8vYFsQxnc0jKkgwp+69NkVJIuyaThM/eJJdPe53e2LVkSpeBjDLPRarBOBR
         xaB3vtoPbKZ/GxLk/gQX4yUORTdxMJJ+rkdJfXraX1kXhlX/AF/cCnUVSda1JpxOYo+a
         lDsw==
X-Gm-Message-State: AOJu0Yzp8zUHEyUakyO/EXSt9bcr8nHFtvK/at1CAd81/d5TVlUinFpA
	tR/H9lWpkIZfbkJj3NJ/IGgXq0+H0URkyKpGIp4NXPoLcB1tNrtWzPIBDInZnLk48DGI6pY6r95
	q
X-Google-Smtp-Source: AGHT+IGg3gcik5KQXgwqQPFt79PNNa/FtXsqMht7WtZDMhPPZdVFQrIJScjfQHc2arZu+M+V4QvtDw==
X-Received: by 2002:a17:902:ced0:b0:1d7:61f9:a5aa with SMTP id d16-20020a170902ced000b001d761f9a5aamr8956821plg.49.1706591884515;
        Mon, 29 Jan 2024 21:18:04 -0800 (PST)
Received: from MVIN00020.mvista.com ([136.185.83.90])
        by smtp.gmail.com with ESMTPSA id i18-20020a170902c95200b001d7439bf914sm6233128pla.235.2024.01.29.21.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 21:18:04 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-networking][kirkstone][PATCH] wireshark: Fix for CVE-2023-4511
Date: Tue, 30 Jan 2024 10:45:51 +0530
Message-Id: <20240130051551.261893-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jan 2024 05:18:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108489

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.com/wireshark/wireshark/-/commit/ef9c79ae81b00a63aa8638076ec81dc9482972e9

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../wireshark/files/CVE-2023-4511.patch       | 81 +++++++++++++++++++
 .../wireshark/wireshark_3.4.12.bb             |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2023-4511.patch

diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2023-4511.patch b/meta-networking/recipes-support/wireshark/files/CVE-2023-4511.patch
new file mode 100644
index 000000000..6a2f20163
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/CVE-2023-4511.patch
@@ -0,0 +1,81 @@
+From ef9c79ae81b00a63aa8638076ec81dc9482972e9 Mon Sep 17 00:00:00 2001
+From: John Thacker <johnthacker@gmail.com>
+Date: Thu, 10 Aug 2023 05:29:09 -0400
+Subject: [PATCH] btsdp: Keep offset advancing
+
+hf_data_element_value is a FT_NONE, so we can add the item with
+the expected length and get_hfi_length() will adjust the length
+without throwing an exception. There's no need to add it with
+zero length and call proto_item_set_len. Also, don't increment
+the offset by 0 instead of the real length when there isn't
+enough data in the packet, as that can lead to failing to advance
+the offset.
+
+When dissecting a sequence type (sequence or alternative) and
+recursing into the sequence member, instead of using the main
+packet tvb directly, create a subset using the indicated length
+of the sequence. That will properly throw an exception if a
+contained item is larger than the containing sequence, instead of
+dissecting the same bytes as several different items (inside
+the sequence recursively, as well in the outer loop.)
+
+Fix #19258
+
+Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/ef9c79ae81b00a63aa8638076ec81dc9482972e9]
+CVE: CVE-2023-4511
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ epan/dissectors/packet-btsdp.c | 15 ++++++++-------
+ 1 file changed, 8 insertions(+), 7 deletions(-)
+
+diff --git a/epan/dissectors/packet-btsdp.c b/epan/dissectors/packet-btsdp.c
+index 397ece7..eb7f5fa 100644
+--- a/epan/dissectors/packet-btsdp.c
++++ b/epan/dissectors/packet-btsdp.c
+@@ -1925,13 +1925,11 @@ dissect_data_element(proto_tree *tree, proto_tree **next_tree,
+         offset += len - length;
+     }
+ 
+-    pitem = proto_tree_add_item(ptree, hf_data_element_value, tvb, offset,  0, ENC_NA);
++    pitem = proto_tree_add_item(ptree, hf_data_element_value, tvb, offset, length, ENC_NA);
+     if (length > tvb_reported_length_remaining(tvb, offset)) {
+         expert_add_info(pinfo, pitem, &ei_data_element_value_large);
+-        length = 0;
+-    }
+-    proto_item_set_len(pitem, length);
+-    if (length == 0)
++	proto_item_append_text(pitem, ": MISSING");
++    } else if (length == 0)
+         proto_item_append_text(pitem, ": MISSING");
+ 
+     if (next_tree) *next_tree = proto_item_add_subtree(pitem, ett_btsdp_data_element_value);
+@@ -3523,6 +3521,8 @@ dissect_sdp_type(proto_tree *tree, packet_info *pinfo, tvbuff_t *tvb,
+         gint           bytes_to_go = size;
+         gint           first       = 1;
+         wmem_strbuf_t *substr;
++	tvbuff_t      *next_tvb = tvb_new_subset_length(tvb, offset, size);
++	gint           next_offset = 0;
+ 
+         ti = proto_tree_add_item(next_tree, (type == 6) ? hf_data_element_value_sequence : hf_data_element_value_alternative,
+                 tvb, offset, size, ENC_NA);
+@@ -3537,14 +3537,15 @@ dissect_sdp_type(proto_tree *tree, packet_info *pinfo, tvbuff_t *tvb,
+                 first = 0;
+             }
+ 
+-            size = dissect_sdp_type(st, pinfo, tvb, offset, attribute, service_uuid,
++            size = dissect_sdp_type(st, pinfo, next_tvb, next_offset,
++		    attribute, service_uuid,
+                     service_did_vendor_id, service_did_vendor_id_source,
+                     service_hdp_data_exchange_specification, service_info, &substr);
+             if (size < 1) {
+                 break;
+             }
+             wmem_strbuf_append_printf(info_buf, "%s ", wmem_strbuf_get_str(substr));
+-            offset += size ;
++            next_offset += size;
+             bytes_to_go -= size;
+         }
+ 
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb b/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
index 365ec5e90..6a6d3ac63 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
@@ -27,6 +27,7 @@ SRC_URI += " \
     file://CVE-2023-2906.patch \
     file://CVE-2023-1992.patch \
     file://CVE-2022-4345.patch \
+    file://CVE-2023-4511.patch \
 "
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
-- 
2.25.1


