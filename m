Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1109CF6499
	for <webhook@archiver.kernel.org>; Sun, 29 Sep 2024 13:00:01 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.31836.1727614799406398052
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Sep 2024 05:59:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=IUdXpgLh;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-2024092912595740a2569bd3d5fac285-cgi6dz@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2024092912595740a2569bd3d5fac285
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 29 Sep 2024 14:59:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=FTatXewoPXlcKQpSbKdceZOJFjOoGQpjnphZqFH+74E=;
 b=IUdXpgLhhA7WlP0Uw8YhA34yZACEobsxWXVTTmKqK2TKhKFBnRwCfeSxjL0nRYjufzhLxT
 fNoLzxay0hifGogxoYGc/qtD7wwtEaoGR9v0dCyGzyHr3/+Q8O6Wj4l1iHziMMvmctZnahga
 H8RjIHlB+AnrIuFUcm1FU2VZnR8+gdfLQ6NuOxKLLknRaKa0U23rViiD1zv9dyQXTzqHc/rH
 x5St7r9/oa/UCHc4GFZicK44NE5fkOoRiBpxj+mdhrXL3BODB6nSQ8IIoS1osrPWG9igo59M
 GyJtQZXrj3CFTolJIoAhWyoMyz9w+3N1BHuuwIMhZA26Q99eOhG4bpyg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][kirkstone][scarthgap][PATCH 2/2] hostapd: Patch security advisory 2024-2
Date: Sun, 29 Sep 2024 14:58:35 +0200
Message-Id: <20240929125835.1055031-2-peter.marko@siemens.com>
In-Reply-To: <20240929125835.1055031-1-peter.marko@siemens.com>
References: <20240929125835.1055031-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 Sep 2024 13:00:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112554

From: Peter Marko <peter.marko@siemens.com>

Pick patches according to
http://w1.fi/security/2024-2/sae-h2h-and-incomplete-downgrade-protection-for-group-negotiation.txt
SAE H2E and incomplete downgrade protection for group negotiation

Patch 0002-SAE-Check-for-invalid-Rejected-Groups-element-length.patch
was removed as it only patched wpa_supplicant. The patch names were
not changed so it is comparable with wpa_supplicant recipe.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...valid-Rejected-Groups-element-length.patch | 52 +++++++++++++++++++
 ...id-Rejected-Groups-element-in-the-pa.patch | 38 ++++++++++++++
 .../hostapd/hostapd_2.10.bb                   |  2 +
 3 files changed, 92 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/0001-SAE-Check-for-invalid-Rejected-Groups-element-length.patch
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/0003-SAE-Reject-invalid-Rejected-Groups-element-in-the-pa.patch

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/0001-SAE-Check-for-invalid-Rejected-Groups-element-length.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/0001-SAE-Check-for-invalid-Rejected-Groups-element-length.patch
new file mode 100644
index 0000000000..5780f27f8b
--- /dev/null
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd/0001-SAE-Check-for-invalid-Rejected-Groups-element-length.patch
@@ -0,0 +1,52 @@
+From 364c2da8741f0979dae497551e70b94c0e6c8636 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Sun, 7 Jul 2024 11:46:49 +0300
+Subject: [PATCH 1/3] SAE: Check for invalid Rejected Groups element length
+ explicitly
+
+Instead of practically ignoring an odd octet at the end of the element,
+check for such invalid case explicitly. This is needed to avoid a
+potential group downgrade attack.
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+
+CVE: CVE-2024-3596
+Upstream-Status: Backport [https://w1.fi/cgit/hostap/commit/?id=364c2da8741f0979dae497551e70b94c0e6c8636]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/ap/ieee802_11.c | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/src/ap/ieee802_11.c b/src/ap/ieee802_11.c
+index db4104928..1a62e30cc 100644
+--- a/src/ap/ieee802_11.c
++++ b/src/ap/ieee802_11.c
+@@ -1258,7 +1258,7 @@ static int check_sae_rejected_groups(struct hostapd_data *hapd,
+ 				     struct sae_data *sae)
+ {
+ 	const struct wpabuf *groups;
+-	size_t i, count;
++	size_t i, count, len;
+ 	const u8 *pos;
+ 
+ 	if (!sae->tmp)
+@@ -1268,7 +1268,15 @@ static int check_sae_rejected_groups(struct hostapd_data *hapd,
+ 		return 0;
+ 
+ 	pos = wpabuf_head(groups);
+-	count = wpabuf_len(groups) / 2;
++	len = wpabuf_len(groups);
++	if (len & 1) {
++		wpa_printf(MSG_DEBUG,
++			   "SAE: Invalid length of the Rejected Groups element payload: %zu",
++			   len);
++		return 1;
++	}
++
++	count = len / 2;
+ 	for (i = 0; i < count; i++) {
+ 		int enabled;
+ 		u16 group;
+-- 
+2.30.2
+
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/0003-SAE-Reject-invalid-Rejected-Groups-element-in-the-pa.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/0003-SAE-Reject-invalid-Rejected-Groups-element-in-the-pa.patch
new file mode 100644
index 0000000000..5e9e8bc01d
--- /dev/null
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd/0003-SAE-Reject-invalid-Rejected-Groups-element-in-the-pa.patch
@@ -0,0 +1,38 @@
+From 9716bf1160beb677e965d9e6475d6c9e162e8374 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Tue, 9 Jul 2024 23:34:34 +0300
+Subject: [PATCH 3/3] SAE: Reject invalid Rejected Groups element in the parser
+
+There is no need to depend on all uses (i.e., both hostapd and
+wpa_supplicant) to verify that the length of the Rejected Groups field
+in the Rejected Groups element is valid (i.e., a multiple of two octets)
+since the common parser can reject the message when detecting this.
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+
+Upstream-Status: Backport [https://w1.fi/cgit/hostap/commit/?id=9716bf1160beb677e965d9e6475d6c9e162e8374]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/common/sae.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/common/sae.c b/src/common/sae.c
+index c0f154e91..620bdf753 100644
+--- a/src/common/sae.c
++++ b/src/common/sae.c
+@@ -2076,6 +2076,12 @@ static int sae_parse_rejected_groups(struct sae_data *sae,
+ 		return WLAN_STATUS_UNSPECIFIED_FAILURE;
+ 	epos++; /* skip ext ID */
+ 	len--;
++	if (len & 1) {
++		wpa_printf(MSG_DEBUG,
++			   "SAE: Invalid length of the Rejected Groups element payload: %u",
++			   len);
++		return WLAN_STATUS_UNSPECIFIED_FAILURE;
++	}
+ 
+ 	wpabuf_free(sae->tmp->peer_rejected_groups);
+ 	sae->tmp->peer_rejected_groups = wpabuf_alloc(len);
+-- 
+2.30.2
+
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb b/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb
index 70fac06d89..a745e7a404 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb
@@ -19,6 +19,8 @@ SRC_URI = " \
     file://CVE-2024-3596_06.patch \
     file://CVE-2024-3596_07.patch \
     file://CVE-2024-3596_08.patch \
+    file://0001-SAE-Check-for-invalid-Rejected-Groups-element-length.patch \
+    file://0003-SAE-Reject-invalid-Rejected-Groups-element-in-the-pa.patch \
 "
 
 
-- 
2.30.2


