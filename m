Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0C1417844B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 18:30:52 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id 8so23695072qkj.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 10:30:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BARiMAfz+E6ZdXOWJVjLjbkuo7DyQKRMr19Jp3onLO8=;
	b=HaUtNqEh9ZricF4iRSlWZF5bkOAGcMHFQP1L05wwJbTFizSRTEHS8wIlduhPc+10ND
	UomWL7DAU7epJCXTnhMewTXz1vpkuzkAfJ6aSWWFYDBZ81dLZO/CwuNyUMaNEkB4T8C8
	sNz5KupbWnneHdXICim+hC26fjQKKh8RUsLWofLX0KDxpS3bqqI8mpOr3WbgyRpQ01iL
	6SkW+TrqcIS4bGARz1GmzNyJ04qu9ZI9KOA4ApODWRHjbuSpB0X4Mki89SNIK3zYeoJ8
	386RiecyGOimaEr4tmosL1FaCE58f6apR4+qmwcLdgBDGspevdFaymQgjnlYm/OW0v4C
	YBSQ==
X-Gm-Message-State: AKGB3mJzaQlkToyOudRNYhP55ie7zT3z/ZLleVBWNAYjhIMotlsV1/Ny
	guAb/H3Z8YDrTqgP79YUz7fxv4aJ
X-Google-Smtp-Source: ACJfBovAPBqe/7+yb6m3hnbcK1UtCy38/eyWUmGnqYphkX7z8FFmZ0ozVrzVsMdUqXvvE0iVc49B1w==
X-Received: by 10.55.71.214 with SMTP id u205mr6158662qka.289.1513708253625;
	Tue, 19 Dec 2017 10:30:53 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	k83sm3909339qkh.89.2017.12.19.10.30.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Dec 2017 10:30:53 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Dec 2017 13:30:47 -0500
Message-Id: <1513708247-1750-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCHv2] python-webencodings: update RDEPENDS to include json
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
X-List-Received-Date: Tue, 19 Dec 2017 18:30:53 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-webencodings.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-webencodings.inc b/meta-python/recipes-devtools/python/python-webencodings.inc
index ed57c52..74b7517 100644
--- a/meta-python/recipes-devtools/python/python-webencodings.inc
+++ b/meta-python/recipes-devtools/python/python-webencodings.inc
@@ -7,4 +7,7 @@ SRC_URI[sha256sum] = "b36a1c245f2d304965eb4e0a82848379241dc04b865afcc4aab1674858
 
 inherit pypi
 
-RDEPENDS_${PN} += "${PYTHON_PN}-codecs"
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-codecs \
+    ${PYTHON_PN}-json \
+"
-- 
2.7.4


