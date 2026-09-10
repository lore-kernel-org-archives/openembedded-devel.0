Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A5BFC88E41
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 23:10:17 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27773.1789081815417016519
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2026 16:10:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=i4hwy8Gz;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-39682983a0fso329873a91.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 16:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789081815; x=1789686615; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5VlGPuLG7rXCC+OJbukjX+gyGDPg8GSNmQ7CaVyQwCc=;
        b=i4hwy8GzQrwSKKH9i8t2iiTuPq4ePqsuGNFMUVZUO8iTxsMMn9+plfwjbgKjTumaaz
         d3WbPFmW5N+wNKGK9E7eKvsA1KaGQgTi3DqkggDajui0O/xDRY8gxEelFX/fYnbhtiCb
         nK6YXjtZE6qhKsyfh3WASbICNVqLSgDjMzr886eVN7aaZnkJ8orpFjoYHYaXQIywO08n
         68Qc5aP5CIaMPcFbcTgSUZwa38zE2seOdcS4G1NJ68vodf0Jz/Jz2LE5D7pb6851n3Gg
         PifjmojEH6YKXliW1ZNLHIOmkyCl6oAKzVQLkFHV6qDshpJ+gEcyL2/b+WiiPkB+Aj3U
         i9Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789081815; x=1789686615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5VlGPuLG7rXCC+OJbukjX+gyGDPg8GSNmQ7CaVyQwCc=;
        b=PrW7BTyVS0V0oxOiuInr3aD0ydx6KxXBl52a7N6s4d/zlC+noSuxp0l/xxgcGCJt+c
         73OCtqhQ/orPHo8Z4ITO+I3iTKjX/9QquIha2ZzDYiZW+DgZhjC2vOg372V/PmbFXR7W
         oMapVomuB+a4YQRSsH/gUOhQSrhWKhyjYR4o8rac/UUWwJixS5MHXcfXazJhyP++PNcb
         2h6akLcjBmpfQvqcn4Wv9YqkHAx6DKu6r9KEmdyRt57VIlhFTDadOYn9Lfb4mIzGfwqQ
         oV48Rh3BLwaxOmz8UxcwvPp8FrGQTGek/l0YFKpK6EQr4Xs5LSky3g2UYX3+E0x0MOR3
         0rCA==
X-Gm-Message-State: AFuF++lYD3ZIzMw+UW2bhQYPfNXg4a7OUhqiPBZw+T7wMYE3OG2X+8Oj
	8TEZ5Mb8RdiPK0OymuscW294wrFA17UiN/ekG3EG2LthP44w1FRVO7+Mmyg1mg==
X-Gm-Gg: AYBFou0bxBQy8PaTicpHDu2Z2SIkEz592p34Grr7EHhDxE95SsLFnshDwVq/p+GGxRI
	xqdmCSwIDEHdHz8fZ8HKjpNAhwDoXZUQKvZCCY0lFRU4BK2yxGHfuMp+QGQwIsea105VRM6XKzh
	qPlz8TfxokTvdbK+gXPOKv7Q/zLaN22oI/Ei+ILLGHE6rk9LIOCfHJj8kMqmFkHoBR81lJIXAh3
	gIE7C1MLLY8MJna/1BLeQSKB5+fCUAx1cnlJX1+fBUd0rs3jjAN93e7l8tOWB+joSDq8BDM3MWo
	gtrIS0INS7/wRjP68dmzFJUXigY9yWdbHpqBmzDuo1fUzCbdhzuUBrS5qW7Z2LkluU/kx2Nz9Uz
	IVNxHj57AQrUpUPbwzpa+/peosbdqH/B91wXOMI54piUL4qFhhCzN9yLntKjre/fLLkEYqrTuBT
	odo0FGAyuTNXgAviKpBvf83wdJ0l1fy//zByERo4uWwo9HE3pmO5bShpjcdv7UsxsHVg4UaW5HD
	+8tXe0C3tpYRQeXs+hpQF1XIg==
X-Received: by 2002:a17:90b:3c8d:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-39d9bbdbac7mr1865517a91.5.1789081814736;
        Thu, 10 Sep 2026 16:10:14 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e602d8sm1265496a91.3.2026.09.10.16.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:10:14 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 11/32] unbound: patch CVE-2026-44390
Date: Fri, 11 Sep 2026 11:09:10 +1200
Message-ID: <20260910230932.173913-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
References: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 23:10:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129929

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-44390

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../unbound/unbound/CVE-2026-44390.patch      | 37 +++++++++++++++++++
 .../recipes-support/unbound/unbound_1.24.2.bb |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-44390.patch

diff --git a/meta-networking/recipes-support/unbound/unbound/CVE-2026-44390.patch b/meta-networking/recipes-support/unbound/unbound/CVE-2026-44390.patch
new file mode 100644
index 0000000000..6c13e90bf0
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/CVE-2026-44390.patch
@@ -0,0 +1,37 @@
+From 166c308b1beba4ecf586d51d63513478d75019a1 Mon Sep 17 00:00:00 2001
+From: "W.C.A. Wijngaards" <wouter@nlnetlabs.nl>
+Date: Wed, 20 May 2026 10:21:26 +0200
+Subject: [PATCH] - Fix CVE-2026-44390, Unbounded name compression in certain
+ cases   causes degradation of service. Thanks to Qifan Zhang, Palo Alto  
+ Networks, for the report.
+
+(cherry picked from commit dae7a3797424607906b132c008fc12dba867b5f3)
+
+CVE: CVE-2026-44390
+Upstream-Status: Backport [https://github.com/NLnetLabs/unbound/commit/dae7a3797424607906b132c008fc12dba867b5f3]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ util/data/msgencode.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/util/data/msgencode.c b/util/data/msgencode.c
+index 7bc55a54e..f84c491b1 100644
+--- a/util/data/msgencode.c
++++ b/util/data/msgencode.c
+@@ -352,7 +352,6 @@ compress_any_dname(uint8_t* dname, sldns_buffer* pkt, int labs,
+ 		(p = compress_tree_lookup(tree, dname, labs, &insertpt))) {
+ 		if(!write_compressed_dname(pkt, dname, labs, p))
+ 			return RETVAL_TRUNC;
+-		(*compress_count)++;
+ 	} else {
+ 		if(!dname_buffer_write(pkt, dname))
+ 			return RETVAL_TRUNC;
+@@ -360,6 +359,7 @@ compress_any_dname(uint8_t* dname, sldns_buffer* pkt, int labs,
+ 	if(*compress_count < MAX_COMPRESSION_PER_MESSAGE &&
+ 		!compress_tree_store(dname, labs, pos, region, p, insertpt))
+ 		return RETVAL_OUTMEM;
++	(*compress_count)++;
+ 	return RETVAL_OK;
+ }
+ 
diff --git a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
index a6f9b14cab..9de6a3c88c 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
@@ -21,6 +21,7 @@ SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master;t
            file://CVE-2026-42534.patch \
            file://CVE-2026-42923.patch \
            file://CVE-2026-42960.patch \
+           file://CVE-2026-44390.patch \
            "
 
 SRCREV = "f6269baa605d31859f28770e01a24e3677e5f82c"

