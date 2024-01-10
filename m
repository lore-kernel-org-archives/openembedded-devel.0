Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF605C3DA6E
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 05:11:05 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.5669.1704863464073457770
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jan 2024 21:11:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=PzS29zhg;
 spf=pass (domain: mvista.com, ip: 209.85.210.169, mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6d9bec20980so1964365b3a.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jan 2024 21:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1704863463; x=1705468263; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BlZ+EMzNEqxcSt22uSioSjRv7kQq+cCYIl+sGw+kjx4=;
        b=PzS29zhgLPyRzILWSTKWC4oL7g9H2NkvOtbTJiuPww4hmwfheIJLT1nr+9WcOwKBOU
         D1z0IoeH/E8Jy5rN4bK+QOhgPOLsq8RYfnLe+rbXRSD61+giWGX72ZlINgMntZ7goaPQ
         rKb/U0yhEp/4GLZJoAYbs4Z5ud9hdkwOVBl6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704863463; x=1705468263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BlZ+EMzNEqxcSt22uSioSjRv7kQq+cCYIl+sGw+kjx4=;
        b=DzfTK28On4p23dOxyS8Y3LB2jwOWyzlgXT2w5k0w/jXNajawlvC6Q0oMXR5mfs+Iab
         W8P7EBq1Rahr8fnxgPGge6zkwXbLgDzWMFuf3sOvldZ8Yo0sJAJEqjSPRGuLjkgyweKH
         4pnxzMrXMOhwGzD7B02oYrWthe6J6J+FCp1vStSnv8eTDuILnyDd4abjk6f4tj++oOMT
         AztB8atJarmhhY+00e2+alH3CZ16r6MjnwAUo6qjkyJ7e0lQ1T4AO3trSIn/U+30T7DI
         Er2NQh80ytOYC8UySBRCUzJoFECsUc6/PLMwpCimtROb2I6KuPXHsqKYBAnTnsg/HBk4
         qsXg==
X-Gm-Message-State: AOJu0YxqLMVXs0pCAPO+YHaARcWFMCr92nyVznhxK9Dr+tYk3ZPTEWKf
	pxbw/I3K9gbGlse2R/aeVEFVfIqab4hOlQHJv5bBKQqOjDo=
X-Google-Smtp-Source: AGHT+IGo/BzQfB5bV9WFsJf3LJKT2BvnLE9wctN71XdcYezhtt+VO8H5pXFa0zof+pU3lE7HWAypgQ==
X-Received: by 2002:a05:6a20:1456:b0:199:d824:bb7c with SMTP id a22-20020a056a20145600b00199d824bb7cmr278870pzi.51.1704863463217;
        Tue, 09 Jan 2024 21:11:03 -0800 (PST)
Received: from MVIN00016.mvista.com ([103.250.136.151])
        by smtp.gmail.com with ESMTPSA id y18-20020a1709027c9200b001d563e22dc0sm93867pll.1.2024.01.09.21.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 21:11:02 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networking][dunfell][PATCH] wireshark: fix CVE-2024-0208 GVCP dissector crash
Date: Wed, 10 Jan 2024 10:40:57 +0530
Message-Id: <20240110051057.33452-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jan 2024 05:11:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108206

Upstream-Status: Backport from https://gitlab.com/wireshark/wireshark/-/commit/a8586fde3a6512466afb2a660538ef3fe712076b

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../wireshark/files/CVE-2024-0208.patch       | 42 +++++++++++++++++++
 .../wireshark/wireshark_3.2.18.bb             |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2024-0208.patch

diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2024-0208.patch b/meta-networking/recipes-support/wireshark/files/CVE-2024-0208.patch
new file mode 100644
index 0000000000..c4dfb6c37d
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
+index 2de4552..b94ddea 100644
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
diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb b/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
index 7d99a1438b..b36a0acbfb 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
@@ -21,6 +21,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
            file://CVE-2023-3649.patch \
            file://CVE-2022-0585-CVE-2023-2879.patch \
            file://CVE-2022-4345.patch \
+           file://CVE-2024-0208.patch \
            "
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-- 
2.25.1


