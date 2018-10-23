Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5A75C794EA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Oct 2018 16:05:15 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id p64-v6so2800189itp.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Oct 2018 09:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=HVaXI3FFuuBlboAya5YiINibozN9Ce91deMXDaFg6oc=;
	b=GaRJFk0yHApCscKlvrdK3Rr/gMYg+4n6EJVrmMWliBUWOuJHxl7bRCO1EJha/IRocd
	vILPkIJH8w9VClNijni1/z2xZD9jrNsmKt7KNY3Wf7HCcAzezqSrvEgFK/+Syk3tNN8W
	PO0Fm1F7HueQjL6FN5jUBg9Jzpfn/tICVw33ko0yKFOy3uzjgduYsLc26XEIksj1Pu9f
	7hVQmYWAYju//WxHtTorcvQbCQmbWCR2ATX689wEHHj6A6dkNVdOV0Ac3MJ6VV/MXrM0
	j1KucKXBcn9R5VzlaiqTRicqDtCmqv6gmSxn45h6bJ+/x7aJPtP7mmei2g2xayh89TN0
	SgOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HVaXI3FFuuBlboAya5YiINibozN9Ce91deMXDaFg6oc=;
	b=ccHtAqC8EQbZm8KAC1knEVPA4sVHnTrxGxtyXT5dZf3lcOAcKbnuqG2EqCsMGWOiqC
	VWOvg5aIlv+DYz0Hp8LL6us4+8LpAmvQCeuT6HxYaCsl38ipKjG3DNiDsRUm9NSk5ryW
	7Sr+mDvhf5yzBLg02qryyiyD3PD6TinMhXimkB16ZIsv/4NPip5B47ZW98z9nhM71IcS
	wIXM71ta1QgIRXq4X5d5DP8GOQHLyxiIXn/xzh/IUQq1dp+cIMPUea9NJEAdKN0w7XeC
	0Bui7iAlnvRNZpi9edjd9V9KOXT+LIiL62h1gR5KGCpNV0BNR54qmGehdTMtkKz3M98x
	CACw==
X-Gm-Message-State: ABuFfoilFrULvdACkVpChqYFKGRI3Zz9aV3Jys1FRYBXhbgbkfiFZY1l
	mq8jim15NrADOF46fTS4ExdpxOIE
X-Google-Smtp-Source: ACcGV61IqwBp2EvlqmCL4FrSt9WfkCrPMIqLi3vW3hgfIefRfqaGM7fJ7jqgMlM6ND50k9dfI9YRXQ==
X-Received: by 2002:a24:3c0a:: with SMTP id
	m10-v6mr12794950ita.15.1540310716198; 
	Tue, 23 Oct 2018 09:05:16 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	s9-v6sm535728ioo.46.2018.10.23.09.05.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 23 Oct 2018 09:05:15 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Oct 2018 11:05:10 -0500
Message-Id: <20181023160510.19604-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][master][sumo][PATCH] rapidjson: Allow empty package
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
X-List-Received-Date: Tue, 23 Oct 2018 16:05:15 -0000

Causes the empty base package to be created so that RapidJSON can be
sanely included in an SDK via IMAGE_INSTALL, RDEPENDS, and the like.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
index 8ab35d224..76e01f824 100644
--- a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
+++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
@@ -19,6 +19,7 @@ inherit cmake
 EXTRA_OECMAKE += "-DRAPIDJSON_BUILD_DOC=OFF -DRAPIDJSON_BUILD_TESTS=OFF -DRAPIDJSON_BUILD_EXAMPLES=OFF"
 
 # RapidJSON is a header-only C++ library, so the main package will be empty.
+ALLOW_EMPTY_${PN} = "1"
 
 FILES_${PN}-dev += "${libdir}/cmake"
 RDEPENDS_${PN}-dev = ""
-- 
2.17.1


