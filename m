Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 6656A7D0D0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Mar 2019 10:54:38 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id w1so22318933wrp.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Mar 2019 03:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=WT8q/w6nWR+faIcVuH+Zp034a6aeHaJ/6E266iC899k=;
	b=fxkiZ67W4i4x05qMwXO7vPGHxO1KfPvFI2b8szkmG81MzTbK36fgmNHShWas8yKWWZ
	RWoL3pqD88YSZ/uRaRrZcsQXqU7bU54q5CkTwyzz6N/9B15wbTdSjbNbmJBS+Y68dpmh
	VvZSCx0xbaoV8JFh/CC46rH2Fm2zrgGOoJrSvU9jW2h9zuTssKcKhd0j4EpOYqSsrbcY
	QySGZsmRnJ9oSbbeJQuBKcwTSKg5ZF/Ssrxz1cdEpe6RpA4w6DLzSHPmir9w/DFoADCt
	YousfanHXNEIpcuewMY9rQkQfN8/ZB/fjv9rdq70JhbkbN9MOybJK6E2rMUR9y3XMHth
	iVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WT8q/w6nWR+faIcVuH+Zp034a6aeHaJ/6E266iC899k=;
	b=SBr6Y6V1CazOkJ1/vWLFU68VM2wa9dOMKVcpmLPBOigPnPWS3D0cetv9O0mBXZHN3T
	SDwjXBc9+3PUxp0Ntfw/bdwsxOVswVj6X3NiO4y4ThpkrsPjdjZAOERyDaZTDu3d0ak2
	QUot+z5r07dj5nDuQDz7PuGMGDKdmcQmAcosi0RwJlqqc20GX/JoR0aBJIbRjsX8vJ84
	269kpHH/bjcXqJzU6u1plQ1td2WbVVVc0rYexUYsRl2Kj6HxBTxqQA2S5+se4EGtIPrR
	vmGIFvmue/0Ka1i60gOI0m2yblZEUWOUMTbticjLWEx+8h6P7RFueoLhiKnYAoivzBRm
	2N5w==
X-Gm-Message-State: APjAAAV10lPvi6mEbqhOkW1CpRbcI4J1MhHExhRWuoMd7ESFlPfQlwKM
	uFH4OJ2ek8hYkKxtVaxm0Uk3M3Wu
X-Google-Smtp-Source: APXvYqyxncKQuPPQYLt0CWoYcODRGTwA77jJo7kJk2ymEBjj0mLJBjdM8g7hx/RLWydhI7XNnnnjZA==
X-Received: by 2002:a5d:6a0b:: with SMTP id m11mr10955013wru.290.1553770478613;
	Thu, 28 Mar 2019 03:54:38 -0700 (PDT)
Received: from Unimatrix05-Bionic.lan (93-34-152-112.ip50.fastwebnet.it.
	[93.34.152.112])
	by smtp.gmail.com with ESMTPSA id y9sm3369622wrn.18.2019.03.28.03.54.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Mar 2019 03:54:37 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Mar 2019 11:54:34 +0100
Message-Id: <20190328105434.32511-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] cpprest: bump version to 2.10.12
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
X-List-Received-Date: Thu, 28 Mar 2019 10:54:38 -0000

---
 .../cpprest/{cpprest_2.10.11.bb => cpprest_2.10.12.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/cpprest/{cpprest_2.10.11.bb => cpprest_2.10.12.bb} (89%)

diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.11.bb b/meta-oe/recipes-support/cpprest/cpprest_2.10.12.bb
similarity index 89%
rename from meta-oe/recipes-support/cpprest/cpprest_2.10.11.bb
rename to meta-oe/recipes-support/cpprest/cpprest_2.10.12.bb
index 8ab72ff5f..903d70e2d 100644
--- a/meta-oe/recipes-support/cpprest/cpprest_2.10.11.bb
+++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.12.bb
@@ -10,8 +10,8 @@ EXTRA_OECMAKE = "-DCPPREST_EXPORT_DIR=cmake -DCPPREST_EXCLUDE_BROTLI=OFF"
 SRC_URI = "git://github.com/Microsoft/cpprestsdk.git;protocol=https;branch=master \
            "
 
-# tag 2.10.11
-SRCREV= "a325079f7e1976e0485a212d8921ce9b837c1f2f"
+# tag 2.10.12
+SRCREV= "d4fb1cf7f7d22c12e2e442ba5a5e98d09b0a28ab"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


