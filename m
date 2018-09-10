Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 25876796CB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Sep 2018 18:40:13 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id j26-v6so23051543wre.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Sep 2018 11:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=UQYQ8OKcX2dRM+B26aEaKlAoqrqXPprk/sezrylIVBc=;
	b=i4uo/lSECOTWtipNKDbMkOdkpiQUTSpDqEIpAkcvjfg8oHjJ/uyhi9RuIIleFaI8ol
	TzFp2Hz2TDlw14yq/WGrzppsg8sEuKTB1iSkp3aXfzclIa2S0s7+jWeOwEg/z2LfaHXZ
	dF8mQA1YUQnWRapzH831KMDHSaIcHBEyzwt+zLrlZTu7/KRbGtWK8vYv64StKCeyyiAT
	VsKcIcrPGw0Bw+wtg03/dgE4rnnhw+UsxE0EBdxKoDyAN1wb0Jji17cx5hcZ01KyQi7n
	bzo/zTBtow6fWOpx5tk0lgXmBE+8qzBpvUQVl3HXreuwuk7amF5EqtDP1qowROYz2Meu
	FTgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UQYQ8OKcX2dRM+B26aEaKlAoqrqXPprk/sezrylIVBc=;
	b=ZBMmqlYjx1BImLZowBUiJSbekcISXQgyc4Vfk5wfJcow9FE536gMS9Idjr6yRZOP9F
	aem1P/bfUjpISFBeEXch+uK4StbTboB1A0+eCTSmv7zCgdPNDMo3pRo/R0MCuGiCvaGM
	jQxEb+D4WgqB2P7+/wRFdWdvM4jF5gRlPlr+8sIvWkvpdmjfxIa0GKCVWAEJiaGf0o/I
	PXskv/qAcKuCfBIIQ/P+j6LCHWb5IXnmsHoYHv6oRUQyJMAdyXvyY7aMPzCThcPEfqlb
	h0wQ71K48dMy+4btyS5+XsnYIdz8jEoyLoaS8fFl4QWxZzh2knVeofQjkktCBpbiNCLQ
	2dcQ==
X-Gm-Message-State: APzg51B9fjpossxsBs6VErNYkg3HxWGDGZUeS+duLwFCghsNjcJP2w4F
	t6ISyIA/RJ+k+0St77VzOFDRug7U
X-Google-Smtp-Source: ANB0VdYaggwu7BcSSUI2EznuoSP8WJh1FyOvK7IoJEkvLep/vI82bvrfsQou5i/9ZLGlvl99Tdpz1g==
X-Received: by 2002:adf:ef89:: with SMTP id
	d9-v6mr16193996wro.195.1536604813626; 
	Mon, 10 Sep 2018 11:40:13 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	b10-v6sm16390450wrr.88.2018.09.10.11.40.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 10 Sep 2018 11:40:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Sep 2018 18:40:16 +0000
Message-Id: <20180910184016.6156-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][sumo][PATCH] xmlstarlet: Disable PARALLEL_MAKE (again)
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
X-List-Received-Date: Mon, 10 Sep 2018 18:40:13 -0000

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


