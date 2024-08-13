Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82BFDC52D7C
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 08:33:21 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.67525.1723537995314854676
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Aug 2024 01:33:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=TIrVt1P3;
 spf=pass (domain: konsulko.com, ip: 209.85.167.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52f04b3cb33so10434256e87.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Aug 2024 01:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723537993; x=1724142793; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+tUAv/pUB/gOvQNDqafKvmds/yrIptbjO1A7aiqvvV4=;
        b=TIrVt1P3ZeDv0uVrml8bs3WdkYAufGUnzetnqM6gxJaRCBdHOKcQwnLNHGuQGY3gMp
         AshJBe/VpUsqBGnmu+/qJ7Rqmfw5ow++4fv7r9MnDuoexjwzFGCZzXLxNXWihUvJ5peC
         casjSyQ6ctweM5IYDBH7VL7oCt5gJyiIT9x8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723537993; x=1724142793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+tUAv/pUB/gOvQNDqafKvmds/yrIptbjO1A7aiqvvV4=;
        b=SB4x6528CKVi0wRiJ33Gwcw5KcR+DCmbYKGILHxd0tQkV9k82/8t2NjGCGRz3y1XTX
         88wxCZzPazrrc27PpgomhHO0yw2F/X8pP5tODRCCMe0DbnKB3TaZnrDZsM7QfPDlMJ/w
         tOTPLkg8yR3ucXmIF2ikqIpYpm+a+4k6/tc2QZGt+MUa7q+xrvRUqzzEyLlgCtubxAGK
         AQPDIlaXIWXfu4wELrCtZO0fxdXZEfrJ10aI/GfdjaL/m5NX2uwvAzEYKAMArbhXIebo
         bxFeVdqgILeRuiCYJmNzh8opbChKdXQKutjKZz1znNURzzQJmbYmTpzWYUl6ZZtPnqbo
         /m0Q==
X-Gm-Message-State: AOJu0Yy71qCnsFk9B7Aw10EifdKltqxJAVhZK9W0yCpw52tKNEld22qZ
	UKKVCv0paTCIKmqvo+k6+88R1cdoZMIRADXprCp57B3HgLOH11QFbi+q2bU2XwUK1Dc/OdFX/BY
	z
X-Google-Smtp-Source: AGHT+IEOn6At60wkXC5gUS9QHALhNfqF3ubMltByLECQwINYHoE7jAQPvCVFZA6ws9OXQAlli4cLNA==
X-Received: by 2002:a05:6512:128f:b0:52c:ddef:4eb7 with SMTP id 2adb3069b0e04-5321365357cmr2428177e87.20.1723537992733;
        Tue, 13 Aug 2024 01:33:12 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f4150226sm49202966b.182.2024.08.13.01.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 01:33:12 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-aiohttp: Upgrade 3.10.1 -> 3.10.3
Date: Tue, 13 Aug 2024 11:33:09 +0300
Message-Id: <20240813083309.3661502-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240813083309.3661502-1-leon.anavi@konsulko.com>
References: <20240813083309.3661502-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Aug 2024 08:33:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111789

Upgrade to release 3.10.3:

- Fixed multipart reading when stream buffer splits the boundary
  over several read() calls
- Fixed :py:class:aiohttp.TCPConnector doing blocking I/O in the
  event loop to create the SSLContext
- Improved performance of :py:meth:~aiohttp.ClientWebSocketResponse.receive
  and :py:meth:~aiohttp.web.WebSocketResponse.receive when there
  is no timeout
- Improved performance of starting request handlers with Python 3.12+
- Improved performance of HTTP keep-alive checks
- Improved performance of generating random WebSocket mask

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-aiohttp_3.10.1.bb => python3-aiohttp_3.10.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.10.1.bb => python3-aiohttp_3.10.3.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.10.1.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.10.3.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.10.1.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.10.3.bb
index f9f007d08..a2cfe7173 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.10.1.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.10.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 
-SRC_URI[sha256sum] = "8b0d058e4e425d3b45e8ec70d49b402f4d6b21041e674798b1f91ba027c73f28"
+SRC_URI[sha256sum] = "21650e7032cc2d31fc23d353d7123e771354f2a3d5b05a5647fc30fea214e696"
 
 PYPI_PACKAGE = "aiohttp"
 inherit python_setuptools_build_meta pypi
-- 
2.39.2


