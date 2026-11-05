Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28842.1793861510178086469
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2026 22:51:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Po+yOVJm;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6042; q=dns/txt;
  s=iport01; t=1793861510; x=1795071110;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TnVW1BiebCNx0KsLGegJTcsbPBQGM9lrsYuCdilgOoE=;
  b=Po+yOVJmMiOO18y8TNlA1qC2tNlptmxV+1/Q6pk7xMgK+24hkfJfeGMf
   4i8z9Je+dSFn0FaeqeRq+NQbTHoxW8OFztyY8x5KAmazmRr0Bmuj5tL8f
   nDIO5Xn/uCpIE4N526ZknCixW+N5wHQ2rks0axf/bD2AwTtX3lccOCTjC
   FaPXde2Z8aRSC9wX4y6ZHMc3FUYDO46GwKh7ROeQR366AfeqctiB6kc5v
   QwaGAiG1iw7Gc45j5yPaaKVMs9EZ+oh1avF5rvWo26VRnulVNEk9DguT1
   QYd1vBiqXVa9Atot7eDcTkQEddXqcnj/Y7Ib6tYZaNqgKAINgP5PSxDkf
   w==;
X-CSE-ConnectionGUID: lWeFGh8YQIu7xCo4O9T0cQ==
X-CSE-MsgGUID: PHOHgiGHQlqE67p40rn+9g==
X-IPAS-Result: =?us-ascii?q?A0BDAgA6Juxq/5L/Ja1aglmCV3VgQ0mWS54kgX4PAQEBD?=
 =?us-ascii?q?0QNBAEBhQWOHwImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGTw2QEgECATUBRiwDAQJaIyGDAgGCdAMRvEaCLIEBg1sFCQJDUNszAQsUA?=
 =?us-ascii?q?YE4hUCII10YAYR9JxsbgXKEfoEFgVwBAYEnhn8EgiJ6EoFaHox6AoFShnFIg?=
 =?us-ascii?q?R4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBHYEegRKBB12BKyhdA?=
 =?us-ascii?q?SGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VDGQLG?=
 =?us-ascii?q?gVhCAINDHI5EDAeJC8FHCZAGwoYGA1IESw3FRkEPm4Hki+DCgcxXQETFgJ/R?=
 =?us-ascii?q?pQfkj6hEQoog3iMJI9ChXgaM6pxmQiOCpZRhGmBaDyBRwsHcBWDIglKGQ+OL?=
 =?us-ascii?q?QIKC4NggX/MUSYyAgkyAQEHAgcOAwuBaJAAgX4BAQ?=
IronPort-Data: A9a23:N+oWla1f00yNE7GCZPbD5YBwkn2cJEfYwER7XKvMYLTBsI5bpz1Wy
 GRNUWmPbP/bM2KmLo8gYNji9h5TvJ/Vy9BkTwpr3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ej9atANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmcsbjpOg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGCH47E6IYqtdOIHwR5
 dcfdBdcUkiIvrfjqF67YrEEasULNsLnOsYb/3pn1zycVadgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUieC/FMEg9/5JYWkOSlgnD+YjRwo1OOrq1x6G/WpOB0+OWxbIaEJoDTG625mG6gh
 kXm8GXWIigeLfHBliLZqmiqxb7AyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBVy4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rErd94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:yZI8zqAwYOK2gjDlHema55DYdb4zR+YMi2TDGXofdfUzSL38qy
 nAppUmPHPP5Qr5O0tQ++xoRpPhfZq0z/cciuMs1NyZMjUO1lHFEGgb1/qA/xTQXwvj6+Vaya
 BsN4J6CNH2EBxGqPyS2njdLz7lq+P3lpxBQozlvhBQcT0=
X-Talos-CUID: 9a23:bJRoo2AMguPR4vr6Ey1Y+WA7GpAUS1zAk2f7JBOfWFoxQ4TAHA==
X-Talos-MUID: 9a23:D8mLkwWwZh7DT5Pq/AfMoxFtNehI2qC3JR5Sicleoc/HZCMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="544494416"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 06:51:49 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 128CD180004A9;
	Thu,  5 Nov 2026 06:51:49 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id B0073CC1611; Wed,  4 Nov 2026 22:51:48 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-perl][wrynose][PATCH] libhtml-parser-perl: fix CVE-2026-8829
Date: Wed,  4 Nov 2026 22:51:46 -0800
Message-Id: <20261105065146.814372-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 06:51:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131861
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix [1] for CVE-2026-8829
as shown in the advisory identifying the fix [2].

[1] https://github.com/libwww-perl/HTML-Parser/commit/6922552b0778c90a9587a3894e248be4d3a25e1c
[2] https://nvd.nist.gov/vuln/detail/cve-2026-8829

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../libhtml/files/CVE-2026-8829.patch         | 127 ++++++++++++++++++
 .../libhtml/libhtml-parser-perl_3.83.bb       |   4 +-
 2 files changed, 130 insertions(+), 1 deletion(-)
 create mode 100644 meta-perl/recipes-perl/libhtml/files/CVE-2026-8829.patch

diff --git a/meta-perl/recipes-perl/libhtml/files/CVE-2026-8829.patch b/meta-perl/recipes-perl/libhtml/files/CVE-2026-8829.patch
new file mode 100644
index 0000000000..fa8ba70999
--- /dev/null
+++ b/meta-perl/recipes-perl/libhtml/files/CVE-2026-8829.patch
@@ -0,0 +1,127 @@
+From 91b79f0d83dafc47f4387a50cd8bbf43c879a492 Mon Sep 17 00:00:00 2001
+From: Paul Johnson <paul@pjcj.net>
+Date: Tue, 19 May 2026 20:24:00 +0000
+Subject: [PATCH] Fix heap-use-after-free in _decode_entities (CVE-2026-8829)
+
+When the input SV passed to _decode_entities is the same SV stored as a
+self-referential value in the entity hash, grow_gap() could realloc the
+SV's PV buffer, leaving repl pointing at freed memory. Copy the entity
+value into an owned buffer when the hash entry SV aliases the input SV.
+
+CVE: CVE-2026-8829
+Upstream-Status: Backport [https://github.com/libwww-perl/HTML-Parser/commit/6922552b0778c90a9587a3894e248be4d3a25e1c]
+
+Co-Authored-By: Claude Opus 4.7 <noreply@anthropic.com>
+(cherry picked from commit 6922552b0778c90a9587a3894e248be4d3a25e1c)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ t/entities.t | 20 ++++++++++++++++++--
+ util.c       | 28 +++++++++++++++++++++++++---
+ 2 files changed, 43 insertions(+), 5 deletions(-)
+
+diff --git a/t/entities.t b/t/entities.t
+index 5f973a1..012e7bb 100644
+--- a/t/entities.t
++++ b/t/entities.t
+@@ -2,8 +2,9 @@ use strict;
+ use warnings;
+ use utf8;
+ 
+-use HTML::Entities qw(decode_entities encode_entities encode_entities_numeric);
+-use Test::More tests => 31;
++use HTML::Entities
++    qw(_decode_entities decode_entities encode_entities encode_entities_numeric);
++use Test::More tests => 32;
+ 
+ my $x = "V&aring;re norske tegn b&oslash;r &#230res";
+ 
+@@ -96,6 +97,21 @@ is($x, $ent);
+     is($got, (values %hash)[0], "decode_entities() decodes a key properly");
+ }
+ 
++# CVE-2026-8829
++# _decode_entities heap-use-after-free when the input SV is the same SV as
++# a self-referential entity value. The payload must be large enough to
++# force grow_gap() to realloc the SV's PV; the fix copies the entity value
++# into an owned buffer so repl is not left pointing at the freed allocation.
++{
++    my $prefix_a = "A" x 32;
++    my $suffix_b = "B" x 8192;
++    my %h;
++    $h{foo} = $prefix_a . "&foo;" . $suffix_b;
++    _decode_entities($h{foo}, \%h);
++    is($h{foo}, ("A" x 64) . "&foo;" . ("B" x 16384),
++        "_decode_entities() with self-aliased entity hash value");
++}
++
+ # From: Bill Simpson-Young <bill.simpson-young@cmis.csiro.au>
+ # Subject: HTML entities problem with 5.11
+ # To: libwww-perl@ics.uci.edu
+diff --git a/util.c b/util.c
+index ed4fd70..0bdb327 100644
+--- a/util.c
++++ b/util.c
+@@ -72,6 +72,7 @@ decode_entities(pTHX_ SV* sv, HV* entity2char, bool expand_prefix)
+ 
+     char *repl;
+     STRLEN repl_len;
++    char *repl_allocated = 0;
+     char buf[UTF8_MAXLEN];
+     int repl_utf8;
+     int high_surrogate = 0;
+@@ -89,6 +90,7 @@ decode_entities(pTHX_ SV* sv, HV* entity2char, bool expand_prefix)
+ 
+ 	ent_start = s;
+ 	repl = 0;
++	repl_allocated = 0;
+ 
+ 	if (s < end && *s == '#') {
+ 	    UV num = 0;
+@@ -176,16 +178,34 @@ decode_entities(pTHX_ SV* sv, HV* entity2char, bool expand_prefix)
+ 		    (*s == ';' && (svp = hv_fetch(entity2char, ent_name, s - ent_name + 1, 0)))
+ 		   )
+ 		{
+-		    repl = SvPV(*svp, repl_len);
++		    char *src = SvPV(*svp, repl_len);
+ 		    repl_utf8 = SvUTF8(*svp);
++		    if ((SV*)*svp == sv) {
++			/* Self-aliased: hash entry SV == input SV.
++			 * grow_gap() may realloc sv's PV later; copy
++			 * the entity value into an owned buffer first.
++			 * Freed by the repl_allocated cleanup below. */
++			Newx(repl_allocated, repl_len ? repl_len : 1, char);
++			Copy(src, repl_allocated, repl_len, char);
++			repl = repl_allocated;
++		    } else {
++			repl = src;
++		    }
+ 		}
+ 		else if (expand_prefix) {
+ 		    char *ss = s - 1;
+ 		    while (ss > ent_name) {
+ 			svp = hv_fetch(entity2char, ent_name, ss - ent_name, 0);
+ 			if (svp) {
+-			    repl = SvPV(*svp, repl_len);
++			    char *src = SvPV(*svp, repl_len);
+ 			    repl_utf8 = SvUTF8(*svp);
++			    if ((SV*)*svp == sv) {
++				Newx(repl_allocated, repl_len ? repl_len : 1, char);
++				Copy(src, repl_allocated, repl_len, char);
++				repl = repl_allocated;
++			    } else {
++				repl = src;
++			    }
+ 			    s = ss;
+ 			    break;
+ 			}
+@@ -197,7 +217,9 @@ decode_entities(pTHX_ SV* sv, HV* entity2char, bool expand_prefix)
+ 	}
+ 
+ 	if (repl) {
+-	    char *repl_allocated = 0;
++	    /* repl_allocated is now function-scoped; set by the
++	     * named-entity self-alias path above or by the UTF8 mismatch
++	     * branch below. Same cleanup in either case. */
+ 	    if (s < end && *s == ';')
+ 		s++;
+ 	    t--;  /* '&' already copied, undo it */
diff --git a/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.83.bb b/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.83.bb
index 2fb16a5672..e585cc4ccf 100644
--- a/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.83.bb
+++ b/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.83.bb
@@ -7,7 +7,9 @@ LIC_FILES_CHKSUM = "file://README;beginline=996;endline=1000;md5=cab05784294bb47
 
 DEPENDS += "perl"
 
-SRC_URI = "${CPAN_MIRROR}/authors/id/O/OA/OALDERS/HTML-Parser-${PV}.tar.gz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/O/OA/OALDERS/HTML-Parser-${PV}.tar.gz \
+           file://CVE-2026-8829.patch \
+           "
 
 SRC_URI[sha256sum] = "7278ce9791256132b26a71a5719451844704bb9674b58302c3486df43584f8c0"
 
-- 
2.35.6
