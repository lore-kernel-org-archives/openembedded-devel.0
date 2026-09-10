Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29737C79FBB
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 23:10:17 +0000 (UTC)
Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27770.1789081810100987718
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2026 16:10:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BsDGGdx2;
 spf=pass (domain: gmail.com, ip: 74.125.227.140, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fb334ddcso2018635ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 16:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789081809; x=1789686609; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dbzAs8rwTYhZrNZD6M3foHBn1uW5DAPnaeRxeK0eI2M=;
        b=BsDGGdx2W0r+f2dBrkaz1khFSXztcUeueQVLRDwOhtwjZvpW4m7ClhVkil1nOJsSDA
         0hZiAwpbFGYjwurjmWx6MGxf5msrUn2JzeZFuUGjcuhUn1+pdLALLwtsZ3JX4zKasJ2v
         unP60U4LskEwmuKZkjMA1f55CJtRo+3oPXswujLa8m3XOQnDLBQkf2XfqSuKIpwHMsBV
         XyNjVkFpoJZ94jFxUXdB98FWmgAS5yW0XcCoLeoSO2N+dsw1M0hagn+KgKftJ3Ek1RY7
         JLpTwVAJhaRvphpjUMKfRg+pi8MPsIttESTqwzo6G78k3IJOAr3aeFhI9TlBI4QFjnxB
         NXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789081809; x=1789686609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dbzAs8rwTYhZrNZD6M3foHBn1uW5DAPnaeRxeK0eI2M=;
        b=CYXlLv3uKCfpKIpVC+25J6aRMJN/hr5qQ323Al5aNhPxbkGIall55X6OVkP9s5Gdi1
         SqCMo3lz4lBc/vhgfEKpqxB59dQ2YIotnbWsz3ZhtUjHBRypxaoSutmj4pzxhj57ZPiH
         1yimI/BcZxD1+BjIT0C6huhZEOMKnxlIlu2+2srybWrTkZHAt4nTA1E23w5Lx0PfjRqI
         BApNb3sDKkstgKvx2Rd8HV4naP92Vfj1jcy6Z5UGHDwtukzvSm/sC0bgayATXjS5Vebz
         RKaGuWxelcmpDo6fgOL7+aLNavr6uWySEECl2Ai6dRlbRI9hzzbV3mNehOhdqAJuXd+E
         VNPA==
X-Gm-Message-State: AFuF++mlxKptHX8Su3GwdX11/aoFP/20MGOWX4DuZ5kJwbgf1FW72C9F
	5okok4KS74d/AB8Zv19YpIaNbqNkUJ+zdup4FASMtXYDf5zXShJd80gyrnvmVw==
X-Gm-Gg: AYBFou03YhnUAb7gczzKMDVtZvMITIFTaSIGgrjO2KGcppoNreRP0lfT2Kdr8yIyptc
	CZx8t7tRYdtapfmSQUJe+8kCrHeetkSD0QfVkZwH9ezCSYPebVqgva8esNQWTD1PV1VUMxiZ/50
	HvBc+ezd1wUt5OLTQJO4gAuiW9iXoDcC6YxBhEPI6qcXxXUGdNMPLF80nenFl7pFTB3ExZoiFql
	klIY+qC1N5swP35I16PSTJrqIIDt2al8LRNozveV7MqMVF1GQIzj4EJRgJqAcoEQypvSq9rK86V
	3AOdK7gWvmZkISAo+abdG4oj2g7gSaO/cVvfK+ZB/+zYK3/vZ2fyEGvLb91FoWxo7c35vzwSv9k
	jh37kcb6jHwzrI8eTpfL/Xppz8jo17wfHQI48Zs+EvswmVI1H9S9vU1NyCptynvWyHMJjrQZ8eT
	f+KBKo+K20ZWaGHj/rfyGEfRcPqIxWL+oxHK3LOBZnl4S4Gkl2/UNAKtPd21uG96IWO68yzX1Ot
	V4sg7tmjXPdSelbsJP9taWCXsYFPioBag==
X-Received: by 2002:a17:90b:5246:b0:398:d2a0:87ff with SMTP id 98e67ed59e1d1-39d9bc67660mr1889870a91.1.1789081809377;
        Thu, 10 Sep 2026 16:10:09 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e602d8sm1265496a91.3.2026.09.10.16.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:10:08 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 9/32] unbound: patch CVE-2026-42923
Date: Fri, 11 Sep 2026 11:09:08 +1200
Message-ID: <20260910230932.173913-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
References: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 23:10:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129927

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-42923

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../unbound/unbound/CVE-2026-42923.patch      | 114 ++++++++++++++++++
 .../recipes-support/unbound/unbound_1.24.2.bb |   1 +
 2 files changed, 115 insertions(+)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-42923.patch

diff --git a/meta-networking/recipes-support/unbound/unbound/CVE-2026-42923.patch b/meta-networking/recipes-support/unbound/unbound/CVE-2026-42923.patch
new file mode 100644
index 0000000000..da46770183
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/CVE-2026-42923.patch
@@ -0,0 +1,114 @@
+From 7a2457c979cdc1f0c1bb1fe68010fdd2f46398f2 Mon Sep 17 00:00:00 2001
+From: "W.C.A. Wijngaards" <wouter@nlnetlabs.nl>
+Date: Wed, 20 May 2026 10:20:02 +0200
+Subject: [PATCH] - Fix CVE-2026-42923, Degradation of service with unbounded
+ NSEC3   hash calculations. Thanks to Qifan Zhang, Palo Alto Networks, for  
+ the report.
+
+(cherry picked from commit c343fff3a4de922835fec7232b90faed658b5371)
+
+CVE: CVE-2026-42923
+Upstream-Status: Backport [https://github.com/NLnetLabs/unbound/commit/c343fff3a4de922835fec7232b90faed658b5371]
+
+Dropped changes to the Changelog file.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ validator/val_neg.c   | 28 +++++++++++++++++++++++++++-
+ validator/val_nsec3.c |  5 -----
+ validator/val_nsec3.h |  6 ++++++
+ 3 files changed, 33 insertions(+), 6 deletions(-)
+
+diff --git a/validator/val_neg.c b/validator/val_neg.c
+index bc3a83aeb..0f2751121 100644
+--- a/validator/val_neg.c
++++ b/validator/val_neg.c
+@@ -62,6 +62,13 @@
+ #include "sldns/rrdef.h"
+ #include "sldns/sbuffer.h"
+ 
++/**
++ * The maximum salt length that the negative cache is willing to use.
++ * Larger salt increases the computation time, while recommendations are
++ * for zero salt length for zones.
++ */
++#define MAX_SALT_LENGTH 64
++
+ int val_neg_data_compare(const void* a, const void* b)
+ {
+ 	struct val_neg_data* x = (struct val_neg_data*)a;
+@@ -826,7 +833,11 @@ void neg_insert_data(struct val_neg_cache* neg,
+ 			(slen != 0 && zone->nsec3_salt && s
+ 			  && memcmp(zone->nsec3_salt, s, slen) != 0))) {
+ 
+-			if(slen > 0) {
++			if(slen > MAX_SALT_LENGTH) {
++				/* RFC 9276 s3.1: operators SHOULD NOT use a salt; large
++				 * salts inflate per-hash block count. Decline to cache. */
++				return;
++			} else if(slen > 0) {
+ 				uint8_t* sa = memdup(s, slen);
+ 				if(sa) {
+ 					free(zone->nsec3_salt);
+@@ -1169,6 +1180,15 @@ neg_find_nsec3_ce(struct val_neg_zone* zone, uint8_t* qname, size_t qname_len,
+ 	uint8_t hashce[NSEC3_SHA_LEN];
+ 	uint8_t b32[257];
+ 	size_t celen, b32len;
++	int hashmax = MAX_NSEC3_CALCULATIONS;
++	if(qlabs > hashmax) {
++		/* strip leading labels so the walk costs at most
++		 * MAX_NSEC3_CALCULATIONS hashes, mirroring val_nsec3.c */
++		while(qlabs > hashmax) {
++			dname_remove_label(&qname, &qname_len);
++			qlabs--;
++		}
++	}
+ 
+ 	*nclen = 0;
+ 	while(qlabs > 0) {
+@@ -1269,6 +1289,12 @@ neg_nsec3_proof_ds(struct val_neg_zone* zone, uint8_t* qname, size_t qname_len,
+ 	if(!zone->nsec3_hash) 
+ 		return NULL; /* not nsec3 zone */
+ 
++	if(!topname && qlabs > zone->labs + 1)
++		return NULL; /* iterator caller; opt-out proof would be discarded
++			     * at the !topname check below anyway.
++			     * The qlabs check allows the exact-match for
++			     * the one-label-below-zone case. */
++
+ 	if(!(data=neg_find_nsec3_ce(zone, qname, qname_len, qlabs, buf,
+ 		hashnc, &nclen))) {
+ 		return NULL;
+diff --git a/validator/val_nsec3.c b/validator/val_nsec3.c
+index 92d853825..62effde20 100644
+--- a/validator/val_nsec3.c
++++ b/validator/val_nsec3.c
+@@ -59,11 +59,6 @@
+ #include "sldns/sbuffer.h"
+ #include "util/config_file.h"
+ 
+-/**
+- * Max number of NSEC3 calculations at once, suspend query for later.
+- * 8 is low enough and allows for cases where multiple proofs are needed.
+- */
+-#define MAX_NSEC3_CALCULATIONS 8
+ /**
+  * When all allowed NSEC3 calculations at once resulted in error treat as
+  * bogus. NSEC3 hash errors are not cached and this helps breaks loops with
+diff --git a/validator/val_nsec3.h b/validator/val_nsec3.h
+index f668a270f..a13e92991 100644
+--- a/validator/val_nsec3.h
++++ b/validator/val_nsec3.h
+@@ -98,6 +98,12 @@ struct sldns_buffer;
+ /** The SHA1 hash algorithm for NSEC3 */
+ #define NSEC3_HASH_SHA1	0x01
+ 
++/**
++ * Max number of NSEC3 calculations at once, suspend query for later.
++ * 8 is low enough and allows for cases where multiple proofs are needed.
++ */
++#define MAX_NSEC3_CALCULATIONS 8
++
+ /**
+ * Cache table for NSEC3 hashes.
+ * It keeps a *pointer* to the region its items are allocated.
diff --git a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
index a70ae4c9a3..7ed5769c69 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master;t
            file://CVE-2026-40622.patch \
            file://CVE-2026-41292.patch \
            file://CVE-2026-42534.patch \
+           file://CVE-2026-42923.patch \
            "
 
 SRCREV = "f6269baa605d31859f28770e01a24e3677e5f82c"

