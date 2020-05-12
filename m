Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.6075.1589291729066025699
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2020 06:55:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=nyiiAYZ7;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=h6oi=62=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49LzpQ5vlqzKj
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2020 15:55:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589291727;
	bh=Txvgr1FtkACXTbpwiq5MUeqW3MtEBnoMkSK9DhHbZTE=;
	h=From:To:Subject:Date:From;
	b=nyiiAYZ7jxkSwu+O9FMLFpcuDRsJcuWw5gpxyO8XyBJLgw6eUbMJc9HMSl9e6Hqev
	 +a/j7S5ZmgN2UAdaV6nW+N70Mji58NixpUbMPdzxgUs5LJ6QkmfmdRbKWmBwMtqMZE
	 e7Ne4BNOEhkhYn95LsVgzQ/1zVLdfuJfTjf77Zxrkp9zdggrzRuZBmPY6TYiiCuIjn
	 v0zTh8J9S6GQC0UINeIXZxdIi6W8w/d+A6dNx6rvNfqQKR7X6P2gXzFhotTiBKrvfy
	 kuERQ8LpISQhJpxrsAXtA9kKdtENGvfHXIjwiGQoXyqoCVXein7QRKynTwypVMq+hE
	 FUUyL7moJK0GuHyILXThGZYuzMJNmiJA4KEyEF2yVC9AFknayv5K1bXWBlcKarGF4J
	 FzNlrM+gVShkwmN7kbLQN5UD5XIa3P3yMvi6Ic8b710a/IZ9n6qs1AWBCQi81sSJAY
	 /NgXyac87nkz95Q62fFgXvMdMorILPDcwgXLmN70X0mGE0GMCy4w63XFkrzSj8kStx
	 1+8QKv0N/bL39wLqE8M2LjSPHrN+RSrLqHz209b8zhktkPFk9OCRht9l0yMybT26Ox
	 Sg5z4dQ7rd61WGPnbuHAc+LEqH8yLiKIxGA6bPqeKgNgbIxHJGXIFxO5g1/3AgP18W
	 ctCSUuB2ZOR/IZJHvrfpwqes=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Subject: [OE-core][PATCH] mesa: Remove -fcommon
Date: Tue, 12 May 2020 16:55:21 +0300
Message-Id: <20200512135523.19970-6-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

This was fixed in upstream version 20.0.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-graphics/mesa/mesa_20.0.2.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa_20.0.2.bb b/meta/recipes-graphics/mesa/mesa_20.0.2.bb
index 56ee28c870..ee0260e073 100644
--- a/meta/recipes-graphics/mesa/mesa_20.0.2.bb
+++ b/meta/recipes-graphics/mesa/mesa_20.0.2.bb
@@ -14,8 +14,6 @@ SRC_URI[sha256sum] = "aa54f1cb669550606aab8ceb475105d15aeb814fca5a778ce70d0fd10e
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-CFLAGS += "-fcommon"
-
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
 do_install_append() {
-- 
2.17.1

