Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B37D7C4450F
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 05:58:47 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7697.1784267919794538422
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jul 2026 22:58:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=MjHgMnQM;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=12087; q=dns/txt;
  s=iport01; t=1784267919; x=1785477519;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rvMSYH8r8S91CwIwf4enGZ+1/MQG0EB/BAZyz0bBLQ4=;
  b=MjHgMnQMu1LFiMx5rYRpw6Fhf4SPDO+KI1Wt1TxcdAoHwxQHM/SaIGBK
   x41Bu9oZR6yOyotl3xO8u3+W309AoYTxCpmqVmqX0nXy0ck91Vgc7FaFK
   U/kkTGVy0y46QCOg5m9BvattnNPRmKbrAqRrX3VD8pv8IBb9lU6/xYO7j
   jkqkYLmzHY4VXmaDQDB82ELSSDKEpV4t5bVJxon2aTxPP48omCAksEaJz
   qoMinMZrIf+tVsClZA7dq8kWBFjA+zhpyRSRmknq22RO9rgtXR7k4lZaw
   ok9J8W8PlMAnI2VIfRicDQKKUWrzZrSBVxds7PKZhaFPr/jY0mjNACLUk
   A==;
X-CSE-ConnectionGUID: Lx3Ag6flToyk5mV9ew10AA==
X-CSE-MsgGUID: jFCgTdNnSNyVfwjAuipZZg==
X-IPAS-Result: =?us-ascii?q?A0AmAABWw1lq/4//Ja1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ0X0JJjHKHN4E1bIEWnQiBfg8BAQEPRA0EAQGSWQImNAkOAQIEAwIDAQEBA?=
 =?us-ascii?q?QEBAQEBAQELAQEFAQEBAgEHBYEOE4ZPDYZaAS0LARgBWQMBAlojGQiDAgGCd?=
 =?us-ascii?q?AMRBr1FgXkzgQGDKAE/AkNQ2y4BCxQBgTgBhT6IIFwYAYR8JxsbgXKBFYE7g?=
 =?us-ascii?q?Th2gQWBXAKBJ4Z+BIIigQyBWh6QAUiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yH?=
 =?us-ascii?q?YEjPheBDBsHBYEdgTqBAIR2Ix8DOX+BL3VKdy1qEheBToIUgT4DCxgNSBEsN?=
 =?us-ascii?q?xQbBD5uB41II4FNcgEsThMBExgigTwkAqYboRIKKIN1jCGVOhozqmwLmH2LJ?=
 =?us-ascii?q?4Jjig2MQ4RpgWg8gVlwFYMiCUoZD1aNVAMBCguDYIRvyVE8NQIJMgEBBwIHD?=
 =?us-ascii?q?gMLgWiQAIF+AQE?=
IronPort-Data: A9a23:7HqIHq1S8sfhAgWB0/bD5YNwkn2cJEfYwER7XKvMYLTBsI5bp2cFy
 WseX2mDP6zcMWGnKIp1Ptjg8xwGucWDz4QySgs63Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g2EtbDpOg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGKFFtFIJG9OJLBnBNq
 PkmeT0SN0iqrrfjqF67YrEEasULNsLnOsYb/3pn1zycVahgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUibC/FMEg9/5JYWkOqlnHDjczpwo1OOrq1x6G/WpOB0+OW0aYSPIoTaHK25mG6ai
 EnJw2jfBCo8JeKR1jis73O0tN3AyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBWC4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rHnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:FS7Cvak+PZ9qMlSP3dx8L4PaV/PpDfIc3DAbv31ZSRFFG/Fw8P
 re/sjzuiWbtN98YhwdcLO7Scq9qA3nlKKdiLN5VdzJYOCMggSVxe9ZgbcKuweBJwTOsshAyK
 xnb69yTPf0DVR8kILGxTPQKadE/DFCm5rY4ts3CBxWPGVXV50=
X-Talos-CUID: 9a23:CmX17m3eKkE7V8AXYGPdLbxfPtB+W3KDwnPsJF67VGNXGbCKEAe50fYx
X-Talos-MUID: 9a23:6+BdHgup2o+kRZiyuc2nhh9JO/tkxaKVLlEzn4oEktSFLR5CNGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,168,1779148800"; 
   d="scan'208";a="511620081"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Jul 2026 05:58:37 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 5DDBC1800039B
	for <openembedded-devel@lists.openembedded.org>; Fri, 17 Jul 2026 05:58:36 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 77333CC037D; Fri, 17 Jul 2026 11:28:34 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][wrynose][PATCH] ldns: fix CVE-2026-10846
Date: Fri, 17 Jul 2026 11:28:28 +0530
Message-Id: <20260717055828.2904536-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jul 2026 05:58:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128243

From: Deepak Rathore <deeratho@cisco.com>

This patch backports the upstream fixes released in ldns 1.9.2 for
CVE-2026-10846.The upstream commits are referenced in [1], [2], and
[3], and the public CVE advisory is referenced in [4].The individual
backported commit links are also recorded in the embedded patch headers.

[1] https://github.com/NLnetLabs/ldns/commit/a21fb16686bbe3355886905f95e13eab5144d805
[2] https://github.com/NLnetLabs/ldns/commit/9ea51a68d458b43a17ccf4ee98a71325300df524
[3] https://github.com/NLnetLabs/ldns/commit/dc117528dfc60b2dda82d9171b7e9e0b6890da2f
[4] https://www.nlnetlabs.nl/downloads/ldns/CVE-2026-10846.txt

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../ldns/ldns/CVE-2026-10846_p1.patch         | 117 ++++++++++++++++++
 .../ldns/ldns/CVE-2026-10846_p2.patch         | 117 ++++++++++++++++++
 .../ldns/ldns/CVE-2026-10846_p3.patch         |  34 +++++
 meta-oe/recipes-devtools/ldns/ldns_1.9.0.bb   |   6 +-
 4 files changed, 273 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/ldns/ldns/CVE-2026-10846_p1.patch
 create mode 100644 meta-oe/recipes-devtools/ldns/ldns/CVE-2026-10846_p2.patch
 create mode 100644 meta-oe/recipes-devtools/ldns/ldns/CVE-2026-10846_p3.patch

diff --git a/meta-oe/recipes-devtools/ldns/ldns/CVE-2026-10846_p1.patch b/meta-oe/recipes-devtools/ldns/ldns/CVE-2026-10846_p1.patch
new file mode 100644
index 0000000000..9456f62281
--- /dev/null
+++ b/meta-oe/recipes-devtools/ldns/ldns/CVE-2026-10846_p1.patch
@@ -0,0 +1,117 @@
+From 4ebda24000ee83704af0998251b98c89a2285985 Mon Sep 17 00:00:00 2001
+From: "W.C.A. Wijngaards" <wouter@nlnetlabs.nl>
+Date: Fri, 29 May 2026 09:44:27 +0200
+Subject: [PATCH] Fix to check address and port and TXID
+
+CVE: CVE-2026-10846
+Upstream-Status: Backport [https://github.com/NLnetLabs/ldns/commit/a21fb16686bbe3355886905f95e13eab5144d805]
+
+(cherry picked from commit a21fb16686bbe3355886905f95e13eab5144d805)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ net.c | 65 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
+ 1 file changed, 64 insertions(+), 1 deletion(-)
+
+diff --git a/net.c b/net.c
+index e944d018..8b8da108 100644
+--- a/net.c
++++ b/net.c
+@@ -441,6 +441,50 @@ ldns_udp_bgsend2(ldns_buffer *qbin,
+ 	return ldns_udp_bgsend_from(qbin, to, tolen, NULL, 0, timeout);
+ }
+ 
++/** helper sockaddr compare function. returns -1, 0 or 1. */
++static int
++ldns_sockaddr_cmp(const struct sockaddr_storage* addr1, socklen_t len1,
++	const struct sockaddr_storage* addr2, socklen_t len2)
++{
++	struct sockaddr_in* p1_in = (struct sockaddr_in*)addr1;
++	struct sockaddr_in* p2_in = (struct sockaddr_in*)addr2;
++	struct sockaddr_in6* p1_in6 = (struct sockaddr_in6*)addr1;
++	struct sockaddr_in6* p2_in6 = (struct sockaddr_in6*)addr2;
++	if(len1 < len2)
++		return -1;
++	if(len1 > len2)
++		return 1;
++	assert(len1 == len2);
++	if( p1_in->sin_family < p2_in->sin_family)
++		return -1;
++	if( p1_in->sin_family > p2_in->sin_family)
++		return 1;
++	assert( p1_in->sin_family == p2_in->sin_family );
++	/* compare ip4 */
++	if( p1_in->sin_family == AF_INET ) {
++		/* just order it, ntohs not required */
++		if(p1_in->sin_port < p2_in->sin_port)
++			return -1;
++		if(p1_in->sin_port > p2_in->sin_port)
++			return 1;
++		assert(p1_in->sin_port == p2_in->sin_port);
++		return memcmp(&p1_in->sin_addr, &p2_in->sin_addr,
++			sizeof(p1_in->sin_addr));
++	} else if (p1_in6->sin6_family == AF_INET6) {
++		/* just order it, ntohs not required */
++		if(p1_in6->sin6_port < p2_in6->sin6_port)
++			return -1;
++		if(p1_in6->sin6_port > p2_in6->sin6_port)
++			return 1;
++		assert(p1_in6->sin6_port == p2_in6->sin6_port);
++		return memcmp(&p1_in6->sin6_addr, &p2_in6->sin6_addr,
++			sizeof(p1_in6->sin6_addr));
++	} else {
++		/* eek unknown type, perform this comparison for sanity. */
++		return memcmp(addr1, addr2, len1);
++	}
++}
++
+ static ldns_status
+ ldns_udp_send_from(uint8_t **result, ldns_buffer *qbin,
+ 		const struct sockaddr_storage *to  , socklen_t tolen,
+@@ -449,6 +493,8 @@ ldns_udp_send_from(uint8_t **result, ldns_buffer *qbin,
+ {
+ 	int sockfd;
+ 	uint8_t *answer;
++	struct sockaddr_storage reply_addr;
++	socklen_t reply_addr_len;
+ 
+ 	sockfd = ldns_udp_bgsend_from(qbin, to, tolen, from, fromlen, timeout);
+ 
+@@ -467,13 +513,19 @@ ldns_udp_send_from(uint8_t **result, ldns_buffer *qbin,
+          * but returns a 'NETWORK_ERROR' much like a timeout. */
+         ldns_sock_nonblock(sockfd);
+ 
+-	answer = ldns_udp_read_wire(sockfd, answer_size, NULL, NULL);
++	reply_addr_len = sizeof(reply_addr);
++	answer = ldns_udp_read_wire(sockfd, answer_size, &reply_addr,
++		&reply_addr_len);
+ 	close_socket(sockfd);
+ 
+ 	if (!answer) {
+ 		/* oops */
+ 		return LDNS_STATUS_NETWORK_ERR;
+ 	}
++	/* Check that the reply came from the to addr. */
++	if(ldns_sockaddr_cmp(to, tolen, &reply_addr, reply_addr_len) != 0) {
++		return LDNS_STATUS_NETWORK_ERR;
++	}
+ 
+ 	*result = answer;
+ 	return LDNS_STATUS_OK;
+@@ -599,6 +651,17 @@ ldns_send_buffer(ldns_pkt **result, ldns_resolver *r, ldns_buffer *qb, ldns_rdf
+ 			ldns_resolver_set_nameserver_rtt(r, i, LDNS_RESOLV_RTT_INF);
+ 			status = send_status;
+ 		}
++		if(reply_bytes && ldns_buffer_limit(qb) >= 2) {
++			uint16_t txid = ldns_buffer_read_u16_at(qb, 0);
++			if(reply_size < 2 ||
++				ldns_read_uint16(reply_bytes) != txid) {
++				printf("wrong TXID!\n");
++				status = LDNS_STATUS_ERR; /* wrong ID */
++				LDNS_FREE(reply_bytes);
++				reply_bytes = NULL;
++				reply_size = 0;
++			}
++		}
+ 		
+ 		/* obey the fail directive */
+ 		if (!reply_bytes) {
diff --git a/meta-oe/recipes-devtools/ldns/ldns/CVE-2026-10846_p2.patch b/meta-oe/recipes-devtools/ldns/ldns/CVE-2026-10846_p2.patch
new file mode 100644
index 0000000000..be26c6b891
--- /dev/null
+++ b/meta-oe/recipes-devtools/ldns/ldns/CVE-2026-10846_p2.patch
@@ -0,0 +1,117 @@
+From 4414a52362e1ec09d2c60f1870e5398b78376e4a Mon Sep 17 00:00:00 2001
+From: Willem Toorop <willem@nlnetlabs.nl>
+Date: Tue, 2 Jun 2026 12:19:38 +0200
+Subject: [PATCH] Match question from query in response, and...
+
+... error codes for unmatched ID and for QDCOUNT != 1 in both queries
+and responses
+
+CVE: CVE-2026-10846
+Upstream-Status: Backport [https://github.com/NLnetLabs/ldns/commit/9ea51a68d458b43a17ccf4ee98a71325300df524]
+
+Backport Changes:
+- Omitted upstream test commit 7f6364cd7f595de766a43401bbecf935e042faa5
+  because the ldns recipe does not run the upstream test framework.
+
+(cherry picked from commit 9ea51a68d458b43a17ccf4ee98a71325300df524)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ error.c      |  6 ++++++
+ ldns/error.h |  5 ++++-
+ net.c        | 29 ++++++++++++++++++++++++++---
+ 3 files changed, 36 insertions(+), 4 deletions(-)
+
+diff --git a/error.c b/error.c
+index 5723aea9..4fc05d6d 100644
+--- a/error.c
++++ b/error.c
+@@ -191,6 +191,12 @@ ldns_lookup_table ldns_error_str[] = {
+ 		"at least 2 bytes of option data" },
+ 	{ LDNS_STATUS_EQUAL_RR,
+ 		"An identical RR already existed in the zone" },
++	{ LDNS_STATUS_ID_DID_NOT_MATCH,
++		"Response ID did not match the query ID" },
++	{ LDNS_STATUS_QDCOUNT_MUST_BE_ONE,
++		"The query section MUST contain exactly one question" },
++	{ LDNS_STATUS_QUERY_DID_NOT_MATCH,
++		"The question in the response did not match the query" },
+ 	{ 0, NULL }
+ };
+ 
+diff --git a/ldns/error.h b/ldns/error.h
+index a76eb2ec..41d64cc0 100644
+--- a/ldns/error.h
++++ b/ldns/error.h
+@@ -144,7 +144,10 @@ enum ldns_enum_status {
+ 	LDNS_STATUS_INVALID_SVCPARAM_VALUE,
+ 	LDNS_STATUS_NOT_EDE,
+ 	LDNS_STATUS_EDE_OPTION_MALFORMED,
+-	LDNS_STATUS_EQUAL_RR
++	LDNS_STATUS_EQUAL_RR,
++	LDNS_STATUS_ID_DID_NOT_MATCH,
++	LDNS_STATUS_QDCOUNT_MUST_BE_ONE,
++	LDNS_STATUS_QUERY_DID_NOT_MATCH
+ };
+ typedef enum ldns_enum_status ldns_status;
+ 
+diff --git a/net.c b/net.c
+index 8b8da108..7baec967 100644
+--- a/net.c
++++ b/net.c
+@@ -564,6 +564,10 @@ ldns_send_buffer(ldns_pkt **result, ldns_resolver *r, ldns_buffer *qb, ldns_rdf
+ 
+ 	assert(r != NULL);
+ 
++	/* The query should at least have one question */
++	if(ldns_buffer_limit(qb) < 6 || ldns_buffer_read_u16_at(qb, 4) != 1)
++		return LDNS_STATUS_QDCOUNT_MUST_BE_ONE;
++
+ 	status = LDNS_STATUS_OK;
+ 	rtt = ldns_resolver_rtt(r);
+ 	ns_array = ldns_resolver_nameservers(r);
+@@ -655,8 +659,7 @@ ldns_send_buffer(ldns_pkt **result, ldns_resolver *r, ldns_buffer *qb, ldns_rdf
+ 			uint16_t txid = ldns_buffer_read_u16_at(qb, 0);
+ 			if(reply_size < 2 ||
+ 				ldns_read_uint16(reply_bytes) != txid) {
+-				printf("wrong TXID!\n");
+-				status = LDNS_STATUS_ERR; /* wrong ID */
++				status = LDNS_STATUS_ID_DID_NOT_MATCH;
+ 				LDNS_FREE(reply_bytes);
+ 				reply_bytes = NULL;
+ 				reply_size = 0;
+@@ -671,7 +674,7 @@ ldns_send_buffer(ldns_pkt **result, ldns_resolver *r, ldns_buffer *qb, ldns_rdf
+ 					LDNS_FREE(src);
+ 				}
+ 				LDNS_FREE(ns);
+-				return LDNS_STATUS_ERR;
++				return status ? status : LDNS_STATUS_ERR;
+ 			} else {
+ 				LDNS_FREE(ns);
+ 				continue;
+@@ -733,6 +736,26 @@ ldns_send_buffer(ldns_pkt **result, ldns_resolver *r, ldns_buffer *qb, ldns_rdf
+ #endif /* HAVE_SSL */
+ 
+ 	LDNS_FREE(reply_bytes);
++	if (reply) {
++		ldns_pkt *query = NULL;
++
++		if(ldns_pkt_qdcount(reply) != 1) {
++			status = LDNS_STATUS_QDCOUNT_MUST_BE_ONE;
++			ldns_pkt_free(reply);
++			reply = NULL;
++
++		} else if(ldns_wire2pkt(&query
++		                , ldns_buffer_begin(qb)
++		                , ldns_buffer_position(qb)) != LDNS_STATUS_OK
++		|| ldns_pkt_qdcount(query) != 1
++		|| ldns_rr_compare(ldns_rr_list_rr(ldns_pkt_question(query),0)
++		                  ,ldns_rr_list_rr(ldns_pkt_question(reply),0))){
++			status = LDNS_STATUS_QUERY_DID_NOT_MATCH;
++			ldns_pkt_free(reply);
++			reply = NULL;
++		}
++		ldns_pkt_free(query);
++	}
+ 	if (result) {
+ 		*result = reply;
+ 	}
diff --git a/meta-oe/recipes-devtools/ldns/ldns/CVE-2026-10846_p3.patch b/meta-oe/recipes-devtools/ldns/ldns/CVE-2026-10846_p3.patch
new file mode 100644
index 0000000000..336f97b43e
--- /dev/null
+++ b/meta-oe/recipes-devtools/ldns/ldns/CVE-2026-10846_p3.patch
@@ -0,0 +1,34 @@
+From e9604a0e5d4a1a7b807f6ec27967c03e689127a7 Mon Sep 17 00:00:00 2001
+From: Willem Toorop <willem@nlnetlabs.nl>
+Date: Tue, 2 Jun 2026 12:42:38 +0200
+Subject: [PATCH] Issues from clang analysis
+
+CVE: CVE-2026-10846
+Upstream-Status: Backport [https://github.com/NLnetLabs/ldns/commit/dc117528dfc60b2dda82d9171b7e9e0b6890da2f]
+
+(cherry picked from commit dc117528dfc60b2dda82d9171b7e9e0b6890da2f)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ net.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/net.c b/net.c
+index 7baec967..4c1f4054 100644
+--- a/net.c
++++ b/net.c
+@@ -514,6 +514,7 @@ ldns_udp_send_from(uint8_t **result, ldns_buffer *qbin,
+         ldns_sock_nonblock(sockfd);
+ 
+ 	reply_addr_len = sizeof(reply_addr);
++	memset(&reply_addr, 0, reply_addr_len);
+ 	answer = ldns_udp_read_wire(sockfd, answer_size, &reply_addr,
+ 		&reply_addr_len);
+ 	close_socket(sockfd);
+@@ -524,6 +525,7 @@ ldns_udp_send_from(uint8_t **result, ldns_buffer *qbin,
+ 	}
+ 	/* Check that the reply came from the to addr. */
+ 	if(ldns_sockaddr_cmp(to, tolen, &reply_addr, reply_addr_len) != 0) {
++		free(answer);
+ 		return LDNS_STATUS_NETWORK_ERR;
+ 	}
+ 
diff --git a/meta-oe/recipes-devtools/ldns/ldns_1.9.0.bb b/meta-oe/recipes-devtools/ldns/ldns_1.9.0.bb
index de75c73207..415890b2b3 100644
--- a/meta-oe/recipes-devtools/ldns/ldns_1.9.0.bb
+++ b/meta-oe/recipes-devtools/ldns/ldns_1.9.0.bb
@@ -3,7 +3,11 @@ HOMEPAGE = "https://nlnetlabs.nl/ldns"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34330f15b2b4abbbaaa7623f79a6a019"
 
-SRC_URI = "https://www.nlnetlabs.nl/downloads/ldns/ldns-${PV}.tar.gz"
+SRC_URI = "https://www.nlnetlabs.nl/downloads/ldns/ldns-${PV}.tar.gz \
+           file://CVE-2026-10846_p1.patch \
+           file://CVE-2026-10846_p2.patch \
+           file://CVE-2026-10846_p3.patch \
+           "
 SRC_URI[sha256sum] = "abaeed2858fbea84a4eb9833e19e7d23380cc0f3d9b6548b962be42276ffdcb3"
 
 DEPENDS = "openssl"
-- 
2.35.6


