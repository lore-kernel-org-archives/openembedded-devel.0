Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 92A8B74B06
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 14:39:33 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id z5-v6so82205iob.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 07:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=cRNe3WoQiNA7OmI0rzb5zzRuPXLHxDHk9n9IvLoqKo0=;
	b=QCcfWFP/CivW9ljjfzmHde2Z5PKY6aC9fVm5QyPz678lZ5Q1KZVnk7f5jRIALpa8g1
	b7kCl4q8nbA8Wer0rLBkzVoaUlwI75jL0VmuAHsvrxFnswi5aDB67HQ9J4eAJGtSvHw8
	XTq0rj1x72goqNgIpFy34ApqQjmA/rogOg8MjJ9Ec8QpeTFipkJXG+5sRhn4AFtOg3r0
	5e5n4qyBJ99l01ZZWDkWX38it5E+pdUGE0OHh6lfuKlinnjH9XAq0k1i+iBeIuEVN6vm
	N89vlfvf/hm/qX8lZvTBnT4zUWwisLWC2DenXK8Z/hhW5aRpbLOQAkLSk35knCKapT/L
	rooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=cRNe3WoQiNA7OmI0rzb5zzRuPXLHxDHk9n9IvLoqKo0=;
	b=JaN9WhNuHl3dAxCg7a7jP6eF4COmJ218Td3PPU3wGeQoyAGhigu8NLIr8IcHTQwg5h
	qEXw3aNX1uytIJpa7jzOQmM/5U9XA3VJenoTOOtfMPoX8NQWRJB2sUHkYIo4WrEX+vSi
	mUylIn2Id4GDxmWe/ZtVdbkH/CfWlFGB12fK63Dc+EN7rkIP/2wmLxrp7p7dZxWk3H8g
	l2ODmO4TllRkt8z3rDUrhCRGcU1UuxiKDrcNq+Hp1tFFLV247wnqwCqkMYxcgW2UI2C8
	KX47Q4hGD6ihkcNARGgcGeVavAwOqXClCgNuR2iQhm5zQyGYjdloFvsuJ99hdFy2ZwgW
	S1Gw==
X-Gm-Message-State: ALKqPwfx0D66KUzhKqrXFbfu1zEtE9dEypdu8FO/zqmYrwfp5zs1WZTE
	QCftzqg6gmAAP8rahJzT3McIV3Ka
X-Google-Smtp-Source: AB8JxZrnt/TfSiqG+/KNo6wQDJr6y7g+VnTehVBW2+YgUVuUDDMcO2kfnQEAhyJs/qGlJO0RYM0ibw==
X-Received: by 2002:a6b:a6d3:: with SMTP id
	p202-v6mr6455640ioe.144.1527172773940; 
	Thu, 24 May 2018 07:39:33 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	a43-v6sm2435261itj.11.2018.05.24.07.39.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 May 2018 07:39:32 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 May 2018 10:38:54 -0400
Message-Id: <20180524143854.24096-18-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.582.gccdcbd54c
In-Reply-To: <20180524143854.24096-1-twoerner@gmail.com>
References: <20180524143854.24096-1-twoerner@gmail.com>
Subject: [meta-oe][master-next][PATCH v3 17/17] libeigen: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Thu, 24 May 2018 14:39:33 -0000

The cmake.bbclass in oe-core now ensures that ${libdir}/cmake and
${datadir}/cmake end up in the dev package, so recipes no longer need to
provide custom packaging rules to handles these files.

	http://git.openembedded.org/openembedded-core/commit/?id=d91dc4666683a96e9d03cbbd21b8a546f9069c93

Originally-conceived-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb b/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb
index bc3b32e384..2ffaea63ad 100644
--- a/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb
+++ b/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb
@@ -13,7 +13,7 @@ S = "${WORKDIR}/eigen-eigen-5a0156e40feb"
 inherit cmake
 
 FILES_${PN} = "${includedir} ${libdir}"
-FILES_${PN}-dev = "${datadir}/eigen3/cmake ${datadir}/cmake/Modules ${datadir}/pkgconfig"
+FILES_${PN}-dev = "${datadir}/pkgconfig"
 
 # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
 RDEPENDS_${PN}-dev = ""
-- 
2.17.0.582.gccdcbd54c


