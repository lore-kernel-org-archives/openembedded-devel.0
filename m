Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2956.1794165990774340051
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2026 11:26:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: roosesweb@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48fd2e38825so161134f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 11:26:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794165989; x=1794770789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IEFINMkAF+lsZNTW71xCUHPmX/xo6tiKXFVZM85VoSI=;
        b=0j1vJztBFHP3LeCEF7uhvuAFESc0Jd5i+Qvx0DyVVUFSZTjJt6Qk9CGk7t0DdLlkPe
         g/gOtT0hElsRuaVyIqkE2GpkEMmh9MS2DL9gAxJG8Liqv7dBgeDGBC6SM7zxWsllw6zX
         xUiFkIbq0t5RTrhX1YwTQ65FmReiPIyWqrCE8ECK19EB64DqRC8YlNyQ2IlO81t06pk2
         +efV2n2SvlVLOEuLhn31t65ttMYjtDqNz3er16XokyLo4mRr8kRT7QIZMRnBPhGQPULa
         beDP4936bpv/R+2wdgvFsR6KObsE7/J2PjxT7hbQeEAwR/yMelFxxQcuHeco/QQHSSLq
         LBFg==
X-Gm-Message-State: APuU4Z8U2wJ7MlUSyU1aCaHwh1mBCjsNsPQwKbJE6g05MYWkjZC5ovsz
	KP6YvQo8r2GcwI7u2S31mk7d4OcJ9v8CQ3/HRnGE721oXyB/Ljuj478npRLNCA==
X-Gm-Gg: AYBFou0KuFbn/vUITuoCeUoer+nVtwQJxd7fdDUXoCV52ZvMFG6oXUvPdx76A42WMib
	Brata/jszz5sVfVjl/mlWe90hMb2G7Oc3RSZBkG5SG9qPoQNFYmbpqIjeUZ+jFAaPGeGdQaF+VO
	6RM2Rrvmwdvwa19vb5lJZPzwOAdyaX4LEoCyVxl8tZ422y4soGJDvBaJTLkneKhnhSO1V4QRmzb
	3qIP9L88DXR9c3CJRLrpd8wJIPcTZBvYeUtls1GIzcyIVZvWGtN9eiVOoWrSigKLv989HARxRmi
	Rl1cVry0hLYB9WwUp9XhnIZLFnRDXgHTT7JbTP9+ryum+l2tbH0BcNP5y2c0UN5ijEVRAqJYpOI
	NfMT94vOSWphgNx1EoGGIbR7IODJdaDp9HRoAtxrBO1pZZeLRTlT0zsQgw/R3j9x4Ga93Yk800Q
	DbVV9mmLjkWSHOT7mnOASn79KINxg6HzDaU28qFsKvFbAXfm68jCUAeLYIBMU/3D/GscB81lOx6
	6YtKOn1/gZmXYh1EaJDCVUIP8VFsXxpt1dRV9CTh6EIijxxzxZurq95vY2LRUKGRuWz10cY1KfA
	VWz80x/cnuW+a+4VmyMVBqEM6pAgbGYunDyhFEnvT6N1OtrgSLSzUPpxMqvy97kyPveV7DdrBJ7
	aN90g6FK9300vqZpJFYAYT6mcffjTOLRNkMPBQXgKKk7WG+h8zgTrm8SenA==
X-Received: by 2002:a05:600c:4f56:b0:4a2:c2b:a91b with SMTP id 5b1f17b1804b1-4b963c75b4fmr46849125e9.10.1794165989036;
        Sun, 08 Nov 2026 11:26:29 -0800 (PST)
Return-Path: <roosesweb@gmail.com>
Received: from mother.tail4535.ts.net ([2a02:810d:ae08:d00:e5a9:b4b9:ba2:5901])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f38e2bsm5808729f8f.8.2026.11.08.11.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 11:26:28 -0800 (PST)
From: "Thomas Roos" <roosesweb@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Roos <thomas@roosesweb.de>
Subject: [meta-python][PATCH 04/13] python3-sqlalchemy: upgrade 2.0.52 -> 2.0.54
Date: Sun,  8 Nov 2026 20:26:09 +0100
Message-ID: <20261108192623.1082770-5-thomas@roosesweb.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108192623.1082770-1-thomas@roosesweb.de>
References: <20261108192623.1082770-1-thomas@roosesweb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 22:38:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132026
Content-Type: text/plain; charset="utf-8"

Home Assistant 2026.11 pins SQLAlchemy 2.0.54 (core and the recorder
integration).

AI-Generated: Claude Code, Claude Opus 5.5
Signed-off-by: Thomas Roos <thomas@roosesweb.de>
---
 ...ython3-sqlalchemy_2.0.52.bb => python3-sqlalchemy_2.0.54.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.52.bb => python3-sqlalchemy_2.0.54.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.52.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.54.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.52.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.54.bb
index 09aa59dbff..ce9553f02c 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.52.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.54.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=53a9111717b305b0fae0d704a24925c3"
 
-SRC_URI[sha256sum] = "5e2d46356ac2ccb7d268ab6c2319ac6a2b42f1b8d5fd8bd3d46855cd82abee97"
+SRC_URI[sha256sum] = "baa8521e8ee9f24e75dfc7aaabc08020e551ef0d48d7c3e3536f5cddf277586b"
 
 inherit pypi python_setuptools_build_meta cython
 
-- 
2.56.0

