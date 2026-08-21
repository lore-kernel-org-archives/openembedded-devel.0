Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A09A5C5DF8F
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 04:35:59 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.689.1787286958052870336
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2026 21:35:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ckPYam8N;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2caced6038eso4924175ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2026 21:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787286957; x=1787891757; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/qUdVlfkP/l3rKhJ3O2pxtH9+6FXTfbbgDGr1W9yn3o=;
        b=ckPYam8N7OqmcuF8DO7vZmIgl0J2qUH1g5SQMZnZIHCWmX9RezmE99oU8xk9eksy1k
         KUlv7iwInTme5Qu2w0FmfMkduUnxO0XjI72qfKe1sxgS1O1xFPJCJp2kPAP/zp1idxwJ
         wGnpNZ5d9efQ0rplQBJ1RxndK7/RpV4WYHB2JWb2UCfBnPq0Wi2kqJ0UgS/31sAnsat5
         J8Gtry9SDn1Mk7wUdf+N+cFj3ubGgjo+/d62rUxjuMuc83Ba3lmS3k54a6zFB41vBkHn
         JzVp2Z0J64Kf8i9N4S+M1FJdkX5QZ23LJmmAagnbiSqpYSTXRyJYgHNqCKoipmpsGsIQ
         GMKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787286957; x=1787891757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/qUdVlfkP/l3rKhJ3O2pxtH9+6FXTfbbgDGr1W9yn3o=;
        b=hfpvIU/AUxpHIKg53ODeYT/kArPRice//I+o/qWkOKrdTLbnLdxGYabg8LwnMRbhSQ
         hnyRZE2W4sgTh5GsKbUMWAgltPdHBoJxOZy/KCOS4kSDtxfhpWtHxzWBhQNrtwsbO7SZ
         HqdHYOB2n0dggwxuJwXac9gDnIIzSfiMy/R59eqsx6w4qbZScmU+j2/HVG8rcqiFM0Bd
         2XBuoX/GkJ4c0DA8bRdA/He3JDhAgATTRcxEKlZdQUzMdykcz1cd9G6eXETluT4+77sc
         KlhNz6VXGP5gsns2Bx3jOVkZqbl5DG2gJgQOXbrnz3ZedlXtp0x93oC01eKehpDxT3l5
         SIXw==
X-Gm-Message-State: AFuF++k7AO004LVzZPTNzqDR3yy6pdTXpiwUZlT/8bTazqdJUlJTfKcO
	HEMe1JHJSEJV2XOvk6nqR4kc6N0Qa8fsbtyhpZrvQOdQqp6iq04HaHVbDDafQg==
X-Gm-Gg: AR+sD12y6HpkFTGtnyw2GEN73ZJf1hllo5QAZcOPXJuS9mIfjyt1nCi6ZouIU5BfNFR
	lhJ7YHs9G0dR3rWPryg5cEiSyYS4l89hUte8QEelPD/LjHnKWipeTDo1wu0o4Nv0FuQGwFM9AEt
	t5SclB1CQgfZZ9Ei10/cJ5VEzKf0W/NlHqe+dQj6ggCOFZfnuBWrm/zTD1u9IkhaTMVLTND0LgK
	3gb4vIfNrM6JOeV9rLNhE4MkZ1fScp1W765r2ES5t70vqsi/0OqkNjTNjC2HFJ3PJdTuKzK4CVe
	2Rfa9pAS7NxYsvyT5E95orrtEVKy1ImvJQh0LywcGZ1Thp81DFRtrBfHdxc6zav3A0PH+84biZQ
	bp7OjH4fCJvaEE9/l/A5hANom1zF9eUUotu9U5GYXOHJ5MVDsWtcHVeobWv1DFHnq+KKjAIvapM
	aHUHkKx5hjLJTd590wRhOla6Ym5pEdE13fk5+vxJSqTdJBSVt053RRVEvLYMNeSSmzPHJ4cLF+d
	hbUGV8byAfLgIY1zVw=
X-Received: by 2002:a17:902:ce0d:b0:2bd:2c3a:2a36 with SMTP id d9443c01a7336-2d619d47dfamr145385705ad.0.1787286957293;
        Thu, 20 Aug 2026 21:35:57 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([161.29.95.207])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef6ec40sm23626097eec.7.2026.08.20.21.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 21:35:56 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 10/15] librdkafka: upgrade 2.11.1 -> 2.15.0
Date: Fri, 21 Aug 2026 16:35:19 +1200
Message-ID: <20260821043525.448011-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821043525.448011-1-ankur.tyagi85@gmail.com>
References: <20260821043525.448011-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 04:35:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129405

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/confluentinc/librdkafka/blob/v2.15.0/CHANGELOG.md

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../librdkafka/{librdkafka_2.11.1.bb => librdkafka_2.15.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/librdkafka/{librdkafka_2.11.1.bb => librdkafka_2.15.0.bb} (92%)

diff --git a/meta-oe/recipes-support/librdkafka/librdkafka_2.11.1.bb b/meta-oe/recipes-support/librdkafka/librdkafka_2.15.0.bb
similarity index 92%
rename from meta-oe/recipes-support/librdkafka/librdkafka_2.11.1.bb
rename to meta-oe/recipes-support/librdkafka/librdkafka_2.15.0.bb
index d7f3ee572d..9a8a84da98 100644
--- a/meta-oe/recipes-support/librdkafka/librdkafka_2.11.1.bb
+++ b/meta-oe/recipes-support/librdkafka/librdkafka_2.15.0.bb
@@ -8,7 +8,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=40b04809b5d6f648f20f45143cbcb1ad"
 
 SRC_URI = "git://github.com/edenhill/librdkafka;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "69b1865efdc0118cd017760d038d34e52fb3f0d0"
+SRCREV = "9a94e11452cdeb0a844db44ee5dd01ccbe17d3ab"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 

