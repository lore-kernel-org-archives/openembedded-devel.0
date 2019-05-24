Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 633E67E259
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 May 2019 23:39:49 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 15so10646229wmg.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 May 2019 16:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=gguUkQGWzDLqvjFGjQQxYC4XP2lylk3S6QhCfg4Dafo=;
	b=K7gckogFbM8et2ByRRzmCZ9FlsK2fLle3gwn51zoXV7XcdR+LGMdZXLCfT9VP5JOrR
	H2WHdEMA1VDr0QRVJegtAur3n1vB50zvzq7/eKa7JtgRoszYvLnreglDMcIDFOpyt0KM
	FVhRVKdCz1w1gu/uazNQmbHdjok8A3289DH8eY/BHy2lEHoauYoILqAPRLQdTREfwCWH
	93LDeQft8LWhgZdJeBJKv/NWdYbulmHzDp13sZ8vWJbve0q60DXwZ0mjyuZ6iwRGHc+Q
	5tNLwk/mVlWiW9ycmApJd2rrEJVqjuGH5x4C+LMa0GvHMggolblGW9xM0pQ+3xpHQbX5
	lilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gguUkQGWzDLqvjFGjQQxYC4XP2lylk3S6QhCfg4Dafo=;
	b=YcKy18zBsk7QG0iUzTQWdF13O76/VkflAf1D6RtXgmx23KlsNROD08C5LiFOdypKWp
	rVSxGbJqtxlrkfYmfep9xNCi/QPK1qfzxNqzDBGMYPqhc1tj/IukmUPQWZpgtE70cLt+
	CtoJO1weCRsPdl2BqpnvUtW3GksneioLOy4ptCO6Cje2wWWVFyqCBtL9dXodVHHiwDfj
	0D8ciKfttZIikxdapMHPJEARjS6ZpTCQS4qo8pIJ11vf5o5q17zHOL+29YajTkRG0Zpn
	EgkSOzMaafKeubcMvvpYLYAji/1R0k9gLIOqcK6YFP4jlvCwJO5qvyoy1CW2ybQTWKTS
	YP/Q==
X-Gm-Message-State: APjAAAV9eAYgtjfIOW2I2DNQHLo87OLi0P15dFfp+MHFm+K2bzJOk06N
	xUNKtk/JBSSrPjGrtwyvrnXdhfHf
X-Google-Smtp-Source: APXvYqySdcQ0W3+HxNZok9fiaT3ZNywvRYSnhgdQiw88VNImfL4d0+x1Xrgzsmu5Hc209clKof1qgg==
X-Received: by 2002:a05:600c:2289:: with SMTP id
	9mr18914684wmf.106.1558741189810; 
	Fri, 24 May 2019 16:39:49 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	v137sm3862514wmf.28.2019.05.24.16.39.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 24 May 2019 16:39:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 May 2019 23:39:48 +0000
Message-Id: <20190524233948.20049-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] libmikmod: fix SRC_URI
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
X-List-Received-Date: Fri, 24 May 2019 23:39:49 -0000

* it was moved to outdated_versions directory

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb
index d53dff6a07..bbf58f9540 100644
--- a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb
+++ b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c"
 DEPENDS = "alsa-lib texinfo"
 
 SRC_URI = "\
-    ${SOURCEFORGE_MIRROR}/project/mikmod/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
+    ${SOURCEFORGE_MIRROR}/project/mikmod/outdated_versions/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
 "
 SRC_URI[md5sum] = "9dd9bed30c6f7607a55480234606071b"
 SRC_URI[sha256sum] = "3f363e03f7b1db75b9b6602841bbd440ed275a548e53545f980df8155de4d330"
-- 
2.17.1


