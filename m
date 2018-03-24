Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3396778819
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Mar 2018 13:53:16 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id b198so15807569qkg.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Mar 2018 06:53:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4dD3P/Ihp7rfL9Fcq7MiQ89i6NU5FVvx6kwUZv5rXX0=;
	b=QxKjZ1x4Ih+ekDhL7f9Y8V4TY8q7EcFcYceG9yBYqBA6qHAYMfnXOx2Cv/uZXnFQFI
	v4GcReqwcV0DTbnSaFQamx39Kg6wZZgJ6M5SMyBxuPudKiDTZ33bFbt1QxecyvX0j1Zl
	DJuyLjaMOqdu3u3NPnvFxIphcXy0W+YvGJi3xVJ0f4QQSQhBAs4kC4zygFKY44PPFxYn
	eigVMsyLYSvWC8dwJ6qLOa9KOCQUcJGmaENHbetZGjZIDKqQMNMaPwjgcJ6Kcwzer8ba
	IzHHl+LhghbzZn7a/d7z5ay+TmnmFbGZPDP0LfFDxjFZmKoFBjNA1ga+gDvpI9JpqZQf
	FHNg==
X-Gm-Message-State: AElRT7FkkLN+60BY1c5akfOyOoGQiqDzOGcdA7LlO27dU6yYR7cEqzjP
	jEt9s10a/wYQQKHicxIx+XxXiovs
X-Google-Smtp-Source: AG47ELu41XEEhRAZJ7G/FXYyK0CMTFbyI49yGLrpN6opa/agPQcw0O61XmnisuEsYB/ayQUenO+53w==
X-Received: by 10.55.156.79 with SMTP id f76mr45072050qke.36.1521899597677;
	Sat, 24 Mar 2018 06:53:17 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id f3sm8357831qkj.7.2018.03.24.06.53.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 24 Mar 2018 06:53:16 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 24 Mar 2018 09:52:59 -0400
Message-Id: <1521899579-3713-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-lxml: update to version 4.2.1
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
X-List-Received-Date: Sat, 24 Mar 2018 13:53:17 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-lxml.inc                   | 4 ++--
 .../python/{python-lxml_4.2.0.bb => python-lxml_4.2.1.bb}             | 0
 .../python/{python3-lxml_4.2.0.bb => python3-lxml_4.2.1.bb}           | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-lxml_4.2.0.bb => python-lxml_4.2.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-lxml_4.2.0.bb => python3-lxml_4.2.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-lxml.inc b/meta-python/recipes-devtools/python/python-lxml.inc
index a0fe140..3f3a1e2 100644
--- a/meta-python/recipes-devtools/python/python-lxml.inc
+++ b/meta-python/recipes-devtools/python/python-lxml.inc
@@ -18,8 +18,8 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[md5sum] = "04455d43fd587bd11ccef6315258c3ce"
-SRC_URI[sha256sum] = "7d96fbb5f23a62300aa9bef7d286cd61aca8902357619c8708c0290aba5df73f"
+SRC_URI[md5sum] = "c266d9062e23b08f66426979a2b36f51"
+SRC_URI[sha256sum] = "e2629cdbcad82b83922a3488937632a4983ecc0fed3e5cfbf430d069382eeb9b"
 
 DISTUTILS_BUILD_ARGS += " \
                      --with-xslt-config='pkg-config libxslt' \
diff --git a/meta-python/recipes-devtools/python/python-lxml_4.2.0.bb b/meta-python/recipes-devtools/python/python-lxml_4.2.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-lxml_4.2.0.bb
rename to meta-python/recipes-devtools/python/python-lxml_4.2.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.2.0.bb b/meta-python/recipes-devtools/python/python3-lxml_4.2.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-lxml_4.2.0.bb
rename to meta-python/recipes-devtools/python/python3-lxml_4.2.1.bb
-- 
2.7.4


