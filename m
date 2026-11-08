Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2961.1794165995093829889
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2026 11:26:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: roosesweb@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4922dbcee23so107479f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 11:26:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794165993; x=1794770793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Hpi5i5RwTjsJKH09DBorKLtr8sE7sU233JlPbf3li4=;
        b=PGFJALoq5zYfXS1AwV+15atopg3mT8q4T6XuZGlSiNxk5PUYJIfMHveruNftYzjyeX
         f/OckRDDBCtUBJprl5NQg5cV0wPKCrp6az05K8nCVhAZtU2lQwGnkIo7JtSqQZz34D7Y
         uA6ClYHc2JLsR32FOfO0vLlaF2cPbRQuc4AGiI1jmeFGnG7dNAStmDc5soOdsvzSzqOu
         Tfyv4sCbDflWVI+Ag9hWnx3f2Qf785BEJ30VWkyklKRJ1LmgGbl1W/zXvLzqASvRXoai
         AI7yu9/xSv3weWbAfbStKIKN2KgO004JKuGAyLbAQ1dfmzlzL9ooXb3J0U3mG7+gRD5J
         KQuA==
X-Gm-Message-State: APuU4Z/dnj0/U8aojtr0/08A8BGsL9rC327t1qFGw5/AiUS4SHz9GBGS
	LlQssZrC4wQe0xssRgYmnOK+8wu3DkkHC5kBPYMBXjEGMST5pcsk0ZcXcoaRtg==
X-Gm-Gg: AYBFou3ctTSRuSMIWjrbdzfZYb85OIc7OLJPvHne2CYpZresN1MjcQJIfaTJFoV2AW+
	x416fgJSbVPPOgE2TTSLSjamWy0ixULHCH5qY3GP1vglz1xPkOf6BlXV1JbWTlUz3A6bEmbM6KB
	5s+zP/y2b5mWELqZFNYJbLVP0X7aV2zj5+mgHRzLiRq/Rd2XjNP3pEhDBimIrT80qPj0BENklqN
	irdy7aKInAbYeDzGVT7LfGoW/OyCD1vle0ySnVv1Cdyhh3HuDMTWxjQdX/WEsaeNR/8EcveT4EK
	veux7zBvLWVISMazggj1JfIafnU5LgbOXetsBn2yt7qb8RgUTJ/RioowAf/IzaBQ6ltkujme04e
	EoSxWmJuCy3CTDSI9o7d0KLGsz58q6YxVfUhPya65oArn57xQ/a3q19kr6nEoGQxxKWZ8a0s92t
	wm8rTQGVByrrKhoz70aY9rdbR9WETt4bdLaPJZ6u/uh/nyLTDbgMSbxq6qMkwPU9QBNJqkU79Ez
	6CakRX6yYvVrl4vJllEqrqXhJMxIHI+IL+sDYWGpy/5PJubT2LkJGISTTLXD+zszTrEBQLzGLzY
	BQsfzxdHAqV3MCb3cj/QZ/OfvB8z/w45J76JyyhUZsIWgNuZERBomq+TNU6XHaIqUHnYPl7NhVp
	v4erB9cecu77qzHraRxZm7pB8dkn2TLEhmyGC81xJSYB+Hf7V7gavDKT3KA==
X-Received: by 2002:a05:6000:481a:b0:48e:62a9:1a65 with SMTP id ffacd0b85a97d-49584690551mr3955456f8f.49.1794165993312;
        Sun, 08 Nov 2026 11:26:33 -0800 (PST)
Return-Path: <roosesweb@gmail.com>
Received: from mother.tail4535.ts.net ([2a02:810d:ae08:d00:e5a9:b4b9:ba2:5901])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f38e2bsm5808729f8f.8.2026.11.08.11.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 11:26:33 -0800 (PST)
From: "Thomas Roos" <roosesweb@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Roos <thomas@roosesweb.de>
Subject: [meta-python][PATCH 12/13] python3-googleapis-common-protos: upgrade 1.63.2 -> 1.76.0
Date: Sun,  8 Nov 2026 20:26:17 +0100
Message-ID: <20261108192623.1082770-13-thomas@roosesweb.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108192623.1082770-1-thomas@roosesweb.de>
References: <20261108192623.1082770-1-thomas@roosesweb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 22:38:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132034
Content-Type: text/plain; charset="utf-8"

1.63.2 declares protobuf < 6, while meta-python provides 7.36. The new
release accepts protobuf < 8. Needed by the google-api-core upgrade.

The package is built with setuptools.build_meta now. The sdist on PyPI
was renamed from googleapis-common-protos-1.63.2.tar.gz to
googleapis_common_protos-1.76.0.tar.gz; the underscore form is the
pypi.bbclass default, so PYPI_PACKAGE_SDIST, which pointed at the old
name, is dropped.

AI-Generated: Claude Code, Claude Opus 5.5
Signed-off-by: Thomas Roos <thomas@roosesweb.de>
---
 ...1.63.2.bb => python3-googleapis-common-protos_1.76.0.bb} | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-googleapis-common-protos_1.63.2.bb => python3-googleapis-common-protos_1.76.0.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.63.2.bb b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.76.0.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.63.2.bb
rename to meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.76.0.bb
index 779f3afa9d..444654a7c3 100644
--- a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.63.2.bb
+++ b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.76.0.bb
@@ -3,11 +3,9 @@ HOMEPAGE = "https://github.com/googleapis/python-api-common-protos"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
-PYPI_PACKAGE_SDIST = "googleapis-common-protos"
-
-SRC_URI[sha256sum] = "27c5abdffc4911f28101e635de1533fb4cfd2c37fbaa9174587c799fac90aa87"
+SRC_URI[sha256sum] = "71db0e44a1d4c2dd024ebad44ca67129cc1e2892e4861df466764749d5ef8642"
 
 RDEPENDS:${PN} += "\
     python3-grpcio \
-- 
2.56.0

