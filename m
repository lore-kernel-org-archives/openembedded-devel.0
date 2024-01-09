Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80ED4C47073
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 05:58:18 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.11133.1704779889355383392
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 21:58:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=LomeTts/;
 spf=pass (domain: mvista.com, ip: 209.85.214.172, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1d50d0c98c3so15629185ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 21:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1704779888; x=1705384688; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PKVKwZ1t99/E+ImWX8W9ZnMNBpeE+/vpoRHMp8Uy5Z8=;
        b=LomeTts/qZHuWmIkahXG3z00lLvwTDzmA5NXmyrZHSLK9SU09zQT8zLzfmdGsSYugS
         VETVaqExwjj6sJlm5RvvX+iMh/b8pKVQXwcvnyZwYe4SxbgWGjnfBPJ2GTW8JF4RbGdv
         wAHymH61eENUJePhrZLdCTp9pC3QOYdkl5fw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704779888; x=1705384688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PKVKwZ1t99/E+ImWX8W9ZnMNBpeE+/vpoRHMp8Uy5Z8=;
        b=WyZ2hOub/KlLkHsIZUxTo8eHJEikvdD4e+UI28GEoqrtF9GqUOb3CkaLMBqEVVnOJZ
         ZvDTVYX9pjiSbV3vHYwnN9aT7jTzUD0wGHrgE5BeRfEwX61SEg6gATO7eOeOfMxXoTB9
         1qdTiCZw7HfyWOz76V7cAfpVTEc7K6T9IvC4dZbQbTQkxQfcXGZyAQCKKWRBYXFvvCqn
         tzpMahdv7bfY5CZK+7KJmKcvXKu6gkQoNtWvq0hAh28NjRSGTl3LQyAVE6WUfEbPw7n4
         bTzzdf/7fnUKzLE0UMlj26DDR79tqERD50vd/KsoyivtV8lNTT1jwRdwZogS5iCkZVrA
         HAug==
X-Gm-Message-State: AOJu0YyVXLww3/FpyrTHFP+OZTyn3U8ErY9SAXyy50sRCHve7jeGx/kE
	l2wdZT6Vm7JkuLz0D6ryzAoVr4lB4CZNTCH1qqpbmp2mYGI=
X-Google-Smtp-Source: AGHT+IGeFCaEovIdONNjK5aL1M+jotThbd71x+n+Rd4UOpBi5gEV8EHPS62VS32C2zT9Bx54a2T2Ww==
X-Received: by 2002:a17:903:2344:b0:1d3:8bf1:9add with SMTP id c4-20020a170903234400b001d38bf19addmr337799plh.36.1704779888548;
        Mon, 08 Jan 2024 21:58:08 -0800 (PST)
Received: from MVIN00016.mvista.com ([150.129.170.233])
        by smtp.gmail.com with ESMTPSA id bd8-20020a170902830800b001d3dacffde3sm845490plb.226.2024.01.08.21.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 21:58:08 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networking][kirkstone][PATCH] wireshark: fix CVE-2024-0208 GVCP dissector crash
Date: Tue,  9 Jan 2024 11:28:01 +0530
Message-Id: <20240109055801.248571-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jan 2024 05:58:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108183

Upstream-Status: Backport from https://gitlab.com/wireshark/wireshark/-/commit/a8586fde3a6512466afb2a660538ef3fe712076b

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../wireshark/files/CVE-2024-0208.patch       | 42 +++++++++++++++++++
 .../wireshark/wireshark_3.4.12.bb             |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2024-0208.patch

diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2024-0208.patch b/meta-networking/recipes-support/wireshark/files/CVE-2024-0208.patch
new file mode 100644
index 0000000000..4c9f8d29c0
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/CVE-2024-0208.patch
@@ -0,0 +1,42 @@
+From a8586fde3a6512466afb2a660538ef3fe712076b Mon Sep 17 00:00:00 2001
+From: John Thacker <johnthacker@gmail.com>
+Date: Thu, 23 Nov 2023 13:47:51 -0500
+Subject: [PATCH] gvcp: Don't try to add a NULL string to a column
+
+This was caught as an invalid argument by g_strlcpy before 4.2,
+but it was never a good idea.
+
+Fix #19496
+
+Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/a8586fde3a6512466afb2a660538ef3fe712076b]
+CVE: CVE-2024-0208
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ epan/dissectors/packet-gvcp.c | 7 ++-----
+ 1 file changed, 2 insertions(+), 5 deletions(-)
+
+diff --git a/epan/dissectors/packet-gvcp.c b/epan/dissectors/packet-gvcp.c
+index 6a17cff..eb849c0 100644
+--- a/epan/dissectors/packet-gvcp.c
++++ b/epan/dissectors/packet-gvcp.c
+@@ -2222,15 +2222,12 @@ static void dissect_readreg_ack(proto_tree *gvcp_telegram_tree, tvbuff_t *tvb, p
+ 			if (addr_list_size > 0)
+ 			{
+ 				address_string = get_register_name_from_address(*((guint32*)wmem_array_index(gvcp_trans->addr_list, 0)), gvcp_info, &is_custom_register);
++				col_append_str(pinfo->cinfo, COL_INFO, address_string);
+ 			}
+ 
+ 			if (num_registers)
+ 			{
+-				col_append_fstr(pinfo->cinfo, COL_INFO, "%s Value=0x%08X", address_string, tvb_get_ntohl(tvb, offset));
+-			}
+-			else
+-			{
+-				col_append_str(pinfo->cinfo, COL_INFO, address_string);
++				col_append_sep_fstr(pinfo->cinfo, COL_INFO, " ", "Value=0x%08X", tvb_get_ntohl(tvb, offset));
+ 			}
+ 		}
+ 	}
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb b/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
index 365ec5e90a..f5e316d9dc 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
@@ -27,6 +27,7 @@ SRC_URI += " \
     file://CVE-2023-2906.patch \
     file://CVE-2023-1992.patch \
     file://CVE-2022-4345.patch \
+    file://CVE-2024-0208.patch \
 "
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
-- 
2.25.1


