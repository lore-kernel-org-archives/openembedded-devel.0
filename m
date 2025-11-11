Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F8CCCD13D2
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 09:38:27 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13815.1762853904493271960
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Nov 2025 01:38:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=inbKbegb;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-29555415c5fso50602725ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 01:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762853904; x=1763458704; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JOi0L4Sg6xB/bU9thKB1VetaO6jxpO7DfNMSGVIvwCY=;
        b=inbKbegbgO9wBytMrk2p9HTd26jst4sqhuBJTe0P3XAooi3cQ+tPFppr+Ke5HBSnGM
         w4c78QgiLpIWZhIvu8LCuNxV8/dNXcVF1b9zpedkjkx9VDA5brPJrDj9HB41Q73wotFs
         OydHRfQZlHPLK5Fm+8KEY/DVJ38/hOPIuKJfTGgIuw1fQaV9UG2ySeMVAdZW9DjjwiVs
         2nFXyvdz5xFyZ0RXXg+/soGZNPqwRUnn6XnqPM7NtWKoGRIj4QtiL4dKBCQR2kiJ4vfY
         Tx6DY915zueEU5R2O2zMZL7HMqbWmb/L4Uw5/8vRkvT5tM1rOGjHnjdDeadVBfuLrBy8
         GntQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762853904; x=1763458704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JOi0L4Sg6xB/bU9thKB1VetaO6jxpO7DfNMSGVIvwCY=;
        b=NnT0EFczrP/VsLpiZ7GE02G6rO1O7KHekHewWCOiMYN4w6k0y+FEm6fkrWhiB90A8B
         t8sngsUjtXAJPZiY2KYaYrxvBf6dFJzGIipAkqiVxMDCjpfn64VL4crJgjSdTZI4mPNO
         6AYkgD7FWRN7UsvCQzPCGsJ3/bdHpxj93oqFQXkaYhUyhoLsEcwzDFBHXatY26LxJZ3f
         9ye13xEJGIPkbGMwzYfV8kY2AtODeAZCMBQvgzkCBbVwwlqXK+3BAKRcvklfqivjM3in
         A5+ViqU24TwUCimYa6DlKZ2aMc3Cdl2EaCJBzBLwQxbOTCSy1FJPSYse/ar/cLdz6fbU
         ViCQ==
X-Gm-Message-State: AOJu0Yx3FB9bNCDsbxG9gKLFmTerG17WBVccPxcRi4dWfIqphtfegMTW
	BrTAXxxpWzuNQOQYLufH2iDKYRuqC0oyFSM/fhjd4cLzMB+YyOx/d6QEIpKz0xIxCEw=
X-Gm-Gg: ASbGnctyc8gn3ZaUBbpC4Uh+mq3bTuk64sVjmYC0RO5Su73P8VvSYJwhmrXVHu7tKQ7
	Usg2r9m6JHR5LHfPjx/82SW3lBwI8VW6va0CyzUnwvx+W2RpWgtai9vWtpwymOf3KvW1dOho1ix
	yzWLDet/ThB6jQfvWU4Sz94VkefXCYEe3NqaeNJkxrRtNfDVslNPtx9S8vOGowI8pcZqMZj3yo5
	AWJ6amsh/VZsYz+e7FJGj6Hy7mSqWDST2cw4LG/D+oneEl8R5Cl7pAns96p/WPMOosFHbS4ucjf
	Q9Qwd2oultskY1jjSPwx9Ypa+hfGlUfyPHR/yJ2o3YvHKihqD7gLLwXtoPHTm1fj1M+ioalKcyG
	QE9M5Zj5R8hwE/qj+ZWoN2M6enHYUTzCFi7mSIJ2+clBV2z83fy4H9lKESnHDk7/XHOXeGzlRbQ
	eulMghG5npVCOV5A==
X-Google-Smtp-Source: AGHT+IEenf9Ih+vgMnmrr2EUbbV/GG+PPnMjgA9PTAW9gI45nuOTBoub7RnxC8dawBaIqDJn4lo9Ew==
X-Received: by 2002:a17:903:1b6e:b0:295:9db1:ff2b with SMTP id d9443c01a7336-297e57095b1mr159867885ad.57.1762853903322;
        Tue, 11 Nov 2025 01:38:23 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096b90asm173611505ad.23.2025.11.11.01.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:38:22 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 17/18] frr: upgrade 9.1 -> 9.1.3
Date: Tue, 11 Nov 2025 22:37:32 +1300
Message-ID: <20251111093733.1393568-17-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251111093733.1393568-1-ankur.tyagi85@gmail.com>
References: <20251111093733.1393568-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 09:38:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121520

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Dropped patches which are part of this release.

Release Notes:
https://github.com/FRRouting/frr/releases/tag/frr-9.1.1
https://github.com/FRRouting/frr/releases/tag/frr-9.1.2
https://github.com/FRRouting/frr/releases/tag/frr-9.1.3

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../frr/frr/CVE-2024-31948.patch              | 130 --------------
 .../frr/frr/CVE-2024-31949.patch              | 163 ------------------
 .../frr/frr/CVE-2024-31950.patch              |  68 --------
 .../frr/frr/CVE-2024-31951.patch              | 110 ------------
 .../frr/frr/CVE-2024-34088.patch              |  83 ---------
 .../frr/frr/CVE-2024-44070.patch              |  54 ------
 .../frr/{frr_9.1.bb => frr_9.1.3.bb}          |   8 +-
 7 files changed, 1 insertion(+), 615 deletions(-)
 delete mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2024-31948.patch
 delete mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2024-31949.patch
 delete mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2024-31950.patch
 delete mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2024-31951.patch
 delete mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2024-34088.patch
 delete mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2024-44070.patch
 rename meta-networking/recipes-protocols/frr/{frr_9.1.bb => frr_9.1.3.bb} (94%)

diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2024-31948.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2024-31948.patch
deleted file mode 100644
index bc1f2edc7d..0000000000
--- a/meta-networking/recipes-protocols/frr/frr/CVE-2024-31948.patch
+++ /dev/null
@@ -1,130 +0,0 @@
-From a11446687169c679b5e51b57f151a6f6c119656c Mon Sep 17 00:00:00 2001
-From: Donatas Abraitis <donatas@opensourcerouting.org>
-Date: Wed, 27 Mar 2024 18:42:56 +0200
-Subject: [PATCH 1/2] bgpd: Fix error handling when receiving BGP Prefix SID
- attribute
-
-Without this patch, we always set the BGP Prefix SID attribute flag without
-checking if it's malformed or not. RFC8669 says that this attribute MUST be discarded.
-
-Also, this fixes the bgpd crash when a malformed Prefix SID attribute is received,
-with malformed transitive flags and/or TLVs.
-
-Reported-by: Iggy Frankovic <iggyfran@amazon.com>
-Signed-off-by: Donatas Abraitis <donatas@opensourcerouting.org>
-
-CVE: CVE-2024-31948
-Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/ba6a8f1a31e1a88df2de69ea46068e8bd9b97138]
-
-Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
----
- bgpd/bgp_attr.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/bgpd/bgp_attr.c b/bgpd/bgp_attr.c
-index 56e77eb3a..2639ff864 100644
---- a/bgpd/bgp_attr.c
-+++ b/bgpd/bgp_attr.c
-@@ -1390,6 +1390,7 @@ bgp_attr_malformed(struct bgp_attr_parser_args *args, uint8_t subcode,
- 	case BGP_ATTR_AS4_AGGREGATOR:
- 	case BGP_ATTR_AGGREGATOR:
- 	case BGP_ATTR_ATOMIC_AGGREGATE:
-+	case BGP_ATTR_PREFIX_SID:
- 		return BGP_ATTR_PARSE_PROCEED;
- 
- 	/* Core attributes, particularly ones which may influence route
-@@ -3144,8 +3145,6 @@ enum bgp_attr_parse_ret bgp_attr_prefix_sid(struct bgp_attr_parser_args *args)
- 	struct attr *const attr = args->attr;
- 	enum bgp_attr_parse_ret ret;
- 
--	attr->flag |= ATTR_FLAG_BIT(BGP_ATTR_PREFIX_SID);
--
- 	uint8_t type;
- 	uint16_t length;
- 	size_t headersz = sizeof(type) + sizeof(length);
-@@ -3195,6 +3194,8 @@ enum bgp_attr_parse_ret bgp_attr_prefix_sid(struct bgp_attr_parser_args *args)
- 		}
- 	}
- 
-+	SET_FLAG(attr->flag, ATTR_FLAG_BIT(BGP_ATTR_PREFIX_SID));
-+
- 	return BGP_ATTR_PARSE_PROCEED;
- }
- 
--- 
-2.34.1
-
-From 70555e1c0927b84f3aae9406379b00c976b2fa0c Mon Sep 17 00:00:00 2001
-From: Donatas Abraitis <donatas@opensourcerouting.org>
-Date: Wed, 27 Mar 2024 19:08:38 +0200
-Subject: [PATCH 2/2] bgpd: Prevent from one more CVE triggering this place
-
-If we receive an attribute that is handled by bgp_attr_malformed(), use
-treat-as-withdraw behavior for unknown (or missing to add - if new) attributes.
-
-Signed-off-by: Donatas Abraitis <donatas@opensourcerouting.org>
-
-CVE: CVE-2024-31948
-Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/babb23b74855e23c987a63f8256d24e28c044d07]
-
-Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
----
- bgpd/bgp_attr.c | 33 ++++++++++++++++++++++-----------
- 1 file changed, 22 insertions(+), 11 deletions(-)
-
-diff --git a/bgpd/bgp_attr.c b/bgpd/bgp_attr.c
-index 2639ff864..797f05d60 100644
---- a/bgpd/bgp_attr.c
-+++ b/bgpd/bgp_attr.c
-@@ -1381,6 +1381,15 @@ bgp_attr_malformed(struct bgp_attr_parser_args *args, uint8_t subcode,
- 			(args->startp - STREAM_DATA(BGP_INPUT(peer)))
- 				+ args->total);
- 
-+	/* Partial optional attributes that are malformed should not cause
-+	 * the whole session to be reset. Instead treat it as a withdrawal
-+	 * of the routes, if possible.
-+	 */
-+	if (CHECK_FLAG(flags, BGP_ATTR_FLAG_TRANS) &&
-+	    CHECK_FLAG(flags, BGP_ATTR_FLAG_OPTIONAL) &&
-+	    CHECK_FLAG(flags, BGP_ATTR_FLAG_PARTIAL))
-+		return BGP_ATTR_PARSE_WITHDRAW;
-+
- 	switch (args->type) {
- 	/* where an attribute is relatively inconsequential, e.g. it does not
- 	 * affect route selection, and can be safely ignored, then any such
-@@ -1418,19 +1427,21 @@ bgp_attr_malformed(struct bgp_attr_parser_args *args, uint8_t subcode,
- 					  BGP_NOTIFY_UPDATE_ERR, subcode,
- 					  notify_datap, length);
- 		return BGP_ATTR_PARSE_ERROR;
-+	default:
-+		/* Unknown attributes, that are handled by this function
-+		 * should be treated as withdraw, to prevent one more CVE
-+		 * from being introduced.
-+		 * RFC 7606 says:
-+		 * The "treat-as-withdraw" approach is generally preferred
-+		 * and the "session reset" approach is discouraged.
-+		 */
-+		flog_err(EC_BGP_ATTR_FLAG,
-+			 "%s(%u) attribute received, while it is not known how to handle it, treating as withdraw",
-+			 lookup_msg(attr_str, args->type, NULL), args->type);
-+		break;
- 	}
- 
--	/* Partial optional attributes that are malformed should not cause
--	 * the whole session to be reset. Instead treat it as a withdrawal
--	 * of the routes, if possible.
--	 */
--	if (CHECK_FLAG(flags, BGP_ATTR_FLAG_TRANS)
--	    && CHECK_FLAG(flags, BGP_ATTR_FLAG_OPTIONAL)
--	    && CHECK_FLAG(flags, BGP_ATTR_FLAG_PARTIAL))
--		return BGP_ATTR_PARSE_WITHDRAW;
--
--	/* default to reset */
--	return BGP_ATTR_PARSE_ERROR_NOTIFYPLS;
-+	return BGP_ATTR_PARSE_WITHDRAW;
- }
- 
- /* Find out what is wrong with the path attribute flag bits and log the error.
--- 
-2.34.1
-
diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2024-31949.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2024-31949.patch
deleted file mode 100644
index dad0255ead..0000000000
--- a/meta-networking/recipes-protocols/frr/frr/CVE-2024-31949.patch
+++ /dev/null
@@ -1,163 +0,0 @@
-From 2779d7d7c4f465f8e117aa4c47982dd60d620bc9 Mon Sep 17 00:00:00 2001
-From: Donatas Abraitis <donatas@opensourcerouting.org>
-Date: Sat, 30 Mar 2024 15:35:18 +0200
-Subject: [PATCH] bgpd: Fix errors handling for MP/GR capabilities as dynamic
- capability
-
-When receiving a MP/GR capability as dynamic capability, but malformed, do not
-forget to advance the pointer to avoid hitting infinity loop.
-
-After:
-```
-Mar 29 11:15:28 donatas-laptop bgpd[353550]: [GS0AQ-HKY0X] 127.0.0.1 rcv CAPABILITY
-Mar 29 11:15:28 donatas-laptop bgpd[353550]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 5, length 0
-Mar 29 11:15:28 donatas-laptop bgpd[353550]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 0, length 0
-Mar 29 11:15:28 donatas-laptop bgpd[353550]: [HFHDS-QT71N][EC 33554494] 127.0.0.1(donatas-pc): unrecognized capability code: 0 - ignored
-Mar 29 11:15:28 donatas-laptop bgpd[353550]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 0, code: 0, length 0
-Mar 29 11:15:28 donatas-laptop bgpd[353550]: [HFHDS-QT71N][EC 33554494] 127.0.0.1(donatas-pc): unrecognized capability code: 0 - ignored
-Mar 29 11:15:28 donatas-laptop bgpd[353550]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 0, code: 0, length 0
-Mar 29 11:15:28 donatas-laptop bgpd[353550]: [HFHDS-QT71N][EC 33554494] 127.0.0.1(donatas-pc): unrecognized capability code: 0 - ignored
-Mar 29 11:15:28 donatas-laptop bgpd[353550]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 0, code: 0, length 1
-Mar 29 11:15:28 donatas-laptop bgpd[353550]: [HFHDS-QT71N][EC 33554494] 127.0.0.1(donatas-pc): unrecognized capability code: 0 - ignored
-Mar 29 11:15:28 donatas-laptop bgpd[353550]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
-Mar 29 11:15:28 donatas-laptop bgpd[353550]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
-```
-
-Before:
-```
-Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
-Mar 29 11:14:54 donatas-laptop bgpd[347675]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
-Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
-Mar 29 11:14:54 donatas-laptop bgpd[347675]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
-Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
-Mar 29 11:14:54 donatas-laptop bgpd[347675]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
-Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
-Mar 29 11:14:54 donatas-laptop bgpd[347675]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
-Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
-Mar 29 11:14:54 donatas-laptop bgpd[347675]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
-Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
-Mar 29 11:14:54 donatas-laptop bgpd[347675]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
-Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
-Mar 29 11:14:54 donatas-laptop bgpd[347675]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
-Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
-Mar 29 11:14:54 donatas-laptop bgpd[347675]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
-Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
-Mar 29 11:14:54 donatas-laptop bgpd[347675]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
-Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
-Mar 29 11:14:54 donatas-laptop bgpd[347675]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
-Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
-Mar 29 11:14:54 donatas-laptop bgpd[347675]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
-Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
-Mar 29 11:14:54 donatas-laptop bgpd[347675]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
-Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
-Mar 29 11:14:54 donatas-laptop bgpd[347675]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
-Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
-Mar 29 11:14:54 donatas-laptop bgpd[347675]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
-Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
-Mar 29 11:14:54 donatas-laptop bgpd[347675]: [Z1DRQ-N6Z5F] 127.0.0.1(donatas-pc): Dynamic Capability MultiProtocol Extensions afi/safi invalid (bad-value/unicast)
-Mar 29 11:14:54 donatas-laptop bgpd[347675]: [JTVED-VGTQQ] 127.0.0.1(donatas-pc): CAPABILITY has action: 1, code: 1, length 10
-```
-
-Reported-by: Iggy Frankovic <iggyfran@amazon.com>
-Signed-off-by: Donatas Abraitis <donatas@opensourcerouting.org>
-
-CVE: CVE-2024-31949
-Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/30a332dad86fafd2b0b6c61d23de59ed969a219b]
-
-Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
----
- bgpd/bgp_packet.c | 17 ++++++++++-------
- 1 file changed, 10 insertions(+), 7 deletions(-)
-
-diff --git a/bgpd/bgp_packet.c b/bgpd/bgp_packet.c
-index cae82cbbb..50e5b54ab 100644
---- a/bgpd/bgp_packet.c
-+++ b/bgpd/bgp_packet.c
-@@ -3121,6 +3121,7 @@ static int bgp_capability_msg_parse(struct peer *peer, uint8_t *pnt,
- 			zlog_err("%pBP: Capability length error", peer);
- 			bgp_notify_send(peer->connection, BGP_NOTIFY_CEASE,
- 					BGP_NOTIFY_SUBCODE_UNSPECIFIC);
-+			pnt += length;
- 			return BGP_Stop;
- 		}
- 		action = *pnt;
-@@ -3133,7 +3134,7 @@ static int bgp_capability_msg_parse(struct peer *peer, uint8_t *pnt,
- 				 action);
- 			bgp_notify_send(peer->connection, BGP_NOTIFY_CEASE,
- 					BGP_NOTIFY_SUBCODE_UNSPECIFIC);
--			return BGP_Stop;
-+			goto done;
- 		}
- 
- 		if (bgp_debug_neighbor_events(peer))
-@@ -3145,12 +3146,13 @@ static int bgp_capability_msg_parse(struct peer *peer, uint8_t *pnt,
- 			zlog_err("%pBP: Capability length error", peer);
- 			bgp_notify_send(peer->connection, BGP_NOTIFY_CEASE,
- 					BGP_NOTIFY_SUBCODE_UNSPECIFIC);
-+			pnt += length;
- 			return BGP_Stop;
- 		}
- 
- 		/* Ignore capability when override-capability is set. */
- 		if (CHECK_FLAG(peer->flags, PEER_FLAG_OVERRIDE_CAPABILITY))
--			continue;
-+			goto done;
- 
- 		capability = lookup_msg(capcode_str, hdr->code, "Unknown");
- 
-@@ -3165,7 +3167,7 @@ static int bgp_capability_msg_parse(struct peer *peer, uint8_t *pnt,
- 					 peer, capability,
- 					 sizeof(struct capability_mp_data),
- 					 hdr->length);
--				return BGP_Stop;
-+				goto done;
- 			}
- 
- 			memcpy(&mpc, pnt + 3, sizeof(struct capability_mp_data));
-@@ -3180,7 +3182,7 @@ static int bgp_capability_msg_parse(struct peer *peer, uint8_t *pnt,
- 						   peer, capability,
- 						   iana_afi2str(pkt_afi),
- 						   iana_safi2str(pkt_safi));
--				continue;
-+				goto done;
- 			}
- 
- 			/* Address family check.  */
-@@ -3207,7 +3209,7 @@ static int bgp_capability_msg_parse(struct peer *peer, uint8_t *pnt,
- 				if (peer_active_nego(peer))
- 					bgp_clear_route(peer, afi, safi);
- 				else
--					return BGP_Stop;
-+					goto done;
- 			}
- 			break;
- 		case CAPABILITY_CODE_RESTART:
-@@ -3217,7 +3219,7 @@ static int bgp_capability_msg_parse(struct peer *peer, uint8_t *pnt,
- 				bgp_notify_send(peer->connection,
- 						BGP_NOTIFY_CEASE,
- 						BGP_NOTIFY_SUBCODE_UNSPECIFIC);
--				return BGP_Stop;
-+				goto done;
- 			}
- 
- 			bgp_dynamic_capability_graceful_restart(pnt, action,
-@@ -3243,7 +3245,7 @@ static int bgp_capability_msg_parse(struct peer *peer, uint8_t *pnt,
- 				bgp_notify_send(peer->connection,
- 						BGP_NOTIFY_CEASE,
- 						BGP_NOTIFY_SUBCODE_UNSPECIFIC);
--				return BGP_Stop;
-+				goto done;
- 			}
- 
- 			uint8_t role;
-@@ -3265,6 +3267,7 @@ static int bgp_capability_msg_parse(struct peer *peer, uint8_t *pnt,
- 			break;
- 		}
- 
-+done:
- 		pnt += hdr->length + 3;
- 	}
- 
--- 
-2.34.1
-
diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2024-31950.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2024-31950.patch
deleted file mode 100644
index c579ec283e..0000000000
--- a/meta-networking/recipes-protocols/frr/frr/CVE-2024-31950.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From f69d1313b19047d3d83fc2b36a518355b861dfc4 Mon Sep 17 00:00:00 2001
-From: Olivier Dugeon <olivier.dugeon@orange.com>
-Date: Wed, 3 Apr 2024 16:28:23 +0200
-Subject: [PATCH] ospfd: Solved crash in RI parsing with OSPF TE
-
-Iggy Frankovic discovered another ospfd crash when performing fuzzing of OSPF
-LSA packets. The crash occurs in ospf_te_parse_ri() function when attemping to
-read Segment Routing subTLVs. The original code doesn't check if the size of
-the SR subTLVs have the correct length. In presence of erronous LSA, this will
-cause a buffer overflow and ospfd crash.
-
-This patch introduces new verification of the subTLVs size for Router
-Information TLV.
-
-Co-authored-by: Iggy Frankovic <iggyfran@amazon.com>
-Signed-off-by: Olivier Dugeon <olivier.dugeon@orange.com>
-
-CVE: CVE-2024-31950
-Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/f69d1313b19047d3d83fc2b36a518355b861dfc4]
-
-Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
----
- ospfd/ospf_te.c | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/ospfd/ospf_te.c b/ospfd/ospf_te.c
-index 359dc1f5d4b8..091669d8ed36 100644
---- a/ospfd/ospf_te.c
-+++ b/ospfd/ospf_te.c
-@@ -2456,6 +2456,9 @@ static int ospf_te_parse_ri(struct ls_ted *ted, struct ospf_lsa *lsa)
- 
- 		switch (ntohs(tlvh->type)) {
- 		case RI_SR_TLV_SR_ALGORITHM:
-+			if (TLV_BODY_SIZE(tlvh) < 1 ||
-+			    TLV_BODY_SIZE(tlvh) > ALGORITHM_COUNT)
-+				break;
- 			algo = (struct ri_sr_tlv_sr_algorithm *)tlvh;
- 
- 			for (int i = 0; i < ntohs(algo->header.length); i++) {
-@@ -2480,6 +2483,8 @@ static int ospf_te_parse_ri(struct ls_ted *ted, struct ospf_lsa *lsa)
- 			break;
- 
- 		case RI_SR_TLV_SRGB_LABEL_RANGE:
-+			if (TLV_BODY_SIZE(tlvh) != RI_SR_TLV_LABEL_RANGE_SIZE)
-+				break;
- 			range = (struct ri_sr_tlv_sid_label_range *)tlvh;
- 			size = GET_RANGE_SIZE(ntohl(range->size));
- 			lower = GET_LABEL(ntohl(range->lower.value));
-@@ -2497,6 +2502,8 @@ static int ospf_te_parse_ri(struct ls_ted *ted, struct ospf_lsa *lsa)
- 			break;
- 
- 		case RI_SR_TLV_SRLB_LABEL_RANGE:
-+			if (TLV_BODY_SIZE(tlvh) != RI_SR_TLV_LABEL_RANGE_SIZE)
-+				break;
- 			range = (struct ri_sr_tlv_sid_label_range *)tlvh;
- 			size = GET_RANGE_SIZE(ntohl(range->size));
- 			lower = GET_LABEL(ntohl(range->lower.value));
-@@ -2514,6 +2521,8 @@ static int ospf_te_parse_ri(struct ls_ted *ted, struct ospf_lsa *lsa)
- 			break;
- 
- 		case RI_SR_TLV_NODE_MSD:
-+			if (TLV_BODY_SIZE(tlvh) < RI_SR_TLV_NODE_MSD_SIZE)
-+				break;
- 			msd = (struct ri_sr_tlv_node_msd *)tlvh;
- 			if ((CHECK_FLAG(node->flags, LS_NODE_MSD))
- 			    && (node->msd == msd->value))
---
-2.34.1
\ No newline at end of file
diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2024-31951.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2024-31951.patch
deleted file mode 100644
index 7f19b0312a..0000000000
--- a/meta-networking/recipes-protocols/frr/frr/CVE-2024-31951.patch
+++ /dev/null
@@ -1,110 +0,0 @@
-From 5557a289acdaeec8cc63ffc97b5c2abf6dee7b3a Mon Sep 17 00:00:00 2001
-From: Olivier Dugeon <olivier.dugeon@orange.com>
-Date: Fri, 5 Apr 2024 12:57:11 +0200
-Subject: [PATCH] ospfd: Correct Opaque LSA Extended parser
-
-Iggy Frankovic discovered another ospfd crash when performing fuzzing of OSPF
-LSA packets. The crash occurs in ospf_te_parse_ext_link() function when
-attemping to read Segment Routing Adjacency SID subTLVs. The original code
-doesn't check if the size of the Extended Link TLVs and subTLVs have the correct
-length. In presence of erronous LSA, this will cause a buffer overflow and ospfd
-crashes.
-
-This patch introduces new verification of the subTLVs size for Extended Link
-TLVs and subTLVs. Similar check has been also introduced for the Extended
-Prefix TLV.
-
-Co-authored-by: Iggy Frankovic <iggyfran@amazon.com>
-Signed-off-by: Olivier Dugeon <olivier.dugeon@orange.com>
-
-CVE: CVE-2024-31951
-Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/5557a289acdaeec8cc63ffc97b5c2abf6dee7b3a]
-
-Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
----
- ospfd/ospf_te.c | 35 +++++++++++++++++++++++++++++++++--
- 1 file changed, 33 insertions(+), 2 deletions(-)
-
-diff --git a/ospfd/ospf_te.c b/ospfd/ospf_te.c
-index 091669d8ed36..e68f9444f512 100644
---- a/ospfd/ospf_te.c
-+++ b/ospfd/ospf_te.c
-@@ -2620,6 +2620,7 @@ static int ospf_te_parse_ext_pref(struct ls_ted *ted, struct ospf_lsa *lsa)
- 	struct ext_tlv_prefix *ext;
- 	struct ext_subtlv_prefix_sid *pref_sid;
- 	uint32_t label;
-+	uint16_t len, size;
- 
- 	/* Get corresponding Subnet from Link State Data Base */
- 	ext = (struct ext_tlv_prefix *)TLV_HDR_TOP(lsa->data);
-@@ -2641,6 +2642,18 @@ static int ospf_te_parse_ext_pref(struct ls_ted *ted, struct ospf_lsa *lsa)
- 	ote_debug("  |- Process Extended Prefix LSA %pI4 for subnet %pFX",
- 		  &lsa->data->id, &pref);
- 
-+	/*
-+	 * Check Extended Prefix TLV size against LSA size
-+	 * as only one TLV is allowed per LSA
-+	 */
-+	len = TLV_BODY_SIZE(&ext->header);
-+	size = lsa->size - (OSPF_LSA_HEADER_SIZE + TLV_HDR_SIZE);
-+	if (len != size || len <= 0) {
-+		ote_debug("  |- Wrong TLV size: %u instead of %u",
-+			  (uint32_t)len, (uint32_t)size);
-+		return -1;
-+	}
-+
- 	/* Initialize TLV browsing */
- 	ls_pref = subnet->ls_pref;
- 	pref_sid = (struct ext_subtlv_prefix_sid *)((char *)(ext) + TLV_HDR_SIZE
-@@ -2751,8 +2764,20 @@ static int ospf_te_parse_ext_link(struct ls_ted *ted, struct ospf_lsa *lsa)
- 	ote_debug("  |- Process Extended Link LSA %pI4 for edge %pI4",
- 		  &lsa->data->id, &edge->attributes->standard.local);
- 
--	/* Initialize TLV browsing */
--	len = TLV_BODY_SIZE(&ext->header) - EXT_TLV_LINK_SIZE;
-+	/*
-+	 * Check Extended Link TLV size against LSA size
-+	 * as only one TLV is allowed per LSA
-+	 */
-+	len = TLV_BODY_SIZE(&ext->header);
-+	i = lsa->size - (OSPF_LSA_HEADER_SIZE + TLV_HDR_SIZE);
-+	if (len != i || len <= 0) {
-+		ote_debug("  |- Wrong TLV size: %u instead of %u",
-+			  (uint32_t)len, (uint32_t)i);
-+		return -1;
-+	}
-+
-+	/* Initialize subTLVs browsing */
-+	len -= EXT_TLV_LINK_SIZE;
- 	tlvh = (struct tlv_header *)((char *)(ext) + TLV_HDR_SIZE
- 				     + EXT_TLV_LINK_SIZE);
- 	for (; sum < len; tlvh = TLV_HDR_NEXT(tlvh)) {
-@@ -2762,6 +2787,8 @@ static int ospf_te_parse_ext_link(struct ls_ted *ted, struct ospf_lsa *lsa)
- 
- 		switch (ntohs(tlvh->type)) {
- 		case EXT_SUBTLV_ADJ_SID:
-+			if (TLV_BODY_SIZE(tlvh) != EXT_SUBTLV_ADJ_SID_SIZE)
-+				break;
- 			adj = (struct ext_subtlv_adj_sid *)tlvh;
- 			label = CHECK_FLAG(adj->flags,
- 					   EXT_SUBTLV_LINK_ADJ_SID_VFLG)
-@@ -2788,6 +2815,8 @@ static int ospf_te_parse_ext_link(struct ls_ted *ted, struct ospf_lsa *lsa)
- 
- 			break;
- 		case EXT_SUBTLV_LAN_ADJ_SID:
-+			if (TLV_BODY_SIZE(tlvh) != EXT_SUBTLV_LAN_ADJ_SID_SIZE)
-+				break;
- 			ladj = (struct ext_subtlv_lan_adj_sid *)tlvh;
- 			label = CHECK_FLAG(ladj->flags,
- 					   EXT_SUBTLV_LINK_ADJ_SID_VFLG)
-@@ -2817,6 +2846,8 @@ static int ospf_te_parse_ext_link(struct ls_ted *ted, struct ospf_lsa *lsa)
- 
- 			break;
- 		case EXT_SUBTLV_RMT_ITF_ADDR:
-+			if (TLV_BODY_SIZE(tlvh) != EXT_SUBTLV_RMT_ITF_ADDR_SIZE)
-+				break;
- 			rmt = (struct ext_subtlv_rmt_itf_addr *)tlvh;
- 			if (CHECK_FLAG(atr->flags, LS_ATTR_NEIGH_ADDR)
- 			    && IPV4_ADDR_SAME(&atr->standard.remote,
---
-2.34.1
\ No newline at end of file
diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2024-34088.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2024-34088.patch
deleted file mode 100644
index 72dffb1328..0000000000
--- a/meta-networking/recipes-protocols/frr/frr/CVE-2024-34088.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From 8c177d69e32b91b45bda5fc5da6511fa03dc11ca Mon Sep 17 00:00:00 2001
-From: Olivier Dugeon <olivier.dugeon@orange.com>
-Date: Tue, 16 Apr 2024 16:42:06 +0200
-Subject: [PATCH] ospfd: protect call to get_edge() in ospf_te.c
-
-During fuzzing, Iggy Frankovic discovered that get_edge() function in ospf_te.c
-could return null pointer, in particular when the link_id or advertised router
-IP addresses are fuzzed. As the null pointer returned by get_edge() function is
-not handlei by calling functions, this could cause ospfd crash.
-
-This patch introduces new verification of returned pointer by get_edge()
-function and stop the processing in case of null pointer. In addition, link ID
-and advertiser router ID are validated before calling ls_find_edge_by_key() to
-avoid the creation of a new edge with an invalid key.
-
-CVE-2024-34088
-
-Co-authored-by: Iggy Frankovic <iggyfran@amazon.com>
-Signed-off-by: Olivier Dugeon <olivier.dugeon@orange.com>
-
-CVE: CVE-2024-34088
-Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/8c177d69e32b91b45bda5fc5da6511fa03dc11ca]
-
-Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
----
- ospfd/ospf_te.c | 19 ++++++++++++++++---
- 1 file changed, 16 insertions(+), 3 deletions(-)
-
-diff --git a/ospfd/ospf_te.c b/ospfd/ospf_te.c
-index e68f9444f512..d57990e1a174 100644
---- a/ospfd/ospf_te.c
-+++ b/ospfd/ospf_te.c
-@@ -1670,6 +1670,11 @@ static struct ls_edge *get_edge(struct ls_ted *ted, struct ls_node_id adv,
- 	struct ls_edge *edge;
- 	struct ls_attributes *attr;
- 
-+	/* Check that Link ID and Node ID are valid */
-+	if (IPV4_NET0(link_id.s_addr) || IPV4_NET0(adv.id.ip.addr.s_addr) ||
-+	    adv.origin != OSPFv2)
-+		return NULL;
-+
- 	/* Search Edge that corresponds to the Link ID */
- 	key.family = AF_INET;
- 	IPV4_ADDR_COPY(&key.k.addr, &link_id);
-@@ -1743,6 +1748,10 @@ static void ospf_te_update_link(struct ls_ted *ted, struct ls_vertex *vertex,
- 
- 	/* Get Corresponding Edge from Link State Data Base */
- 	edge = get_edge(ted, vertex->node->adv, link_data);
-+	if (!edge) {
-+		ote_debug("  |- Found no edge from Link Data. Abort!");
-+		return;
-+	}
- 	attr = edge->attributes;
- 
- 	/* re-attached edge to vertex if needed */
-@@ -2246,11 +2255,11 @@ static int ospf_te_parse_te(struct ls_ted *ted, struct ospf_lsa *lsa)
- 	}
- 
- 	/* Get corresponding Edge from Link State Data Base */
--	if (IPV4_NET0(attr.standard.local.s_addr) && !attr.standard.local_id) {
--		ote_debug("  |- Found no TE Link local address/ID. Abort!");
-+	edge = get_edge(ted, attr.adv, attr.standard.local);
-+	if (!edge) {
-+		ote_debug("  |- Found no edge from Link local add./ID. Abort!");
- 		return -1;
- 	}
--	edge = get_edge(ted, attr.adv, attr.standard.local);
- 	old = edge->attributes;
- 
- 	ote_debug("  |- Process Traffic Engineering LSA %pI4 for Edge %pI4",
-@@ -2759,6 +2768,10 @@ static int ospf_te_parse_ext_link(struct ls_ted *ted, struct ospf_lsa *lsa)
- 	lnid.id.ip.area_id = lsa->area->area_id;
- 	ext = (struct ext_tlv_link *)TLV_HDR_TOP(lsa->data);
- 	edge = get_edge(ted, lnid, ext->link_data);
-+	if (!edge) {
-+		ote_debug("  |- Found no edge from Extended Link Data. Abort!");
-+		return -1;
-+	}
- 	atr = edge->attributes;
- 
- 	ote_debug("  |- Process Extended Link LSA %pI4 for edge %pI4",
---
-2.34.1
\ No newline at end of file
diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2024-44070.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2024-44070.patch
deleted file mode 100644
index 87bd16efa6..0000000000
--- a/meta-networking/recipes-protocols/frr/frr/CVE-2024-44070.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 335dc7f0421dc5b59a50795f21f28bd92ed4ef12 Mon Sep 17 00:00:00 2001
-From: Donatas Abraitis <donatas@opensourcerouting.org>
-Date: Wed, 31 Jul 2024 08:35:14 +0300
-Subject: [PATCH] bgpd: Check the actual remaining stream length before taking
- TLV value
-
-```
-    0 0xb50b9f898028 in __sanitizer_print_stack_trace (/home/ubuntu/frr-public/frr_public_private-libfuzzer/bgpd/.libs/bgpd+0x368028) (BuildId: 3292703ed7958b20076550c967f879db8dc27ca7)
-    1 0xb50b9f7ed8e4 in fuzzer::PrintStackTrace() (/home/ubuntu/frr-public/frr_public_private-libfuzzer/bgpd/.libs/bgpd+0x2bd8e4) (BuildId: 3292703ed7958b20076550c967f879db8dc27ca7)
-    2 0xb50b9f7d4d9c in fuzzer::Fuzzer::CrashCallback() (/home/ubuntu/frr-public/frr_public_private-libfuzzer/bgpd/.libs/bgpd+0x2a4d9c) (BuildId: 3292703ed7958b20076550c967f879db8dc27ca7)
-    3 0xe0d12d7469cc  (linux-vdso.so.1+0x9cc) (BuildId: 1a77697e9d723fe22246cfd7641b140c427b7e11)
-    4 0xe0d12c88f1fc in __pthread_kill_implementation nptl/pthread_kill.c:43:17
-    5 0xe0d12c84a678 in gsignal signal/../sysdeps/posix/raise.c:26:13
-    6 0xe0d12c83712c in abort stdlib/abort.c:79:7
-    7 0xe0d12d214724 in _zlog_assert_failed /home/ubuntu/frr-public/frr_public_private-libfuzzer/lib/zlog.c:789:2
-    8 0xe0d12d1285e4 in stream_get /home/ubuntu/frr-public/frr_public_private-libfuzzer/lib/stream.c:324:3
-    9 0xb50b9f8e47c4 in bgp_attr_encap /home/ubuntu/frr-public/frr_public_private-libfuzzer/bgpd/bgp_attr.c:2758:3
-    10 0xb50b9f8dcd38 in bgp_attr_parse /home/ubuntu/frr-public/frr_public_private-libfuzzer/bgpd/bgp_attr.c:3783:10
-    11 0xb50b9faf74b4 in bgp_update_receive /home/ubuntu/frr-public/frr_public_private-libfuzzer/bgpd/bgp_packet.c:2383:20
-    12 0xb50b9faf1dcc in bgp_process_packet /home/ubuntu/frr-public/frr_public_private-libfuzzer/bgpd/bgp_packet.c:4075:11
-    13 0xb50b9f8c90d0 in LLVMFuzzerTestOneInput /home/ubuntu/frr-public/frr_public_private-libfuzzer/bgpd/bgp_main.c:582:3
-```
-
-CVE: CVE-2024-44070
-Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/21cd931a5f9303e12104c72ce31ca383c0c57514]
-
-Reported-by: Iggy Frankovic <iggyfran@amazon.com>
-Signed-off-by: Donatas Abraitis <donatas@opensourcerouting.org>
-(cherry picked from commit 0998b38e4d61179441f90dd7e7fd6a3a8b7bd8c5)
-(cherry picked from commit 21cd931a5f9303e12104c72ce31ca383c0c57514)
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- bgpd/bgp_attr.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/bgpd/bgp_attr.c b/bgpd/bgp_attr.c
-index 797f05d606..cc63251cc8 100644
---- a/bgpd/bgp_attr.c
-+++ b/bgpd/bgp_attr.c
-@@ -2718,6 +2718,14 @@ static int bgp_attr_encap(struct bgp_attr_parser_args *args)
- 						  args->total);
- 		}
- 
-+		if (STREAM_READABLE(BGP_INPUT(peer)) < sublength) {
-+			zlog_err("Tunnel Encap attribute sub-tlv length %d exceeds remaining stream length %zu",
-+				 sublength, STREAM_READABLE(BGP_INPUT(peer)));
-+			return bgp_attr_malformed(args,
-+						  BGP_NOTIFY_UPDATE_OPT_ATTR_ERR,
-+						  args->total);
-+		}
-+
- 		/* alloc and copy sub-tlv */
- 		/* TBD make sure these are freed when attributes are released */
- 		tlv = XCALLOC(MTYPE_ENCAP_TLV,
diff --git a/meta-networking/recipes-protocols/frr/frr_9.1.bb b/meta-networking/recipes-protocols/frr/frr_9.1.3.bb
similarity index 94%
rename from meta-networking/recipes-protocols/frr/frr_9.1.bb
rename to meta-networking/recipes-protocols/frr/frr_9.1.3.bb
index ce9876c79f..f3b4816941 100644
--- a/meta-networking/recipes-protocols/frr/frr_9.1.bb
+++ b/meta-networking/recipes-protocols/frr/frr_9.1.3.bb
@@ -13,15 +13,9 @@ LIC_FILES_CHKSUM = "file://doc/licenses/GPL-2.0;md5=b234ee4d69f5fce4486a80fdaf4a
 SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/9.1 \
            file://frr.pam \
            file://0001-zebra-Mimic-GNU-basename-API-for-non-glibc-library-e.patch \
-           file://CVE-2024-34088.patch \
-           file://CVE-2024-31950.patch \
-           file://CVE-2024-31951.patch \
-           file://CVE-2024-31948.patch \
-           file://CVE-2024-31949.patch \
-           file://CVE-2024-44070.patch \
            "
 
-SRCREV = "ca2d6f0f1e000951224a18973cc1827f7f5215b5"
+SRCREV = "ad1766d17be022587fe05ebe1a7bf10e1b7dce19"
 
 UPSTREAM_CHECK_GITTAGREGEX = "frr-(?P<pver>\d+(\.\d+)+)$"
 

