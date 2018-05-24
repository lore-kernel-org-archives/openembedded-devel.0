Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 0C0DE74A02
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 14:39:11 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id e185-v6so17469539ita.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 07:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=XT+iWVBZD7nYWlTRfgc9W/3XLYh73X+Xn+p5UUCIYT4=;
	b=adVskv2bnHLpn8yhhwytwRSQBsywCWhzjBbvrNyRBaEIGuAUw7kVYVD+olLOWDT1t3
	PqLeVpWVbxhGALbIcIqlWasjavZvs0Vg++EBXzUnMl9fYWEBRBG+5kHN7qEGHH62DThj
	fOeaixX3EGW8DfsEMUm8QZRA4ksfnvmDbPQuYMUpWtz3ohJEO06Onzj+BUnJp+Z5L1aV
	yxWDS98AWAvon6kTFQQJyDbB4DL10eoRyG+sx3lLjDYKhxHBQPtM8ObtzJ1mdZpl1gme
	NCOdLKeK5NWyJBihJyqlOEVvWs2u5Mkq5Qge29/LsEn81ST3k67vwMh4CrGQboW64JiT
	J/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=XT+iWVBZD7nYWlTRfgc9W/3XLYh73X+Xn+p5UUCIYT4=;
	b=aRRQ6nezGXDf/TaNIQiClGo8lzqnL7ZxY+uMhdSVuWeuNEiFeAFGETTgMSGO26jmyA
	wFowgAGsJGs5JrPpJyRmjciNqWnB9WSaPz3y1QZLd68XCJYoz1eEHgjyNUi6wFJpewUU
	A5kV2ZbAiBpbCPvlqafhrKYy4J4ZyMQmdK8XT3jjzuxLTkW6cbT9SayqqsD/SRnnGdP+
	bf+SdzgCmtoUtdn97ces01Y6RsESj/T4LcVi0AXTeND2mfPOQbN9Ap4/SfaEWbs5a4rk
	talaPNPnhSYNckN8yrbpPHodoE69ASr57JKvj8w1PF6umZ9/a93xpI1LC1MzrBr3ltzn
	dhFA==
X-Gm-Message-State: ALKqPwfAyOw3fZmWIDcCy8GhumUEbCgG+4KJhgtSjG5mNkQYUsBnk5H2
	LU7gFTOgVSNXactz/yj1CAPs7CGa
X-Google-Smtp-Source: AB8JxZohbZpTC0+ScGWhKOCbc7PlB7jEsSB88Bq+GnerSwly2oBW0Uu/cQ+oJ4iMFs9WWar9m4AvFw==
X-Received: by 2002:a24:df84:: with SMTP id
	r126-v6mr9682885itg.17.1527172752531; 
	Thu, 24 May 2018 07:39:12 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	a43-v6sm2435261itj.11.2018.05.24.07.39.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 May 2018 07:39:11 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 May 2018 10:38:41 -0400
Message-Id: <20180524143854.24096-5-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.582.gccdcbd54c
In-Reply-To: <20180524143854.24096-1-twoerner@gmail.com>
References: <20180524143854.24096-1-twoerner@gmail.com>
Subject: [meta-oe][master-next][PATCH v3 04/17] json-spirit: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Thu, 24 May 2018 14:39:12 -0000

The cmake.bbclass in oe-core now ensures that ${libdir}/cmake and
${datadir}/cmake end up in the dev package, so recipes no longer need to
provide custom packaging rules to handles these files.

	http://git.openembedded.org/openembedded-core/commit/?id=d91dc4666683a96e9d03cbbd21b8a546f9069c93

Originally-conceived-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb b/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
index c7c1ad1eca..3c1d8a9959 100644
--- a/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
+++ b/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
@@ -20,6 +20,4 @@ DEPENDS = "boost"
 
 inherit cmake
 
-FILES_${PN}-dev += "${datadir}/cmake/Modules/FindLibJsonSpirit.cmake"
-
 BBCLASSEXTEND = "nativesdk"
-- 
2.17.0.582.gccdcbd54c


