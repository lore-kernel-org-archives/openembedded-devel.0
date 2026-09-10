Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4648DC79FBB
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 23:10:27 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27847.1789081826775938233
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2026 16:10:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XjED/DIK;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3990fe066ebso241196a91.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 16:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789081826; x=1789686626; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Thz1GNaWb7wB9BBJpVaV2SCrMrZ3r1cOXSeZ8VT4TOw=;
        b=XjED/DIKtfVCCFS3qYNRqzSGOK6z0r/d31JW7rpgFS1HcTKLR+tTm3iMxp/p0mQvC3
         gd16/fqovJtLjA8Z4mdFdZDq3emQXXcvHyjzQiCOPN5DNMHXJrQSODlHnS5i6Mcx2kx0
         EBenIvwOWROJo9cjB4u9IoAfuiWYWlwK2PwYnO1Aqil+Ru99bzVGqbtOtmIf5ifijBP7
         zg9mrv15o7RsddbvNE2bcoq+67uPU/KBbir3CTupHd7ep9VcAXs4dCILc6a3jGEFmhQ+
         zdGj+dUve6ic8yYLxvNZUz6X+eD59HwtC3dI/sySX5+/bFzMcLul4LEz36LvLOKOsDUq
         oP3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789081826; x=1789686626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Thz1GNaWb7wB9BBJpVaV2SCrMrZ3r1cOXSeZ8VT4TOw=;
        b=hSeDqqNfw92akOnW+W8ceUyevT2YTXbuxOkATXsVxGaE3lPJbH6Gr51S9nnva9rzKh
         /8Arc95G9P/33EWOPS6KHP10+2CtLhbHJtLEyqZAN+SwulVUAo/tHmr2dpZQGsBXj320
         iCXV4z/eK4hFhm7T5B4zRolAn2O/0yU2dwNODMGQqrBEy3ddoS3L//BHZShRQAuFEpCF
         bnHqWGR4UTuiiA8QsO+axoKhTp/kvfFQ3uk9b/0IIxQWRUYjboHXo1WXm1vTaMGLNR4E
         OYL5eYBCS5h2JUwnLRp8oQt3oYiL0L3/bjRSXePqLGQVgHowlxPWSahVyATrm0ZHrTEj
         jAZA==
X-Gm-Message-State: AFuF++m5WHixmdTJXf+egV9axJNCY8TxMo69+2ZyYtGO52hlXrFO0LqT
	Fa5soI9EI5TtODCnQ5SGvfzeCAmRDoY4Q+A6lvxroe39IsjgdSKo/+N3ocpDYQ==
X-Gm-Gg: AYBFou0bT91mLiTpwoR4PEw/IARqycUpAG6g3s4RG2qUAR4sbiZRdj+vGQpEij7/O5k
	qO/R4RH3hniQTpXLXCGnQ7fgB9NWZmQOJ41Y5v4XHBx5ZRlUDDiCK9BTDBk9Q7dfQn+uex6A5V4
	qrOwxBeqUcTDUKBBMr5xb2CpbBOb6w9QsSB5JlGIt7sBCZ1ao2hNGe/B8Zf2eJ3lW4tBcPvvBle
	GyuoBaVUtXCOWzPq4bhjUHSq/d8Rok+q9qpETxua+zLjwL1GJ6Sjc4ZxwPftjvF2STGwj13B8To
	IxFC2L8y1Tu3cCSRmYT5X4Qa8tRoaS7uwLHz0G3tzrFJaLzZmf71bMPGh5eAnycVPdgEygP3tOr
	6yBF3/iwe63xg4Pd8U3Y9ic3nvkNHAVLYIC8o1FdxCPLPqdT03GRl/RFVCkp9BGP/knl0bmRpIm
	GKKWuQt4IKEEMZcT0eJxhVARepex+175ppyjVxGN4b2vYFzGRziLCliqyLFZpnykRt6Wmlyvp8H
	1YNpa/PUj+3+WZlDcEvFuE=
X-Received: by 2002:a17:90b:5605:b0:398:b17b:3bd2 with SMTP id 98e67ed59e1d1-39d9bbc9177mr1686387a91.4.1789081825988;
        Thu, 10 Sep 2026 16:10:25 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e602d8sm1265496a91.3.2026.09.10.16.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:10:25 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 15/32] unbound: patch CVE-2026-42955
Date: Fri, 11 Sep 2026 11:09:14 +1200
Message-ID: <20260910230932.173913-15-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
References: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 23:10:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129933

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-42955

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../unbound/unbound/CVE-2026-42955.patch      | 98 +++++++++++++++++++
 .../recipes-support/unbound/unbound_1.24.2.bb |  1 +
 2 files changed, 99 insertions(+)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-42955.patch

diff --git a/meta-networking/recipes-support/unbound/unbound/CVE-2026-42955.patch b/meta-networking/recipes-support/unbound/unbound/CVE-2026-42955.patch
new file mode 100644
index 0000000000..aa6c7a1dd5
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/CVE-2026-42955.patch
@@ -0,0 +1,98 @@
+From 40a9f83c64c94b974e6b6f75e4ef350debf86577 Mon Sep 17 00:00:00 2001
+From: "W.C.A. Wijngaards" <wouter@nlnetlabs.nl>
+Date: Wed, 22 Jul 2026 10:11:04 +0200
+Subject: [PATCH] - Fix CVE-2026-42955, Extra fix for CVE-2026-40622 to also
+ clamp   the TTL of A/AAAA records disallowing a one-time 'ghost domain'  
+ delegation renewal via glue records. Thanks to Qifan Zhang, Palo   Alto
+ Networks, for the report.
+
+(cherry picked from commit 13ec8d0f261ee7900ac67cfece551e8a703d14b1)
+
+CVE: CVE-2026-42955
+Upstream-Status: Backport [https://github.com/NLnetLabs/unbound/commit/13ec8d0f261ee7900ac67cfece551e8a703d14b1]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ services/cache/rrset.c          | 12 +++++++++---
+ testdata/iter_prefetch_fail.rpl |  8 ++++----
+ 2 files changed, 13 insertions(+), 7 deletions(-)
+
+diff --git a/services/cache/rrset.c b/services/cache/rrset.c
+index 81f4e2820..b5fee1dc9 100644
+--- a/services/cache/rrset.c
++++ b/services/cache/rrset.c
+@@ -126,7 +126,8 @@ rrset_cache_touch(struct rrset_cache* r, struct ub_packed_rrset_key* key,
+ 
+ /** see if rrset needs to be updated in the cache */
+ static int
+-need_to_update_rrset(void* nd, void* cd, time_t timenow, int equal, int ns)
++need_to_update_rrset(void* nd, void* cd, time_t timenow, int equal, int ns,
++	int a_aaaa)
+ {
+ 	struct packed_rrset_data* newd = (struct packed_rrset_data*)nd;
+ 	struct packed_rrset_data* cached = (struct packed_rrset_data*)cd;
+@@ -151,9 +152,13 @@ need_to_update_rrset(void* nd, void* cd, time_t timenow, int equal, int ns)
+ 			return 0;
+ 		/* ghost-domain: never let an NS overwrite extend lifetime
+ 		 * past the entry it replaces, regardless of trust. */
+-		if(ns && !TTL_IS_EXPIRED(cached->ttl, timenow) &&
++		/* Also for A/AAAA and it is glue. */
++		if((ns ||
++			(a_aaaa && cached->trust==rrset_trust_add_noAA))
++			&& !TTL_IS_EXPIRED(cached->ttl, timenow) &&
+ 			newd->ttl > cached->ttl) {
+ 			size_t i;
++			if(a_aaaa) newd->trust=rrset_trust_add_noAA;
+ 			newd->ttl = cached->ttl;
+ 			for(i=0; i<(newd->count+newd->rrsig_count); i++)
+ 				if(newd->rr_ttl[i] > newd->ttl)
+@@ -223,7 +228,8 @@ rrset_cache_update(struct rrset_cache* r, struct rrset_ref* ref,
+ 		equal = rrsetdata_equal((struct packed_rrset_data*)k->entry.
+ 			data, (struct packed_rrset_data*)e->data);
+ 		if(!need_to_update_rrset(k->entry.data, e->data, timenow,
+-			equal, (rrset_type==LDNS_RR_TYPE_NS))) {
++			equal, (rrset_type==LDNS_RR_TYPE_NS),
++			(rrset_type==LDNS_RR_TYPE_A || rrset_type==LDNS_RR_TYPE_AAAA))) {
+ 			/* cache is superior, return that value */
+ 			lock_rw_unlock(&e->lock);
+ 			ub_packed_rrset_parsedelete(k, alloc);
+diff --git a/testdata/iter_prefetch_fail.rpl b/testdata/iter_prefetch_fail.rpl
+index d1e308305..aa94d0fe5 100644
+--- a/testdata/iter_prefetch_fail.rpl
++++ b/testdata/iter_prefetch_fail.rpl
+@@ -319,7 +319,7 @@ example.com.	360 IN NS	ns.example.com.
+ SECTION ADDITIONAL
+ ; this is picked up from the parent (because this simulation has the
+ ; parent respond with servfail, not actually timeout)
+-ns.example.com.	3600 	IN 	A	1.2.3.4
++ns.example.com.	360 	IN 	A	1.2.3.4
+ ENTRY_END
+ 
+ ; another query to see if there is another lookup towards the authority
+@@ -342,7 +342,7 @@ www.example.com. 360 IN A	10.20.30.40
+ SECTION AUTHORITY
+ example.com.	360 IN NS	ns.example.com.
+ SECTION ADDITIONAL
+-ns.example.com.	3600 	IN 	A	1.2.3.4
++ns.example.com.	360 	IN 	A	1.2.3.4
+ ENTRY_END
+ 
+ ; some time later another query, and now it is fine to bother the authority
+@@ -367,7 +367,7 @@ www.example.com. 330 IN A	10.20.30.40
+ SECTION AUTHORITY
+ example.com.	330 IN NS	ns.example.com.
+ SECTION ADDITIONAL
+-ns.example.com.	3570 	IN 	A	1.2.3.4
++ns.example.com.	330 	IN 	A	1.2.3.4
+ ENTRY_END
+ ; now the just-looked-up entry
+ STEP 190 QUERY
+@@ -388,7 +388,7 @@ www.example.com. 3600 IN A	10.20.30.40
+ SECTION AUTHORITY
+ example.com.	3600 IN NS	ns.example.com.
+ SECTION ADDITIONAL
+-ns.example.com.	3570 	IN 	A	1.2.3.4
++ns.example.com.	3600 	IN 	A	1.2.3.4
+ ENTRY_END
+ 
+ 
diff --git a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
index 12e3deb6e4..5c798c00d3 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
@@ -25,6 +25,7 @@ SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master;t
            file://CVE-2026-44608.patch \
            file://CVE-2026-46582.patch \
            file://CVE-2026-32665.patch \
+           file://CVE-2026-42955.patch \
            "
 
 SRCREV = "f6269baa605d31859f28770e01a24e3677e5f82c"

