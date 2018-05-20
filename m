Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id A343E70100
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 May 2018 02:40:31 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id g14-v6so10612032ioc.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 May 2018 19:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=fObbu/NjKG6A3V/NJFFa4cxnNJDCnjKmzCdGxSfkxKw=;
	b=eHyIMjS8cxNa12EL2ancuoE/enoQfBSr9qjOKvCLKicOAmApLulehiPE8Ragykc82L
	d7+yOAsbrtyNjCfZF1wMZ4CIdPtad0PqBP+RAsJEBfsC+V8JvOSkyUPT1x2ZZH0xV/jK
	cCO3/+kTMv3PE7TIfgEAoxIxOEh9G9IHqDbi0+w7TLAYjKJFTk1U/JZBQw4NFvfZI3Wy
	o1J+a7UjgJ2FLrUS9S3RYkUCb8UziYt59k/qUoIV8EPQalVieO2N+xW7QbCMJerYYbEe
	musFFX0begFrnw2VESs3uTN1cbmmhTqx4TRqGEcTAgruTo/G/ntKwZMiZ3a1uTiV0auL
	4e3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=fObbu/NjKG6A3V/NJFFa4cxnNJDCnjKmzCdGxSfkxKw=;
	b=TIWYnENnh80nLT3OV1nnYsuJbZOtvZSVNoMMn3HsJqQJpmeAdOvqgQFRxOYLQLx0uB
	1MmZC98MElcgvUkxkSohN+CBksNkxP0DlF6kcnyrMuo9RC5VWAh/jNV2oK+6sMxgX9NA
	f/9RYbeg7qs/VrVTKJPWLJP01if5Pajy58WcAgFoUjDod0gss0PS8K3TDFa30iit/vhw
	s5QqyiZ9wEJ3wL/dsJJ74+++dubss+zXY852BPjQqlLxEQ1KpLV09PZke4S0m8Go1XC5
	ZIfRdNQ1ukJ10Cen47bJO+MhxggzKgE2zqgnTQt7LRasY5DXVWhST+/5vUGSFEdcPylY
	E0yQ==
X-Gm-Message-State: ALKqPwfBbre6N0zrqyxM8BJ9XmIM8bM6bivaO1xOUaHDab4LKOM6cPe/
	LhN6Hpx0GCsGcUzwWCDBtXFKqEOU
X-Google-Smtp-Source: AB8JxZqtt8Eboz3QGBJo8LdcxByuI3Fy/mfPrs+OQ8iD1lUC/qiQh+lov5MMOH8NQTVmEjNpVAOarw==
X-Received: by 2002:a6b:ac42:: with SMTP id
	v63-v6mr15881593ioe.261.1526784032186; 
	Sat, 19 May 2018 19:40:32 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	b102-v6sm6888194itd.4.2018.05.19.19.40.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 19 May 2018 19:40:30 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 May 2018 22:40:25 -0400
Message-Id: <20180520024025.10446-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.582.gccdcbd54c
Subject: [meta-networking][master-next][PATCH 1/2] rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Sun, 20 May 2018 02:40:31 -0000

The cmake.bbclass in oe-core now ensures that ${libdir}/cmake and
${datadir}/cmake end up in the dev package, so recipes no longer need to
provide custom packaging rules to handles these files.

	http://git.openembedded.org/openembedded-core/commit/?id=d91dc4666683a96e9d03cbbd21b8a546f9069c93

Originally-conceived-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-networking/recipes-devtools/grpc/grpc_1.8.5.bb     | 2 --
 meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb | 1 -
 2 files changed, 3 deletions(-)

diff --git a/meta-networking/recipes-devtools/grpc/grpc_1.8.5.bb b/meta-networking/recipes-devtools/grpc/grpc_1.8.5.bb
index 0883ec176b..e9491c45a9 100644
--- a/meta-networking/recipes-devtools/grpc/grpc_1.8.5.bb
+++ b/meta-networking/recipes-devtools/grpc/grpc_1.8.5.bb
@@ -31,6 +31,4 @@ EXTRA_OECMAKE = " \
     -DBUILD_SHARED_LIBS=ON \
     "
 
-FILES_${PN}-dev += "${libdir}/cmake"
-
 BBCLASSEXTEND = "native"
diff --git a/meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb b/meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb
index 70e497f5f0..defbeaa623 100644
--- a/meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb
+++ b/meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb
@@ -18,7 +18,6 @@ inherit cmake pkgconfig
 
 PACKAGES =+ "${PN}-utils"
 
-FILES_${PN}-dev += "${libdir}/cmake"
 FILES_${PN}-utils = "${bindir}"
 
 BBCLASSEXTEND = "native"
-- 
2.17.0.582.gccdcbd54c


