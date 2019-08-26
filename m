Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 664C27D41C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2019 20:26:38 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id u16so16572572wrr.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2019 13:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=slPTpGMBWWoHNvRHyqEkRroBbcp1buwgmkDCpXngrUQ=;
	b=i5NucGHvPI7Dwkr/pZ8J/2/kCe7kvbAcFiul4Xr4rmGyCBLJ1ZHK+Nr7l6Vxw+Ov/x
	lFSz1bZFtSwHycS1l88tms2RhG9S1Kxidy4abF2mucXO4BcAIApQjKQ6PDSmYT97TmsC
	eROUA6ZJPKP2cPZahcuWLon+5BnB2moF3kT7NUfw39L/ZpOK82mO4MKvKDyKlxMizQEP
	hOPtEX7n4OiMQiZGgDVOVAExx5teO+Svk7c7UOUA6L2qTFq+xDSpzq2E7sSTRNQ1YYG0
	xEAcPtAVeX/nlobVQtXcycQwPmHp5PqDEaw+GUlgCLGPyx1nnibvSNv56EkjE9UX/kS5
	p9lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=slPTpGMBWWoHNvRHyqEkRroBbcp1buwgmkDCpXngrUQ=;
	b=Ajw7DmXVx7/dRTemR29+QNmtA1CUXTXHU2Z6xwPQHKoR/X/LqyvQ9l3gqkiTAZ3jIf
	4lv9gLxT5pnlTqA71qbguBMrVJ1mGOEDrzz5JWMtS1HymFnu2Gv7qDGnmRlJHfqyeFJj
	jTWixVRXjWB7ArY3pf95Yb/MgJ3iSGuu6OkPesWxzX296aPDzBOGxXpynEeW5KcAPGOz
	kOgBP15RC9xFkoZ1E7m5vGx/6C/9sWpDHH/0UAoGlb/wAjQGpdLx1SeRj4rA/4zHi5jB
	1+xyNsjeHxTTY981i1xsqCUtXCnknGFx996DvbR14pxV4qAHWU/A9tqefq/4tyLukC+U
	So2Q==
X-Gm-Message-State: APjAAAVgXlpqf4VqTYKNwfBq81YduohydxRY4QQuzhqetBxoeK4M3//n
	BsdqhZpI8H3KVUPC4yeGMnSq6wsl
X-Google-Smtp-Source: APXvYqxnjo1xHN//xlVB0ZZ/noX4PxJou5sZqiyBqCLBlWtQrbw2JHxya/9T9l3wrs0BY907RWmODA==
X-Received: by 2002:adf:f404:: with SMTP id g4mr23844595wro.290.1566851198690; 
	Mon, 26 Aug 2019 13:26:38 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F43169926A389420D7F9B96.dip0.t-ipconnect.de.
	[2003:f0:7f43:1699:26a3:8942:d7f:9b96])
	by smtp.gmail.com with ESMTPSA id
	u129sm1130163wmb.12.2019.08.26.13.26.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 26 Aug 2019 13:26:38 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Aug 2019 22:26:29 +0200
Message-Id: <20190826202629.1781-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] cmark: initial add 0.29.0
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
X-List-Received-Date: Mon, 26 Aug 2019 20:26:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-support/cmark/cmark_git.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-support/cmark/cmark_git.bb

diff --git a/meta-oe/recipes-support/cmark/cmark_git.bb b/meta-oe/recipes-support/cmark/cmark_git.bb
new file mode 100644
index 000000000..f74a39b50
--- /dev/null
+++ b/meta-oe/recipes-support/cmark/cmark_git.bb
@@ -0,0 +1,17 @@
+SUMMARY = "CommonMark parsing and rendering library and program in C"
+HOMEPAGE = "https://github.com/commonmark/cmark"
+LICENSE = "BSD-2-Clause & MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=81f9cae6293cc0345a9144b78152ab62"
+
+SRC_URI = "git://github.com/commonmark/cmark.git"
+SRCREV = "8daa6b1495124f0b67e6034130e12d7be83e38bd"
+S = "${WORKDIR}/git"
+
+PV = "0.29.0"
+
+inherit cmake lib_package
+
+EXTRA_OECMAKE += " \
+    -DCMARK_TESTS=OFF \
+    -DCMARK_STATIC=OFF \
+"
-- 
2.21.0


