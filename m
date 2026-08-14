Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30F97C5DF70
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:18 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24365.1786747574872180271
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=s7ii7oXH;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c9e7391839cso1390579a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747574; x=1787352374; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b1VxOyPKlp6Y2rnuJtSpzFmKkbDT/m8+Gu4CYDvpLCA=;
        b=s7ii7oXHgYRQ5mOQYVzge8h9/offyee/fTXdm0WXXvWlRZJhhsoiXvvto34+zQPpPE
         c56RqMcfj7Eh+/XKzfkVLeVTsvwoqujcf5PG4si4x4WTPbk4FIUqooVHO9yUdc+3mDtD
         exP9tKbNeV/w2ycyZChrUI6Aoo1+7/17enoMy2oTmBHtPUr56i+6yLk+2HzHiPdK61sh
         W4duxXQtC9D3IKA9NRY7b1xhB4SL4zNyPuDpFkkquAPXK9DlpltEu/TO73J1k7kVfOab
         mFFmym3uCZTI0262TT0zmvCQbStUYV/0G2W6mf2J+OcGqbVfx1jOxeW0mLnosA/dCSs7
         KiRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747574; x=1787352374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b1VxOyPKlp6Y2rnuJtSpzFmKkbDT/m8+Gu4CYDvpLCA=;
        b=R9ybZmIwDTVLOkuxN+AOrgNG3joY+lnxoSxUlUZCnH2zP1r+NnY4hHc07w9OIhYiWu
         fFvTZhvWo5OM7iqF6APL/P+lfnt+cZb6ubK1ATW3pLcILg19fx5liMyoxUhf3PxhAQJQ
         8kwPXLltadZNmhIt+Fe9YfB5VlH3K3ogPrsLITCNnAac4xcGWQMzAeGO6r9mWBZj3mGO
         hs6OdCtgFYTNS0LFSkQQIaSFd+zxBBuZKh+3/FcH6etpjwYdd/6B0c+HptPdNyVWzNpd
         2/WyDHPiLWbGQp2Z57lWUsbb8u3Yo1/S+6EggZh4dHwO5xV9/fH2xrLv+PrEG8EVz3n2
         fxtw==
X-Gm-Message-State: AOJu0YxIkqrqM3IY0xqxDVqkPv1B194pqoIw5iq/zHw8IhogjXnh5eNv
	+ly1L1KG1lD+FKY5Lruo+vzymdSU/rsm/nyBr1fyJZtZFGNzxvVanIOZOUkJKmEA
X-Gm-Gg: AR+sD13SJrnyDVoiqkGpiUT7J6T4kSP7V16DVJl5oA3mZOwg3vbqYglU80Wlp2fnJdm
	zeIcjFCLN0EwTJkFYtmNdGtivcJ0z8aMPuAdx8J21zrlUGzK3CEKtVm7PsTUS701GB8AYlbDFSX
	s+nhpjPcaTSvhIk6bTXDObuLgA/qiY8Mj1wDpJmIDYiiAYfbbzpfCRxcNq9UUYFI9i61NJgoAYK
	558b3FTE7FxI2BGhnuKhKXu7BNngWFZX+7UOczp+R7Z05RhkBT5PYXmVpCOqEKCb+ZUg79FMwqQ
	dzN3FtqG++YpsSKVuvCbLb+aSHPrCzbwJ89jwmxbYk9kpvXM+lA+Sck6g25VMjW8lwBcF0nhpjx
	o+8jHWvgoX2BXihW+y+D2FF7Q7otjjt2S14s0w+bxKHw+zpvh8NzfsPNLeHbMv/84ALgVG+xlsX
	B2C1hx1te5V5W3oOLR4gWnViyGyBqEDg0VyXsMg4Q7cZZ54UDxqtOjGPzBVZYrkI3KNC4H/5jw8
	HHTe+IxbT+KU9bNSNev4C0GLTgJaZDEp6HD3/eQZ8NIuN2ISvilgnr2FBL4w12Q8QBD8Gt1jqxK
	qVtHrhBAWS65EHJBa3XcZXGqCjWj6n/dx4yu5YdifaBSXNG3fjq34gMHdOuQPuSxQdQDWW929A0
	5qubUD5rtuQLg37G74hB6lsyN42C9xUYp0ycsJFz1GQ8f3w==
X-Received: by 2002:a05:6300:4c:b0:3c3:89ce:b5bc with SMTP id adf61e73a8af0-3cc71ac4503mr11751096637.15.1786747574197;
        Fri, 14 Aug 2026 15:46:14 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 029/109] lemon: upgrade 3.44.2 -> 3.53.4
Date: Fri, 14 Aug 2026 15:44:15 -0700
Message-ID: <20260814224539.1523174-29-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129093

Minor release; see upstream release notes for details.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../lemon/{lemon_3.44.2.bb => lemon_3.53.4.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/lemon/{lemon_3.44.2.bb => lemon_3.53.4.bb} (89%)

diff --git a/meta-oe/recipes-devtools/lemon/lemon_3.44.2.bb b/meta-oe/recipes-devtools/lemon/lemon_3.53.4.bb
similarity index 89%
rename from meta-oe/recipes-devtools/lemon/lemon_3.44.2.bb
rename to meta-oe/recipes-devtools/lemon/lemon_3.53.4.bb
index d4eb2e7ae9..403871a07d 100644
--- a/meta-oe/recipes-devtools/lemon/lemon_3.44.2.bb
+++ b/meta-oe/recipes-devtools/lemon/lemon_3.53.4.bb
@@ -5,9 +5,9 @@ SECTION = "devel"
 
 LIC_FILES_CHKSUM = "file://tool/lemon.c;endline=8;md5=c7551a78fa3fdecd96d1ad6761d205ee"
 
-SRC_URI = "git://github.com/sqlite/sqlite;protocol=https;branch=branch-3.44"
+SRC_URI = "git://github.com/sqlite/sqlite;protocol=https;branch=branch-3.53"
 
-SRCREV = "c8f9803dc32bfee78a9ca2b1abbe39499729219b"
+SRCREV = "b09c88c14082339b66c7b7158d609a771e64ca69"
 
 
 do_compile() {

