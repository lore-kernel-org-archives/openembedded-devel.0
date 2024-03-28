Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA37BC54E67
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 06:19:16 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.9547.1711606755892151004
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Mar 2024 23:19:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=SQ3WSA3y;
 spf=pass (domain: mvista.com, ip: 209.85.214.173, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1e0025ef1efso4762155ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Mar 2024 23:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1711606754; x=1712211554; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/d5Hyt4PWZsf+5kML+cSDFDCA+hP27/DagPHxz1vz6k=;
        b=SQ3WSA3yIP8FtEJ/OqXP/GjIuMsYQ3SHKhIgv5ycsdH8A15Ja1qW6KTRmr0EU1sQOF
         Z3xgACRSyd3sqrYgGuQ1pAku1i625bHQwILFBjGPsZhsMzvX+DKa3ZhriJjgi01xYhwU
         8gKgpN7U97vBbnx2+Z2aGLWdJJ/W/yIOUVatI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711606754; x=1712211554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/d5Hyt4PWZsf+5kML+cSDFDCA+hP27/DagPHxz1vz6k=;
        b=pl8WRbp9iKDbrMFLQY6jnbZMWGOaUiv6QF8N0565xHyerziiH364jbZNnG7xnZBjjS
         0+1SQQIPre7QGJ0Nris86U+VnjcJH5xfYHpOaVVqQFdc9Q4GKHZQyzmXyv0Cb0AY09eW
         50dBj1Yn2/t2Cnr6bqdqutZKUHfVJCruNbPQE9DPdAPvlzteO0GFmSbSQmkSTBCzjCDQ
         QdvrfpSddm2jyJ2t68FrN8cobFKsb3T0RKl1jiIyiwNB5dCRqy0/ATx+i9JyOXCJTIgj
         F+xWIIBIWalFyzqJr+GCiHAQ3IQG00rTXxVYNfONi2kbscLkupiN2A/fLo2Jf8FA43mo
         nc3A==
X-Gm-Message-State: AOJu0YzgHgIliP4HXXkxbXrPZ0ilt2JT6lvvky9i3uUcJUhJdo18KDWT
	fhvsaJg3yEkvLjtyDSPPKSKosNjNu14TGM9sbynE/wiBXfkUx+EZN0xZL6OJAWbt7RZqMSFk1RZ
	f
X-Google-Smtp-Source: AGHT+IG6ADMApcYPWd6DZzIqwL5TU1ViA2kF/F0fYYztkOZjlof0E+MiiQ5LbYa944RRAdWJWS1WXg==
X-Received: by 2002:a17:903:234e:b0:1e0:b8df:1083 with SMTP id c14-20020a170903234e00b001e0b8df1083mr2464936plh.0.1711606754326;
        Wed, 27 Mar 2024 23:19:14 -0700 (PDT)
Received: from MVIN00020.mvista.com ([2401:4900:1cb0:1008:418c:4261:573f:896c])
        by smtp.gmail.com with ESMTPSA id mm8-20020a1709030a0800b001e12013ae07sm637210plb.231.2024.03.27.23.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 23:19:13 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-networking][dunfell][PATCH] wireshark: Fix for CVE-2023-4511
Date: Thu, 28 Mar 2024 11:49:02 +0530
Message-Id: <20240328061902.188059-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Mar 2024 06:19:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109652

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.com/wireshark/wireshark/-/commit/ef9c79ae81b00a63aa8638076ec81dc9482972e9

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../wireshark/files/CVE-2023-4511.patch       | 81 +++++++++++++++++++
 .../wireshark/wireshark_3.2.18.bb             |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2023-4511.patch

diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2023-4511.patch b/meta-networking/recipes-support/wireshark/files/CVE-2023-4511.patch
new file mode 100644
index 000000000..fbbdf0cfc
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
+index 529bb71..f18d531 100644
+--- a/epan/dissectors/packet-btsdp.c
++++ b/epan/dissectors/packet-btsdp.c
+@@ -1925,13 +1925,11 @@ dissect_data_element(proto_tree *tree, proto_tree **next_tree,
+         offset += len - length;
+     }
+ 
+-    pitem = proto_tree_add_item(ptree, hf_data_element_value, tvb, offset,  0, ENC_NA);
++    pitem = proto_tree_add_item(ptree, hf_data_element_value, tvb, offset,  length, ENC_NA);
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
++        tvbuff_t      *next_tvb = tvb_new_subset_length(tvb, offset, size);
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
diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb b/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
index 8054cbb5a..8af0e6aa5 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
@@ -23,6 +23,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
            file://CVE-2022-4345.patch \
            file://CVE-2024-0208.patch \
            file://CVE-2023-1992.patch \
+           file://CVE-2023-4511.patch \
            "
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-- 
2.25.1


