Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B4BEC48286
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 17:40:34 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.1547.1706809233185492398
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Feb 2024 09:40:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G3xSUn69;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-33b1b21c020so330101f8f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Feb 2024 09:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706809231; x=1707414031; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B5a34RDXhOs0bLJB51RwrnXqAnwgqy5vUZzjARgAG+E=;
        b=G3xSUn690YV1xMjklFR/ZTVtCmyUVbQKyruyDEjFSTxzFOwCN35btwG51//RgC1aCO
         Bta8xcKh3URGsoIsTJt86QrhcccZBrXOr302cJqEjgo4tUy/IUC4C6L6Ted1OkGyaxqH
         AzcEsBMJ/p9WrWTs9XQyfsQeX1RsFQ5mEXKWFPcD1heLFraUm50a0TM+6riSABO/q+lj
         SLJVtbRYJueYfn6sFFjbV75zMoleIWKDvINmO2CuVvafyiVQKrlLYma/2F9SBadE9iXp
         vsrn/idYn5X+kjpVr2hP2bk2DIITlADOcNAjEBBAh5Cq5bkEg1KtZzTLOvzRNn/lq5VK
         xg2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706809231; x=1707414031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B5a34RDXhOs0bLJB51RwrnXqAnwgqy5vUZzjARgAG+E=;
        b=aS4caFH8tqHk2k9Ly5fGZ8HPsovGoum0tvuaLBW2iF8FWgC7ZTEXNOfhUt/1ejEmKc
         PilDmzn4dQ8yu27PpsQhxseVUHAXU//IezzYoCmci75hbIQ0eYDDVIqGgNAFhpuIGe/8
         f3+9FZgL6oHruoFaTvdvlKQbqHWcisa8d2f+xqyq6Kob6L8aAtsXjcEXE4v0Bt3ipk+5
         o4ru9EF3J3edGn1XtGgNQ0QJrMcekojUMnYabvCmwIValb4j+4llMzP39wJWPX5xAM/D
         cHxeVPlI+7EBIyK3rqWEoRKcpYS/y01PPOijFpVLqDBSWe7DVNAmxQjJldnzsg5aeVPd
         2y/Q==
X-Gm-Message-State: AOJu0Yw9pTtsxP6j33SzQCiMpAJVgAejclxGQBtpDe2iO4SKtoFHyCqW
	Fr8A2R7b/jkJv6PyqUUDQLUXOkUblnzEdkiuc/ta6502AR3j8P9Imil6qkk/6Ds=
X-Google-Smtp-Source: AGHT+IEeQFxUP98ueb4xuRbJSS1tH04CI3XROeRXGgDQcDkPBuLozX8mSkJpvQwsJ3lvpnZBi2LXBw==
X-Received: by 2002:adf:ef4d:0:b0:33a:ea49:34db with SMTP id c13-20020adfef4d000000b0033aea4934dbmr4075771wrp.60.1706809230996;
        Thu, 01 Feb 2024 09:40:30 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.159])
        by smtp.gmail.com with ESMTPSA id d2-20020a5d4f82000000b0033af670213dsm258041wru.110.2024.02.01.09.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 09:40:30 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCHv2] python3-google-auth-oauthlib: add recipe
Date: Thu,  1 Feb 2024 20:40:20 +0300
Message-Id: <20240201174020.94018-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Feb 2024 17:40:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108520

This library is part of the Google Auth Library and simplifies the authentication and authorization processes by utilizing the OAuth protocol.

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../python/python3-google-auth-oauthlib_1.2.0.bb   | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.2.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.2.0.bb b/meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.2.0.bb
new file mode 100644
index 000000000..b1e89e4b4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.2.0.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Google Authentication Library"
+DESCRIPTION = "This library provides oauthlib integration with google-auth"
+HOMEPAGE = "https://github.com/googleapis/google-auth-library-python-oauthlib"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRC_URI[sha256sum] = "292d2d3783349f2b0734a0a0207b1e1e322ac193c2c09d8f7c613fb7cc501ea8"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} = " \
+    ${PYTHON_PN}-google-auth \
+    ${PYTHON_PN}-requests-oauthlib \
+"
-- 
2.25.1


