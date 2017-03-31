Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id ECBA277E33
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 16:43:11 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id g2so18477549pge.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 09:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Elssv4KcqHWbUKsdu40jU1biY+fJ/zifWKU2WrSK6uQ=;
	b=gHUEfUMFPPoNxHdKwE44qVIouEeH3aR1Aj1g93tWtUgnobZO2HDHVGkk0xgihtjPdz
	ezZ9/9UHutrzUKMtihKO9PecIKtBS6nRLZxL0XX/c6h88n+MlQkkNOqTNV2Tdbn2Fgg2
	MWu87iGEX/S/vvKDRSPeQNX8PsZbHt7mjHBD+sTklDDLfWvlNNe1L1WkM73yRdPAryzD
	vm0P7zvOZB+KRLUJROOc6X3Gx277hDu7vSVh+uNE4s7EXxEU/J3bvrK5VHJ+3wjLi9T3
	LNeQaeYDfKrzFa6vjKQ+wrSafM0fBekOjAchQLxhrwetDWC+PlyCqh0I1P2hOrIdhMMR
	4WXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Elssv4KcqHWbUKsdu40jU1biY+fJ/zifWKU2WrSK6uQ=;
	b=smUd25E8kqkki1DUCUtSWNwjs8y14ETHymFA0JVihZ8exLU+Wx8qQIsHEjnGUP8E85
	f9vjrh5aj3NYVME4O4b90uO+Adqm+fb1AqUoPrYVE8r6tfliuMKP/LRL27DwSLfMFeE3
	3g2lNDMFZJpILq+Wgfp3sLvPoHkQ9y8hCDg4kMmLnoRWS2aIqGATsS0sa+CXdhbd1EJY
	c00YXy0CRoJ747nixrb/cm/3t+28ztVc1T9IdUk+KJZLg8ZCVEfKBSKdUPuzsQHYCLqn
	FXicIJmraVG5/EpjEBNVT2ZrlF06EGxBQ5SZkZzfTlaSu5MeTyQoXBWuJleDrLDTBi2P
	B0zA==
X-Gm-Message-State: AFeK/H0kw65FqRY0HuZgQ4209x6OpW+Fzsaniw4H9rUrR2awmGGLHcTY/kulXdhi3J+2sA==
X-Received: by 10.99.170.70 with SMTP id x6mr4272794pgo.111.1490978593638;
	Fri, 31 Mar 2017 09:43:13 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm11569706pfh.124.2017.03.31.09.43.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 09:43:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 09:42:17 -0700
Message-Id: <20170331164247.5052-13-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.1
In-Reply-To: <20170331164247.5052-1-raj.khem@gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 13/43] poco: Upgrade to 1.7.8
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
X-List-Received-Date: Fri, 31 Mar 2017 16:43:12 -0000

Fixes build with musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/poco/{poco_1.7.7.bb => poco_1.7.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/poco/{poco_1.7.7.bb => poco_1.7.8.bb} (97%)

diff --git a/meta-oe/recipes-support/poco/poco_1.7.7.bb b/meta-oe/recipes-support/poco/poco_1.7.8.bb
similarity index 97%
rename from meta-oe/recipes-support/poco/poco_1.7.7.bb
rename to meta-oe/recipes-support/poco/poco_1.7.8.bb
index e2d3be885..0fd6a8b1c 100644
--- a/meta-oe/recipes-support/poco/poco_1.7.7.bb
+++ b/meta-oe/recipes-support/poco/poco_1.7.8.bb
@@ -12,9 +12,9 @@ inherit cmake ptest
 
 BBCLASSEXTEND = "native"
 
-SRCREV = "e98adba2c298b4179e77237873d3fbc53876c528"
+SRCREV = "aae9c2e0f64caf019d31ba8f97635d5656b25ba5"
 SRC_URI = " \
-    git://github.com/pocoproject/poco.git \
+    git://github.com/pocoproject/poco.git;branch=poco-${PV} \
     file://run-ptest \
    "
 
-- 
2.12.1


