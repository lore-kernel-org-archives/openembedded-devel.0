Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web09.36581.1620060562188992372
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 May 2021 09:49:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UamYqKOF;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id b21so3160990plz.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 May 2021 09:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QL9LcBPBwSCFq2BGQqUtDbHGW9BUbYRUKg/SrFZPfyQ=;
        b=UamYqKOFGDWf75cRwPcdUP7+WOQS963ULqdqIHzyA6IJUydqVOMvXWbTaG0mEIVxcC
         clDBmSQvw8sARquOkg0m5uOid81k5HxpSY98Zz8gREgAttjGwtz5LihIgw5rCyABImT1
         ATpjYaiBoD8el9f1FeCFZ2B7hYIJjV13wcckyE6D/kBLxV7F8lLMuAA/HTu5O4NQpjLP
         hoTTFnAaFhALDumCPBZY+nTweAeCDhN2FpN2V8mz1SsPLJxvAEUaXw8Hjrp+kcZNlERc
         qwgMD6d4M+Y670M3TnEGAZ/DkBv6b9RIOrzjHEN2VG5JruNLXHs55p6ZqrRP9JUijHT9
         k2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QL9LcBPBwSCFq2BGQqUtDbHGW9BUbYRUKg/SrFZPfyQ=;
        b=Q3w6BV9UJhKgSR5AFDp1c8kBamgQtFlR6MKxNZk2i0hKAkZjb25cso3gv6SYlvgNjY
         eCDepo8tAHhEK/+hljJGaFOCvjyXBLc66KPOx9l7gTXWWfkhMBnQirTEd6x81ufQqSai
         JyMS3ZG8kuzAL08d6mopVjscoVhsgR4je8jf7vGQft+4FxPJ47lifnW1hy1k8WkVkmzU
         Y1W6WLK8qeE4VU1RepfdNy8ItGhkNgJcXp2cWkHcv0l37+mDgmuMHRMy5KsLiZHmS9Lt
         n2qAb8Y8Gcfw+6UQfHBpKCApwBQIY5z42CLH5gTYFrshd3BbiN5Jzbe79UtYKv6IBLuu
         H8aA==
X-Gm-Message-State: AOAM530bCrHQDNn8khvZgQDR9jlhvHeGn+eh/siXJkoYZSd7EzEHFHcK
	UjBO20FVEJZ8Hg9hKeg+zJyyeZb3qdX3bQ==
X-Google-Smtp-Source: ABdhPJwHX9fq6rYZe2YFDUUOoKSB/6RkYUd2W20pPq9CsJiaw/iwi9gktNb/wgJUrByypQCAJ3tyQQ==
X-Received: by 2002:a17:90a:590d:: with SMTP id k13mr5022849pji.68.1620060561438;
        Mon, 03 May 2021 09:49:21 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a7ac])
        by smtp.gmail.com with ESMTPSA id x9sm10087362pfq.197.2021.05.03.09.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 09:49:21 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH] libupnp: Upgrade to 1.14.6
Date: Mon,  3 May 2021 09:49:19 -0700
Message-Id: <20210503164919.3067041-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libupnp/{libupnp_1.14.0.bb => libupnp_1.14.6.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-connectivity/libupnp/{libupnp_1.14.0.bb => libupnp_1.14.6.bb} (85%)

diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.0.bb b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.6.bb
similarity index 85%
rename from meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.0.bb
rename to meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.6.bb
index 88652a443b..ff6fb55dd3 100644
--- a/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.0.bb
+++ b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.6.bb
@@ -8,8 +8,8 @@ HOMEPAGE = "http://pupnp.sourceforge.net/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=394a0f17b97f33426275571e15920434"
 
-SRCREV = "a6c3616530490ca67db41131572ec18f00d95eb0"
-SRC_URI = "git://github.com/mrjimenez/pupnp.git;protocol=https"
+SRCREV = "cef2b23fb36baac091b0c7d41136b4c1d9549c6d"
+SRC_URI = "git://github.com/pupnp/pupnp.git;protocol=https;branch=branch-1.14.x"
 
 S="${WORKDIR}/git"
 
-- 
2.31.1

