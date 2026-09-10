Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F42DC88E41
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 23:11:18 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27870.1789081869844839239
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2026 16:11:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TlzKpp6J;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-398a5aad413so281832a91.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 16:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789081869; x=1789686669; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H2UsNTZTCbxP3VVBKasiC5N+37ohbcAmCzxMd6QfSiM=;
        b=TlzKpp6JCxu3QUXfezPArEBJdvQbOoC+/M80kdqMVuIgrLC4a1XI14GRSt3nAlr3Jp
         nsOhEz8n5dPCKi0qQE21PdHwKuQsIfML7P/1DrfTZSGVLa/Z/rf+ocigc7SWoMvVcdkN
         icXRQ3Ep/LZjqFV06opwYZUy+3kSIUdDmEJ2fbVy3mlzjiSojM7WRKuzqUL4eiFE2N4v
         8KE5twbKPhmbuGFX+uvhW49Z3UGbdY53ElMLKm/SU8WM+fUjV7cJlKT9hVRY9+RJlEDz
         Rt7OvskRH5jO2KYwdz7JxEn0VfQGuvt7QjHY+cbUheTjgOJxamWumsg81oSf0QfKfxGw
         rX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789081869; x=1789686669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H2UsNTZTCbxP3VVBKasiC5N+37ohbcAmCzxMd6QfSiM=;
        b=AvpfzfUcxrdxXdNWZBKIAncsdgh3uI5CT/bSNs94vB9abCGB5PKQ/WCN6xFWeu/Xan
         kcagjKalwWgMhcdTTVQS5wpFpoUnXsmgS14LJFM9UbLwOHZCfkzWFHG7yOQBddOiCtVl
         nUmCShr6S9AD2JeasF80+qkZhYugYG4WG4yBu5/8GEEcz6JseY3MztL3BKW62tIRFs72
         1ad3z+Iew9qjGFwqvrG3rAKQU8GnDoctYDXStJQCPXqdJFTeIYn2ZkGmPDvSjWI3Q7ad
         RWJ44x0bsxC91xY3gy1WOdf+xBgvgyqQ4CSaZsfniksM/94N2l2DIRcSuE4HqDaVqkZQ
         I7yA==
X-Gm-Message-State: AFuF++lMr5XUu52aymJnuXRV3kwr0wVWfrJaSzQ6kX88Uh4D1m57s8zg
	w0HBHhUvhMSWCDolACJVgyqv8f+1GXFPw7oS3JPiTy/4DNQBUz6gCbJ8xPzq7Q==
X-Gm-Gg: AYBFou21Ct1tFi/FF4kzObxM/lpu+sKu8SxQBi6mcrLmBfsntmVcE1KY8rqy3bQuqBj
	j6/N/+msYSKYR0FT94OVkLTXSSGM3UDKD+Yx+Tll/KbWyFHWRvMEfjMDadZ3RaptHC/Jy1r97cE
	vEqfAOuHoJyL9iHPkM/M+ptH/8GRDSgsf5Ktrl3anY4A4X9xtRkBwRS0fIIsupKcuWbSJ/0hysE
	cciLANh0oWHMs7sRHfLBYTc5wMLpexJpbj84i9b0gcmBUNhQCrjI4+3ku6WOLSC4//DAj9qUz1u
	tFr8wHXCV5H5ilTcgt9NsOBt2XYj9z2ZUWnOyrRD0HyMLJJAr8e+DxSiZ4lIOn+GgYknnpbj8Ty
	p7cEaKdI5cD/3/ldlzvMzZdrE9G+rj5zbCqg2ITVPhY4F3ul7ijLs3HFRJ2YDsDMj8UW+Gt3sGd
	pQWR75yGdPWbki+A1QE82B8zoQJiRYuQKsqC+bNmQaaZ2jmC7Nz1Cz8e2HOJEpMOgLyR7wofNA2
	wwaQXyZ6f/lBvgQiNgQMCc=
X-Received: by 2002:a17:90b:4cce:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-39d9bec4d91mr1756634a91.10.1789081869143;
        Thu, 10 Sep 2026 16:11:09 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e602d8sm1265496a91.3.2026.09.10.16.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:11:08 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 31/32] unbound: patch CVE-2026-56416
Date: Fri, 11 Sep 2026 11:09:30 +1200
Message-ID: <20260910230932.173913-31-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
References: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 23:11:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129949

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-56416

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../unbound/unbound/CVE-2026-56416.patch      | 68 +++++++++++++++++++
 .../recipes-support/unbound/unbound_1.24.2.bb |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-56416.patch

diff --git a/meta-networking/recipes-support/unbound/unbound/CVE-2026-56416.patch b/meta-networking/recipes-support/unbound/unbound/CVE-2026-56416.patch
new file mode 100644
index 0000000000..6002c44924
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/CVE-2026-56416.patch
@@ -0,0 +1,68 @@
+From 984cbdd8761685087f1e20d6e9d9da12d7412916 Mon Sep 17 00:00:00 2001
+From: "W.C.A. Wijngaards" <wouter@nlnetlabs.nl>
+Date: Wed, 22 Jul 2026 10:19:28 +0200
+Subject: [PATCH] - Fix CVE-2026-56416, Possible heap buffer overflow when
+ validator   canonicalizes RDATA that contains domain name. Thanks to Qifan  
+ Zhang, Palo Alto Networks, for the report.
+
+(cherry picked from commit 4b1635e19406fd8040806f0fa4a4488c003b5d0d)
+
+CVE: CVE-2026-56416
+Upstream-Status: Backport [https://github.com/NLnetLabs/unbound/commit/4b1635e19406fd8040806f0fa4a4488c003b5d0d]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ util/data/msgparse.c     |  3 +++
+ validator/val_sigcrypt.c | 11 +++++++----
+ 2 files changed, 10 insertions(+), 4 deletions(-)
+
+diff --git a/util/data/msgparse.c b/util/data/msgparse.c
+index 3dc2e1264..9d3ddda7a 100644
+--- a/util/data/msgparse.c
++++ b/util/data/msgparse.c
+@@ -687,6 +687,9 @@ calc_size(sldns_buffer* pkt, uint16_t type, struct rr_parse* rr)
+ 			}
+ 			rdf++;
+ 		}
++		/* rdata ended before all _dname_count names were seen */
++		if(count != 0)
++			return 0; /* the rdata is too short. */
+ 	}
+ 	/* remaining rdata */
+ 	rr->size += pkt_len;
+diff --git a/validator/val_sigcrypt.c b/validator/val_sigcrypt.c
+index 86de6fb8e..cde281870 100644
+--- a/validator/val_sigcrypt.c
++++ b/validator/val_sigcrypt.c
+@@ -1094,6 +1094,7 @@ canonicalize_rdata(sldns_buffer* buf, struct ub_packed_rrset_key* rrset,
+ 	size_t len)
+ {
+ 	uint8_t* datstart = sldns_buffer_current(buf)-len+2;
++	size_t firstlen;
+ 	switch(ntohs(rrset->rk.type)) {
+ 		case LDNS_RR_TYPE_NXT: 
+ 		case LDNS_RR_TYPE_NS:
+@@ -1113,8 +1114,9 @@ canonicalize_rdata(sldns_buffer* buf, struct ub_packed_rrset_key* rrset,
+ 		case LDNS_RR_TYPE_SOA:
+ 			/* two names after another */
+ 			query_dname_tolower(datstart);
+-			query_dname_tolower(datstart + 
+-				dname_valid(datstart, len-2));
++			firstlen = dname_valid(datstart, len-2);
++			if(firstlen && firstlen < len-2)
++				query_dname_tolower(datstart + firstlen);
+ 			return;
+ 		case LDNS_RR_TYPE_RT:
+ 		case LDNS_RR_TYPE_AFSDB:
+@@ -1141,8 +1143,9 @@ canonicalize_rdata(sldns_buffer* buf, struct ub_packed_rrset_key* rrset,
+ 				return;
+ 			datstart += 2;
+ 			query_dname_tolower(datstart);
+-			query_dname_tolower(datstart + 
+-				dname_valid(datstart, len-2-2));
++			firstlen = dname_valid(datstart, len-2-2);
++			if(firstlen && firstlen < len-2-2)
++				query_dname_tolower(datstart + firstlen);
+ 			return;
+ 		case LDNS_RR_TYPE_NAPTR:
+ 			if(len < 2+4)
diff --git a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
index af848988aa..516ea20654 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
@@ -41,6 +41,7 @@ SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master;t
            file://CVE-2026-55973.patch \
            file://CVE-2026-55990.patch \
            file://CVE-2026-55991.patch \
+           file://CVE-2026-56416.patch \
            "
 
 SRCREV = "f6269baa605d31859f28770e01a24e3677e5f82c"

