Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12FDDC88E41
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 23:10:07 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27834.1789081800654449780
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2026 16:10:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sRGGUMdp;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso290800a91.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 16:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789081800; x=1789686600; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ar7uUfQa5gC71YYexyU3oxDlWFhuLtKKDzqgATvwLVQ=;
        b=sRGGUMdpQl4GD3rD4HtUoTkaYg2TmgTeUyNcflyllV2E5T0eWH+uqrHDmynGuP5Yda
         U28agp/w2w22gAg7iUK8RzEkTOFq6N6B9xxqOkxFfj2u1NBA+3621kE8fY/NF4X/7XRg
         mIuPak1XaRpUQ9slWUekXdo622pt0qZxh8lVPBJbPI8hxHu4UJZH3C5UTIJ3xn5wRsA1
         pz4mS3fDMalo5Q2x6aojiNv8yVhEX1TDiLMQaqvNej2eJG733TJckq0uBxqYLJ14IUts
         CWckYb9d5cpkvt1wuqkAVdP7+A9iVUbmvGknbTg8v26EWPVVAqFxdUKfN0hL7YRERPTB
         ctFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789081800; x=1789686600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ar7uUfQa5gC71YYexyU3oxDlWFhuLtKKDzqgATvwLVQ=;
        b=JotFetP8UpaNDblnCGyvua4s2gKxfbR+X241kDng1/u/00+fKrYW8LI3BFL/tbaFXH
         wyVzeGjPABLfeaC4YDrHJi8S/w4DIYrJqbZh0LG2jDCrVyri/kvqA1kR+YqmpitxV55E
         iR5KHlJffPQlbt2tk1pNpIV4gkiY/FqMktA2ngBQbTLUe2g4PWwkrYBx82zNQNUfua6b
         aiHansKlQ6BJZ/xZqpKVU6dvy80yjXsUzLwO20UbF/clmKOg5/YJd1QbzUEc+FVUuYAY
         azinUWdvuBw0wYx3DBerp5eHOoJXIpOFM/32g96A0YELT9vS0pNw8YS9qJArN8xG93VX
         GqVg==
X-Gm-Message-State: AFuF++lrRWDsVp9o5bbkMmhXQym/Sf3mOZoXSe4TcSfw49y8PJxljIzA
	BptH7E6rKV62dY3CZ5DU+/JCNaA1/eczBU70lMGLnF0KKPwxPDGk8iHVX9pWCg==
X-Gm-Gg: AYBFou2vABzKTxyt6QE6c8z598Fiun7R3eMjBw+4ub5xis59eHiowJ4PgOcn+wD7ED5
	N25zff/RRuZw2ce2sf7OoYFg43tniG5HJEI/Sfg931L58gknDf3nQJcM1aTQFwuJ0+wvmQnke6S
	4OQmyYYr4k3q9MEhiouZpzif5Uifk7uVnsD7dDXq5dccBAvxvX0rRH/iRoxOyS7917XFhrVIcF7
	T9kKdlaMhUrLogbWAwGJ8jzf0DdO4qnadOtoA0MBDDeqiQVMPwDUcqPzakLoxJctnLJxpckZ8Kj
	0KJh3a3IJpC1KJEID32yZa2ORgWK9An0yYuOXeaFXb2eNzSxqZMb135AanL5yDOImFGVxSmwK5N
	I5tKxXt26LR5jyNwcT7lqhEgS5rc0UNTZ47lkyPnJcrIE3+6pwWIQkGHd0JPgx0PRI/+Q6/8ax5
	+OwINuSHDym+Ihl6w9c3SNVoeFs4Sixtd55LGpXaUo1l1yGjuDF+6JkeOrEWdWFKRgdE5X24oRq
	lYDwn3cmJRuJzQUhIusWj4=
X-Received: by 2002:a17:90b:39a7:b0:398:9bd1:3214 with SMTP id 98e67ed59e1d1-39d9c223eb3mr1724755a91.21.1789081799938;
        Thu, 10 Sep 2026 16:09:59 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e602d8sm1265496a91.3.2026.09.10.16.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:09:59 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 6/32] unbound: patch CVE-2026-40622
Date: Fri, 11 Sep 2026 11:09:05 +1200
Message-ID: <20260910230932.173913-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
References: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 23:10:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129924

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also backport TTL_IS_EXPIRED macro introduced by commit:
https://github.com/NLnetLabs/unbound/commit/73e408f1d0792267429e9f5f89537cda61297952

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-40622

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../unbound/unbound/CVE-2026-40622.patch      | 58 +++++++++++++++++++
 .../recipes-support/unbound/unbound_1.24.2.bb |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-40622.patch

diff --git a/meta-networking/recipes-support/unbound/unbound/CVE-2026-40622.patch b/meta-networking/recipes-support/unbound/unbound/CVE-2026-40622.patch
new file mode 100644
index 0000000000..1e338b1709
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/CVE-2026-40622.patch
@@ -0,0 +1,58 @@
+From 8711cb40328a6fab85bebb12be0c2948c0752291 Mon Sep 17 00:00:00 2001
+From: "W.C.A. Wijngaards" <wouter@nlnetlabs.nl>
+Date: Wed, 20 May 2026 10:16:18 +0200
+Subject: [PATCH] - Fix CVE-2026-40622, "Ghost domain name" variant. Thanks to
+ Qifan   Zhang, Palo Alto Networks, for the report.
+
+(cherry picked from commit 8d8fa4226613138f5a244a9f1a2506704e049180)
+
+CVE: CVE-2026-40622
+Upstream-Status: Backport [https://github.com/NLnetLabs/unbound/commit/8d8fa4226613138f5a244a9f1a2506704e049180]
+
+Dropped changes to the Changelog file.
+
+Also backport TTL_IS_EXPIRED macro introduced by commit:
+https://github.com/NLnetLabs/unbound/commit/73e408f1d0792267429e9f5f89537cda61297952
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ services/cache/rrset.c | 10 ++++++++++
+ util/data/msgparse.h   |  4 ++++
+ 2 files changed, 14 insertions(+)
+
+diff --git a/services/cache/rrset.c b/services/cache/rrset.c
+index 6d5c24f80..81f4e2820 100644
+--- a/services/cache/rrset.c
++++ b/services/cache/rrset.c
+@@ -149,6 +149,16 @@ need_to_update_rrset(void* nd, void* cd, time_t timenow, int equal, int ns)
+ 		if(equal && cached->ttl >= timenow && 
+ 			cached->security == sec_status_bogus)
+ 			return 0;
++		/* ghost-domain: never let an NS overwrite extend lifetime
++		 * past the entry it replaces, regardless of trust. */
++		if(ns && !TTL_IS_EXPIRED(cached->ttl, timenow) &&
++			newd->ttl > cached->ttl) {
++			size_t i;
++			newd->ttl = cached->ttl;
++			for(i=0; i<(newd->count+newd->rrsig_count); i++)
++				if(newd->rr_ttl[i] > newd->ttl)
++					newd->rr_ttl[i] = newd->ttl;
++		}
+                 return 1;
+ 	}
+ 	/*	o item in cache has expired */
+diff --git a/util/data/msgparse.h b/util/data/msgparse.h
+index 7de4e394f..9bfe0225d 100644
+--- a/util/data/msgparse.h
++++ b/util/data/msgparse.h
+@@ -98,6 +98,10 @@ extern time_t SERVE_EXPIRED_REPLY_TTL;
+ /** If we serve the original TTL or decrementing TTLs */
+ extern int SERVE_ORIGINAL_TTL;
+ 
++/** Check if TTL is expired. 0 TTL is considered expired.
++ * Used mainly to identify parts of the code that do this comparison. */
++#define TTL_IS_EXPIRED(ttl, now) ((ttl) <= (now))
++
+ /**
+  * Data stored in scratch pad memory during parsing.
+  * Stores the data that will enter into the msgreply and packet result.
diff --git a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
index 1225cb99c2..1c9a7fa489 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master;t
            file://CVE-2026-42944-2.patch \
            file://CVE-2026-42959.patch \
            file://CVE-2026-32792.patch \
+           file://CVE-2026-40622.patch \
            "
 
 SRCREV = "f6269baa605d31859f28770e01a24e3677e5f82c"

