Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id C511B7869B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Sep 2017 19:26:49 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id l25so2082677qtf.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Sep 2017 12:26:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OWM7Z9pQwnsDac5lAxUHgeUr0Ht4UF9BUvntPlaDoCE=;
	b=mbWXOGfSmJqFb+qDRyEUapgpoIwFL/0YH27ZrDtUg5r2rmBr+sVJdK1P0X+cRmRbUU
	+PXAsqRjbHxu6j/wjlIU9Agm48KrPqpZH/aMNKqEcmUZ4k8cNEMYwNtRGu0iqv4xY6c+
	/VOISKbm27BzoPHjRufM15JXVd/1O8Bosujga1ESltYbyobAgO7MOmvw4VTkKO2CHVFT
	nFewZKW3SAUTxeHDSq6O0pivE3PfwQSqDNyhbMQvrz0F9tjPQQG29inrDjUAiEAEyHU8
	3qEg4z3UVVXL4JvC2WzDdaOwFeMunHuTVU2CAxfeoV9OAxAXwlx9Vf5VSyyBKPQUNwnO
	iYkw==
X-Gm-Message-State: AHPjjUiOhBAAehE2MJBX0vzpJ2JIabYAS1nkXkPjbGFEP5/ym71v3KfE
	wZxx06C7ImfSAwlyJtE=
X-Google-Smtp-Source: AOwi7QBpEgCqNxvijroUyeYzY9UGd80vPU/PrN12ghSJAGvkR3x+47yOr0PhKig0Ke5BSiNDHiXjTQ==
X-Received: by 10.237.42.79 with SMTP id k15mr37192751qtf.222.1505503610713;
	Fri, 15 Sep 2017 12:26:50 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	f20sm1033547qta.86.2017.09.15.12.26.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Sep 2017 12:26:50 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Sep 2017 15:26:44 -0400
Message-Id: <1505503604-25614-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-jsonpointer: update to version 1.12
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
X-List-Received-Date: Fri, 15 Sep 2017 19:26:49 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-jsonpointer_1.10.bb => python-jsonpointer_1.12.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-jsonpointer_1.10.bb => python-jsonpointer_1.12.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python-jsonpointer_1.10.bb b/meta-python/recipes-devtools/python/python-jsonpointer_1.12.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python-jsonpointer_1.10.bb
rename to meta-python/recipes-devtools/python/python-jsonpointer_1.12.bb
index 8ec8772..f5c1aa8 100644
--- a/meta-python/recipes-devtools/python/python-jsonpointer_1.10.bb
+++ b/meta-python/recipes-devtools/python/python-jsonpointer_1.12.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=32b15c843b7a329130f4e266a281ebb3"
 
 inherit pypi setuptools
 
-SRC_URI[md5sum] = "d68c0c6ad6889e9c94ec0feba719e45e"
-SRC_URI[sha256sum] = "9fa5dcac35eefd53e25d6cd4c310d963c9f0b897641772cd6e5e7b89df7ee0b1"
+SRC_URI[md5sum] = "eaaad79e983d58ecbee5b4a326723777"
+SRC_URI[sha256sum] = "819b6dd4fd0a18ac219e02a0117f24b2d31296b0c475c33862cfa9a1616d62c3"
 
 RDEPENDS_${PN} += "python-re python-json"
-- 
2.7.4


