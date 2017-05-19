Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 00ED5780C1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 17:40:13 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id o85so11062422qkh.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 10:40:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YoIP496hXxR2O+JmFJocLiA7mZ0MYLnf0k31EjvnLSU=;
	b=tVycuzD4snpPWaOlndGgnxnGK86j3Ovvn1wSOOn6fffn+9/3S7YpdUSXWvMyvZ9zcV
	l45wmdu2jgolQIL/aZH0hIN3SOvyXODJ5G37sLs3A2bDp18dC7oXJixdeunwhEJXmIiP
	mUCYgAk01E5Sdp1XMmW2u9vDslyOBned6RE2y7mfOU9BdHkh5dk9usLkZFXVz8e3hl+c
	nrAJ/81Bmfw6ZwnZTPznAT8zMg+wT0Dqofy0G4WENKg5aw1UpRjhIEdidbjFxc38XoTx
	VcYLIeT7CMW32/YdVOgoc99iaAeAqoI1hzQOvw2bOQfc0zIz4XL/Fcgbp561/zZOdmos
	EP4w==
X-Gm-Message-State: AODbwcAeQr1/Onis0dQhbXhnwn2cJeLP7l4OpzzWAzhuPP/QnxtiioMl
	fSegAAFgRO1v5A==
X-Received: by 10.55.64.83 with SMTP id n80mr10423664qka.268.1495215614583;
	Fri, 19 May 2017 10:40:14 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	p16sm5627476qkp.69.2017.05.19.10.40.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 19 May 2017 10:40:13 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 May 2017 13:40:03 -0400
Message-Id: <1495215604-9534-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH 1/2] python-cryptography-vectors: update to version 1.8.1
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
X-List-Received-Date: Fri, 19 May 2017 17:40:14 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cryptography-vectors.inc   | 4 ++--
 ...tography-vectors_1.7.2.bb => python-cryptography-vectors_1.8.1.bb} | 0
 ...ography-vectors_1.7.2.bb => python3-cryptography-vectors_1.8.1.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cryptography-vectors_1.7.2.bb => python-cryptography-vectors_1.8.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cryptography-vectors_1.7.2.bb => python3-cryptography-vectors_1.8.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors.inc b/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
index 122528b..4481c1d 100644
--- a/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
+++ b/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
@@ -7,8 +7,8 @@ DEPENDS += " \
     ${PYTHON_PN}-cryptography \
 "
 
-SRC_URI[md5sum] = "c3f2a66d71a0413879d4dd001c56de95"
-SRC_URI[sha256sum] = "4be4eee8a11deee5c2f00e389b49de8ce2642130282d1cd0adffb2f7dbe0acdc"
+SRC_URI[md5sum] = "e6ee71f1cc9950e3df026bef69e5fdcb"
+SRC_URI[sha256sum] = "2fd61facea08800ca98ac923f6d02f48a7ae6648025b29cdeb51987c1532add6"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors_1.7.2.bb b/meta-python/recipes-devtools/python/python-cryptography-vectors_1.8.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cryptography-vectors_1.7.2.bb
rename to meta-python/recipes-devtools/python/python-cryptography-vectors_1.8.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_1.7.2.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_1.8.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cryptography-vectors_1.7.2.bb
rename to meta-python/recipes-devtools/python/python3-cryptography-vectors_1.8.1.bb
-- 
2.7.4


