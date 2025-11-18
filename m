Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91144CEBF93
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 09:08:58 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8398.1763456933743506859
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 01:08:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KgmJsqK6;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1763456934; x=1794992934;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7rpGinw1NsaB1HTVwOfnwLI91PRfUxdgiVunytwBI7w=;
  b=KgmJsqK6/jbmAxexwmJsXEL3dOhVF+LfwSWdRvWq5LollLTIktonWce3
   wertXxBjle91xKbV2ow9GHZZ+2ndexQxMhAskzjDTFbPEfxiAnJLeqHil
   +g3+ehZD+HS4TvSBD2e+Tb28mwvFAW+Bgsza41f6fQrTfby0oyuxtQgWJ
   QTJ4iVdMlPh2lHVlIIq2VqJsOZDea2AYa0f0pFCi9AEsuXd8h2d6E7I9a
   /txvjK2/XqmikDSRRLwqn0PIL3yp9KwTUEmJgM5WbhtOuDWGX9d7AVrEV
   TF7KZVmxOCqAg2RIr8X+PBC8zdaaMduwU+IWLT5uRxxp2PtlD8+JfWdiE
   Q==;
X-CSE-ConnectionGUID: OMW+UlJFSlCTgHFlwTWnlw==
X-CSE-MsgGUID: wjIeAYSrRvuGC1xkmw7q4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="219608301"
X-IronPort-AV: E=Sophos;i="6.19,314,1754924400"; 
   d="scan'208";a="219608301"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 18:08:53 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id E399B1002BB2
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:08:51 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 9F12E18000D6
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:08:51 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 3EF21140024E;
	Tue, 18 Nov 2025 09:08:48 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 01/29] corosync: upgrade 3.1.9 -> 3.1.10
Date: Tue, 18 Nov 2025 17:08:18 +0800
Message-ID: <20251118090846.1484-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:08:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121812

From: Wang Mingyu <wangmy@fujitsu.com>

CVE-2025-30472.patch
removed since it's included in 3.1.10

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
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
index 1699701c9d..07d9333ec8 100644
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
-- 
2.43.0


