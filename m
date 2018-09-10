Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id B7E1579716
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Sep 2018 18:39:37 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id j192-v6so22582599wmj.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Sep 2018 11:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=UQYQ8OKcX2dRM+B26aEaKlAoqrqXPprk/sezrylIVBc=;
	b=UJ5OvqQi6qZg2IyQSOGUj2vgs53/h+b85C7L3jIrrEEryzc2qb6GJ+3Wiu5HTAN2tA
	dk8mVtECeJEFF8Z7a9/JMjMvif8vgASf3qENi78AuzHaAz3lXI+VD4upkvM4PFo1cF+8
	FgyEHT8lx/3zLQmst2t5ocXOHOk8RQuSkO+brTOkkbfIqM76OdeqBzzS7NdOsBV9IFk4
	9Nc3ecuT4W+eQ0XTgzLF65rime8O9gWwVKfXqirJWy2qjiDx+AU5wslrLJIdk+Jf6Ngn
	5g1QM7zcmT5D4E+HSJaW5yTT2hq9a6hn8WLwmehtkM8t6kozpEdXyp+1QVwiHu3Kje5g
	4NDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UQYQ8OKcX2dRM+B26aEaKlAoqrqXPprk/sezrylIVBc=;
	b=luqbP7+9FzRQI47K4zKLBNFC8/14oNXWPsQnlkP5nLRjxgsBdTH0x9PRCuopWzNqjI
	F6Y1/ihW42nylC57cGleIDL5p2dufSNOEO4HOy/kpmEco+yUjMKDCVKatlsD9xgN9J23
	JZ+BBn9o4IMHg+BUSilEKsAh1QwrPKl0SgRyf8P9fdpliDXcJKzGnwkRMxrtKk7J1Iio
	Qsi/f2pUCf6yvANdiE8/xsn0rB8nWyJqCejEYxR6Gna2XgfvARtZdqq5jHKyBrAG9ldL
	0j+r1TOXU+RJ7rUGj+QHSQOuFnLMPVZo7zzkNhQPIU0x+/dP49CvpwCE6qvsEOaZrF4z
	sSdQ==
X-Gm-Message-State: APzg51DXCu63fLPxao0sp0YB5Qc6NRj/N8b7Te2czDvekvkIQ8KEqENT
	xZt2efDmNn8hY2jbM/JJhO21T7dN
X-Google-Smtp-Source: ANB0Vdb6pZ4ZJSE4+PI5Ng0z13huHrLmkG4G8vFD4vpJkiViT5iy95k5boCZk/CyTATyMp7a95AiAw==
X-Received: by 2002:a1c:8f0e:: with SMTP id
	r14-v6mr1581768wmd.79.1536604778101; 
	Mon, 10 Sep 2018 11:39:38 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	200-v6sm29483376wmv.6.2018.09.10.11.39.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 10 Sep 2018 11:39:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Sep 2018 18:39:32 +0000
Message-Id: <20180910183932.25639-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] xmlstarlet: Disable PARALLEL_MAKE (again)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Sep 2018 18:39:38 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

* MJ: this was applied for 1.5.0 version in:
  https://patchwork.openembedded.org/patch/116023/
  then removed with the upgrade to 1.6.1 in:
  https://patchwork.openembedded.org/patch/141059/
  but as reported before this issue is still reproducible
  with 1.6.1

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.6.1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.6.1.bb b/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.6.1.bb
index e3d52e616a..e28fd61a03 100644
--- a/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.6.1.bb
+++ b/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.6.1.bb
@@ -24,3 +24,8 @@ inherit autotools
 EXTRA_OECONF="--disable-build-docs \
   --with-libxml-prefix=${STAGING_LIBDIR}/.. \
   --with-libxslt-prefix=${STAGING_LIBDIR}/.."
+
+# http://errors.yoctoproject.org/Errors/Details/157121/
+# /bin/bash: src/usage.c: No such file or directory
+# Makefile:2121: recipe for target 'src/usage.c' failed
+PARALLEL_MAKE = ""
-- 
2.17.1


