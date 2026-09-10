Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2026DC88E45
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 23:10:07 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27835.1789081804596741523
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2026 16:10:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Z1Kgi0wt;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so273040a91.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 16:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789081804; x=1789686604; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XgA1xrq578t5HSQKvEAHraUaSA9gmzb+lHrdv60mZec=;
        b=Z1Kgi0wtC3IhmJyZi3vmh4Rh5Eyh4pPWrHooDJZsiscyvpCan6jCYmWwnSLQyUknSg
         guIjzybWThbe1MOpYN/ZQ0j4FlPmRcpVRq26J1w2P6Lu73vJtJpuT6vuLNkWZ4Hu0haT
         B2TIqst1VAw2bmZ20hQfqJzqE128uKPDDmFYn8twrcttC30nu59DTYqYtlYyxaKIDg6y
         27upblW611esam3EHImLZDOe57QpUT+XCDcPWdQB3E0H6N24osHFgmjSZTg9k4AsSDyZ
         mz0vTNxtFn6/a4DyhcE686PFmevqhISSH1QopPOfV0T1vKpOo9SXhnwaAYkUZZLlohjH
         usAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789081804; x=1789686604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XgA1xrq578t5HSQKvEAHraUaSA9gmzb+lHrdv60mZec=;
        b=Wv85TeknztWg6hvQdqRjTIgXt2xrqdaHCpOhDESzUQGiZHbNCPFWDhxAOFpd3ivhlZ
         PDBhQx9MxBpmnuWzSDCrcHCYtkGgX+3s17ScqMWsDsNDNDXyXQUS4vsMy1M4x3pHDcdZ
         Vp89lRsi0sdPD3nhg+IEBHjJkqWCTwulIyrVMMPY2G+wAb56LIO2YZfpQfkkiUCofwLo
         NZ2QrgtGAF0ra3MCXd5VrbBVuoY83rd6IcXU5qxVeEbjUUC3Qa2BBAoXzO31Vg6uqd+p
         krfEqw0lHf2k6k5jXSuw5Y1HsH/NPURrKjT4jv2tug6iJbBVokqgho4QUUv16faxBlJr
         mYdw==
X-Gm-Message-State: AFuF++mWpj2OxDe2BcNAhJA+J1hDhujz1Mui/hV9rSVYO2bYqcdjB5h4
	8OIREKqyoxPNTgjZL0MuW5WdalGroSrUUdpuGaNTvtoymImD5qLHPheCLLszkw==
X-Gm-Gg: AYBFou1mUxPM00R1vN45Ml70AV30XT4Ivt7s554ZXq2vqgyK6IretbNx3KkGkp5Gn8J
	c0Qg5ILPynYZOi2s6kdnn0KT2dSH0W0BUvNqQuOW3/tyhdUePpyATxmCQBwFefFKpyvFdakDebs
	TqjoIH4eS0ubE/Ls2o1FjWKKiREvXrU8CDFo2yEQ775Tz9bRwFF8tLS4UPluC/TOmTeDuVsQKHP
	nyel+UNtyRPFKWYpdGYTnZgpHhtJCPC5DCmZtK+qpSyL6mcyrofwxZx7Op/bpVDiZdEKC/fR6+Q
	btHtmqN2ezigmKd1wylzKvhfQsS4QKais9RXPgrCYLfd3upXmX8NglfFFtZDDdjL0ao9HLGFY8m
	8dhCHFleDo4/Y6X8inudg4Os/uixaK4w154B4Gd8X3uXxgYtamzd2lmq6pt3TrzTG90XMr99h7V
	DJXNlUwyMswvUVskKPJMvBH/e11vICliokqwGgVTtVEbM7sw7wNCav2HZzC7S3qdx8u6tp6pjdK
	S4o2kjMjFcBPpxW6V8cRIU=
X-Received: by 2002:a17:90b:588d:b0:399:1f8b:d255 with SMTP id 98e67ed59e1d1-39d9bbc823fmr1805677a91.5.1789081803787;
        Thu, 10 Sep 2026 16:10:03 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e602d8sm1265496a91.3.2026.09.10.16.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:10:03 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 7/32] unbound: patch CVE-2026-41292
Date: Fri, 11 Sep 2026 11:09:06 +1200
Message-ID: <20260910230932.173913-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
References: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 23:10:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129925

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-41292

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../unbound/unbound/CVE-2026-41292.patch      | 83 +++++++++++++++++++
 .../recipes-support/unbound/unbound_1.24.2.bb |  1 +
 2 files changed, 84 insertions(+)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-41292.patch

diff --git a/meta-networking/recipes-support/unbound/unbound/CVE-2026-41292.patch b/meta-networking/recipes-support/unbound/unbound/CVE-2026-41292.patch
new file mode 100644
index 0000000000..8ca3ec2716
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/CVE-2026-41292.patch
@@ -0,0 +1,83 @@
+From 97caf75e44191118fcb678f95fca15d3ea2a074f Mon Sep 17 00:00:00 2001
+From: "W.C.A. Wijngaards" <wouter@nlnetlabs.nl>
+Date: Wed, 20 May 2026 10:18:23 +0200
+Subject: [PATCH] - Fix CVE-2026-41292, Parsing a long list of incoming EDNS
+ options   degrades performance. Thanks to GitHub user 'N0zoM1z0', also Qifan 
+  Zhang from Palo Alto Networks, for the report.
+
+(cherry picked from commit ef5ca84360934fa1e857ebc371d4b093aea6355d)
+
+CVE: CVE-2026-41292
+Upstream-Status: Backport [https://github.com/NLnetLabs/unbound/commit/ef5ca84360934fa1e857ebc371d4b093aea6355d]
+
+Dropped changes to the Changelog file.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ util/data/msgparse.c | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/util/data/msgparse.c b/util/data/msgparse.c
+index 2d0955631..169709b7e 100644
+--- a/util/data/msgparse.c
++++ b/util/data/msgparse.c
+@@ -53,6 +53,8 @@
+ #include "sldns/parseutil.h"
+ #include "sldns/wire2str.h"
+ 
++#define MAX_PARSED_EDNS_OPTIONS 100
++
+ /** smart comparison of (compressed, valid) dnames from packet */
+ static int
+ smart_compare(sldns_buffer* pkt, uint8_t* dnow, 
+@@ -950,7 +952,7 @@ parse_edns_options_from_query(uint8_t* rdata_ptr, size_t rdata_len,
+ 	struct comm_reply* repinfo, uint32_t now, struct regional* region,
+ 	struct cookie_secrets* cookie_secrets)
+ {
+-	int nsid_seen = 0, cookie_seen = 0, padding_seen = 0;
++	int i = 0, nsid_seen = 0, cookie_seen = 0, padding_seen = 0;
+ 	/* To respond with a Keepalive option, the client connection must have
+ 	 * received one message with a TCP Keepalive EDNS option, and that
+ 	 * option must have 0 length data. Subsequent messages sent on that
+@@ -970,7 +972,7 @@ parse_edns_options_from_query(uint8_t* rdata_ptr, size_t rdata_len,
+ 
+ 	/* while still more options, and have code+len to read */
+ 	/* ignores partial content (i.e. rdata len 3) */
+-	while(rdata_len >= 4) {
++	while(rdata_len >= 4 && i < MAX_PARSED_EDNS_OPTIONS) {
+ 		uint16_t opt_code = sldns_read_uint16(rdata_ptr);
+ 		uint16_t opt_len = sldns_read_uint16(rdata_ptr+2);
+ 		uint8_t server_cookie[40];
+@@ -1150,6 +1152,7 @@ parse_edns_options_from_query(uint8_t* rdata_ptr, size_t rdata_len,
+ 		}
+ 		rdata_ptr += opt_len;
+ 		rdata_len -= opt_len;
++		i++;
+ 	}
+ 	return LDNS_RCODE_NOERROR;
+ }
+@@ -1164,6 +1167,7 @@ parse_extract_edns_from_response_msg(struct msg_parse* msg,
+ 	struct rrset_parse* found_prev = 0;
+ 	size_t rdata_len;
+ 	uint8_t* rdata_ptr;
++	int i = 0;
+ 	/* since the class encodes the UDP size, we cannot use hash table to
+ 	 * find the EDNS OPT record. Scan the packet. */
+ 	while(rrset) {
+@@ -1223,7 +1227,7 @@ parse_extract_edns_from_response_msg(struct msg_parse* msg,
+ 
+ 	/* while still more options, and have code+len to read */
+ 	/* ignores partial content (i.e. rdata len 3) */
+-	while(rdata_len >= 4) {
++	while(rdata_len >= 4 && i < MAX_PARSED_EDNS_OPTIONS) {
+ 		uint16_t opt_code = sldns_read_uint16(rdata_ptr);
+ 		uint16_t opt_len = sldns_read_uint16(rdata_ptr+2);
+ 		rdata_ptr += 4;
+@@ -1238,6 +1242,7 @@ parse_extract_edns_from_response_msg(struct msg_parse* msg,
+ 		}
+ 		rdata_ptr += opt_len;
+ 		rdata_len -= opt_len;
++		i++;
+ 	}
+ 	/* ignore rrsigs */
+ 	return LDNS_RCODE_NOERROR;
diff --git a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
index 1c9a7fa489..0688b8a78b 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
@@ -17,6 +17,7 @@ SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master;t
            file://CVE-2026-42959.patch \
            file://CVE-2026-32792.patch \
            file://CVE-2026-40622.patch \
+           file://CVE-2026-41292.patch \
            "
 
 SRCREV = "f6269baa605d31859f28770e01a24e3677e5f82c"

