Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CDE8C55ABA
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 19:41:32 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25000.1785872488965064857
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 12:41:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mqJC8EGS;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2caced6038eso3662425ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 12:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785872488; x=1786477288; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T//9r0hZNwTHOqykxHA6hmAoL08zA8mtxsKeLYKwJ94=;
        b=mqJC8EGSbL3Le/PfpYaTtv62lDd3xRJ8uejGBKBIyOvgjwUFKUbl2365BzSFkatgLN
         IGv9LYAFsp3InPewqjIeJK2I1n6B9UnUGWLyzMuv8zgpnTEUrzxum7znpc5+NZAQugY5
         8It32mMMrsziWvvCl+68rUBPMacMXvOyp/gbWPBbpxpoRFHzRE6OgToKvKFNnRrh/ztJ
         Wg0FEnOrnEB7KxnSnSezKOxzy0gPsvvck88x1jJqoWPQ8Xi6e/o6n8eOYWt8w+uL+41M
         3Di9ZXHMaHngaS+2Rr8jnpL7JvvCSTn9fF0IBPonYZbrfsXyVZwbANtj04KgVvziFHTs
         ITyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785872488; x=1786477288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T//9r0hZNwTHOqykxHA6hmAoL08zA8mtxsKeLYKwJ94=;
        b=JiGc7a4tSCNsOJRyO+AenOZlx6GCfiuSR+S9h6HZ/KAGgMhOrEc/SYhWo/4mBNoG/Y
         O7lMw+45YzNnndsCRwxrMGRZXrRngf/16QMehEAoUH7DEYyQVl/UZ99ZblsPixVWBo0R
         OJyczPY1vAtpjkcSRmowEjH0hpYo9FGtIJ7Ndt9+ssd7sk4OD5H+CaOvjEY5kST5qcCU
         /NkzoK11BigCyg0jMAb0o9MbAlMBhirmXqv1SHsA70/8/jScYJKO5cvApUwPLdNBisxV
         UQyBfHRpS4VqcTPGfGYFy86WblQg1g0WNPl6fEzzWVEWgmkTs2w/U8Vax9eqSaE31yr4
         Y98Q==
X-Gm-Message-State: AOJu0Yyhq2qbRBP/Zu8sFX6ihSY+tzneaxqYMalegUPbL1rcw6LjcwK/
	u7AVHeSHXaMwYV7QHEjtExAbK6umhLuNsJtO7gzDPlm5j5Wj5vrqQMbKWbTN8o6C
X-Gm-Gg: AR+sD13JdNi+NtRmgHEMFsXsQozH81/zMgtKdmIJfN0GvKvl/cZPcvnhVwdlL33jgSm
	fPiT6iNERqrAmntQmXRTkSVRV7ov5DR8aTy8amSsC+5vbS/NiZzHh5rbkQBBV0Is4K/Yi/0Hfh0
	Q1COGcwA8FncOw2OlQtOM+ADxgk5JgJx756dpa1m59tVE1IxgmsXrVOOSwOPaonS/QB1Wh1NwJd
	Wk7wtfHplDD4r1s5vFdNEHopgj5OwEXrbjQXaIiI4k84hzH76p9KyoWot9CWs547xzdtWlnzA7Z
	L+OZ17zs0ZP/GrX1mKGgVRQGt8R22jfbR9NEeiBNwGv1kBrMgM8Nie4mlR+J0PSWWEzCiQ2qwKx
	SeZQGEokD2vsUBtVfwUTGCc7OGYZR1Wtj9sB1q6NNd/OXht1UOyzsDv+XNLKsAgsw5t0DSXgIfR
	0TkCv3nekkNjnJw82AxJGxoD0YLNpfLq+k2EP0Nq5gS9VL2NwT7mpWUI4oodoaXvr0vUHoUo+Kg
	g==
X-Received: by 2002:a17:902:d54a:b0:2c9:d56d:afa3 with SMTP id d9443c01a7336-2d08ab5dc4fmr58507895ad.15.1785872488293;
        Tue, 04 Aug 2026 12:41:28 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673b7f4sm8156417eec.17.2026.08.04.12.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:41:28 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][wrynose][PATCH 31/36] gupnp: upgrade 1.6.9 -> 1.6.10
Date: Wed,  5 Aug 2026 07:39:58 +1200
Message-ID: <20260804194003.3158916-31-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
References: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 19:41:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128778

From: Khem Raj <khem.raj@oss.qualcomm.com>

Upstream changes (NEWS):
 * Require GSSDP >= 1.6.5 and reuse its allocated TCP socket for the web
   server.
 * Do not leak a GError in the ACL handler.
 * Fix IPv6 host-header validation.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 575122a4a09af6314e0b5a8b1b2085172dcfbe89)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../gupnp/{gupnp_1.6.9.bb => gupnp_1.6.10.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-connectivity/gupnp/{gupnp_1.6.9.bb => gupnp_1.6.10.bb} (93%)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.9.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.10.bb
similarity index 93%
rename from meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.9.bb
rename to meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.10.bb
index e2bfcb5ed7..6ba8a0689c 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.9.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.10.bb
@@ -7,7 +7,7 @@ DEPENDS = "e2fsprogs gssdp libsoup-3.0 libxml2"
 
 inherit gnomebase pkgconfig vala gobject-introspection ptest
 SRC_URI += "file://run-ptest"
-SRC_URI[archive.sha256sum] = "2edb6ee3613558e62f538735368aee27151b7e09d4e2e2c51606833da801869b"
+SRC_URI[archive.sha256sum] = "a1ee07b7b12673c32d7fc73ca158a50c1a4dc69ab35b65e94d24d38ac875345e"
 
 SYSROOT_PREPROCESS_FUNCS += "gupnp_sysroot_preprocess"
 

