Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F0D1D148BF
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 07:51:49 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1712.1767858705699086565
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 23:51:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LWJ7kpP3;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47a8195e515so20419095e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 23:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767858704; x=1768463504; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hJBnLJwwlAGPpoWxYr3V5RLjx3Npp5n0ofDzkwgUA9w=;
        b=LWJ7kpP3+v2WtO0WpvsLuqkzIXbvRSMfMNx3dUgS/XHtXNUmP14sHmy1XVf5rr30UC
         BfBqJpACH4/hV8QIpd9xVpk8IGAv3/UmrdKkEHFGXsYmV/bQiwU36pZ0uXJxf39ZRFhh
         O2ZOxSATTtHptG9NJ5d9JnRXHia9utSGvWQ8oFckJY2mg2ny3tvyrt5yiQvUWPOO2p/2
         7yPjedgau3ivycfMYUmXsu7b5vAvRFeCEw5ekUPEHOEGOJ5kvWBJCBJRx376wz0jX7tU
         1B+GIQzFirciu3+HDn20WlrV9H64GbXiPFFtfIsuRvGjeILoPkvw9Gs13bDbLtWFCrTe
         1MdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767858704; x=1768463504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hJBnLJwwlAGPpoWxYr3V5RLjx3Npp5n0ofDzkwgUA9w=;
        b=VGKuCuwX+8FWZqdBvcvkFo6FZdSx4yblUUZs1Zp4KcsmNi9C47POKWyE8QYgW5Ch6b
         ydLGVz/Ws04NTWj/nL5c7KQCDuhYwa68vvEJHkS7DBuQ1jywiekywe6RtCOSW9x1jYAO
         qEWVGoGoQgY0RN3LzgLAqwNoIbtHdBjZdH3k1pjqYjrBHUIccfYs6zeE/RsR6fdKSPgN
         COfKJf/6rezicUuZ7ozCpiVi733f8lsxa0AgcOeYFKz7LbpAiyc8wdHUjJB1MBa8TM8E
         GZsdeIFRqL1PCyyBnOeWuRAGEW/sCIhxNAuWtEo+PtmJgPNTzI+VT8eqYuPlErE+zWOO
         jcOw==
X-Gm-Message-State: AOJu0YzR07PfJo34WFMg7zif8XNHppeBhIea3OC5/ck6xXMIiKgixXjr
	buB+j6lG/OkA05gcQYh9nBvxyvU84DzuWkfW6PDmR1jM8IA2iquTNdA/ZBIaHQ==
X-Gm-Gg: AY/fxX567Vs3SaTvRxJlfG3bc3IVvJKkpa3GXgu9FvR/u1hJTnY6/ROQH2j/lRY5oor
	JuLHvy+tuqXitQw7SK09jSNT3vGgp7prD4ekFaa7OkltadmBS1cYX4bk47uGEoXu1jIKwVGWmP0
	5CN5ySGVwC114sDnyGCExWI4vuFQM+d4UQDJJnYokyASJXtcbdL1IP+rghw7GqkCJHikBIHDthg
	VRiMMiRAreMqeTmkgJbf9B5Ki+38ZGNehDRYoJvPgr8m1RbfJKX1AmSUrAiiTSWy/WnAIxK1AuL
	jUp0V+XQu+pdsR+QIFznURVLJjeaR3OUcnF0CmNjZiXPt8Ee2HUpdv77yFbcyuaQYfJbFTI741s
	QDVjGPLyLbLGO/gQcKT7yGlwrFB12jt1w0Bhsa9dpKe6MK1n6Ghwn/gCPXjrn9WTH9BQDOmzxrQ
	01wXWqllTu
X-Google-Smtp-Source: AGHT+IFUMKwxoJ0nDmRu6dvOzYfpEFRQ5pI3oa3rRDUyhaUgJGoGvXK7EvVaYFNIOk7JAJdsKg/y4g==
X-Received: by 2002:a05:600c:820f:b0:477:a978:3a7b with SMTP id 5b1f17b1804b1-47d84b32f09mr57751475e9.22.1767858704004;
        Wed, 07 Jan 2026 23:51:44 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5dfa07sm14819032f8f.25.2026.01.07.23.51.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 23:51:43 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] raptor2: set CVE_PRODUCT
Date: Thu,  8 Jan 2026 08:51:42 +0100
Message-ID: <20260108075142.2782868-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 07:51:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123253

All relevant CVEs are files against these CPEs.

See CVE db query (zediious vendor is not relevant):

sqlite> select * from PRODUCTs where PRODUCT like '%raptor%' and vendor <> 'symantec' and product <> 'velociraptor';
CVE-2012-0037|librdf|raptor|||2.0.7|<
CVE-2017-18926|librdf|raptor_rdf_syntax_library|2.0.15|=||
CVE-2020-25713|librdf|raptor_rdf_syntax_library|2.0.15|=||
CVE-2023-49078|zediious|raptor-web|0.4.4|=||
CVE-2024-57822|librdf|raptor_rdf_syntax_library|||2.0.16|<=
CVE-2024-57823|librdf|raptor_rdf_syntax_library|||2.0.16|<=

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/raptor2/raptor2_2.0.16.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/raptor2/raptor2_2.0.16.bb b/meta-oe/recipes-support/raptor2/raptor2_2.0.16.bb
index 7014a28c02..03e57ce86f 100644
--- a/meta-oe/recipes-support/raptor2/raptor2_2.0.16.bb
+++ b/meta-oe/recipes-support/raptor2/raptor2_2.0.16.bb
@@ -22,3 +22,5 @@ EXTRA_OECONF = " \
     --without-xml2-config \
     --without-xslt-config \
 "
+
+CVE_PRODUCT = "librdf:raptor_rdf_syntax_library librdf:raptor"

