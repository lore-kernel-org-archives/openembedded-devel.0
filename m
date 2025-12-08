Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06FB1D3B7EA
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 19:00:18 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.544.1765220410303626554
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Dec 2025 11:00:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BDqH2Cm5;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-29ba9249e9dso66928225ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Dec 2025 11:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765220409; x=1765825209; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kJVg9oLfN+/XlZoe5polYxkLOi240neUHWivA4PWvrI=;
        b=BDqH2Cm5/RkVMYL0R2xt61RxbIXbLqssTH4Cs9CkN1dc4cP2pVg39IIKrUMRcBgjAe
         mjoExyl0bRwd2Os7+vuQpadfcJjnVhEwUkEt+7URmGAvoIywyF4xuBzz8MHnJlvhRYu3
         EBR90XigIIXhvrhVT7oJiCI4vWF3jGCOKEcqd/JeVUUmDm9dGWrb158PGjDeGdL0ivbP
         q01ckYURAQGWpZVvcO8yQazBqQama+m1+JMXoHmiNJzLZ2/7c7V4sAWah/amyLURGNAM
         1ctT8zZqwL0maUvR2nCjuinR3x8uIMWOamK0ajF9hzxY5djWB6QHBIYKIPYLkUc38WBI
         4mbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765220409; x=1765825209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJVg9oLfN+/XlZoe5polYxkLOi240neUHWivA4PWvrI=;
        b=n5/JGkjWac3VSS9uf27lJKWurrIQnQ8Ux7d9MRXpQSoSxnUGh//JMrBekVPnreZSfO
         5bGyF7AJiN/KB6J6yzzrF5siUyvYaZHC0GXmLESA8m2d8zytnghzDq2Nqm0ZjTZ/OBvS
         NlZSt+hyPr+PY7mUSfF9563+PLk/tfY9VbGoGgRTQgGwUnzt2XIhaDsLl2b/u27yShFg
         u+28wDv8/euddF695shzoDZgdZLCKyQlAyz5Qjo/X6cv0C4sDjVDRgKVCkSLXaD4HPLL
         L1TXEmKoewwwmfm7CHE0Sa/pSBZ/DRHcEphmBQS1z0Up9rCY7DVaTrYbzu/pcvlRVMKi
         WqlQ==
X-Gm-Message-State: AOJu0YwIwj29vTqXoBVdaPks6Asao6TtBillyh2aw7gzdNINrKurmWgH
	undy/PbTH3y2BeUepx4Tayq/XTTflF5TfwzObhY4nRoT5aN+9mv+OH801Du84w==
X-Gm-Gg: ASbGncvO6IpM+mhMXJMzvfBinaVLpD7+Bfe7ZRITtqgluapR5Wf1ZJgXG76Suko8gO+
	82ySzCFiH46ISuA2K2ij4GmKl/b003CcGJF3K0zsmR/hk/R8wXL7wnk5A3/4i7sDGFrlluV5fug
	YMVUKgQYfkJTXv+grNsx/L5R4lEtW5mP9Oe1ibfjzdHopxUv/6SypgZS8oRDuA3rlLczxHHiAmD
	oU/+mfTHLltLjINvKcQujoBeo7osmRk2t3X0KTR4Q3pIuBqGuVPRcummjAYsLM8OJX0W5pE/bZE
	8eXmLXu5gA9eFF4nt/+MSCB+dedgTOzkQ+aHRv7svbhwGv4IKhoVTW9hGtB+Sv22i/YDSJvO3Hf
	CySHN3+CF/UMqICPPCGDAtcxPVw1G2EXH6L3OmdN9cCZG23B78OHtF+7qVGslW+ANVxknalnm/s
	MqYuh6oVy5Dikphs9DvXQBBui5
X-Google-Smtp-Source: AGHT+IFcXSd2lFP1hjefHIlLCM9D6ERcvTrc5T5rEzY6W4Y5b8dqHKvA0gG6aNctIuMxTzJFMYa7LQ==
X-Received: by 2002:a17:903:3b87:b0:295:888e:9fff with SMTP id d9443c01a7336-29df568427fmr63045925ad.20.1765220409260;
        Mon, 08 Dec 2025 11:00:09 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.250.253])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae49c46csm135351415ad.18.2025.12.08.11.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 11:00:07 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 1/2] corosync: upgrade 3.1.9 -> 3.1.10
Date: Tue,  9 Dec 2025 08:00:00 +1300
Message-ID: <20251208190000.3119070-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Dec 2025 19:00:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122385

From: Wang Mingyu <wangmy@fujitsu.com>

CVE-2025-30472.patch
removed since it's included in 3.1.10

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 7915bcecf5b25eb525c5700fc4196422596b5a38)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../corosync/corosync/CVE-2025-30472.patch    | 69 -------------------
 .../{corosync_3.1.9.bb => corosync_3.1.10.bb} |  5 +-
 2 files changed, 2 insertions(+), 72 deletions(-)
 delete mode 100644 meta-networking/recipes-extended/corosync/corosync/CVE-2025-30472.patch
 rename meta-networking/recipes-extended/corosync/{corosync_3.1.9.bb => corosync_3.1.10.bb} (94%)

diff --git a/meta-networking/recipes-extended/corosync/corosync/CVE-2025-30472.patch b/meta-networking/recipes-extended/corosync/corosync/CVE-2025-30472.patch
deleted file mode 100644
index 9b36dbe3fb..0000000000
--- a/meta-networking/recipes-extended/corosync/corosync/CVE-2025-30472.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 7839990f9cdf34e55435ed90109e82709032466a Mon Sep 17 00:00:00 2001
-From: Jan Friesse <jfriesse@redhat.com>
-Date: Mon, 24 Mar 2025 12:05:08 +0100
-Subject: [PATCH] totemsrp: Check size of orf_token msg
-
-orf_token message is stored into preallocated array on endian convert
-so carefully crafted malicious message can lead to crash of corosync.
-
-Solution is to check message size beforehand.
-
-Signed-off-by: Jan Friesse <jfriesse@redhat.com>
-Reviewed-by: Christine Caulfield <ccaulfie@redhat.com>
-
-CVE: CVE-2025-30472
-Upstream-Status: Backport [https://github.com/corosync/corosync/commits/7839990f9cdf34e55435ed90109e82709032466a]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- exec/totemsrp.c | 18 +++++++++++++++++-
- 1 file changed, 17 insertions(+), 1 deletion(-)
-
-diff --git a/exec/totemsrp.c b/exec/totemsrp.c
-index 962d0e2a..364528ce 100644
---- a/exec/totemsrp.c
-+++ b/exec/totemsrp.c
-@@ -3679,12 +3679,20 @@ static int check_orf_token_sanity(
- 	const struct totemsrp_instance *instance,
- 	const void *msg,
- 	size_t msg_len,
-+	size_t max_msg_len,
- 	int endian_conversion_needed)
- {
- 	int rtr_entries;
- 	const struct orf_token *token = (const struct orf_token *)msg;
- 	size_t required_len;
- 
-+	if (msg_len > max_msg_len) {
-+		log_printf (instance->totemsrp_log_level_security,
-+		    "Received orf_token message is too long...  ignoring.");
-+
-+		return (-1);
-+	}
-+
- 	if (msg_len < sizeof(struct orf_token)) {
- 		log_printf (instance->totemsrp_log_level_security,
- 		    "Received orf_token message is too short...  ignoring.");
-@@ -3698,6 +3706,13 @@ static int check_orf_token_sanity(
- 		rtr_entries = token->rtr_list_entries;
- 	}
- 
-+	if (rtr_entries > RETRANSMIT_ENTRIES_MAX) {
-+		log_printf (instance->totemsrp_log_level_security,
-+		    "Received orf_token message rtr_entries is corrupted...  ignoring.");
-+
-+		return (-1);
-+	}
-+
- 	required_len = sizeof(struct orf_token) + rtr_entries * sizeof(struct rtr_item);
- 	if (msg_len < required_len) {
- 		log_printf (instance->totemsrp_log_level_security,
-@@ -3868,7 +3883,8 @@ static int message_handler_orf_token (
- 	    "Time since last token %0.4f ms", tv_diff / (float)QB_TIME_NS_IN_MSEC);
- #endif
- 
--	if (check_orf_token_sanity(instance, msg, msg_len, endian_conversion_needed) == -1) {
-+	if (check_orf_token_sanity(instance, msg, msg_len, sizeof(token_storage),
-+	    endian_conversion_needed) == -1) {
- 		return (0);
- 	}
- 
diff --git a/meta-networking/recipes-extended/corosync/corosync_3.1.9.bb b/meta-networking/recipes-extended/corosync/corosync_3.1.10.bb
similarity index 94%
rename from meta-networking/recipes-extended/corosync/corosync_3.1.9.bb
rename to meta-networking/recipes-extended/corosync/corosync_3.1.10.bb
index cd9feb5da5..0cb475a4d4 100644
--- a/meta-networking/recipes-extended/corosync/corosync_3.1.9.bb
+++ b/meta-networking/recipes-extended/corosync/corosync_3.1.10.bb
@@ -9,9 +9,8 @@ inherit autotools pkgconfig systemd github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://corosync.conf \
-           file://CVE-2025-30472.patch \
-          "
-SRC_URI[sha256sum] = "203354bbddee1a97b3c50a076eae89c635f406dd674ccaefc94bb9092acd9535"
+           "
+SRC_URI[sha256sum] = "be361c827f99b215b3bd3fa2fb071c03dac6831c2a351963d938caef62604bc8"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 LICENSE = "BSD-3-Clause"

