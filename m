Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.2814.1612007541502452504
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Jan 2021 03:52:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZnNe9zF3;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: salerio@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id 7so11483325wrz.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Jan 2021 03:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=efIdeBJ9Oam5vtTi+Oj9aQrIbd8TgaO5NNtUek9CwuY=;
        b=ZnNe9zF3LKV3L0wH1la61i7zEXGEgGDENchZsbTQ7J4o+amJOQdQThR4DnChaGIpMh
         h51/Ybg7Wn9Qh3UrMoz4ZJEg8ocINb4tZajDqRDkyWsvnbkNdE3Mgv6soN03txIUFDde
         OA5A/FHrooe6/C0sv1nObeVCcPX/Bp0XKIRyk4WjW0aatg2EmrrXkVepL9rap2PqmUIq
         EnPPHrAm7qjkfqgVNfBtRAF5Glbm7n7Wmy3OYqdV1pkFPnvdJ7ZvQqViXOOLPo2SJqEL
         n4oSdzNpkLkV8T1wqndtrI09ud3JXVoN/Vfcj73n4fbzgQQpBbbZ9vbygL2+IjFQTwce
         juRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=efIdeBJ9Oam5vtTi+Oj9aQrIbd8TgaO5NNtUek9CwuY=;
        b=WsadCgqV25MQhvxvLLUu1T/X6wKbGA38zfeVAViNxhWKIjnXag7UzEqkCuJJYs+Nei
         xLLMKVfFqIi9Ps83rhZImjoSyGaxbNFtnZj1Ql6QxWVPlT/AsSfxqlDx/LLVJP/9i470
         cf4l/Ls2fLMMJbz8ALwCGaeNQhsJB9tps/aHFG/aKoaFbUlZKBx78rQ2FZLEBtejbaNa
         GU11Aw+OCxmEDqS1tVPWP5DGxnhdDd+YjW2QrrsCUGQyHQakiEqp7mBpJ3nXK0rbRbZz
         73yuQDPD5taBWrnEpAeuJJ8Xw/46Ep6jxq0e8KR8W3ilOiF173IR8shgu2cNTgexRUCM
         RTqA==
X-Gm-Message-State: AOAM532eXTtHKBu5sXM7yl8fjo63NCJZJif2VHEJ9iYCV22SRTTZrdB4
	KTC4Kq8aaZQnb1xRmd7p1JnsyLu4YrHndw==
X-Google-Smtp-Source: ABdhPJw5bkyNnLHmTEj7KXQveKHdoEwivNkC4Ids+QfUmMsH/GzVAo6WqU1g89suAtjxS06I/v9nSA==
X-Received: by 2002:a5d:538b:: with SMTP id d11mr9477042wrv.334.1612007539720;
        Sat, 30 Jan 2021 03:52:19 -0800 (PST)
Return-Path: <salerio@gmail.com>
Received: from Peters-MBP.home ([2a00:23c6:581c:df00:dd66:d423:b944:ce9a])
        by smtp.gmail.com with ESMTPSA id z4sm17772226wrw.38.2021.01.30.03.52.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 30 Jan 2021 03:52:19 -0800 (PST)
From: "Peter Smith" <salerio@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Smith <salerio@gmail.com>
Subject: [meta-python][PATCH] python3-ruamel-yaml: add support for native and nativesdk
Date: Sat, 30 Jan 2021 11:52:16 +0000
Message-Id: <20210130115216.5875-1-salerio@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The recipe is missing the BBCLASSEXTEND so it has been added.

Signed-off-by: Peter Smith <salerio@gmail.com>
---
 .../recipes-devtools/python/python3-ruamel-yaml_0.16.12.bb      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.12.bb b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.12.bb
index ec8545dae..406da80f4 100644
--- a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.12.bb
+++ b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.12.bb
@@ -8,6 +8,8 @@ PYPI_PACKAGE = "ruamel.yaml"
 
 inherit pypi setuptools3
 
+BBCLASSEXTEND = "native nativesdk"
+
 SRC_URI[md5sum] = "c7e4b216d9554d80be42011b448b7c61"
 SRC_URI[sha256sum] = "076cc0bc34f1966d920a49f18b52b6ad559fbe656a0748e3535cf7b3f29ebf9e"
 
-- 
2.24.3 (Apple Git-128)

