Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67E9AC561E6
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 19:40:31 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24799.1785872425915234098
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 12:40:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CZxFpBLu;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ca12086c06eso132904a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 12:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785872425; x=1786477225; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UY/6T2jBKWD1MTxGBRs08ZBnVtWCy87gyVViuYeFSy8=;
        b=CZxFpBLukmf09W70C+K3RJvru0s6Vg82FpM4u0qgjmVC3RWwtTp3z3eTtAVaarhRr6
         Z3XCkPKTAFNELawFp6pEzHp96b2zbT7ZsCIsZA6Gh/tkt7W6POmUXqPoBV3fsa7sPEUZ
         36S7Z6rX0ChEXPrYaXeFyB4V5+YhsGEvazhbGV6mZjpYGelCRy4ZT7TNhtF/y/HlopmT
         PhM3nFW9+WSsZWPohhMHXX8ygIT8ZLkgM+DxVr8I8jsdlzobfu6SfohQvg6f/HNUd71l
         82q5sB4A3uwI+fiYB8JqzGZBCaK09Qloiel7y6B7Ptrhi9E7hkrYkIMBH/fdKTbZU5/n
         wQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785872425; x=1786477225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UY/6T2jBKWD1MTxGBRs08ZBnVtWCy87gyVViuYeFSy8=;
        b=IDkT585UeiA8eJ6WcjsPpOgrIu7JdQjuSV/9EhDB6nk7VWFzjKWDbCVeX8Laa9fmVu
         BQ87IxAGuiu2IbA3pLqcDfFUJR9G+FiqyOFzlttw7n7MTrmvfghBzH4GVdlIKcM5DtpX
         7Y0OWFyD4wOrXwrGyu2ZST4tB63kII7x5akEc2QyJPwK8J6zP2UYADHOwG2cUXcdIae/
         wEXytbuImir0/xEh6BnPh+EOnpQyo0T1nUU4Dr76KS3tPnpESMDuHGIQP0HFqZEVP17w
         Zz5EG5Jzt+81aHDUqDNPVnQYguAXawQQnHNdAnF/U+slDS8Cyz8SBqxE/5igJSYx8x5O
         4xJw==
X-Gm-Message-State: AOJu0YwfKbRAXA3rviJo7tsegf9JuN6QU4osZSRYL9qxG1gzAjxTb7OA
	U7MMh5ztVGLSUqBgaMhvLxhugH12weYLVMXOYGa/YJ2dp1/vGX7113YZB+fV4shh
X-Gm-Gg: AR+sD10VjELir3CJOjlDPXeDIXCqbqE8cR0u2zSAqzpT9roBz170x6XotpXuec4LhkS
	zBVHw/v8ZfDcKnTOyb/fIR1D1wuUNPVZhhB5hR4KA8mIazGcM3i6pGrDNEXVy9bmo7eHSmwT/wJ
	BoLd7RbjXiZ+0H9ZQD1aZ8NveNSWUcsaTNVQBsBIqu0LE0rWhwpbHYdRVukYXoJ+oqGmDKMfI9+
	+ZD576GIKmOXY93s/+pQr2vLhQGc1n9w0h3Ef5hHQy1vcSmKChyWVIGhyVOf6d9+Y94DYnuS5lx
	l2mDlIrVHFuUE6NvKK8hJp6osHELOPoooB5iQY0UB1iG24cuhChdd5vVvBVb8ujPcy6yq+VW06H
	dTiKkeabvraRMBSMHJ7R0yUPNiE7Csl1ZkzEY12MC5wNNlAWb2uwlFuNYNBcCCqB8EHmsD4RtLj
	CF0/g0+bUGW29vbjETuHd9nAzfCgA1CnXZCvP3IeYvjNaiOcNSmg15d8KH3gzEVM0Sr7Q656Lu9
	Q==
X-Received: by 2002:a05:6a21:6e0c:b0:3c6:3c5b:fe66 with SMTP id adf61e73a8af0-3cb85f4a678mr1141239637.41.1785872425169;
        Tue, 04 Aug 2026 12:40:25 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673b7f4sm8156417eec.17.2026.08.04.12.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:40:24 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 6/36] netplan: upgrade 1.2.1 -> 1.2.2
Date: Wed,  5 Aug 2026 07:39:33 +1200
Message-ID: <20260804194003.3158916-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
References: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 19:40:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128753

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://github.com/canonical/netplan/releases/tag/1.2.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../netplan/{netplan_1.2.1.bb => netplan_1.2.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/{netplan_1.2.1.bb => netplan_1.2.2.bb} (97%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.2.1.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.2.2.bb
similarity index 97%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.2.1.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.2.2.bb
index 22159dbcab..62e6db9b61 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.2.1.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.2.2.bb
@@ -20,7 +20,7 @@ SRC_URI = "git://github.com/CanonicalLtd/netplan.git;branch=main;protocol=https
 
 SRC_URI:append:libc-musl = " file://0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch"
 
-SRCREV = "f758e3f6415aa68b7cf28991bc5b3e9631297d6d"
+SRCREV = "e9dd90a96727bc6b7264c36526b39d1dacccc00f"
 
 
 DEPENDS = "glib-2.0 libyaml util-linux-libuuid \

