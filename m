Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22786.1794814537476895691
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 23:35:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=IL4r5klW;
 spf=pass (domain: konsulko.com, ip: 209.85.128.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so18119745e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 23:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794814535; x=1795419335; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wUrXn4M0BO04ZfkDCI7N5o52qp0VM3zJywKKnK4IKsQ=;
        b=IL4r5klWp0p1xdsMj0f01IosqhsZE2AIsl9YfZ+jVc49l1+RaypyRma2BnNB7STYgx
         eF0yvtEbcErrt7jR36BiOdEexjdam+7h22nl5qx+Cfy5lX4sO7gyoqOAkL+Q60jem8g7
         /xr7Jczgql2Wxi2jz82K6n5cgOrKsuKlOYPy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814535; x=1795419335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wUrXn4M0BO04ZfkDCI7N5o52qp0VM3zJywKKnK4IKsQ=;
        b=L2PUlUKIToH1qHmR6vBQ7Uesw/YABuENyDDa735Xq1thLhTZWEZICEsmSSfbKbdFuF
         6wUupoBtlKGDLTdEsQO7P2/WgPvhjCsKUZs1hFVN4JnHdbjtXaTwdPzEJoCISVKb3abV
         B/gDRM2uoN2c29BN09BuoXyzEqjBftBMg0WZ7NtuxixEXgqlE/W+H+54iJyxAmHmr2FM
         io5EbJyV5CZMKZWOwRQJIaEqgvM2AasDoAzUNG3LRlz9SvGbnca5vwLbEMTa4yMgyVUQ
         /OTjCSFsxsXHQxS/rUgMHaHJ6l96o975tmW1/gZyCWCFWW5+0rL2dkUKSKC89Eff5sgh
         NiTw==
X-Gm-Message-State: APuU4Z+AwtNJHNsKksKUVUR5uNM7wTf4e1JQpvv++ko/Odoj3kP+/w3j
	X8vcuOz5oJ8yTPb5oYRoYnqYn+PFGdGtxDcptb1V9vWL6qjt2z4SnQVl763KPDv/tNvdIW314kp
	eNTMM
X-Gm-Gg: AYBFou14CzmaGA6rEqm6WDlUgrvIt7fZJuhTkNfJ6vQHeQzHKx6VBamSmt4zlQaaX1s
	niCTwroKNGfPFusGwGKHIs3JTOugVdg2c2gdMKGwPIeIJj7JBZyxWa/21llvKe5jlecHMneoC+s
	q+yhNWNJjoZFS0WOX/2NYU0QMfvia6jjyXYILv/9GaoPXUoZmJpkM7zDWIDPoxz1BQzmk3Fgfg0
	t0vxVuJ7C0/gxWaww6hCNCwKumPgfLrtpFP5FFWQEMsEEEVUnKMe3XCvm3pBKgjzLVDVjl3RoO+
	7x/bxdtWZT+IcxybIKtOo+vHuaOSaabdHWxyrHeIrehn+6QRMobq8z0p3WsCFXX1D0edgI2elhO
	ic3Z1+PMcn9MO71I03Ro1NrxTItUMlq/3D1aTw6PNob329e1KHwkrkZawP4cOq5wO1xxfZw87VB
	E/SFJ2TlaMcPIgWh08RoGsqWup6P31ENlWrfvImgv6Fyq5xxUVhlr7FeXtyjn4/hld0o6rR4fBI
	L2+ns2QUt6+YilTGjIF1Raz/oyt0nBL2fM/Sldsr0+koz4uUPCZ3V6wvUnJ1xE46mfzfPzqQxL4
	ueVf7FCjHaxR/ooZ8u8gJx4A5SNjKbzs6VN0fAj5c0h15Pc/E+k0UkO0MZNe8JZwQDlu3PwKzc7
	KabmX3viaraLjmd25kMnl543amh1g/z2mwYaQUTs522BDIUI10aSWWvYTiecX5q6qtzo4Dq0Mwh
	g=
X-Received: by 2002:a05:600c:6085:b0:4a2:967:dfb8 with SMTP id 5b1f17b1804b1-4bb55a8d7abmr198135285e9.20.1794814535502;
        Sun, 15 Nov 2026 23:35:35 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae501bsm289781975e9.10.2026.11.15.23.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:35:35 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 02/24] python3-fastapi-cli: Upgrade 0.0.32 -> 0.0.33
Date: Mon, 16 Nov 2026 09:35:09 +0200
Message-ID: <20261116073532.880420-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261116073532.880420-1-leon.anavi@konsulko.com>
References: <20261116073532.880420-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 07:35:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132430
Content-Type: text/plain; charset="utf-8"

Upgrade to release 0.0.33:

- Add support for Python 3.15 and 3.15t.
- Bump Typer min version to 0.26.1.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-fastapi-cli_0.0.32.bb => python3-fastapi-cli_0.0.33.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fastapi-cli_0.0.32.bb => python3-fastapi-cli_0.0.33.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.32.bb b/meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.33.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.32.bb
rename to meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.33.bb
index 33a441e1e9..106f4d8534 100644
--- a/meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.32.bb
+++ b/meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.33.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://fastapi.tiangolo.com/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e0cf8d811ea2046529403707b266fb5a"
 
-SRC_URI[sha256sum] = "38024d2345275e1b37ce8848727a580d84901b570e96b3256d9d36a9a5039424"
+SRC_URI[sha256sum] = "94f19bcde4bd6ae26328292ac864082543262b7ee9f5d11bd7224614c22fb958"
 
 inherit pypi python_pdm
 
-- 
2.47.3

