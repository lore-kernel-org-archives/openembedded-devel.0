Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.6212.1589291726687583268
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2020 06:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=nRJxb7lG;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=h6oi=62=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49LzpN6Fsgz4y
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2020 15:55:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589291725;
	bh=9LPgK/xiqwIrOyQufjKyIRCa3EZWj6r4VtQ0Eo7n/lM=;
	h=From:To:Subject:Date:From;
	b=nRJxb7lG9BRq+rkK2unG5ez1xjXAhyEX+MTFNo9g2ZfZUcE12caCi2qgE3PLEG5Q1
	 4Q9d7c4vsD/02QX2708ai4LnB2/h82Jk18xLK31IQspt38Dqn9ScUM0ybPkaHiF45T
	 1GpIYGQQ2cbGIiFNCyxhdiKLwYt72yTpHA/pDl49ZwNWHgRiQH0fAUjaOi95wSJ0qU
	 FFf9uNF9F1bkvAlVebRpI16cKCm79SbR8FGmYABGJniWfc2pMpr3zwBiOecHOIFF/d
	 82DMlILx16OjEN1+xzytGG9yyqL/JZTom28oBzQbYvxg1FLvLb+ovnMWdfuAsmbSrG
	 eFqFb+InZtZi6o/CPc9rVRbbuUJK8aViMM4wewyfJlRTMJUyQBh2cK14Gaq2uHXl4F
	 +BP33i70iUSyIlemlyIUJIZIRyE47jDxafQ5WazbCIBop9SLDfUOnXHr+dLzX1mEjd
	 PKxe3GiYQNhcYi83736Vprz3MgsvbW8FVKA6KfS/HEiJFrzA9d5V8167QQVXJxr3qV
	 BXlEGAGsyeD2OQDZRDOipv9qG5CCFEc16EE6njeeP3C5Kq7DYYWjGAw92RgAHsHel2
	 01LWWd8Hwysq2c+vQHotrg7luKi83tySU5swgqLW6ouhrt8369ANSr8Wefbk0JSHWX
	 yj3eYNMSPZzHEHAiK+y4fsSM=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Subject: [OE-core][PATCH] iproute2: Remove -fcommon
Date: Tue, 12 May 2020 16:55:16 +0300
Message-Id: <20200512135523.19970-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

This was fixed in upstream version 5.5.0.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-connectivity/iproute2/iproute2_5.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_5.5.0.bb b/meta/recipes-connectivity/iproute2/iproute2_5.5.0.bb
index ad0ab13c9a..7ad4b8eee6 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_5.5.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_5.5.0.bb
@@ -9,4 +9,4 @@ SRC_URI[sha256sum] = "bac543435cac208a11db44c9cc8e35aa902befef8750594654ee71941c
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-EXTRA_OEMAKE_append = " CCOPTS='${CFLAGS} -fcommon'"
+EXTRA_OEMAKE_append = " CCOPTS='${CFLAGS}'"
-- 
2.17.1

