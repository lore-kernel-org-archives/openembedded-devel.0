Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 932D2C4450F
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 05:59:07 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7598.1784267944520929434
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jul 2026 22:59:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Yzd4wHD5;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=12158; q=dns/txt;
  s=iport01; t=1784267944; x=1785477544;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=h2JWpGvppxGBJYE+PdKTx7Q4Vk3/IoP1BeOtSVfe6a8=;
  b=Yzd4wHD5wIxuXZ/sc6sKg1VnL+CDSPdPIpO3cPRwlmUoIF/iplrO8kwI
   4jFDu4xrm6GJxi/0/z+EutFvIFwgm68+I7BP7x2PKT6lsB548ryYmOPiw
   NrX2NWNrFTC9F6DlXvRRpqOqqXC2FRYfWS+wLXM/jPMH+SXXjZa2NsSZE
   rQb6G/DRyC2L6BskobMcuAEW8wAJBJ85ziOMECU7SZzUd+Cs+qtZqE80X
   PBZa89socjD0+8x+aauPZqTwd3drQQGVDaXQrtBl9gXLtgKWgFtulomcR
   ML70I2b6WT8neX25NDaPxkHZ6IPugGGQs94txbG0yr0zFKwNO6dlwiNAN
   Q==;
X-CSE-ConnectionGUID: QpbUSpD/SgWe1j0IZPEtRw==
X-CSE-MsgGUID: lGTKV8BCS5yepywoc7lFGg==
X-IPAS-Result: =?us-ascii?q?A0BFAgBWw1lq/5P/Ja1aglmCV3RfQkmUKYE1bIEWnQiBf?=
 =?us-ascii?q?g8BAQEPRA0EAQGSWQImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZaAS0LARgBWQMBAlojGQiDAgGCdAMRBr1FgXkzgQGDKAE/AkNQ2?=
 =?us-ascii?q?y4BCxQBgTiFP4ggXBgBhHwnGxuBcoEVgnN2gQWBXAKBJ4Z+BIIigQyBWh6QA?=
 =?us-ascii?q?UiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDBsHBYEdgTqBAIR2Ix8DO?=
 =?us-ascii?q?X+BL3VKdy1qEheBToIUgT4DCxgNSBEsNxQbBD5uB41II4FNcgEsThMBExgXC?=
 =?us-ascii?q?4E8JAKmG6ESCiiDdYwhlToaM6psC5h9iyeCY4oNjEOEaYFoPIFZcBWDIglKG?=
 =?us-ascii?q?Q9WjVcBCguDYIRvyVE8NQIJMgEBBwIHDgMLgWiQAIF+AQE?=
IronPort-Data: A9a23:yklYE6gAKEhPZKIp95CDmpl2X161MBEKZh0ujC45NGQN5FlHY01je
 htvX2iEbPuNZ2L8L9wiYY+3pEgP75/Vz9UyGgQ+/ys0FChjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeCULOZ82QsaDxMtPvd8EkHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUh4uxKOnlis
 scXFz1UbEiitdqb3IikH7wEasQLdKEHPasFsX1miDWcBvE8TNWaG+PB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgh/5JEWxI9EglHzfjBCoU6VooI84nPYy0p6172F3N/9Jo3UFZUMwh7Gz
 o7A12DWPjIkZPa08meU/2q9mejEwifVd41HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHt5SN
 UEQ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2cZLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:27M9laMjKhRuwsBcTvGjsMiBIKoaSvp037BN7TESdfU7SKKlfq
 yV8cjztiWE6wr5JktApTnoAsDpKhnhHPVOjrX5U43PYOCfgguVBbAny5f+yDv9HCC73Otc2a
 B8N5VaMrTLfD1HZQKQ2njeLz7mq+P3lJyVuQ==
X-Talos-CUID: 9a23:LwFUtmNM5Ifl6O5DYTFtyXUMNocefULQlXWIAn2AJHpTV+jA
X-Talos-MUID: 9a23:kyYe4wgTgtlj71zhH0rBE8MpMOhUwJr+Ims2zIQLo9ibMicvPxmyg2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,168,1779148800"; 
   d="scan'208";a="496881406"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Jul 2026 05:59:03 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 0C64218000895
	for <openembedded-devel@lists.openembedded.org>; Fri, 17 Jul 2026 05:59:03 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 2F022CC037D; Fri, 17 Jul 2026 11:29:01 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][scarthgap][PATCH] ldns: fix CVE-2026-10846
Date: Fri, 17 Jul 2026 11:28:41 +0530
Message-Id: <20260717055841.2905177-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jul 2026 05:59:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128244

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
 meta-oe/recipes-devtools/ldns/ldns_1.8.3.bb   |   6 +-
 4 files changed, 273 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/ldns/ldns/CVE-2026-10846_p1.patch
 create mode 100644 meta-oe/recipes-devtools/ldns/ldns/CVE-2026-10846_p2.patch
 create mode 100644 meta-oe/recipes-devtools/ldns/ldns/CVE-2026-10846_p3.patch

diff --git a/meta-oe/recipes-devtools/ldns/ldns/CVE-2026-10846_p1.patch b/meta-oe/recipes-devtools/ldns/ldns/CVE-2026-10846_p1.patch
new file mode 100644
index 0000000000..4b9d86a2ee
--- /dev/null
+++ b/meta-oe/recipes-devtools/ldns/ldns/CVE-2026-10846_p1.patch
@@ -0,0 +1,117 @@
+From 844fb7e197b646a11dc058c5c7ce0877371bd4d4 Mon Sep 17 00:00:00 2001
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
+index 57d4dff2..03911637 100644
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
index 0000000000..f2f9d4b596
--- /dev/null
+++ b/meta-oe/recipes-devtools/ldns/ldns/CVE-2026-10846_p2.patch
@@ -0,0 +1,117 @@
+From 0e291b494fc5e4d3800b27d7016fc92c7aac269e Mon Sep 17 00:00:00 2001
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
+index e3fd1211..f046c962 100644
+--- a/error.c
++++ b/error.c
+@@ -184,6 +184,12 @@ ldns_lookup_table ldns_error_str[] = {
+ 	{ LDNS_STATUS_INVALID_SVCPARAM_VALUE,
+ 		"Invalid wireformat of a value "
+ 		"in the ServiceParam rdata field of SVCB or HTTPS RR" },
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
+index 2429b770..5754f5a0 100644
+--- a/ldns/error.h
++++ b/ldns/error.h
+@@ -141,7 +141,10 @@ enum ldns_enum_status {
+ 	LDNS_STATUS_RESERVED_SVCPARAM_KEY,
+ 	LDNS_STATUS_NO_SVCPARAM_VALUE_EXPECTED,
+ 	LDNS_STATUS_SVCPARAM_KEY_MORE_THAN_ONCE,
+-	LDNS_STATUS_INVALID_SVCPARAM_VALUE
++	LDNS_STATUS_INVALID_SVCPARAM_VALUE,
++	LDNS_STATUS_ID_DID_NOT_MATCH,
++	LDNS_STATUS_QDCOUNT_MUST_BE_ONE,
++	LDNS_STATUS_QUERY_DID_NOT_MATCH
+ };
+ typedef enum ldns_enum_status ldns_status;
+ 
+diff --git a/net.c b/net.c
+index 03911637..ab7cf028 100644
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
index 0000000000..f0f0de8b71
--- /dev/null
+++ b/meta-oe/recipes-devtools/ldns/ldns/CVE-2026-10846_p3.patch
@@ -0,0 +1,34 @@
+From b2cae7389bc43613fdd21bed1f9d41b3870c5545 Mon Sep 17 00:00:00 2001
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
+index ab7cf028..215c0cac 100644
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
diff --git a/meta-oe/recipes-devtools/ldns/ldns_1.8.3.bb b/meta-oe/recipes-devtools/ldns/ldns_1.8.3.bb
index 80e5571954..75d02ad673 100644
--- a/meta-oe/recipes-devtools/ldns/ldns_1.8.3.bb
+++ b/meta-oe/recipes-devtools/ldns/ldns_1.8.3.bb
@@ -3,7 +3,11 @@ HOMEPAGE = "https://nlnetlabs.nl/ldns"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34330f15b2b4abbbaaa7623f79a6a019"
 
-SRC_URI = "https://www.nlnetlabs.nl/downloads/ldns/ldns-${PV}.tar.gz"
+SRC_URI = "https://www.nlnetlabs.nl/downloads/ldns/ldns-${PV}.tar.gz \
+           file://CVE-2026-10846_p1.patch \
+           file://CVE-2026-10846_p2.patch \
+           file://CVE-2026-10846_p3.patch \
+           "
 SRC_URI[sha256sum] = "c3f72dd1036b2907e3a56e6acf9dfb2e551256b3c1bbd9787942deeeb70e7860"
 
 DEPENDS = "openssl"
-- 
2.35.6


