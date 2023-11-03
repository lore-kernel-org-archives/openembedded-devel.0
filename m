Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DA76C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 05:49:43 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.30887.1698990578470664788
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Nov 2023 22:49:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=MI1lUzFA;
 spf=pass (domain: mvista.com, ip: 209.85.215.182, mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5b92b670f2aso1348245a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Nov 2023 22:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1698990578; x=1699595378; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MbzeW1kkWKWKNezjcYoYaWpFCucvw+hlg97tAYg8+nw=;
        b=MI1lUzFATs0+33ZPsfKM8WRlwwpU0XJExsJHsMwYLzpJDU70ivWKVHtBbTNVB4vOLx
         7NAPesirCYcd1qX2au5/xRDIsxvvQgxAUItkve1Ph25HGizsJMNuNU8xTulJcTHelh96
         0lNDOJFOvjXSrd3S646NzvmR5hdy6eyAnSuvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698990578; x=1699595378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MbzeW1kkWKWKNezjcYoYaWpFCucvw+hlg97tAYg8+nw=;
        b=UP9DMuinTG7EB49Sz43UMo8OvQbY42wyEQkZ7kjeVBhiuWZ/F7h/A0AXYh+iDn/QSU
         3aA7tGEPx1VbrBxvrfH8uSAmjgmYncAQ18MVNISUJP2MMvUB05gj+mzxc71zyAumJlnQ
         F3V3tsZJpQK9o6ClFeNg2nYBbD9sxb4RNdG4MSuKsh3lvexuDIl5QunVUIjIbH3BLgBy
         Yg4f/ZNHZ3fZarxm/doByv8qipe03pzsiRMXfgl3D57nQ6EmKvEMAsFG4wMXm3sKVhJC
         1rItHDMiumnfyGPGHbN4P5VshLkA8hdGB3JtewvCsQuL7Nys6txSfjMOMsIC1UucDlAL
         uRrA==
X-Gm-Message-State: AOJu0YzlDPD2WjiLKxx5eXlPO4rX/BleQqaX1JYJZ0zga9Wm+NmbbY7i
	mB/JG3OY9F0nUQhbvuiq6MO7HmcomgbsvEBxPkVNXw==
X-Google-Smtp-Source: AGHT+IFQRHHQzhl5Qc9BEbimk/aAEk1DKQMz5h0hRYgc+9YZcwOCx2+RVPiBMFhas+7Yj29okp7OpA==
X-Received: by 2002:a05:6a21:7785:b0:180:db7b:23f2 with SMTP id bd5-20020a056a21778500b00180db7b23f2mr14777087pzc.61.1698990577576;
        Thu, 02 Nov 2023 22:49:37 -0700 (PDT)
Received: from MVIN00016.mvista.com ([150.129.170.135])
        by smtp.gmail.com with ESMTPSA id fd15-20020a056a002e8f00b006b5922221f4sm630216pfb.8.2023.11.02.22.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 22:49:37 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networking][dunfell][PATCH] wireshark: Fix CVE-2023-3649
Date: Fri,  3 Nov 2023 11:19:31 +0530
Message-Id: <20231103054931.31565-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 05:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105849

Upstream-Status: Backport from https://gitlab.com/wireshark/wireshark/-/commit/75e0ffcb42f3816e5f2fdef12f3c9ae906130b0c

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../wireshark/files/CVE-2023-3649.patch       | 231 ++++++++++++++++++
 .../wireshark/wireshark_3.2.18.bb             |   1 +
 2 files changed, 232 insertions(+)
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2023-3649.patch

diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2023-3649.patch b/meta-networking/recipes-support/wireshark/files/CVE-2023-3649.patch
new file mode 100644
index 000000000..5e92bd8a2
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/CVE-2023-3649.patch
@@ -0,0 +1,231 @@
+From 75e0ffcb42f3816e5f2fdef12f3c9ae906130b0c Mon Sep 17 00:00:00 2001
+From: John Thacker <johnthacker@gmail.com>
+Date: Sat, 24 Jun 2023 00:34:50 -0400
+Subject: [PATCH] iscsi: Check bounds when extracting TargetAddress
+
+Use tvb_ functions that do bounds checking when parsing the
+TargetAddress string, instead of incrementing a pointer to an
+extracted char* and sometimes accidentally overrunning the
+string.
+
+While we're there, go ahead and add support for IPv6 addresses.
+
+Fix #19164
+
+(backported from commit 94349bbdaeb384b12d554dd65e7be7ceb0e93d21)
+
+Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/75e0ffcb42f3816e5f2fdef12f3c9ae906130b0c]
+CVE: CVE-2023-3649
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ epan/dissectors/packet-iscsi.c | 146 +++++++++++++++++----------------
+ 1 file changed, 75 insertions(+), 71 deletions(-)
+
+diff --git a/epan/dissectors/packet-iscsi.c b/epan/dissectors/packet-iscsi.c
+index 8a80f49..08f44a8 100644
+--- a/epan/dissectors/packet-iscsi.c
++++ b/epan/dissectors/packet-iscsi.c
+@@ -20,8 +20,6 @@
+ 
+ #include "config.h"
+ 
+-#include <stdio.h>
+-
+ #include <epan/packet.h>
+ #include <epan/prefs.h>
+ #include <epan/conversation.h>
+@@ -29,6 +27,7 @@
+ #include "packet-scsi.h"
+ #include <epan/crc32-tvb.h>
+ #include <wsutil/crc32.h>
++#include <wsutil/inet_addr.h>
+ #include <wsutil/strtoi.h>
+ 
+ void proto_register_iscsi(void);
+@@ -512,70 +511,81 @@ typedef struct _iscsi_conv_data {
+    dissector for the address/port that TargetAddress points to.
+    (it starts to be common to use redirectors to point to non-3260 ports)
+ */
++static address null_address = ADDRESS_INIT_NONE;
++
+ static void
+-iscsi_dissect_TargetAddress(packet_info *pinfo, tvbuff_t* tvb, proto_tree *tree, char *val, guint offset)
++iscsi_dissect_TargetAddress(packet_info *pinfo, tvbuff_t* tvb, proto_tree *tree, guint offset)
+ {
+-    address *addr = NULL;
++    address addr = ADDRESS_INIT_NONE;
+     guint16 port;
+-    char *value = wmem_strdup(wmem_packet_scope(), val);
+-    char *p = NULL, *pgt = NULL;
+-
+-    if (value[0] == '[') {
+-        /* this looks like an ipv6 address */
+-        p = strchr(value, ']');
+-        if (p != NULL) {
+-            *p = 0;
+-            p += 2;    /* skip past "]:" */
+-
+-            pgt = strchr(p, ',');
+-            if (pgt != NULL) {
+-                *pgt++ = 0;
+-            }
++    int colon_offset;
++    int end_offset;
++    char *ip_str, *port_str;
++
++    colon_offset = tvb_find_guint8(tvb, offset, -1, ':');
++    if (colon_offset == -1) {
++        /* RFC 7143 13.8 TargetAddress "If the TCP port is not specified,
++         * it is assumed to be the IANA-assigned default port for iSCSI",
++         * so nothing to do here.
++         */
++        return;
++    }
+ 
+-            /* can't handle ipv6 yet */
++    /* We found a colon, so there's at least one byte and this won't fail. */
++    if (tvb_get_guint8(tvb, offset) == '[') {
++        offset++;
++        /* could be an ipv6 address */
++        end_offset = tvb_find_guint8(tvb, offset, -1, ']');
++        if (end_offset == -1) {
++            return;
+         }
+-    } else {
+-        /* This is either a ipv4 address or a dns name */
+-        int i0,i1,i2,i3;
+-        if (sscanf(value, "%d.%d.%d.%d", &i0,&i1,&i2,&i3) == 4) {
+-            /* looks like a ipv4 address */
+-            p = strchr(value, ':');
+-            if (p != NULL) {
+-                char *addr_data;
+-
+-                *p++ = 0;
+-
+-                pgt = strchr(p, ',');
+-                if (pgt != NULL) {
+-                    *pgt++ = 0;
+-                }
+ 
+-                addr_data = (char *) wmem_alloc(wmem_packet_scope(), 4);
+-                addr_data[0] = i0;
+-                addr_data[1] = i1;
+-                addr_data[2] = i2;
+-                addr_data[3] = i3;
+-
+-                addr = wmem_new(wmem_packet_scope(), address);
+-                addr->type = AT_IPv4;
+-                addr->len  = 4;
+-                addr->data = addr_data;
++        /* look for the colon before the port, if any */
++        colon_offset = tvb_find_guint8(tvb, end_offset, -1, ':');
++        if (colon_offset == -1) {
++            return;
++        }
+ 
+-                if (!ws_strtou16(p, NULL, &port)) {
+-                    proto_tree_add_expert_format(tree, pinfo, &ei_iscsi_keyvalue_invalid,
+-                        tvb, offset + (guint)strlen(value), (guint)strlen(p), "Invalid port: %s", p);
+-                }
+-            }
++        ws_in6_addr *ip6_addr = wmem_new(pinfo->pool, ws_in6_addr);
++        ip_str = tvb_get_string_enc(pinfo->pool, tvb, offset, end_offset - offset, ENC_ASCII);
++        if (ws_inet_pton6(ip_str, ip6_addr)) {
++            /* looks like a ipv6 address */
++            set_address(&addr, AT_IPv6, sizeof(ws_in6_addr), ip6_addr);
++        }
+ 
++    } else {
++        /* This is either a ipv4 address or a dns name */
++        ip_str = tvb_get_string_enc(pinfo->pool, tvb, offset, colon_offset - offset, ENC_ASCII);
++        ws_in4_addr *ip4_addr = wmem_new(pinfo->pool, ws_in4_addr);
++        if (ws_inet_pton4(ip_str, ip4_addr)) {
++            /* looks like a ipv4 address */
++            set_address(&addr, AT_IPv4, 4, ip4_addr);
+         }
++        /* else a DNS host name; we could, theoretically, try to use
++         * name resolution information in the capture to lookup the address.
++         */
+     }
+ 
++    /* Extract the port */
++    end_offset = tvb_find_guint8(tvb, colon_offset, -1, ',');
++    int port_len;
++    if (end_offset == -1) {
++        port_len = tvb_reported_length_remaining(tvb, colon_offset + 1);
++    } else {
++        port_len = end_offset - (colon_offset + 1);
++    }
++    port_str = tvb_get_string_enc(pinfo->pool, tvb, colon_offset + 1, port_len, ENC_ASCII);
++    if (!ws_strtou16(port_str, NULL, &port)) {
++        proto_tree_add_expert_format(tree, pinfo, &ei_iscsi_keyvalue_invalid,
++            tvb, colon_offset + 1, port_len, "Invalid port: %s", port_str);
++        return;
++    }
+ 
+     /* attach a conversation dissector to this address/port tuple */
+-    if (addr && !pinfo->fd->visited) {
++    if (!addresses_equal(&addr, &null_address) && !pinfo->fd->visited) {
+         conversation_t *conv;
+ 
+-        conv = conversation_new(pinfo->num, addr, addr, ENDPOINT_TCP, port, port, NO_ADDR2|NO_PORT2);
++        conv = conversation_new(pinfo->num, &addr, &null_address, ENDPOINT_TCP, port, 0, NO_ADDR2|NO_PORT2);
+         if (conv == NULL) {
+             return;
+         }
+@@ -587,30 +597,24 @@ iscsi_dissect_TargetAddress(packet_info *pinfo, tvbuff_t* tvb, proto_tree *tree,
+ static gint
+ addTextKeys(packet_info *pinfo, proto_tree *tt, tvbuff_t *tvb, gint offset, guint32 text_len) {
+     const gint limit = offset + text_len;
++    tvbuff_t *keyvalue_tvb;
++    int len, value_offset;
+ 
+     while(offset < limit) {
+-        char *key = NULL, *value = NULL;
+-        gint len = tvb_strnlen(tvb, offset, limit - offset);
+-
+-        if(len == -1) {
+-            len = limit - offset;
+-        } else {
+-            len = len + 1;
+-        }
+-
+-        key = tvb_get_string_enc(wmem_packet_scope(), tvb, offset, len, ENC_ASCII);
+-        if (key == NULL) {
+-            break;
+-        }
+-        value = strchr(key, '=');
+-        if (value == NULL) {
++        /* RFC 7143 6.1 Text Format: "Every key=value pair, including the
++         * last or only pair in a LTDS, MUST be followed by one null (0x00)
++         * delimiter.
++         */
++        proto_tree_add_item_ret_length(tt, hf_iscsi_KeyValue, tvb, offset, -1, ENC_ASCII, &len);
++        keyvalue_tvb = tvb_new_subset_length(tvb, offset, len);
++        value_offset = tvb_find_guint8(keyvalue_tvb, 0, len, '=');
++        if (value_offset == -1) {
+             break;
+         }
+-        *value++ = 0;
++        value_offset++;
+ 
+-        proto_tree_add_item(tt, hf_iscsi_KeyValue, tvb, offset, len, ENC_ASCII|ENC_NA);
+-        if (!strcmp(key, "TargetAddress")) {
+-            iscsi_dissect_TargetAddress(pinfo, tvb, tt, value, offset + (guint)strlen("TargetAddress") + 2);
++        if (tvb_strneql(keyvalue_tvb, 0, "TargetAddress=", strlen("TargetAddress=")) == 0) {
++            iscsi_dissect_TargetAddress(pinfo, keyvalue_tvb, tt, value_offset);
+         }
+ 
+         offset += len;
+@@ -2941,7 +2945,7 @@ proto_register_iscsi(void)
+         },
+         { &hf_iscsi_KeyValue,
+           { "KeyValue", "iscsi.keyvalue",
+-            FT_STRING, BASE_NONE, NULL, 0,
++            FT_STRINGZ, BASE_NONE, NULL, 0,
+             "Key/value pair", HFILL }
+         },
+         { &hf_iscsi_Text_F,
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb b/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
index 64e436df3..b4425cb66 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
@@ -18,6 +18,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
            file://CVE-2023-0667.patch \
            file://CVE-2023-0668.patch \
            file://CVE-2023-2906.patch \
+           file://CVE-2023-3649.patch \
            "
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-- 
2.25.1


