Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7144ED25934
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 05:05:24 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2976.1769490321890722750
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jan 2026 21:05:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=UHkMIP+j;
 spf=pass (domain: mvista.com, ip: 209.85.214.170, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a79ded11a2so32133425ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 21:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1769490321; x=1770095121; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Phug26a5Q6Al8kztw03WcsHh2R0SBlCe4fbMITE31g=;
        b=UHkMIP+juJcjiG5CHxZXGvQpRG4YbBZXoLoRhebxYNxKzI0NcBfJmRDsdE/k+rSzb1
         c0jOoT9eC04R8KzCHkucsxcgWbQM6djCe6VMdmuuMn6upPdWTKy90TWmWwDvrxO8kMLa
         x+6QWIKX6FvuICBbeCyNdqthfisJT1SpMI6Ps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769490321; x=1770095121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Phug26a5Q6Al8kztw03WcsHh2R0SBlCe4fbMITE31g=;
        b=meQ4eNsVi+S1ytLwUNOrkcyna+Hky0XTxgnKA7VRI9P62bJLtxu3FSSw/hG2YFIxt1
         koEtHMahaAD/T8zw7i/0eXlIjnxJDKKiqi0CSDx7E4yHGdZGbR+uCTsootclC7Yk6g9z
         ck0+kwBqmQuwoBs3jC6TXF2+NZwJ5RHBY5fu4U0NSb43/IIvsKjUrJE3B22j5aJmJzVK
         khgXY87H6dtqyhCtiQcUL9rzalk4bhff2OosPZoXY8cmnPDJ9p8Lnb/hTCneDGmVwlka
         lHEXppPlEyXPc2fRL7wQ/thbZvuAi1+kVyTS37kDSZyJRg56o9pXMkQBiKH6S7D6e+vp
         QUWQ==
X-Gm-Message-State: AOJu0YwlPnTeog1rK5sT6Cg9SCmwvWAnYRyOXT/b8Dgus3a08x8bK4wR
	hUGdJiLzyJFDOX1UXsAQl8ngT1itr5h2T3eX5dMM96MWcgtDh/r0sc18y/vsmkAxL0MM2UQq2nc
	NS9Yo
X-Gm-Gg: AZuq6aK0K8SIcPGEtE1Au0B7yPRmtnHTnW9OMoNSMQknwP8CkXTM+0ZNw9810WmW7yh
	NhTMY6KbW3CrUo7/U2VJNhcng6pQMfjbjZ+8t9k5ohOuIdJAK6KvxmNdViZ1apFCe8R4exsYjeG
	k7UIwWLoRO2/k/PxwkYDFF/U4BVAjjMdF38+UojlMVwHpg8k0flVIzH/bPzq92WNhK5pRFVr2AS
	lBZeG+b6d/MoJZc2YDCZ4vpuRVqJUWPeaRX+/fVEd/u0TC7RZvqMd1nPgl1jtD8DCVsHSAPWYNb
	PladG9VvoC+tIXR5sjNAdwUqBT4mtUOqg2QZS1fRN34KhzT+rOWHx0DyTAauv7fxCAlZ7jl7wBj
	8JqOF3zIefFMQJBonRfR/XaGFGNO2ermsQCwL6cCIomY9BPNnJ5TnZs1MxE2Wxn8GtC6XFP8wW9
	Yns66f+PzZHin6wRUwlcWKfTFL
X-Received: by 2002:a17:902:ce8c:b0:2a7:d5c0:c661 with SMTP id d9443c01a7336-2a870d4cc31mr6152605ad.15.1769490320976;
        Mon, 26 Jan 2026 21:05:20 -0800 (PST)
Received: from MVIN00013.mvista.com ([103.250.136.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802fdd4e8sm104028055ad.99.2026.01.26.21.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 21:05:20 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networking][scarthgap][PATCH] wireshark: fix for CVE-2026-0959
Date: Tue, 27 Jan 2026 10:34:53 +0530
Message-ID: <20260127050453.84586-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 05:05:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123896

Upstream-Status: Backport from https://gitlab.com/wireshark/wireshark/-/commit/4b48ee36f1829d6d3d009bf9871af523ce8e3ace

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../wireshark/files/CVE-2026-0959.patch       | 65 +++++++++++++++++++
 .../wireshark/wireshark_4.2.14.bb             |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2026-0959.patch

diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2026-0959.patch b/meta-networking/recipes-support/wireshark/files/CVE-2026-0959.patch
new file mode 100644
index 0000000000..a7aeb80610
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/CVE-2026-0959.patch
@@ -0,0 +1,65 @@
+From 4b48ee36f1829d6d3d009bf9871af523ce8e3ace Mon Sep 17 00:00:00 2001
+From: John Thacker <johnthacker@gmail.com>
+Date: Sat, 10 Jan 2026 08:33:35 -0500
+Subject: [PATCH] ieee80211: Avoid using a fixed array for multi-link per-STA
+ subelements
+
+Since this processes to the end of the TVB, there might be more than 16.
+Simplify the logic and only test for a set link_id in one place. This
+also gets rid of a possible use of an uninitialized value on error.
+
+Fix #20939, OSS-Fuzz 474458885 
+
+CVE: CVE-2026-0959
+Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/4b48ee36f1829d6d3d009bf9871af523ce8e3ace]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ epan/dissectors/packet-ieee80211.c | 12 ++----------
+ 1 file changed, 2 insertions(+), 10 deletions(-)
+
+diff --git a/epan/dissectors/packet-ieee80211.c b/epan/dissectors/packet-ieee80211.c
+index 0371e21..15e89f7 100644
+--- a/epan/dissectors/packet-ieee80211.c
++++ b/epan/dissectors/packet-ieee80211.c
+@@ -27911,7 +27911,7 @@ dissect_multi_link(tvbuff_t *tvb, packet_info *pinfo _U_, proto_tree *tree,
+   guint8 multi_link_type = multi_link_control & 0x0007;
+   guint16 present = multi_link_control >> 4;
+   int elt = 0, hf_index;
+-  int local_link_ids[16];
++  wmem_strbuf_t *link_id_list = wmem_strbuf_create(pinfo->pool);
+ 
+   control = proto_tree_add_item(tree, hf_ieee80211_eht_multi_link_control, tvb,
+                                 offset, 2, ENC_LITTLE_ENDIAN);
+@@ -28194,9 +28194,6 @@ dissect_multi_link(tvbuff_t *tvb, packet_info *pinfo _U_, proto_tree *tree,
+                                            multi_link_type, &link_id);
+ 
+       offset += overhead; /* Account for the overhead in the subelt */
+-      if (link_id != -1) {
+-        local_link_ids[elt] = link_id;
+-      }
+       break;
+     case 221:
+       /* Add an expert info saying there are none so far? */
+@@ -28207,18 +28204,13 @@ dissect_multi_link(tvbuff_t *tvb, packet_info *pinfo _U_, proto_tree *tree,
+       break;
+     }
+     if (link_id != -1) {
++      wmem_strbuf_append_printf(link_id_list, (elt == 0) ? "%d" : "_%d", link_id);
+       elt++;
+     }
+   }
+   proto_tree_add_uint(tree, hf_index, tvb, 0, 0, elt);
+ 
+   if (elt) {
+-    wmem_strbuf_t *link_id_list = wmem_strbuf_new_sized(pinfo->pool, elt * 2);
+-    for (int i = 0; i < elt; i++) {
+-      if (local_link_ids[i] != -1) {
+-        wmem_strbuf_append_printf(link_id_list, (i == 0) ? "%d" : "_%d", local_link_ids[i]);
+-      }
+-    }
+     proto_tree_add_string(tree, hf_ieee80211_eht_multi_link_link_id_list, tvb,
+                           0, 0, link_id_list->str);
+   }
+-- 
+2.50.1
+
diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.2.14.bb b/meta-networking/recipes-support/wireshark/wireshark_4.2.14.bb
index c313075ea4..d03b86775e 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.2.14.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.2.14.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
            file://0001-UseLemon.cmake-do-not-use-lemon-data-from-the-host.patch \
            file://CVE-2025-9817.patch \
            file://CVE-2025-13499.patch \
+           file://CVE-2026-0959.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src/all-versions"
-- 
2.50.1


