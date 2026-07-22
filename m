Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C163CC4453A
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 09:49:07 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44110.1784713745064258884
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 02:49:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ERUIgQHz;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5588; q=dns/txt;
  s=iport01; t=1784713745; x=1785923345;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=J3wY1T71fqWaOymfsHOrwaQ2BnsrcgJ8VLk2AN+5kUc=;
  b=ERUIgQHzAGrLoS/sFsGp+yRRENUgvHK52LHSXgEAZA5dWnvlprX9WlGP
   edKIjqOW5Xds64a60fBMzuIwNpMu9vl5I96Nf/jupy67D6UO+2UsWnYLl
   sgYiBw8LXh/2BSWF67jt6Sv9QkYTGGTV2D/leMJVFIUjihidTriJ6UMV/
   GE4VntvCh8Efy3BSIUPRBuybxFAiM4tV8KfDTu/NG7LtmoBJPqXsQjtbi
   dwzysxs8jZz1GvZtbFL+Tw05f0IE0/CYyeIXT9ovItedrx3KkGaq8XWpb
   RXtqeaGBxp88eGC+ybwmd86O9tEv8vv9g3sqQInsgxVpJzEJn71P1GD0k
   A==;
X-CSE-ConnectionGUID: GiUuV6fOQEa65jA6F2jy8g==
X-CSE-MsgGUID: gQ8q1NQXQZK2w5g2SeXzgA==
X-IPAS-Result: =?us-ascii?q?A0BDAgBJkWBq/5H/Ja1aHgEBCxIMggULgld0XkNJA5ZHn?=
 =?us-ascii?q?h6Bfg8BAQEPRA0EAQGFBY1ZAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NhloBAgEqCwFGLAMBAlojIYMCAYJ0AxHBB4F5M4EBg2gCQ?=
 =?us-ascii?q?1DbLgELFAEFgTOFP4ggXBgBhHwnGxuBcoEVg2mBBYFcBBiICwSCIoEMgVoeU?=
 =?us-ascii?q?I9SSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EMGwcFgR2BLoEChG4jH?=
 =?us-ascii?q?wM5f4EvdUp3LWkBEheBJoIUgToCgQMDCxgNSBEsNxQZBD5uB41pI4FzTAGBD?=
 =?us-ascii?q?gEqAVZvZxGTACcHkBaCIaEPCiiDdYwhlToaM6psC5h9jgqWAU+EaYFoPIFZc?=
 =?us-ascii?q?BWDIglKGQ+OKgMLC4hzgmbGDScyCwMvAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:GzEQEKsgF3Pcsdr2fsZTe4twNOfnVAZfMUV32f8akzHdYApBsoF/q
 tZmKTqAMq6ONGrzeotwOozkpxsAv5XcyIUyTARprCw9FH4bgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZTdJ5xYuajhKs/3Z8ks21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw1edKHF8Q+
 9shBTlTMxKq2czswqPrRbw57igjBJGD0II3oHpsy3TdSP0hW52GG/WM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtKYH49tL/Aan3Xfz5VrFuUtKMf6GnIxws327/oWDbQUoHTHp4PzxvD+
 goq+Uz2O0EDbfqm+QO30Siz2+CVpi7LSo07QejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dTJ
 lIZ/gIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sZOJottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvoUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:lNeBzqB02fMYtN3lHemA55DYdb4zR+YMi2TDGXofdfUzSL38qy
 nAppUmPHPP5Qr5O0tQ++xoRpPhfZq0z/cciuMs1NyZMjUO1lHFEGhK1/qH/9SZIVycysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: 9a23:oJSkJGFvG7ABE6gQqmJI9XMJJJ4rVUTwxSmNIWbmJzxrWe2aHAo=
X-Talos-MUID: 9a23:RkpVMAUpqL8spkrq/DDV1Cg7Ev5Y2paNUl9Qns89tvmWOgUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,178,1779148800"; 
   d="scan'208";a="513329534"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 22 Jul 2026 09:49:04 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 03257180001DB;
	Wed, 22 Jul 2026 09:49:04 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 9C4E1CAEF79; Wed, 22 Jul 2026 02:49:03 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-networking][scarthgap][PATCH 1/2] dnsmasq: Fix CVE-2026-12725
Date: Wed, 22 Jul 2026 02:48:59 -0700
Message-Id: <20260722094900.1399727-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 09:49:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128366

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix for CVE-2026-12725 as referenced
in [2], using the upstream commit identified in [1].

[1] https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=36d081e37477027fd721fea498f3760f529034ad
[2] https://security-tracker.debian.org/tracker/CVE-2026-12725

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../recipes-support/dnsmasq/dnsmasq_2.90.bb   |   1 +
 .../dnsmasq/files/CVE-2026-12725.patch        | 111 ++++++++++++++++++
 2 files changed, 112 insertions(+)
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2026-12725.patch

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
index 3a7af56c34..c25c25a447 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getV
            file://CVE-2026-4893.patch \
            file://CVE-2026-5172.patch \
            file://CVE-2026-2291.patch \
+           file://CVE-2026-12725.patch \
 "
 SRC_URI[sha256sum] = "8f6666b542403b5ee7ccce66ea73a4a51cf19dd49392aaccd37231a2c51b303b"
 
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-12725.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-12725.patch
new file mode 100644
index 0000000000..191bfc9595
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-12725.patch
@@ -0,0 +1,111 @@
+From 85a8577cc28751a2337275e566a9e29b8e8d8403 Mon Sep 17 00:00:00 2001
+From: Simon Kelley <simon@thekelleys.org.uk>
+Date: Tue, 21 Apr 2026 22:14:41 +0100
+Subject: [PATCH] Fix buffer overlow in log_query()
+
+The addition of "(not supported)" to logs of DS and DNSKEY replies
+overflows the buffer used to construct the string.
+
+Re-arrange things to avoid this, and add checks to avoid the same  problem
+if the logging calls change in the future.
+
+Thanks to Yiwei Hou for finding this.
+
+The problem exists is DNSSEC is enabled and query logging is also
+enabled. The overwrite is of bounded length and the bytes
+written are not in control of an attacker, so this is not considered
+a likely remote-execution vector.
+
+CVE: CVE-2026-12725
+Upstream-Status: Backport [https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=36d081e37477027fd721fea498f3760f529034ad]
+
+Backport Changes:
+- dnsmasq 2.90 predates upstream commit 9e67099ce73c, which added
+  F_QUERY to the log_query() type-string exclusion mask. Preserve the
+  existing 2.90 F_QUERY logging behavior and add only the
+  security-relevant F_KEYTAG and F_RR exclusions.
+
+(cherry picked from commit 36d081e37477027fd721fea498f3760f529034ad)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ src/cache.c  | 28 +++++++++++++++++-----------
+ src/dnssec.c |  7 ++-----
+ 2 files changed, 19 insertions(+), 16 deletions(-)
+
+diff --git a/src/cache.c b/src/cache.c
+index 0eacec9..5f92520 100644
+--- a/src/cache.c
++++ b/src/cache.c
+@@ -2104,7 +2104,7 @@ void log_query(unsigned int flags, char *name, union all_addr *addr, char *arg,
+     return;
+ 
+   /* build query type string if requested */
+-  if (!(flags & (F_SERVER | F_IPSET)) && type > 0)
++  if (!(flags & (F_SERVER | F_IPSET | F_KEYTAG | F_RR)) && type > 0)
+     arg = querystr(arg, type);
+ 
+   dest = arg;
+@@ -2120,19 +2120,25 @@ void log_query(unsigned int flags, char *name, union all_addr *addr, char *arg,
+     {
+       dest = daemon->addrbuff;
+ 
+-       if (flags & F_RR)
+-	 {
+-	   if (flags & F_KEYTAG)
+-	     dest = querystr(NULL, addr->rrblock.rrtype);
+-	   else
+-	     dest = querystr(NULL, addr->rrdata.rrtype);
+-	 }
+-       else if (flags & F_KEYTAG)
+-	sprintf(daemon->addrbuff, arg, addr->log.keytag, addr->log.algo, addr->log.digest);
++      if (flags & F_RR)
++	{
++	  if (flags & F_KEYTAG)
++	    dest = querystr(NULL, addr->rrblock.rrtype);
++	  else
++	    dest = querystr(NULL, addr->rrdata.rrtype);
++	}
++#ifdef HAVE_DNSSEC
++      else if (flags & F_KEYTAG)
++	{
++	  snprintf(daemon->addrbuff, ADDRSTRLEN, arg, addr->log.keytag, addr->log.algo, addr->log.digest);
++	  if (type)
++	    extra = " (not supported)";
++	}
++#endif
+       else if (flags & F_RCODE)
+ 	{
+ 	  unsigned int rcode = addr->log.rcode;
+-
++	  
+ 	  if (rcode == SERVFAIL)
+ 	    dest = "SERVFAIL";
+ 	  else if (rcode == REFUSED)
+diff --git a/src/dnssec.c b/src/dnssec.c
+index bdd48ca..28c07dd 100644
+--- a/src/dnssec.c
++++ b/src/dnssec.c
+@@ -953,10 +953,7 @@ int dnssec_validate_by_ds(time_t now, struct dns_header *header, size_t plen, ch
+ 			   
+ 			   a.log.keytag = keytag;
+ 			   a.log.algo = algo;
+-			   if (algo_digest_name(algo))
+-			     log_query(F_NOEXTRA | F_KEYTAG | F_UPSTREAM, name, &a, "DNSKEY keytag %hu, algo %hu", 0);
+-			   else
+-			     log_query(F_NOEXTRA | F_KEYTAG | F_UPSTREAM, name, &a, "DNSKEY keytag %hu, algo %hu (not supported)", 0);
++			   log_query(F_NOEXTRA | F_KEYTAG | F_UPSTREAM, name, &a, "DNSKEY keytag %hu, algo %hu", !algo_digest_name(algo));
+ 			 }
+ 		     }
+ 				  
+@@ -1082,7 +1079,7 @@ int dnssec_validate_ds(time_t now, struct dns_header *header, size_t plen, char
+ 		  a.log.keytag = keytag;
+ 		  a.log.algo = algo;
+ 		  a.log.digest = digest;
+-		  log_query(F_NOEXTRA | F_KEYTAG | F_UPSTREAM, name, &a, "DS for keytag %hu, algo %hu, digest %hu (not supported)", 0);
++		  log_query(F_NOEXTRA | F_KEYTAG | F_UPSTREAM, name, &a, "DS for keytag %hu, algo %hu, digest %hu", 1);
+ 		  neg_ttl = ttl;
+ 		} 
+ 	      else if ((key = blockdata_alloc((char*)p, rdlen - 4)))
+-- 
+2.44.4
+
-- 
2.35.6


