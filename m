Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 11CA7792A9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Aug 2018 11:26:45 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id y9-v6so9593677wma.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Aug 2018 04:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OftdxU7pI7uWhmm6xrsCoubxS4WVKPrMb7BSpvfM/QY=;
	b=tLnUmSxqfGIfNnX5ZbbwQW2DzH/AFri7VlpwK6kK4ZnRD2l7nPnTQjhidbDC2ik4eQ
	JBMFv1diENSR/aiWFR2G1fOaUAMdmu9zeeguMeT5knLD+3z9vYIK94YbHelPzcigkBNH
	vw5rnDlJt96l4QlTd0NPHM/QZ5xN/9tRdx09eUzYQTokiCTHHsOpeQmbKVutusHw5weO
	CHpUSfKc4xR7cTs3AQF1nv+SXk4hcrnlunoXy7uW48C7dtnj4zxq5JNPZ38N078taMX8
	GApEmCuMJE4nxUt52x/r8OpEA0VAUvpxVG2COWpI7/Qu08yIThDmqAJvXlsTEwOoTBdU
	NS0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OftdxU7pI7uWhmm6xrsCoubxS4WVKPrMb7BSpvfM/QY=;
	b=iFfHJ0qeCcooKodcnKuXEIxjMs0EavwFvFvvWi/6pZ/y9djKlyr0gNuddW0aM24G0O
	8m63L3Tkc/LRGAB1lckO6EET2g9Zdlgmu17udSSeBMmvkSvvG75VeHdHl0nLHtbLTgKZ
	CjI+b8OQ40CMkXdh/MCyFAcWiPbyoPQwFmauJqlRuBhEBCroGtCvxesqo2RS4TtZvoFy
	7W1alIn+u8rUHIso9mBibAvaL4xuoJF6kmDjsuICnwLITYCgHBN0R7wSDQFpNEB5Gz89
	gsslhKAyFty1UIOjXoi6vXTYEtXVXg/k7nTEsd9I6Rr0f6GIhCRbEoXRRc5y94U9hoRR
	qFcA==
X-Gm-Message-State: AOUpUlFW/aueKUtlUaOwQtS60lABs5HxKqLZb5ySEACeGmSuyF2XsxWd
	uJIUwkSeoTbnbqS8j+9RbWX8hSW+
X-Google-Smtp-Source: AA+uWPzE0jLwTHBc7OvDhF6a0PvNm/tu961MGnEhfhUsKgXACtDo6XuCZvwhOmrVAEUSd9tCKGlq3A==
X-Received: by 2002:a1c:55c8:: with SMTP id
	j191-v6mr20738014wmb.67.1534591606615; 
	Sat, 18 Aug 2018 04:26:46 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	200-v6sm11693861wmv.6.2018.08.18.04.26.45
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 18 Aug 2018 04:26:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Aug 2018 11:26:36 +0000
Message-Id: <20180818112638.10006-5-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180818112638.10006-1-Martin.Jansa@gmail.com>
References: <20180818112638.10006-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-networking][PATCH 5/7] nftables: add dependency on bison-native
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
X-List-Received-Date: Sat, 18 Aug 2018 11:26:46 -0000

* fixes:
checking whether yytext is a pointer... no
checking for bison... no
checking for byacc... no
*** Error: No suitable bison/yacc found. ***
    Please install the 'bison' package.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-filter/nftables/nftables_0.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-filter/nftables/nftables_0.7.bb b/meta-networking/recipes-filter/nftables/nftables_0.7.bb
index 0ea79953be..287c350b9c 100644
--- a/meta-networking/recipes-filter/nftables/nftables_0.7.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_0.7.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d1a78fdd879a263a5e0b42d1fc565e79"
 SECTION = "net"
 
-DEPENDS = "libmnl libnftnl readline gmp"
+DEPENDS = "libmnl libnftnl readline gmp bison-native"
 RRECOMMENDS_${PN} += "kernel-module-nf-tables \
     "
 
-- 
2.17.1


