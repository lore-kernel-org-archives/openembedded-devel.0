Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EEF0D1CDC6
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 09:56:20 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4112.1765274169941996426
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 01:56:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=s+D5dqyQ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765274170; x=1796810170;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JgI8zniK3sxKG9aKxampNT3FWHpNw2Cgl9GxwxWlF2A=;
  b=s+D5dqyQL4p1jkyVJ+pD2scp+ImPy+WMh7BwJGu/Gl2EywJ2ahPhmpdE
   NGEIFt/f8TXW4HTXQdNBihOrLpu3fEWAVGFpNs9ocKR1+01n9hbN8GhIb
   juskqe/sbLFKDhMjM46u/ggKuUlw92NXyblWHv5cUZg03Qv1tnrBuxX64
   jSnkQCS7Xfa79isqwfNSeY083XUKVgqQkmfDAxBpU/5pIO0SKz9f5/jI8
   lO1c7P8drCsqe4/WqUVOM7gooKox+BasskJ3LAI0xZSuyILTpLrpAGT8/
   oAZfAQaIfNb0rkWFNml4GP5C5ew99jJSavyjPnIpHxovWJ9FiVwYYCQWY
   Q==;
X-CSE-ConnectionGUID: Erna7vWLStWzXzyDJZyEfg==
X-CSE-MsgGUID: zA0joYWTRJe4fYaFNjSM/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="221968091"
X-IronPort-AV: E=Sophos;i="6.20,261,1758553200"; 
   d="scan'208";a="221968091"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 18:56:08 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 49E52100036C
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:08 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id F407EC00D47
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:07 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 910D920002AF;
	Tue,  9 Dec 2025 09:56:05 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/38] ldns: upgrade 1.8.4 -> 1.9.0
Date: Tue,  9 Dec 2025 17:55:20 +0800
Message-ID: <20251209095552.690-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251209095552.690-1-wangmy@fujitsu.com>
References: <20251209095552.690-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 09:56:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122410

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* PR #246: Make ldns_calc_keytag() available for CDNSKEY RR
* PR #247: Make ldns_key_rr2ds() available for CDNSKEY RR
* PR #248: Make ldns_rr_compare_{ds,ds_dnskey}() available for
  CDS and CDNSKEY RRs.
* PR #245: Make drill trace use IPv6 when used with -6
* Fix #254: Unquoted "value" rdata for CAA records fail to validate.
  Follows the long string unquoted syntax from RFC8659, section 4.1.1.
* Fix #266: ldns-read-zone -u fails if a type is the only type in a
  window and the type modulo 256 is equal to zero.
* Fix #271: Intermittent build failure with multi-job
  builds (make -j).
* Add ldns-verify-zone -s option. It checks all signature results,
  instead of passing by when one RRSIG validates. That prints output
  for spurious RRSIGs, the failures for them.
* Fix RR types NSAP-PTR, GPOS and RESINFO to print unquoted strings.
* Fix memory leak when trying to read zones that have equal RRs.
  the ldns_dnssec_*_add_rr() functions now return LDNS_STATUS_EQUAL_RR
  when an already existing RR is tried to be added. This is a API
  change, hence this also bumps the version to 1.9.0
* PR #282: ensure returning pkt with LDNS_STATUS_OK.
* PR #286: Fix RR Type AMTRELAY type nogateway, to print relay '.',
  and memory leaks in parsing it.
* DSYNC is no longer a draft RR type and compiled by default
* RFC 9824 support: Compact Denial of Existence in DNSSEC
* The HHIT and BRID draft RR types
* PR #249: If RNG is already seeded, return early.
* PR #221: Improve error messages.
* PR #256: Use SWIG_AppendOutput to support swig 4.3
* PR #188: Homogenize paths for source files during compilation
* Fix #283: ldns-walk fails after update from 1.8.3 to 1.8.4
* PR #200: Allow compiled tests to link to ldns statically via
  environment variable.
* PR #220: Optionally exclude ZONEMD RRs in ldns-compare-zone
* Fix #285: A WALLET RR breaks TXT signing.
* Fix #287: ldns-verify-zone hangs with missing NSEC3 RRs.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/ldns/{ldns_1.8.4.bb => ldns_1.9.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ldns/{ldns_1.8.4.bb => ldns_1.9.0.bb} (89%)

diff --git a/meta-oe/recipes-devtools/ldns/ldns_1.8.4.bb b/meta-oe/recipes-devtools/ldns/ldns_1.9.0.bb
similarity index 89%
rename from meta-oe/recipes-devtools/ldns/ldns_1.8.4.bb
rename to meta-oe/recipes-devtools/ldns/ldns_1.9.0.bb
index f071f579df..de75c73207 100644
--- a/meta-oe/recipes-devtools/ldns/ldns_1.8.4.bb
+++ b/meta-oe/recipes-devtools/ldns/ldns_1.9.0.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34330f15b2b4abbbaaa7623f79a6a019"
 
 SRC_URI = "https://www.nlnetlabs.nl/downloads/ldns/ldns-${PV}.tar.gz"
-SRC_URI[sha256sum] = "838b907594baaff1cd767e95466a7745998ae64bc74be038dccc62e2de2e4247"
+SRC_URI[sha256sum] = "abaeed2858fbea84a4eb9833e19e7d23380cc0f3d9b6548b962be42276ffdcb3"
 
 DEPENDS = "openssl"
 
-- 
2.43.0


