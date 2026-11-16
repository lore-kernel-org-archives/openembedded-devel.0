Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23.1794851779932418858
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:56:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=IKjKjDth;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so7093100eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851779; x=1795456579; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oYT612+AEMJkZjiY3NHu06tOKmtssnk96WJmGFFk9sw=;
        b=IKjKjDthFr98MN+xOrIZrmf69nHGLVHVyIAtDNUgsUKwqKlB3k+ytyPEHNwYUbJFe8
         9VRNv4GF9Pgm/9Du4MHu20EK5X0Zd+c9xWp6OZ7HxcKuMpSldQXjK2yHDfq6bOo3IeN8
         GJh0mMOriCd/bUmMZ19TETvBIgjydrMhh95OtQ4XwUBOLdOxT/ddVlEM0biP3tiCkNcK
         WHbwC6UwFDtqHcThVdBVgdA+blUEC8v+pfYrg81EwhjBdA/IB3kmz9vRQcSvtlVRUY2J
         LxhtyUW3aM8/tECV09tBPdG0PjaSwlUIXCDNZ3muPvqo8hR8wEkfFdbBO8NB+6qQnoCs
         kQfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851779; x=1795456579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oYT612+AEMJkZjiY3NHu06tOKmtssnk96WJmGFFk9sw=;
        b=VOqq849mD2YTQCE4VbQZ7R4EgeAZ5McLkQF/Wx3pumNE6/LLcUjcggLCNOcmLP552c
         ahYEKsrYM9JUlt73ZYabbfBL20bJuzpcKNvk3DZ21EGQBMpaTXhPjlJZF8lBIXFcmFxa
         Qdynxp27DNNZ8QW54dZc7vczBmFatR9qKGn3F5OpbxCefbjDb0RXiVOty8OYKZNTs3w0
         uQDloBM7qdgrqhTzo2/jaFmnc77mgZC179pbCiwvxk85izumCudNlrFCMzme9UZ53i0s
         f9+IyQg/YyIGlHaVeTZb2PuN/eQWMHVILuqh9q08dlL7BlVOAdmJ6UO2MRJDQJuBg4b8
         COvQ==
X-Gm-Message-State: APuU4Z9yS5aAQTzQwK7avhg2yj7OUPEvs/9AGoUVuuE7o50YXEp8lslx
	M/i47C5pIO57b9mDan5vNjGsXlG/mZ/cqc7hOC55nf+wOxMZ48i22yFjGg4mbwMk
X-Gm-Gg: AZFdTZelsXGVA2r5X2WS4oaz5zkwfTBqsh/XRTnqQodd5LBKU5R615+u28MKT3I7itl
	QbCfRBdDnDNjoQdImfevMIqXbsDOMcL+f467HF5IV6nSqSEQ0uQlbxjsrsn6xMGVthaX4inZh0Z
	9gDWJ73B+jNnEYlQtQapvPt94p3jVOD7/zJz4VPb+BydR7rcgig/iOhxURoKFLJ14YihryJtZEg
	HsboTf5jhncZRdKR89IEUvIjdz52n6lJpfeAli1WyRLGGnm5Xz5moPRIWdd1vATlH9wyX/f68GQ
	AErP4vIVgBzuSkRpv6HkyubT4CbYNFm09JcjPFskfF0LQ1HdWmjmM4iAGvlbnSOJgMqPof/3wgY
	x2Aue0mG3mOj5/nt9oX8WB9rfLq46Mc6vKaaNeeGCqIELyZ0TvYt3EqomUMAQkpgHl/BexTeFI3
	3luI5kU5t6cCsyFhW0dL9WmzH79gcODX2diEr8dZuqCzPFCP0Rn4+dzsiv9JR6lnjfGF7Own/H5
	zu30l4X++153x8TLhJHnZS7/rds6ozGuQCU19VnKibL5w5N+nqBVz0/ooqiy8ZtcvgJ+Wgf766B
	hIqpLwISnK7sgS3eTaN8SaoO/qtRxBMubKIE4qF/BLbCUnmLr4lpmSKuLBQO4JqY+d1seLJc3jU
	wPz7EN89jlK6/WmBkldi2vM4HwFDRzbtK7oTYaGbTfgGGnC9qwLQAr9CvrmuReZn8uEXMcRIMB/
	SlIMsvcSdFHJ5dM6FwqhBPDi72aITYvKMPjxY7EUktTuyxT/wrKn4TythNMKs45UtHTWeOqLZf3
	ruyrPpkulCOCz7RiZjwiPuIBqVxXilK+JfPg4Pch/U04EwGxesGxUmIOlqcE7COG0/P7u18dmx9
	z86e9cBUUO9rVcSGDcFe3AVydg==
X-Received: by 2002:a05:693c:2585:b0:36c:a1ef:f8f7 with SMTP id 5a478bee46e88-37963371df1mr9793859eec.4.1794851779247;
        Mon, 16 Nov 2026 09:56:19 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:56:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 102/105] python3-watchdog: upgrade 6.0.0 -> 7.1.0
Date: Mon, 16 Nov 2026 09:53:54 -0800
Message-ID: <20261116175359.342679-102-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:56:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132557
Content-Type: text/plain; charset="utf-8"

Changes:
- 7.0.0 BREAKING: dropped Python 3.9 and 3.10; added Python 3.15.
- inotify: instance created lazily, recursive watches reconciled
  after queue overflow, directories moved into a watched tree are
  watched, fixed thread dying with KeyError on tree copies.
- DirectorySnapshotDiff no longer reports new symlinks as moves.
- case_sensitive=False matching fixed on Python <3.13; debounce_
  interval_seconds and DelayedQueue.delay_sec deprecated.
- watchmedo: runnable via "python -m watchdog"; AutoRestartTrick stop
  signal works on Windows; generate-tricks-yaml output loadable.
- fsevents extension builds on PyPy 3.12.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{python3-watchdog_6.0.0.bb => python3-watchdog_7.1.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-watchdog_6.0.0.bb => python3-watchdog_7.1.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-watchdog_6.0.0.bb b/meta-python/recipes-devtools/python/python3-watchdog_7.1.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-watchdog_6.0.0.bb
rename to meta-python/recipes-devtools/python/python3-watchdog_7.1.0.bb
index 40abfbfa38..e206e93c5f 100644
--- a/meta-python/recipes-devtools/python/python3-watchdog_6.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-watchdog_7.1.0.bb
@@ -3,7 +3,7 @@ SUMMARY = "Filesystem events monitoring"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "9ddf7c82fda3ae8e24decda1338ede66e1c99883db93711d8fb941eaa2d8c282"
+SRC_URI[sha256sum] = "d3861e255416f49a1384474cb2efa097de165fb330d4c5432ce6708b509ed922"
 
 inherit pypi setuptools3
 
