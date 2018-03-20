Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 70A0460721
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2018 13:06:24 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id n12so1443760qtl.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2018 06:06:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=29c1O5GDFF3/bm0bikFBGrQe0f3byjdxZicRHUn+Wfs=;
	b=j90WgT/xzxqGnjI5xaeCXSzUV14yk4BqIMi5P14L10JJx6TKLx/cwtgczkGyO3wAeQ
	16JBhlGyhItzhTi0nYmnLpgikhANfHgkL3ftqcgUS20jkCKe3obXY+kagdd1oDCGF4JL
	3yzr8/j/t0y1gkP3f64uVstoaIfXMcJjeZgIExvltyDvk7WPCaPkFhNHDQxjClbQ4vpR
	GzsnfGKxFZBUBC24AfTVYD/ziZbiK6OEEq8wsJeODqwu9cioc0PdwW//i0HkppLzKX66
	EaF/k8tKaEbvMDnQEmoDEzU7czdnDxOIEPW4jU0WhQiCZlxrW0gDUJeXXXen2SmSoFMr
	93JA==
X-Gm-Message-State: AElRT7FgtnpDQYxa7EvtHT1f6pBvkl6abN8/eh/jjMvAglbJCsT801oe
	MhWdf3hIuDdGXxAI8LR0DFIXUZ1l
X-Google-Smtp-Source: AG47ELtWwolcjPvSqD8+bSuTIqN+SWMUPJQCrtQZIV3Fwd6h5HBEnNKKQp5beoZ/1dBQsKtR87+dxg==
X-Received: by 10.237.52.103 with SMTP id w94mr23380631qtd.218.1521551184539; 
	Tue, 20 Mar 2018 06:06:24 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	v56sm1214433qtc.20.2018.03.20.06.06.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Mar 2018 06:06:23 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Mar 2018 09:06:03 -0400
Message-Id: <1521551163-29634-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pytz: Add dependency on pickle
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
X-List-Received-Date: Tue, 20 Mar 2018 13:06:24 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pytz.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python-pytz.inc b/meta-python/recipes-devtools/python/python-pytz.inc
index 1390b91..979faa6 100644
--- a/meta-python/recipes-devtools/python/python-pytz.inc
+++ b/meta-python/recipes-devtools/python/python-pytz.inc
@@ -12,6 +12,7 @@ RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-doctest \
     ${PYTHON_PN}-io \
+    ${PYTHON_PN}-pickle \
     ${PYTHON_PN}-pprint \
     ${PYTHON_PN}-threading \
 "
-- 
2.7.4


