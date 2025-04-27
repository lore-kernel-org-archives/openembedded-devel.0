Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E7BC369D1
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 21:30:32 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.34229.1745789410042816540
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Apr 2025 14:30:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=DPI1PSUL;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20250427213007fe47440a4cf7b8dbc1-2us4t1@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20250427213007fe47440a4cf7b8dbc1
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 27 Apr 2025 23:30:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Fc8uYxZ0t1Xo6PS191iKNZUpmsqUIGB/YReKRtgSoPw=;
 b=DPI1PSULMHcgdRP120jNah2OPMtqAu72X5XPMwel78zUDS/LpP1+QLN5GqiTnUzbvcDq0R
 vNR0FF4PRBWP0r7lBe/n72n2q9wPNJ4AL8K3QGTap6CwjSgu3tgRrnNwSbje7EkbfZTb+5L2
 M+dFeHKkizBYcNl78VVS4+OMFi6ST7Gs4wWs2VmGvE9JooU9GgZHun+uSRWxhdP54m0A7Y91
 CIwmmF3EVKqVUdnKRLD0i8g3BjW85Jb02ZQlYPJaZcB8kHzkvyYjfJigZ7QBKuOGO6Xab18v
 gWBq83nMQfI6/2EPqN0wcG8LmbiTkY6eNtJEmTVPQo8WzoFW8IbLdfVw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][PATCH 3/3] corosync: patch CVE-2025-30472
Date: Sun, 27 Apr 2025 23:28:44 +0200
Message-Id: <20250427212844.1992660-3-peter.marko@siemens.com>
In-Reply-To: <20250427212844.1992660-1-peter.marko@siemens.com>
References: <20250427212844.1992660-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Apr 2025 21:30:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117180

From: Peter Marko <peter.marko@siemens.com>

Pick commit from [1] mentioned in [2] from [3]

[1] https://github.com/corosync/corosync/issues/778
[2] https://github.com/corosync/corosync/pull/779
[3] https://nvd.nist.gov/vuln/detail/CVE-2025-30472

Signed-off-by: Peter Marko <peter.marko@siemens.com>
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

