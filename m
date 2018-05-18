Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f48.google.com (mail-pg0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 9455B74B10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 01:31:15 +0000 (UTC)
Received: by mail-pg0-f48.google.com with SMTP id w4-v6so2579226pgq.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2018 18:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5pAKU1BmW31h9TCO99nNtnCARBbpu2dJ9FzSlFpnyHY=;
	b=sfCKH6D6wvWY2WvgMUHCs5tbywspepcMU4IhDXtAAz5Xy9IUPS0YFxUJ+LNA4+LNCq
	G4k0Q2ZZ/j47Wi9RhTQ7KjkV/eJ79BmI/9p8tdC79uqbARupH3LLM2w0yq2kIFvmrPWH
	0Do16whBzUClRqlXFPjiFXg9Z9yP9AXuleX8m4v+wzb0cccyZPWvG05L+TvVr3p5lduQ
	ZywxMFmk9rX3KdGAgIN9FVON4qJygciI7+/gtSOgrl5q/p6to0Pnk2tx8axsMj90xFEW
	8Ej1VUdHcxNtgwXhB3njBesV2zuu83Mhq3io7Ypd+Xbx8flMxwQO7h6afOlwWSMEjj8A
	4CoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5pAKU1BmW31h9TCO99nNtnCARBbpu2dJ9FzSlFpnyHY=;
	b=HrAqePc1hjFn4pJAJ+NjfI/ZEvYN7s3VemcrEAER0O7A9/DakMlhgJnwQSt5xKxRlF
	+E9GQmk4lEad88v1KbJUgaElIqegJf9JJYyk3xwWAQLLF9Ed8Jr6EzqU4Txn8RLWDfun
	nGB68XkCVZe72rnvaQVd7T/5SW/lNWH/KnAirmpDV6/pV3ur+uGCSpPOFuYq6f25nRWA
	y8UdXPlLdj3nMAbPfjpp/T4GXc4ceJJoiNfljFubYg9zN4v7ga6ywxwF2TsHapeTW0NP
	ZLveUrNU7wA4suZzXbsGoaQlOkHmft4JWZEWqBxDDgKz4z0QeyPjan48HB0JA+bty+nH
	kWFQ==
X-Gm-Message-State: ALKqPwdX1NuvNCE8xxBm4oR0X6JTAocgZf/LNo32FZ+5QdLxuftRau4o
	gub8u5jagr/HdXvv2q/VSwFeXg==
X-Google-Smtp-Source: AB8JxZoeVfY8o5mH82382ch63wBg/RYqXaBOFlKfJaI3JUnG1Mw2xBOsPRPylc7foCwaD56lXRmoLA==
X-Received: by 2002:a62:4a50:: with SMTP id
	x77-v6mr7355836pfa.142.1526607076274; 
	Thu, 17 May 2018 18:31:16 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	n25-v6sm9428562pgd.5.2018.05.17.18.31.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 May 2018 18:31:15 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 May 2018 18:30:38 -0700
Message-Id: <1526607046-8081-9-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1526607046-8081-1-git-send-email-armccurdy@gmail.com>
References: <1526607046-8081-1-git-send-email-armccurdy@gmail.com>
Subject: [meta-oe][PATCH 09/17] rapidjson: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Fri, 18 May 2018 01:31:15 -0000

The cmake.bbclass in oe-core now ensures that ${libdir}/cmake and
${datadir}/cmake end up in the dev package, so recipes no longer need
to provide custom packaging rules to handles these files.

  http://git.openembedded.org/openembedded-core/commit/?id=d91dc4666683a96e9d03cbbd21b8a546f9069c93

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
index 8ab35d2..069385d 100644
--- a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
+++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
@@ -20,7 +20,6 @@ EXTRA_OECMAKE += "-DRAPIDJSON_BUILD_DOC=OFF -DRAPIDJSON_BUILD_TESTS=OFF -DRAPIDJ
 
 # RapidJSON is a header-only C++ library, so the main package will be empty.
 
-FILES_${PN}-dev += "${libdir}/cmake"
 RDEPENDS_${PN}-dev = ""
 
 BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1


