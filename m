Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDF78EB64DA
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 06:04:51 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.1882.1687759488413720411
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Jun 2023 23:04:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=jb86dRLr;
 spf=pass (domain: mvista.com, ip: 209.85.214.176, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1b80f2e6c17so403455ad.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Jun 2023 23:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1687759487; x=1690351487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WVHe6BeFGoEtgsK5u1VIe4wodjeyOie6u5E72WCoN+M=;
        b=jb86dRLrW1rFsrwDWUUkCOHt9Ge250DVgw+h2+4UfhftJxKXe1Lc8uXln8qIqyaNs2
         V9KfovQaDYacmNAckZmQsYhubns7EX3tV/2A+muWkE0PazGwtAfDpPEQNqn6QTNvs5i2
         +Js0Um+sf5q1ficr/igz0dE6ONwEL+sodI/Dw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687759487; x=1690351487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WVHe6BeFGoEtgsK5u1VIe4wodjeyOie6u5E72WCoN+M=;
        b=W2NXQOqJwXPyYyVyTmsmyLDIEoer0kpXF0lEzqQJYoWNvKVmk5kBS1r69tS9t3rH/K
         9ylC9boZCZsYirZhrlpz3u6j67U7/Qkzvn+yge0VwRE0pbGSt2HRSmJxTAG7ErK7B/Ag
         0uygCWlX+BPNIXaCQV/nl/qyUzDHuUkKgScbnevJCOIwFsPeqk1lS5v/zekwtl12ha0J
         2fEHYKSUuQ+8g3RVwEVM+kgxO68mPcvRNvkWzrmFqOG37SH2KsT/Vx8HsQptA7X0BkQh
         +clorAMKZlhXTymPNU7kcDzBd9cp/sKmZGR8UUgQi1EUhymMv6UbbjV9e/Y0WOc9xym/
         fNrA==
X-Gm-Message-State: AC+VfDyUYn0gTZ9b1lhlrHY4Bp5STg41s9VYZCM8RKPhYylXdcoLahnD
	W0p1wSdxJIdxv7EnLJfqDnAjJ+nbUtKtYls59RA=
X-Google-Smtp-Source: ACHHUZ4MmV592PMRxStW+L/6WqqmAYSVPKudWSYJHqHzBx4vmyhwyTMRfgVKSjzM/CIp8rvgYctxdA==
X-Received: by 2002:a17:902:d2ca:b0:1b6:9551:e2b8 with SMTP id n10-20020a170902d2ca00b001b69551e2b8mr9056938plc.34.1687759487273;
        Sun, 25 Jun 2023 23:04:47 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.143])
        by smtp.gmail.com with ESMTPSA id w5-20020a1709029a8500b001b8013ed362sm1113624plp.96.2023.06.25.23.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 23:04:46 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Mon, 26 Jun 2023 11:34:41 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networking][mickledore][PATCH] wireshark: Fix Multiple CVEs
Date: Mon, 26 Jun 2023 11:34:40 +0530
Message-Id: <20230626060440.43508-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jun 2023 06:04:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103572

Backport fixes for:
* CVE-2023-0666 - Upstream-Status: Backport from https://gitlab.com/wireshark/wireshark/-/commit/265cbf15a418b629c3c8f02c0ba901913b1c8fd2
* CVE-2023-0667 - Upstream-Status: Backport from https://gitlab.com/wireshark/wireshark/-/commit/85fbca8adb09ea8e1af635db3d92727fbfa1e28a
* CVE-2023-0668 - Upstream-Status: Backport from https://gitlab.com/wireshark/wireshark/-/commit/c4f37d77b29ec6a9754795d0efb6f68d633728d9

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../wireshark/files/CVE-2023-0666.patch       | 122 ++++++++++++++++++
 .../wireshark/files/CVE-2023-0667.patch       |  66 ++++++++++
 .../wireshark/files/CVE-2023-0668.patch       |  33 +++++
 .../wireshark/wireshark_3.4.12.bb             |   3 +
 4 files changed, 224 insertions(+)
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2023-0666.patch
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2023-0667.patch
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2023-0668.patch

diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2023-0666.patch b/meta-networking/recipes-support/wireshark/files/CVE-2023-0666.patch
new file mode 100644
index 0000000000..7732916826
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/CVE-2023-0666.patch
@@ -0,0 +1,122 @@
+From 265cbf15a418b629c3c8f02c0ba901913b1c8fd2 Mon Sep 17 00:00:00 2001
+From: Gerald Combs <gerald@wireshark.org>
+Date: Thu, 18 May 2023 13:52:48 -0700
+Subject: [PATCH] RTPS: Fixup our g_strlcpy dest_sizes
+
+Use the proper dest_size in various g_strlcpy calls.
+
+Fixes #19085
+
+(cherry picked from commit 28fdce547c417b868c521f87fb58f71ca6b1e3f7)
+
+Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/265cbf15a418b629c3c8f02c0ba901913b1c8fd2]
+CVE: CVE-2023-0666
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ epan/dissectors/packet-rtps.c | 22 +++++++++++-----------
+ 1 file changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/epan/dissectors/packet-rtps.c b/epan/dissectors/packet-rtps.c
+index 5c2d1c1..ef592d7 100644
+--- a/epan/dissectors/packet-rtps.c
++++ b/epan/dissectors/packet-rtps.c
+@@ -3025,7 +3025,7 @@ static gint rtps_util_add_typecode(proto_tree *tree, tvbuff_t *tvb, gint offset,
+     ++tk_id;
+   }
+ 
+-  g_strlcpy(type_name, rtps_util_typecode_id_to_string(tk_id), 40);
++  g_strlcpy(type_name, rtps_util_typecode_id_to_string(tk_id), sizeof(type_name));
+ 
+     /* Structure of the typecode data:
+      *
+@@ -3196,7 +3196,7 @@ static gint rtps_util_add_typecode(proto_tree *tree, tvbuff_t *tvb, gint offset,
+                     member_name, -1, NULL, ndds_40_hack);
+         }
+         /* Finally prints the name of the struct (if provided) */
+-        g_strlcpy(type_name, "}", 40);
++        g_strlcpy(type_name, "}", sizeof(type_name));
+         break;
+ 
+     } /* end of case UNION */
+@@ -3367,7 +3367,7 @@ static gint rtps_util_add_typecode(proto_tree *tree, tvbuff_t *tvb, gint offset,
+           }
+         }
+         /* Finally prints the name of the struct (if provided) */
+-        g_strlcpy(type_name, "}", 40);
++        g_strlcpy(type_name, "}", sizeof(type_name));
+         break;
+       }
+ 
+@@ -3459,7 +3459,7 @@ static gint rtps_util_add_typecode(proto_tree *tree, tvbuff_t *tvb, gint offset,
+         offset += 4;
+         alias_name = tvb_get_string_enc(wmem_packet_scope(), tvb, offset, alias_name_length, ENC_ASCII);
+         offset += alias_name_length;
+-        g_strlcpy(type_name, alias_name, 40);
++        g_strlcpy(type_name, alias_name, sizeof(type_name));
+         break;
+     }
+ 
+@@ -3494,7 +3494,7 @@ static gint rtps_util_add_typecode(proto_tree *tree, tvbuff_t *tvb, gint offset,
+         if (tk_id == RTI_CDR_TK_VALUE_PARAM) {
+           type_id_name = "valueparam";
+         }
+-        g_snprintf(type_name, 40, "%s '%s'", type_id_name, value_name);
++        g_snprintf(type_name, sizeof(type_name), "%s '%s'", type_id_name, value_name);
+         break;
+     }
+   } /* switch(tk_id) */
+@@ -3673,7 +3673,7 @@ static gint rtps_util_add_type_library_type(proto_tree *tree,
+   long_number = tvb_get_guint32(tvb, offset_tmp, encoding);
+   name = tvb_get_string_enc(wmem_packet_scope(), tvb, offset_tmp+4, long_number, ENC_ASCII);
+   if (info)
+-    g_strlcpy(info->member_name, name, long_number);
++    g_strlcpy(info->member_name, name, sizeof(info->member_name));
+ 
+   proto_item_append_text(tree, " %s", name);
+   offset += member_length;
+@@ -3848,13 +3848,13 @@ static gint rtps_util_add_type_member(proto_tree *tree,
+   proto_item_append_text(tree, " %s (ID: %d)", name, member_id);
+   if (member_object) {
+     member_object->member_id = member_id;
+-    g_strlcpy(member_object->member_name, name, long_number < 256 ? long_number : 256);
++    g_strlcpy(member_object->member_name, name, sizeof(member_object->member_name));
+     member_object->type_id = member_type_id;
+   }
+   if (info && info->extensibility == EXTENSIBILITY_MUTABLE) {
+       mutable_member_mapping * mutable_mapping = NULL;
+       mutable_mapping = wmem_new(wmem_file_scope(), mutable_member_mapping);
+-      g_strlcpy(mutable_mapping->member_name, name, long_number < 256 ? long_number : 256);
++      g_strlcpy(mutable_mapping->member_name, name, sizeof(mutable_mapping->member_name));
+       mutable_mapping->struct_type_id = info->type_id;
+       mutable_mapping->member_type_id = member_type_id;
+       mutable_mapping->member_id = member_id;
+@@ -3909,7 +3909,7 @@ static gint rtps_util_add_type_union_member(proto_tree *tree,
+     union_member_mapping * mapping = NULL;
+ 
+     mapping = wmem_new(wmem_file_scope(), union_member_mapping);
+-    g_strlcpy(mapping->member_name, object.member_name, 256);
++    g_strlcpy(mapping->member_name, object.member_name, sizeof(mapping->member_name));
+     mapping->member_type_id = object.type_id;
+     mapping->discriminator = HASHMAP_DISCRIMINATOR_CONSTANT;
+     mapping->union_type_id = union_type_id + mapping->discriminator;
+@@ -3922,7 +3922,7 @@ static gint rtps_util_add_type_union_member(proto_tree *tree,
+     union_member_mapping * mapping = NULL;
+ 
+     mapping = wmem_new(wmem_file_scope(), union_member_mapping);
+-    g_strlcpy(mapping->member_name, object.member_name, 256);
++    g_strlcpy(mapping->member_name, object.member_name, sizeof(mapping->member_name));
+     mapping->member_type_id = object.type_id;
+     mapping->discriminator = -1;
+     mapping->union_type_id = union_type_id + mapping->discriminator;
+@@ -3942,7 +3942,7 @@ static gint rtps_util_add_type_union_member(proto_tree *tree,
+     ti = proto_tree_add_item(labels, hf_rtps_type_object_union_label, tvb, offset_tmp, 4, encoding);
+     offset_tmp += 4;
+ 
+-    g_strlcpy(mapping->member_name, object.member_name, 256);
++    g_strlcpy(mapping->member_name, object.member_name, sizeof(mapping->member_name));
+     mapping->member_type_id = object.type_id;
+     mapping->discriminator = discriminator_case;
+     mapping->union_type_id = union_type_id + discriminator_case;
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2023-0667.patch b/meta-networking/recipes-support/wireshark/files/CVE-2023-0667.patch
new file mode 100644
index 0000000000..cd07395aac
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/CVE-2023-0667.patch
@@ -0,0 +1,66 @@
+From 85fbca8adb09ea8e1af635db3d92727fbfa1e28a Mon Sep 17 00:00:00 2001
+From: John Thacker <johnthacker@gmail.com>
+Date: Thu, 18 May 2023 18:06:36 -0400
+Subject: [PATCH] MS-MMS: Use format_text_string()
+
+The length of a string transcoded from UTF-16 to UTF-8 can be
+shorter (or longer) than the original length in bytes in the packet.
+Use the new string length, not the original length.
+
+Use format_text_string, which is a convenience function that
+calls strlen.
+
+Fix #19086
+
+(cherry picked from commit 1c45a899f83fa88e60ab69936bea3c4754e7808b)
+
+Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/85fbca8adb09ea8e1af635db3d92727fbfa1e28a]
+CVE: CVE-2023-0667
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ epan/dissectors/packet-ms-mms.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/epan/dissectors/packet-ms-mms.c b/epan/dissectors/packet-ms-mms.c
+index f4dbcd0..092a64b 100644
+--- a/epan/dissectors/packet-ms-mms.c
++++ b/epan/dissectors/packet-ms-mms.c
+@@ -740,7 +740,7 @@ static void dissect_client_transport_info(tvbuff_t *tvb, packet_info *pinfo, pro
+                                  transport_info, "Transport: (%s)", transport_info);
+ 
+     col_append_fstr(pinfo->cinfo, COL_INFO, " (%s)",
+-                    format_text(wmem_packet_scope(), (guchar*)transport_info, length_remaining - 20));
++                    format_text_string(pinfo->pool, (const guchar*)transport_info));
+ 
+ 
+     /* Try to extract details from this string */
+@@ -837,7 +837,7 @@ static void dissect_server_info(tvbuff_t *tvb, packet_info *pinfo, proto_tree *t
+                             ENC_UTF_16|ENC_LITTLE_ENDIAN, wmem_packet_scope(), &server_version);
+ 
+         col_append_fstr(pinfo->cinfo, COL_INFO, " (version='%s')",
+-                    format_text(wmem_packet_scope(), (const guchar*)server_version, strlen(server_version)));
++                    format_text_string(pinfo->pool, (const guchar*)server_version));
+     }
+     offset += (server_version_length*2);
+ 
+@@ -891,7 +891,7 @@ static void dissect_client_player_info(tvbuff_t *tvb, packet_info *pinfo, proto_
+                         ENC_UTF_16|ENC_LITTLE_ENDIAN, wmem_packet_scope(), &player_info);
+ 
+     col_append_fstr(pinfo->cinfo, COL_INFO, " (%s)",
+-                    format_text(wmem_packet_scope(), (const guchar*)player_info, strlen(player_info)));
++                    format_text_string(pinfo->pool, (const guchar*)player_info));
+ }
+ 
+ /* Dissect info about where client wants to start playing from */
+@@ -966,7 +966,7 @@ static void dissect_request_server_file(tvbuff_t *tvb, packet_info *pinfo, proto
+                         ENC_UTF_16|ENC_LITTLE_ENDIAN, wmem_packet_scope(), &server_file);
+ 
+     col_append_fstr(pinfo->cinfo, COL_INFO, " (%s)",
+-                    format_text(wmem_packet_scope(), (const guchar*)server_file, strlen(server_file)));
++                    format_text_string(pinfo->pool, (const guchar*)server_file));
+ }
+ 
+ /* Dissect media details from server */
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2023-0668.patch b/meta-networking/recipes-support/wireshark/files/CVE-2023-0668.patch
new file mode 100644
index 0000000000..0009939330
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/CVE-2023-0668.patch
@@ -0,0 +1,33 @@
+From c4f37d77b29ec6a9754795d0efb6f68d633728d9 Mon Sep 17 00:00:00 2001
+From: John Thacker <johnthacker@gmail.com>
+Date: Sat, 20 May 2023 23:08:08 -0400
+Subject: [PATCH] synphasor: Use val_to_str_const
+
+Don't use a value from packet data to directly index a value_string,
+particularly when the value string doesn't cover all possible values.
+
+Fix #19087
+
+Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/c4f37d77b29ec6a9754795d0efb6f68d633728d9]
+CVE: CVE-2023-0668
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ epan/dissectors/packet-synphasor.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/epan/dissectors/packet-synphasor.c b/epan/dissectors/packet-synphasor.c
+index 12b388b..fbde875 100644
+--- a/epan/dissectors/packet-synphasor.c
++++ b/epan/dissectors/packet-synphasor.c
+@@ -1212,7 +1212,7 @@ static gint dissect_PHSCALE(tvbuff_t *tvb, proto_tree *tree, gint offset, gint c
+ 
+ 		data_flag_tree = proto_tree_add_subtree_format(single_phasor_scaling_and_flags_tree, tvb, offset, 4,
+ 							       ett_conf_phflags, NULL, "Phasor Data flags: %s",
+-							       conf_phasor_type[tvb_get_guint8(tvb, offset + 2)].strptr);
++							       val_to_str_const(tvb_get_guint8(tvb, offset + 2), conf_phasor_type, "Unknown"));
+ 
+ 		/* first and second bytes - phasor modification flags*/
+ 		phasor_flag1_tree = proto_tree_add_subtree_format(data_flag_tree, tvb, offset, 2, ett_conf_phmod_flags,
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb b/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
index 96603710f4..0255591934 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
@@ -21,6 +21,9 @@ SRC_URI += " \
     file://CVE-2023-2858.patch \
     file://CVE-2023-2879.patch \
     file://CVE-2023-2952.patch \
+    file://CVE-2023-0666.patch \
+    file://CVE-2023-0667.patch \
+    file://CVE-2023-0668.patch \
 "
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
-- 
2.25.1


