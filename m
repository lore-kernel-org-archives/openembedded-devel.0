Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46918C48BF6
	for <webhook@archiver.kernel.org>; Sun, 18 Feb 2024 14:54:13 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.19024.1708268052516695778
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Feb 2024 06:54:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UgctFOn+;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-561587ce966so7073492a12.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 Feb 2024 06:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708268051; x=1708872851; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UUFAW/bSmM40+lMXl36GqIX10jhqT7ewWU70MW+ZSH8=;
        b=UgctFOn+2jCNZiD9XW6uUcle8k1rdEz/CXzqRLRbnc+9I3uWWN3J6tBd2tl4tOG+oR
         fFxJy5yWBLURkadaZ+V0GHhHqpqmsixILvkuVnxUAoP5IJhaDK/R2sNEoM9tbfEvcxrU
         moNsGvgCAjnt39UMrbY3jfAiv3DzCHp5QP94DxoHVCsJWK5/ZCjlxu00Cyxhp0eITMNC
         Q8TjJm3dIMbNCG0UPJ2rmviE+mmK+Bbug00ae48QFa+yqKjW8xEe54MHUBi64tdyWsT7
         iD1AIbKi7YPv4jJ5BFeBC8DHLLbo4lO/zarZn/q2/QEQN14zCT/BLGC+1SdESHZGW5cD
         TR1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708268051; x=1708872851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UUFAW/bSmM40+lMXl36GqIX10jhqT7ewWU70MW+ZSH8=;
        b=TGaxbaZ8lyJS4UlGU31v1wnAEqmzCrM2NCi8hIeeMw3mhjlXDRmzldNsPoP56ZXwy2
         Efbo1RrBWqUtkU3pn7qJe8xyw2gaTqomL1GlcrW1yrxEqxbawYpYA5QohN4dmKVtchJ2
         jnZIUzOEExf0aGXTrzMNbGJikOEtv7fJoV5afdbxRHOxiFLtDRr/jka9at7UG1zWTj5N
         3YeDi+E6E1nTbU2PDck7M2HHYYGI9Z5ag+H+wsPo1pM2SJqjK3rW7nOVrHAFSPFBKikk
         xzTRNTnl87S0snI1gy4Nr07zprLuSXBSGpTpgl8lwEUQk8bEexwHINK9ExmpoJnyMmR+
         vwKQ==
X-Gm-Message-State: AOJu0YyRMXFSiTvbTldeXHrEiLggobMfblvXvk0E5SvJo4RM25dROtH2
	Xbscesgr4IREGWtkxxm7i0Hb8oQGYyvSWWFVTPKBkQlK0cINK+RlK7Y2Zz76
X-Google-Smtp-Source: AGHT+IFTbTOCWi/jTMgDhPyroycW5Z2xBV1sGqhcOHDgG61r2IASML4P9qnZ7j5GXYDMa6XRK0hCKQ==
X-Received: by 2002:a05:6402:500f:b0:561:fc2:bec0 with SMTP id p15-20020a056402500f00b005610fc2bec0mr13175760eda.4.1708268050732;
        Sun, 18 Feb 2024 06:54:10 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id dm26-20020a05640222da00b00560a1ce1373sm1847041edb.57.2024.02.18.06.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Feb 2024 06:54:10 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: dev@g0hl1n.net,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-python][PATCH] python3-httpx: respect libdir in packaging
Date: Sun, 18 Feb 2024 15:54:06 +0100
Message-ID: <20240218145406.3261614-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 Feb 2024 14:54:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108839

* hardcoding /usr/lib is always wrong, doesn't match with libdir e.g.
  for multilib causing:
ERROR: QA Issue: python3-httpx: Files/directories were installed but not shipped in any package:
  /usr/lib64
  /usr/lib64/python3.12
  /usr/lib64/python3.12/site-packages
  /usr/lib64/python3.12/site-packages/httpx
...
  /usr/lib64/python3.12/site-packages/httpx/__pycache__/__version__.cpython-312.pyc
  /usr/lib64/python3.12/site-packages/httpx-0.26.0.dist-info/entry_points.txt
  /usr/lib64/python3.12/site-packages/httpx-0.26.0.dist-info/WHEEL
  /usr/lib64/python3.12/site-packages/httpx-0.26.0.dist-info/METADATA
  /usr/lib64/python3.12/site-packages/httpx-0.26.0.dist-info/RECORD
  /usr/lib64/python3.12/site-packages/httpx-0.26.0.dist-info/licenses
  /usr/lib64/python3.12/site-packages/httpx-0.26.0.dist-info/licenses/LICENSE.md
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
python3-httpx: 63 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-python/recipes-devtools/python/python3-httpx_0.26.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-httpx_0.26.0.bb b/meta-python/recipes-devtools/python/python3-httpx_0.26.0.bb
index 9abd13e2be..50bff7f851 100644
--- a/meta-python/recipes-devtools/python/python3-httpx_0.26.0.bb
+++ b/meta-python/recipes-devtools/python/python3-httpx_0.26.0.bb
@@ -36,9 +36,9 @@ RDEPENDS:${PN}-cli += "\
 "
 
 FILES:${PN} = "\
-    /usr/lib/python${PYTHON_BASEVERSION} \
+    ${libdir}/${PYTHON_DIR} \
 "
 
 FILES:${PN}-cli = "\
-    /usr/bin/httpx \
+    ${bindir}/httpx \
 "
-- 
2.43.2


