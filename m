Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 037F177B20
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Oct 2017 17:27:12 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id x54so14299806qth.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Oct 2017 10:27:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OqLm0n0xhgg+NfMh4h9/hHQGUbdHjAojFPvnPSgSJdY=;
	b=N51095HSLchalj5EDBZgynMVB2r5H2zFkGnBOL6r3271MwvgvrOEn7R8HoqFJtUfWK
	2YeyF9o5oVeDmhA0f3EsI01kgh5mnwOCngoGARv64yX2wuhHLRLVq3VQJVLn42y+fLG4
	SUeDge2XaY5CV+iA6oqqAJ1w9J5lLuT5PWhJS0rzM8bJFdUw3ygbM6XEsN1QGBRROYnH
	CZkYI893r+N095PqEX+k78zwE/eliuiP9NDtDih+BM4kT1BofCkM+hSoV6HWJNWI+Jyo
	DmY1ygnEqml8zYhen+QmQ6xKqvakvB76gONU9tQDUm60bF4T1YcLszziS9mvZM6aWRr+
	B+rg==
X-Gm-Message-State: AMCzsaVcdV6yhB5MwV1hlu5VQ2+dbWpqY19BRkikKDDs1DStyszMuwF9
	cKmRBt1yybUSfkLINgRxP5DA5und
X-Google-Smtp-Source: AOwi7QAYb7nsSvcFvhzG80Xpp7RotmOWCUpmwj8tX0dvyPZ3/ughMfVj8/x4hF/UY8Oh2owuMciP8w==
X-Received: by 10.237.39.135 with SMTP id a7mr26009356qtd.84.1507051633395;
	Tue, 03 Oct 2017 10:27:13 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id q1sm756914qti.2.2017.10.03.10.27.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Oct 2017 10:27:12 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Oct 2017 13:27:06 -0400
Message-Id: <1507051626-12487-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-grpcio-tools: update to version 1.6.3
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
X-List-Received-Date: Tue, 03 Oct 2017 17:27:13 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python-grpcio-tools_1.6.0.bb => python-grpcio-tools_1.6.3.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-grpcio-tools_1.6.0.bb => python-grpcio-tools_1.6.3.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python-grpcio-tools_1.6.0.bb b/meta-python/recipes-devtools/python/python-grpcio-tools_1.6.3.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python-grpcio-tools_1.6.0.bb
rename to meta-python/recipes-devtools/python/python-grpcio-tools_1.6.3.bb
index 2b82ca6..0fb136b 100644
--- a/meta-python/recipes-devtools/python/python-grpcio-tools_1.6.0.bb
+++ b/meta-python/recipes-devtools/python/python-grpcio-tools_1.6.3.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec
 
 inherit pypi setuptools
 
-SRC_URI[md5sum] = "74a02d8218c2680a7ca10d6dec2123ef"
-SRC_URI[sha256sum] = "6efe56bc6565edf6bc52c97f29131a7a125261716576d9e824b43cabf354bf45"
+SRC_URI[md5sum] = "835f19142e26cb7ad68cec3a083ecda2"
+SRC_URI[sha256sum] = "57b3110ced50a18f1b2bf7da58ed011f57278b48084ed8013c67a34d42a5ca37"
 
 # For usage in other recipies when compiling protobuf files (e.g. by grpcio-tools)
 BBCLASSEXTEND = "native"
-- 
2.7.4


