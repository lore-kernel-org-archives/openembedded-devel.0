Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CFFDCA0EE6
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 17:44:54 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.28778.1755193481050545092
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Aug 2025 10:44:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Lj29ei1S;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20250814174437ece86bcc2c94377ed9-wcbe0c@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20250814174437ece86bcc2c94377ed9
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 14 Aug 2025 19:44:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:References:In-Reply-To;
 bh=qAuiPmSwZ6Z9PgsYYKww/GHiuffRMaztzwQQdle5G84=;
 b=Lj29ei1SG3G4zd7CBgBvWyD801cI8i52RWHEhJdNHo4NJkeUWNdit2KsmGbsz3a7dkg8+x
 pNqtYkNx04mZijmiWe4znsT1h2tWD9xQE4sRcr1iu6VuASbKplONlR6Zt5INK9NOmGd/uPYy
 VvCX/lJoPQhSEDs49f+lgCMsxaMVKndAaRuvGYz3N13+TmWY++B7Opndedp+2ryVHkN5ME5p
 4W6AN3mOd/drzqo/QlJNHx0YWKlBzCluq0sWUzMPN1ocF2XybmLo5bOLzJaFO33fu/tqa4bK
 68p3aiu+cbpFbAagIIXBct0/5vL4HfBVoF/k+/ZB7M3TVGpRvykrs0+g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][walnascar][PATCH 3/5] corosync: patch CVE-2025-30472
Date: Thu, 14 Aug 2025 19:43:50 +0200
Message-Id: <20250814174352.10670-3-peter.marko@siemens.com>
In-Reply-To: <20250814174352.10670-1-peter.marko@siemens.com>
References: <20250814174352.10670-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Aug 2025 17:44:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118940

From: Peter Marko <peter.marko@siemens.com>

Pick commit from [1] mentioned in [2] from [3]

[1] https://github.com/corosync/corosync/issues/778
[2] https://github.com/corosync/corosync/pull/779
[3] https://nvd.nist.gov/vuln/detail/CVE-2025-30472

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../corosync/corosync/CVE-2025-30472.patch    | 69 +++++++++++++++++++
 .../corosync/corosync_3.1.9.bb                |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta-networking/recipes-extended/corosync/corosync/CVE-2025-30472.patch

diff --git a/meta-networking/recipes-extended/corosync/corosync/CVE-2025-30472.patch b/meta-networking/recipes-extended/corosync/corosync/CVE-2025-30472.patch
new file mode 100644
index 0000000000..9b36dbe3fb
--- /dev/null
+++ b/meta-networking/recipes-extended/corosync/corosync/CVE-2025-30472.patch
@@ -0,0 +1,69 @@
+From 7839990f9cdf34e55435ed90109e82709032466a Mon Sep 17 00:00:00 2001
+From: Jan Friesse <jfriesse@redhat.com>
+Date: Mon, 24 Mar 2025 12:05:08 +0100
+Subject: [PATCH] totemsrp: Check size of orf_token msg
+
+orf_token message is stored into preallocated array on endian convert
+so carefully crafted malicious message can lead to crash of corosync.
+
+Solution is to check message size beforehand.
+
+Signed-off-by: Jan Friesse <jfriesse@redhat.com>
+Reviewed-by: Christine Caulfield <ccaulfie@redhat.com>
+
+CVE: CVE-2025-30472
+Upstream-Status: Backport [https://github.com/corosync/corosync/commits/7839990f9cdf34e55435ed90109e82709032466a]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ exec/totemsrp.c | 18 +++++++++++++++++-
+ 1 file changed, 17 insertions(+), 1 deletion(-)
+
+diff --git a/exec/totemsrp.c b/exec/totemsrp.c
+index 962d0e2a..364528ce 100644
+--- a/exec/totemsrp.c
++++ b/exec/totemsrp.c
+@@ -3679,12 +3679,20 @@ static int check_orf_token_sanity(
+ 	const struct totemsrp_instance *instance,
+ 	const void *msg,
+ 	size_t msg_len,
++	size_t max_msg_len,
+ 	int endian_conversion_needed)
+ {
+ 	int rtr_entries;
+ 	const struct orf_token *token = (const struct orf_token *)msg;
+ 	size_t required_len;
+ 
++	if (msg_len > max_msg_len) {
++		log_printf (instance->totemsrp_log_level_security,
++		    "Received orf_token message is too long...  ignoring.");
++
++		return (-1);
++	}
++
+ 	if (msg_len < sizeof(struct orf_token)) {
+ 		log_printf (instance->totemsrp_log_level_security,
+ 		    "Received orf_token message is too short...  ignoring.");
+@@ -3698,6 +3706,13 @@ static int check_orf_token_sanity(
+ 		rtr_entries = token->rtr_list_entries;
+ 	}
+ 
++	if (rtr_entries > RETRANSMIT_ENTRIES_MAX) {
++		log_printf (instance->totemsrp_log_level_security,
++		    "Received orf_token message rtr_entries is corrupted...  ignoring.");
++
++		return (-1);
++	}
++
+ 	required_len = sizeof(struct orf_token) + rtr_entries * sizeof(struct rtr_item);
+ 	if (msg_len < required_len) {
+ 		log_printf (instance->totemsrp_log_level_security,
+@@ -3868,7 +3883,8 @@ static int message_handler_orf_token (
+ 	    "Time since last token %0.4f ms", tv_diff / (float)QB_TIME_NS_IN_MSEC);
+ #endif
+ 
+-	if (check_orf_token_sanity(instance, msg, msg_len, endian_conversion_needed) == -1) {
++	if (check_orf_token_sanity(instance, msg, msg_len, sizeof(token_storage),
++	    endian_conversion_needed) == -1) {
+ 		return (0);
+ 	}
+ 
diff --git a/meta-networking/recipes-extended/corosync/corosync_3.1.9.bb b/meta-networking/recipes-extended/corosync/corosync_3.1.9.bb
index af023307bb..1699701c9d 100644
--- a/meta-networking/recipes-extended/corosync/corosync_3.1.9.bb
+++ b/meta-networking/recipes-extended/corosync/corosync_3.1.9.bb
@@ -9,6 +9,7 @@ inherit autotools pkgconfig systemd github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://corosync.conf \
+           file://CVE-2025-30472.patch \
           "
 SRC_URI[sha256sum] = "203354bbddee1a97b3c50a076eae89c635f406dd674ccaefc94bb9092acd9535"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"

