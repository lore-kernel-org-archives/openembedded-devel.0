Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8C7EC74E1A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Sep 2018 17:22:19 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id d19-v6so5582909pgv.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2018 10:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=GjIqyk/dOXWh3LMVK4jxDt4u0wcqqiZTSTLpQYnno60=;
	b=eXsXZ0u29stoWf7/rBJdD+RfBJ2jQKiy67qY0KELkfZH05PbVVJK8aCRe1cyGFdIMV
	zOyylAzIf1JK7Yo0ASm5eMz4UdUtGD8Aq2ykj0PYHgYfMx84nt4NrGtbns47YzGW29SX
	FSPaNG4a7QeokFAnK6vVJFmvgwNcO22Qn+GAVrqweqK1XrYS1SOCxoPSNvY1R06hEQi0
	xyH3VNGtdNHBZZ40OJuveQZocwktOD/RZijNwPjp9SUnbNTzRoEx4UEDmRaNd95w9sG/
	4C7HyotFKmcYM/lvPuNwoCmSD0uJacpfTV/6w/CnkZo+/+6pjNlz94GtjAT4qOjuXXJF
	dmDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GjIqyk/dOXWh3LMVK4jxDt4u0wcqqiZTSTLpQYnno60=;
	b=umgNYcWHU/ElRiryNDqgXd8lqIzHd1nojyUmlCgvieyUgl8Zo31GV6j8swThSUk3L0
	96sy+f1ZTJRcL593q6B2wtyCoi41AING9t6BnL2n6k++hWsDZJ94wlwW62gNCOlYO1zz
	I9Tl1zH2V3erCA8XcNhBbY1pE6bkU99C7EeFGgSDa92YLHEEThPFt/sgZ0hZA8G/ctFm
	eDvUd9m/LKbVNaxQc0PepM/pGBpiOM/9hd6O2bohqE05lyeQW6wP9XyDmyc35zgkC/Gm
	2n//2gYXQ8sZnBqqnhKx7F9WtgZAyyYTkjjFgQzRxn8UR1tX1I/suwk3ktjh5MUnm78B
	3WrQ==
X-Gm-Message-State: APzg51AH1Aj3D3vniAdQwF+PAZdjIOXc2BhkvbzCj8HhoXbQdPfBgdng
	UO8qOYkwYuFUVNlPfbKuBUii1o12
X-Google-Smtp-Source: ANB0Vdax6QuJS6UT2PXHrYwG/4E9kc6SLD2b+Cr88P1dcWnWlI1WhP7MnQyL5IE5igGurdsxRNJCWg==
X-Received: by 2002:a63:1125:: with SMTP id
	g37-v6mr3862790pgl.187.1536254539863; 
	Thu, 06 Sep 2018 10:22:19 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	22-v6sm8319828pfl.126.2018.09.06.10.22.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Sep 2018 10:22:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Sep 2018 10:21:54 -0700
Message-Id: <20180906172210.42551-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [meta-oe][PATCH 01/17] pkcs11-helper: Upgrade to 1.25.1
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
X-List-Received-Date: Thu, 06 Sep 2018 17:22:19 -0000

* Fixes build with OpenSSL 1.1.x

License-Update:

* update year to 2018
* remove 'All rights reserved'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{pkcs11-helper_1.11.bb => pkcs11-helper_1.25.1.bb}   | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-crypto/pkcs11-helper/{pkcs11-helper_1.11.bb => pkcs11-helper_1.25.1.bb} (74%)

diff --git a/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.11.bb b/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.25.1.bb
similarity index 74%
rename from meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.11.bb
rename to meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.25.1.bb
index db71bd03b7..271f2eaa3c 100644
--- a/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.11.bb
+++ b/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.25.1.bb
@@ -11,16 +11,15 @@ SECTION = "Development/Libraries"
 
 LICENSE = "GPLv2 & BSD"
 LIC_FILES_CHKSUM = " \
-    file://COPYING;md5=4948810631bcac142af53d32df5b6ee1 \
+    file://COPYING;md5=30f10d22cfb1ba98ccd714a41ad3311a \
     file://COPYING.GPL;md5=8a71d0475d08eee76d8b6d0c6dbec543 \
-    file://COPYING.BSD;md5=f79f90ea7a106796af80b5d05f1f8da1 \
+    file://COPYING.BSD;md5=66b7a37c3c10483c1fd86007726104d7 \
 "
 SRC_URI = "git://github.com/OpenSC/${BPN}.git"
-SRC_URI[md5sum] = "9f62af9f475901b89355266141306673"
-SRC_URI[sha256sum] = "494ec59c93e7c56c528f335d9353849e2e7c94a6b1b41c89604694e738113386"
 
 S = "${WORKDIR}/git"
-SRCREV = "e7adf8f35be232a4f04c53b4ac409be52792093e"
+# v1.25.1
+SRCREV = "2713cb09dcd90104cb7bceb5f14cd6f90834f7b1"
 
 DEPENDS = "zlib nettle gnutls gmp openssl nss nspr"
 
-- 
2.18.0


