Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CFC5D29C54
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 17:55:12 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40944.1768845308584391932
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 09:55:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MMJUI6YR;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4801d21c411so15210455e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 09:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768845307; x=1769450107; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=aDkmgUGnMNEXEkXjh8BdeqW4PL3/1EbxA+EJCjnlRLM=;
        b=MMJUI6YRH3KPP8GlC+sr2M9T1as4FEdPxrIS1IkHXv22Uhwe7p4mLbdjPuJtepR5+2
         HFfo9I7ej4AEjxr9bQ+tDJwCImQX8mbKItbVUwvsx0rqEJPgDgc7EbtH/KaQFB2YwU9h
         QZDGnTqj61+i2JQ3bvppQD1lJ+1AiTyj+Ci7vcfafSnptdjO/YMn9g28OM3p4cCkg6VQ
         BCz980vjuZU/JaNWtutuKWHSgJQuEdLGVgS4ryIECsYWYIU8tSukfYts11r+yUZSc+oa
         pEn9w5QWK3K8GOHTGyAF2dfr1195IHlCOqDge05ERsCJP3Jtbz43rdXq2IJ+TjdVhQTr
         /kOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768845307; x=1769450107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aDkmgUGnMNEXEkXjh8BdeqW4PL3/1EbxA+EJCjnlRLM=;
        b=mLdxx688dE4pXqiGgwFLcYhrlw3BmthDMifHPrctrYdfjTbzPVCLHNOMk7wvhoBxkP
         27PA1P9CkWjXMMpFGLJo6TfJZ2WzIF42Bg9l803K8bzUCkJ1fDrycpjhSBOpqDNFUERc
         mVLXOkDy0i6MLaonYbF5nWcjABLacjWUqllwVsXkQidQh/LaGwuQqLqX56iXatiJLgFM
         c/hDNa35SWun7hSgAepIzbPmv1y6/U+ldixM9yXzXHUSLuQLKQcACVXS7TLEgWrDq6mn
         fK/GVKRc/LaWMqsIcx5OxyGvXsoxy7RQOCalh3BK3XVIXvF/UfJRjYDaWN2epfcpBNtC
         aOpA==
X-Gm-Message-State: AOJu0YykDUc+qKd5GXcEUtNp8xhKriHzThwAGR450d6ZecX8QvOeuD0z
	RE8DFxWVQ38z6FzJfTQ95ZwrUWpknfhcq66fYZgjuyL8BFQpwgvcGIZmUOsRcQ==
X-Gm-Gg: AY/fxX6utXXGXoXQYNId1yeUvkZB5EKSvnfA4vpWfn1JRBWWFe9ffjKSzdsfLy4HPow
	R0a7OwL+pwBjdWkbpmv6EUqGoM4UVGSRi0ONSW7MpNpcLkj2Fo22DifTN6KB8bdPtYiKSieVcKw
	g+wiczk9QBiOLvs96our0TAHONjzVBlyL6W66FFr4TbYvNYCBhVGd3OQddgg1/8xGXGHcNL63iN
	4r35bI91YoLxnRhhA1st6Qi/a5f5kvu87jzWK3OJ5kRVctquyQ5ut/IrBF1O1nzIpaahAW3Fb9v
	a5C3F1IbB+xhWyvdWR3sR0fJyhUa2kN2XU8wMWRUXLbobG48wZo0C5jw0G7IQOeRmh3vkaMdnS6
	6sxkkrPLlW1KsrhQ/5nAKSH0kPQD6JJ//hblkmNF9rEWHgnSZCHPN2X11sTmwBYaX3Z8R7KVyWt
	i2F1JsHR34
X-Received: by 2002:a05:600c:4586:b0:477:76cb:4812 with SMTP id 5b1f17b1804b1-4801e2a50e4mr155620275e9.0.1768845306691;
        Mon, 19 Jan 2026 09:55:06 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8795f1sm204201785e9.6.2026.01.19.09.55.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 09:55:06 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/4] python3-werkzeug: upgrade 3.1.4 -> 3.1.5
Date: Mon, 19 Jan 2026 18:55:02 +0100
Message-ID: <20260119175505.777598-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 17:55:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123644

Contains fix for CVE-2026-21860

Changelog:
- safe_join on Windows does not allow more special device names,
  regardless of extension or surrounding spaces.
- The multipart form parser handles a \r\n sequence at a chunk boundary.
  This fixes the previous attempt, which caused incorrect content lengths.
- Fix AttributeError when initializing DebuggedApplication with pin_security=False.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{python3-werkzeug_3.1.4.bb => python3-werkzeug_3.1.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_3.1.4.bb => python3-werkzeug_3.1.5.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_3.1.4.bb b/meta-python/recipes-devtools/python/python3-werkzeug_3.1.5.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-werkzeug_3.1.4.bb
rename to meta-python/recipes-devtools/python/python3-werkzeug_3.1.5.bb
index 0886dbfef1..1df88b78d0 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_3.1.4.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_3.1.5.bb
@@ -10,7 +10,7 @@ HOMEPAGE = "https://werkzeug.palletsprojects.com"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "cd3cd98b1b92dc3b7b3995038826c68097dcb16f9baa63abe35f20eafeb9fe5e"
+SRC_URI[sha256sum] = "6a548b0e88955dd07ccb25539d7d0cc97417ee9e179677d22c7041c8f078ce67"
 
 CVE_PRODUCT = "werkzeug"
 

