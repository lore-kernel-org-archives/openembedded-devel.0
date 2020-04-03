Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web10.4507.1585942967794433630
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2020 12:42:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=ELiPJaV2;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 5F6FC60368;
	Fri,  3 Apr 2020 21:42:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1585942966;
	bh=8PxYruqhx3+9VyvGyLhFzcLdskCo/ipTqiKKY6or/v0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ELiPJaV2rqc243z1+cV3kcN7fcrQX89jzMWl4py1evqFTraL8OY21GUznKWQtUtDv
	 XoRcSLx1uYnOQsz2Q171zO52dmNA8nPvV6I1wIjCYFUOzgLVfTzJ/yEEjHM+6mx/0W
	 LGY7fHwYU4RjuPyIaX87GNanR8qpkyopOsyROtgjgwP7Cx4U8ZJwId9sGob2Z1DJAj
	 UzIdBQq+G3D8BqoxchmTnl8oxaN1wPGsztcoIIDCqDHFGP05/6cyhI02Tul8hzAzdk
	 z4YlRnFqTLz7Bmrw3yZXqE2bYUKgr00w7W257ZoB5xmlWrvBcLJuHRm+jUF68bqecN
	 UKN45TQ6DGpeA==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-python][PATCH 4/5] python3-socketio: upgrade 4.4.0 -> 4.5.1
Date: Fri,  3 Apr 2020 21:42:42 +0200
Message-Id: <1585942963-20703-4-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585942963-20703-1-git-send-email-pjtexier@koncepto.io>
References: <1585942963-20703-1-git-send-email-pjtexier@koncepto.io>

See full changelog https://github.com/miguelgrinberg/python-socketio/blob/master/CHANGES.md

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 .../python/{python3-socketio_4.4.0.bb => python3-socketio_4.5.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-socketio_4.4.0.bb => python3-socketio_4.5.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-socketio_4.4.0.bb b/meta-python/recipes-devtools/python/python3-socketio_4.5.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-socketio_4.4.0.bb
rename to meta-python/recipes-devtools/python/python3-socketio_4.5.1.bb
index 7f9fade..54ecbba 100644
--- a/meta-python/recipes-devtools/python/python3-socketio_4.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-socketio_4.5.1.bb
@@ -9,8 +9,8 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "python-socketio"
 
-SRC_URI[md5sum] = "6631497753977b70d2b5ceb12af2775f"
-SRC_URI[sha256sum] = "48cba5b827ac665dbf923a4f5ec590812aed5299a831fc43576a9af346272534"
+SRC_URI[md5sum] = "3dbd0a2ebcf34632f67327b665cbb951"
+SRC_URI[sha256sum] = "149b98c33f8c3d09273fb4ebeb83781e4dc9411b56b27d9f058bec1bd1ed74b7"
 
 PACKAGECONFIG ?= "asyncio_client client"
 PACKAGECONFIG[asyncio_client] = ",,,${PYTHON_PN}-aiohttp ${PYTHON_PN}-websockets"
-- 
2.7.4

