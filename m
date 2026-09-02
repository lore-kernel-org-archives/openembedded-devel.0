Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 565F3C61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:06:17 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9065.1788343574049599293
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:06:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JW+FR1Tk;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d6e954afbdso5171635ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 03:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788343573; x=1788948373; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fowu6XI+DUSRHXo45Qm1TWU8fLj7OAHlch8GTHzWiz0=;
        b=JW+FR1Tk4mmPQTJ2EdDW/8d/rU964O+Zmu+hCAEtURECWcvmddc5Fp5QAQFX9CiMyP
         1iWX7z5NUroYhyBokFwO9PTUhEkVg1AmJxgOaNy7T3YMYWBCRF3r0ehYeUW1tNxv0lMC
         QLLyk/b+UEeqxqOSrufE4hpjqJcowXbB6yTw6kWiHJ/+J1PGzIdHR64mgg0y4ZWiVO4/
         5oz9cez3LZTyboD0jmX3CYdiAXq55RBFojVhSgjqIf0ySsbeVrtyM2BfiIxRJuEfeQWv
         flKIHrnpaCLQ7yOKWf6UQWphHBX2vTuIrEPSbFuEG2GlAxQmq8kiOFxgwo0VfwjZO5o3
         i54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788343573; x=1788948373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fowu6XI+DUSRHXo45Qm1TWU8fLj7OAHlch8GTHzWiz0=;
        b=sRPwhH6vtnmdftr71q2LD9Y3Gs+0X/DQeEviaRYdfwqZllhyL0op1A0TCVMrLO387m
         EvU52Hng+Lr2etYcEJ0E4vmPM8Es9102NvGGUS3LyEeqO7gBTgNW0iP7YfLipl/izmnN
         13Ndxod+An/YgRVFx6PdOEPU5QbRIoX2J/KjBAIQ7Q8wCoFLEZjbUrcV0+BSPQdvl3VG
         EVq2JIx2mz8NHIV+I0BDIbXt4oGJ6yT4UuueeO86Bno2cAS9KXxzUXXEnX71ITgIezPj
         7wb8gIZcQZkM0IkfRKepxYVTswvo6J6QJcvk/g/JXalRyy7OkaUQPiPg+i0FwlP1MGia
         +aQQ==
X-Gm-Message-State: AFuF++leFeXP8FEw9MHkWLKTMLeyPeEfmI3SloqaFbBmkDe5r5CdYgmk
	KJM0dEOmzZyA6JKA3dbBRrm1CeqYfioso3pvvOBKIdvW7jhFVM7vz7FB+1qDkw==
X-Gm-Gg: AYBFou3cHxEubDAwQJw49QLr9TsaekgkWUAbkHkTsprOLCcimo+VAgMHeaDvUtC3d8u
	unxqbjFtFUNqh5y7+NxP7NnGzDWmb+1Onux5/H1lX1G17zM7wldGU3VUIaksppSMvZWFBM/sOio
	Aa0dTJVqxyb+tCiX1boAYakVl73rbT9uWIFOxzFk9WZmRczXck7HRBI2UEzCX/aiskK8g6XbTEJ
	rmBQ14KKsBNwYFz2hM79wwT2tePNct+iApIrH2XmaKEfv6xV9T4P4/jNCMIDmjIiXrKlKVJKRdq
	zcPAfq7QtBPyjkJQFvG+lTpNQF7mHdR/ZKTkVfi8qu5kY2YOL61VtK3ElJNU04KNEBfhiLLc3mq
	0suRViICoPnglL2e6mTJDBz1kR1SBhjOSWguK9iG4FJwza2qz5H193n0QtDAaM9m0/obCRDIIp4
	sceTpwxVpDEzs2ZPZQyyXzhyRp0tqP+lAP9Avojj52xL5yAz6GKGZhQWpLDkCNILNW86s4v7mE
X-Received: by 2002:a17:90b:4d06:b0:398:bf7e:b267 with SMTP id 98e67ed59e1d1-39aedec7bd8mr4901111a91.2.1788343573232;
        Wed, 02 Sep 2026 03:06:13 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd1dcfbsm10766784a91.2.2026.09.02.03.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:06:12 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 22/28] hostapd: patch CVE-2026-58374
Date: Wed,  2 Sep 2026 22:05:04 +1200
Message-ID: <20260902100511.2105916-22-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
References: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:06:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129653

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Apply hostapd patches recommended by upstream[1] as mentioned in the NVD[2]

[1] https://w1.fi/security/2026-1/
[2] https://nvd.nist.gov/vuln/detail/cve-2026-58374

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../hostapd/hostapd/CVE-2026-58374-1.patch    | 49 +++++++++++++++++++
 .../hostapd/hostapd/CVE-2026-58374-2.patch    | 43 ++++++++++++++++
 .../hostapd/hostapd_2.11.bb                   |  2 +
 3 files changed, 94 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2026-58374-1.patch
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2026-58374-2.patch

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2026-58374-1.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2026-58374-1.patch
new file mode 100644
index 0000000000..9bb8974c50
--- /dev/null
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2026-58374-1.patch
@@ -0,0 +1,49 @@
+From 7ab2de9eecf5409f6af1461cf89dbf217930bd45 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <jouni.malinen@oss.qualcomm.com>
+Date: Tue, 31 Mar 2026 23:24:04 +0300
+Subject: [PATCH] AP MLD: Fix link ID validation in Basic MLE parsing
+
+Link ID 15 can be indicated in the field, but that is not a valid value
+and must be rejected to avoid issues pointing beyond the array of links
+for a non-AP MLD. Without this, an invalid MLE could result in writing
+beyond the end of the buffer and causing process termination or
+unexpected behavior.
+
+Fixes: 5f5db9366cde ("AP: MLO: Process Multi-Link element from (Re)Association Request frame")
+Signed-off-by: Jouni Malinen <jouni.malinen@oss.qualcomm.com>
+
+CVE: CVE-2026-58374
+Upstream-Status: Backport [https://git.w1.fi/cgit/hostap/commit/?id=46dd5a4ffc9bcf44cf8fc45120b3e1e5ec922187]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/ap/ieee802_11_eht.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/src/ap/ieee802_11_eht.c b/src/ap/ieee802_11_eht.c
+index b935ee8..804808c 100644
+--- a/src/ap/ieee802_11_eht.c
++++ b/src/ap/ieee802_11_eht.c
+@@ -1262,6 +1262,7 @@ u16 hostapd_process_ml_assoc_req(struct hostapd_data *hapd,
+ 		size_t sub_elem_len = *(pos + 1);
+ 		size_t sta_info_len;
+ 		u16 control;
++		u8 link_id;
+ 
+ 		wpa_printf(MSG_DEBUG, "MLD: sub element len=%zu",
+ 			   sub_elem_len);
+@@ -1302,8 +1303,13 @@ u16 hostapd_process_ml_assoc_req(struct hostapd_data *hapd,
+ 			goto out;
+ 		}
+ 		control = WPA_GET_LE16(pos);
+-		link_info = &info->links[control &
+-					 EHT_PER_STA_CTRL_LINK_ID_MSK];
++		link_id = control & BASIC_MLE_STA_CTRL_LINK_ID_MASK;
++		if (link_id >= MAX_NUM_MLD_LINKS) {
++			wpa_printf(MSG_DEBUG,
++				   "MLD: Invalid Link ID in Per-STA Profile subelement");
++			goto out;
++		}
++		link_info = &info->links[link_id];
+ 		pos += 2;
+ 		ml_len -= 2;
+ 		sub_elem_len -= 2;
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2026-58374-2.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2026-58374-2.patch
new file mode 100644
index 0000000000..7881e687ff
--- /dev/null
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2026-58374-2.patch
@@ -0,0 +1,43 @@
+From 86cefb9f27e0e2d31d857bea483b0735e6441801 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <jouni.malinen@oss.qualcomm.com>
+Date: Mon, 18 May 2026 15:45:15 +0300
+Subject: [PATCH] AP MLD: Verify AP MLD link ID validity before updating bitmap
+ of links
+
+Link ID is 0..14, so ignore value 15 if an invalid frame is processed.
+It does not look like the invalid value was actually used to reference
+any local array, but in any case, it is better to not mark an invalid
+link as being specified.
+
+Signed-off-by: Jouni Malinen <jouni.malinen@oss.qualcomm.com>
+
+CVE: CVE-2026-58374
+Upstream-Status: Backport [https://git.w1.fi/cgit/hostap/commit/?id=ce1a8612e309fe86133ecf05ffb452b0bdf3b035]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/ap/beacon.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/ap/beacon.c b/src/ap/beacon.c
+index cec0c98..cc295c1 100644
+--- a/src/ap/beacon.c
++++ b/src/ap/beacon.c
+@@ -1305,6 +1305,7 @@ static bool parse_ml_probe_req(const struct ieee80211_eht_ml *ml, size_t ml_len,
+ 	for_each_element_id(sub, 0, pos, len) {
+ 		const struct ieee80211_eht_per_sta_profile *sta;
+ 		u16 sta_control;
++		u8 link_id;
+ 
+ 		if (*links == 0xffff)
+ 			*links = 0;
+@@ -1324,7 +1325,9 @@ static bool parse_ml_probe_req(const struct ieee80211_eht_ml *ml, size_t ml_len,
+ 		 * partial profile was requested.
+ 		 */
+ 		sta_control = le_to_host16(sta->sta_control);
+-		*links |= BIT(sta_control & EHT_PER_STA_CTRL_LINK_ID_MSK);
++		link_id = sta_control & BASIC_MLE_STA_CTRL_LINK_ID_MASK;
++		if (link_id < MAX_NUM_MLD_LINKS)
++			*links |= BIT(link_id);
+ 	}
+ 
+ 	if (!for_each_element_completed(sub, pos, len)) {
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb b/meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb
index ce1c145fd7..f98bad9ef6 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb
@@ -15,6 +15,8 @@ SRC_URI = " \
     file://hostapd.service \
     file://CVE-2025-24912-01.patch \
     file://CVE-2025-24912-02.patch \
+    file://CVE-2026-58374-1.patch \
+    file://CVE-2026-58374-2.patch \
 "
 
 

