Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25997D5C0C0
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 07:15:53 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16741.1765869350831360642
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Dec 2025 23:15:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d7uVoaCP;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7aab7623f42so5084530b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Dec 2025 23:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765869350; x=1766474150; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fmed4X2LNu1MMBfrzSeV+sH7FcME7Z+/WyYCyXuSoFE=;
        b=d7uVoaCPhy4Mu2Mfqq8JR5wfSi7koZI8nJzVWwAQ038U5bxISrfvKdZciXKeqnaiLn
         +ZJS+XsshNBiE9Oq9LWoANK7NiBSdOK5qHMfFeMICR4PajTe+gNCKbW78gNcG7vIv96P
         aZTvOy0mhkhEjDVIUQxvQe3kPIxTsH9bA8IetzzcjeyJFpO3cH2VR5ppy26HKvoJspyQ
         O4Q3gR7gGxjPJ0T0eZRLnydtBhTqcEAHjxLYoiIcITy9HN/rA762yz3RuayqFsKWgKZo
         CrjWvUpfzZ6jUezLGvUjMi8HAr9c8hLB9TNMHAtfCi6sjuVxUsG0vIIHa1tf//v6AfSZ
         PFJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765869350; x=1766474150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fmed4X2LNu1MMBfrzSeV+sH7FcME7Z+/WyYCyXuSoFE=;
        b=CxJY7RVFbgqPj/lXp8msUTnl2AYutMhqDS4HZa1/G8hGe72VXZAtxjirv6w/15Efdn
         4BfTxcg7hl+oj6O3NFXE0h1F/sX4Qc2aQxmdPNK7Nk3IzJXebnMPkPqxDVjjHr93AH9h
         ZPLRuLzX9ygNmmehWF1cik0dxNYXAG1fr472gOe3D/QZJB9LBC+SlFvtDwXWcKOjgTW7
         ucB8QGZEXMNn1jnkXmsppvj2jXYhyDTPuxZlMm2Bo0FtcPP1UDAEBn2ETpNYfGNvMvTp
         VxoeFmefMURUJtMbSF5IbvO35jJzq4psxWGzhGOxUu2tiyUAmGCSU5SnvhcRSdNmmqEk
         2CiQ==
X-Gm-Message-State: AOJu0YwzjZQ9ovfqDoNZJeCFumtyUvrZSIUPuNQs2xv6mhH84qxYFiqq
	oKQcunycStZL8M+jCnX+G7U+LbQLOawuJ0LqOMSJCjr/gSwGdp6oxoTGHvWEfg==
X-Gm-Gg: AY/fxX54dYvDzZmpLpJ+QHx/917iBw2qvuZ86zE9iI7ghev9j38R+ypTRP1WL6WUOWh
	omA+SptMhkuL/e/uxrbwY0zGv0tl5bZ/8mkaIZlkz4HNjjPPqSvQFfApmBIfjPXYD8vrthZYlZk
	gHMdIW1n3diHBsXWnMNTLRmEevjgNk5Bz9pg4TOnQgIAOfgOYAPC05dFxohamoJWDwqlKqNAR7x
	tf+2uf3Z/HA1sIq02g9rDLqKdleZY/WtG+3iy0ssOo86XGFOMex+ITZlB2FtEAoGL1aG6GVgb1y
	uFsgDKiPxz4CRTT0ZRsqZE8CJz00GjhlHDTcGrOlH7hC/nTrrSB0m3f6jyHGlMOsKlmJG/j2Pp1
	/yysMI9w5/Noqn1n1l3zusD8iNvoqxr8g7s4gY/imecEi6ptE/BjtGxrCNGzPn0mL3J7iiGx8fa
	Tuw76pShZHzE5/5qBDx2A/vtRjQoqf39RXpBE=
X-Google-Smtp-Source: AGHT+IGcr/IFgtkxt5fGI/1buhxEID/P7i8Dp5XL/FwEvPq6NMI4h/xA5Bcp4AHt237UvvKeY40iUQ==
X-Received: by 2002:a05:6a00:3311:b0:7e8:4433:8fa8 with SMTP id d2e1a72fcca58-7f669a9369amr12282556b3a.48.1765869349968;
        Mon, 15 Dec 2025 23:15:49 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.223])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c2d48514sm14471448b3a.30.2025.12.15.23.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 23:15:49 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 4/6] unbound: patch CVE-2024-43168
Date: Tue, 16 Dec 2025 12:45:35 +0530
Message-ID: <20251216071537.3174578-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216071537.3174578-1-ankur.tyagi85@gmail.com>
References: <20251216071537.3174578-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 07:15:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122683

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details https://nvd.nist.gov/vuln/detail/CVE-2024-43168

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../unbound/unbound/CVE-2024-43168_1.patch    | 29 ++++++++++
 .../unbound/unbound/CVE-2024-43168_2.patch    | 57 +++++++++++++++++++
 .../recipes-support/unbound/unbound_1.19.3.bb |  2 +
 3 files changed, 88 insertions(+)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2024-43168_1.patch
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2024-43168_2.patch

diff --git a/meta-networking/recipes-support/unbound/unbound/CVE-2024-43168_1.patch b/meta-networking/recipes-support/unbound/unbound/CVE-2024-43168_1.patch
new file mode 100644
index 0000000000..27bb01e596
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/CVE-2024-43168_1.patch
@@ -0,0 +1,29 @@
+From ae1788088e0db0d7a31e9ef4edced212395089c1 Mon Sep 17 00:00:00 2001
+From: zhailiangliang <zhailiangliang@loongson.cn>
+Date: Wed, 3 Apr 2024 15:40:58 +0800
+Subject: [PATCH] fix heap-buffer-overflow issue in function cfg_mark_ports of
+ file util/config_file.c
+
+CVE: CVE-2024-43168
+Upstream-Status: Backport [https://github.com/NLnetLabs/unbound/commit/193401e7543a1e561dd634a3eaae932fa462a2b9]
+(cherry picked from commit 193401e7543a1e561dd634a3eaae932fa462a2b9)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ util/config_file.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/util/config_file.c b/util/config_file.c
+index 147f41e8..724b174c 100644
+--- a/util/config_file.c
++++ b/util/config_file.c
+@@ -1776,6 +1776,10 @@ cfg_mark_ports(const char* str, int allow, int* avail, int num)
+ #endif
+ 	if(!mid) {
+ 		int port = atoi(str);
++		if(port < 0) {
++			log_err("Prevent out-of-bounds access to array avail");
++			return 0;
++		}
+ 		if(port == 0 && strcmp(str, "0") != 0) {
+ 			log_err("cannot parse port number '%s'", str);
+ 			return 0;
diff --git a/meta-networking/recipes-support/unbound/unbound/CVE-2024-43168_2.patch b/meta-networking/recipes-support/unbound/unbound/CVE-2024-43168_2.patch
new file mode 100644
index 0000000000..a85200a8c2
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/CVE-2024-43168_2.patch
@@ -0,0 +1,57 @@
+From c9c49b5f3244bde6f4300fc19e56d5944fb25c0c Mon Sep 17 00:00:00 2001
+From: "W.C.A. Wijngaards" <wouter@nlnetlabs.nl>
+Date: Wed, 3 Apr 2024 10:16:18 +0200
+Subject: [PATCH] - For #1040: adjust error text and disallow negative ports in
+ other   parts of cfg_mark_ports.
+
+CVE: CVE-2024-43168
+Upstream-Status: Backport [https://github.com/NLnetLabs/unbound/commit/dfff8d23cf4145c58e5c1e99d4159d3a91a70ab7]
+(cherry picked from commit dfff8d23cf4145c58e5c1e99d4159d3a91a70ab7)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ util/config_file.c | 14 +++++++++++++-
+ 1 file changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/util/config_file.c b/util/config_file.c
+index 724b174c..c403d745 100644
+--- a/util/config_file.c
++++ b/util/config_file.c
+@@ -1777,7 +1777,7 @@ cfg_mark_ports(const char* str, int allow, int* avail, int num)
+ 	if(!mid) {
+ 		int port = atoi(str);
+ 		if(port < 0) {
+-			log_err("Prevent out-of-bounds access to array avail");
++			log_err("port number is negative: %d", port);
+ 			return 0;
+ 		}
+ 		if(port == 0 && strcmp(str, "0") != 0) {
+@@ -1789,6 +1789,10 @@ cfg_mark_ports(const char* str, int allow, int* avail, int num)
+ 	} else {
+ 		int i, low, high = atoi(mid+1);
+ 		char buf[16];
++		if(high < 0) {
++			log_err("port number is negative: %d", high);
++			return 0;
++		}
+ 		if(high == 0 && strcmp(mid+1, "0") != 0) {
+ 			log_err("cannot parse port number '%s'", mid+1);
+ 			return 0;
+@@ -1801,10 +1805,18 @@ cfg_mark_ports(const char* str, int allow, int* avail, int num)
+ 			memcpy(buf, str, (size_t)(mid-str));
+ 		buf[mid-str] = 0;
+ 		low = atoi(buf);
++		if(low < 0) {
++			log_err("port number is negative: %d", low);
++			return 0;
++		}
+ 		if(low == 0 && strcmp(buf, "0") != 0) {
+ 			log_err("cannot parse port number '%s'", buf);
+ 			return 0;
+ 		}
++		if(high > num) {
++			/* Stop very high values from taking a long time. */
++			high = num;
++		}
+ 		for(i=low; i<=high; i++) {
+ 			if(i < num)
+ 				avail[i] = (allow?i:0);
diff --git a/meta-networking/recipes-support/unbound/unbound_1.19.3.bb b/meta-networking/recipes-support/unbound/unbound_1.19.3.bb
index 9a537c2dc2..076f03f2ae 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.19.3.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.19.3.bb
@@ -14,6 +14,8 @@ SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;nobranch=1 \
            file://CVE-2024-33655.patch \
            file://CVE-2025-11411.patch \
            file://CVE-2024-43167.patch \
+           file://CVE-2024-43168_1.patch \
+           file://CVE-2024-43168_2.patch \
            "
 SRCREV = "48b6c60a24e9a5d6d369a7a37c9fe2a767f26abd"
 

