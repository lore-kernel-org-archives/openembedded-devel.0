Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
	[209.85.222.171])
	by mail.openembedded.org (Postfix) with ESMTP id D4E447F555
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2019 12:10:01 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id 205so1479002qkk.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2019 04:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:organization:content-transfer-encoding;
	bh=BswH6yi4Tq8fuLyrb0SnYeSbeiDGxOYSd/aX/Ct4YC8=;
	b=UgSaesQoI29F3SkBYs709u3hHHGI5dZNzoqeyQCyran2PxRQew/nmFXfvJHH1KVf8R
	gfvg23PEXn1bM2SZKLVxWo+cg9agewNYo9IZjRa043BVCLmF1alCT3Gai6dxq0IUqxUu
	wThyf65bM5JPL/yTX/Tfwrvj3tYi6px0KT7Bs73516FMzNP43kOc9TAXtYjtL3YkrHyw
	ATNJIPnzA4/P+upTuHYzEsoJiQ+holcmRCcCfCXA/xGBZ9pSOVHYOiv8v/2DVKjgsQ4P
	tdUbF1SAbaDUW0d/0346GT+y4EZyEMwrda7/rOtRzjn+RoWw5Ve8TLjb/FV9b2gbznNq
	yObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:organization:content-transfer-encoding;
	bh=BswH6yi4Tq8fuLyrb0SnYeSbeiDGxOYSd/aX/Ct4YC8=;
	b=p47qRR5hwkvqpyKoFEzeEvm50wKKqAuyF3q9dJuh2Uxw6ZC/R1ZSgzZRv95N2RuMWt
	mrChVgJS+rESComIglAak8X/CTHrGsSU/SGjs2YVl6sjf4UIl1PrWzlkGea7CBuMAXnF
	myJDEuWE4oWlIyUtp/u2WE68cKfaYf4UmUHLsF+t9NeEsrbdNJ/hHE2c0u651oHLV+S5
	zwgs+nB+sj9rBNZh06yFApWeNI7j0Wy1laxheuAsM1+h7rhV4ZxCtazNNkP4/KUi7a6D
	JlwWxIJC4CW2yv9JtCJJEna54j0LX5dr3ApNgQtVZvRswarRuyKCKqLdx2qEYgW3vpjh
	Q3aw==
X-Gm-Message-State: APjAAAUZz+I516wNzsqm3GMREQvYGJwDFpN2mDyvZuaY2DJqfluRDnj8
	tnyk3Q8tulr4hP6ulqhd9qmGhqChYnL/Wg==
X-Google-Smtp-Source: APXvYqyBn06wAG3LUDgzaB7D4xnfPU5qzlZ/eUs15kXCED/cBG4ChhuGcmdWZN6fjd+wTlspRyMVyQ==
X-Received: by 2002:a37:7d05:: with SMTP id y5mr2008439qkc.27.1573647002724;
	Wed, 13 Nov 2019 04:10:02 -0800 (PST)
Received: from centrium.lab.ossystems ([181.220.83.67])
	by smtp.gmail.com with ESMTPSA id
	a137sm830252qkg.75.2019.11.13.04.10.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 13 Nov 2019 04:10:02 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Nov 2019 09:09:44 -0300
Message-Id: <20191113120944.10668-5-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191113120944.10668-1-fabio.berton@ossystems.com.br>
References: <20191113120944.10668-1-fabio.berton@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [meta-python][PATCH 5/5] python3-importlib-metadata: RDEPEND python3-misc only for target and nativesdk
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
X-List-Received-Date: Wed, 13 Nov 2019 12:10:02 -0000
Content-Transfer-Encoding: 8bit

Python3 recipe rprovides python3-misc only for target and nativesdk,
but if we have some recipe that rdepends python3-misc and has native
in BBCLASSEXTEND bitbake raises an error showing that nothing rprovides
python3-misc-native.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../recipes-devtools/python/python3-importlib-metadata_0.23.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-importlib-metadata_0.23.bb b/meta-python/recipes-devtools/python/python3-importlib-metadata_0.23.bb
index 4c53d5fbb..851d703c9 100644
--- a/meta-python/recipes-devtools/python/python3-importlib-metadata_0.23.bb
+++ b/meta-python/recipes-devtools/python/python3-importlib-metadata_0.23.bb
@@ -1,4 +1,5 @@
 inherit pypi setuptools3
 require python-importlib-metadata.inc
 
-RDEPENDS_${PN} += "python3-misc"
+RDEPENDS_${PN}_class-target += "python3-misc"
+RDEPENDS_${PN}_class-nativesdk += "python3-misc"
-- 
2.20.1


