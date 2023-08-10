Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1225AC001E0
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 15:40:17 +0000 (UTC)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
 by mx.groups.io with SMTP id smtpd.web10.20617.1691682010885424762
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Aug 2023 08:40:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=mesmtp header.b=duhyPJsl;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=3cDC5HOD;
 spf=pass (domain: cold-front.org, ip: 64.147.123.21, mailfrom: jsbronder@cold-front.org)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 3B76C320047A;
	Thu, 10 Aug 2023 11:40:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 10 Aug 2023 11:40:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=mesmtp; t=1691682009;
	 x=1691768409; bh=WMu05IZBMpCeQapcr0f6SrGIpN0T8r/ZnkHK6gyou/M=; b=
	duhyPJsl1YTyx7KIhajyhzuqrmfkJhcr7ouNbs68wvJT+OAtbprU7tyeqEzQKc/2
	uTFoBZgmXnzhQtlYM2NJVDVE02pefUgwRgMwXDrXvUkv3kx+IRdZQlu3gF/vnqcI
	8JvKNK3Y5jtNX2Fu6CD580x8sLkkMsAw6Ogj4d/WDJI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1691682009; x=
	1691768409; bh=WMu05IZBMpCeQapcr0f6SrGIpN0T8r/ZnkHK6gyou/M=; b=3
	cDC5HODa9iZ+xtItQCOZ1wWwtqfCj90qvq/OZVooYDpdROeeAyz22YFhvoY/2Wll
	hR5f/WQeWWMp56dhhNXw89kViWOzJJXWAm1BOdT3HpybGrTr8asdl/Od95QPcFiU
	+jZw2bJc9QaPAn2qi4rlmu8IeFlA9iiGXjFIbaGNd3lwmgXkt7JAb2dPmXn88YOC
	OtC9bMX8vjQU56P8wPlH5y/4R+7oBc249S4J3Hl03kdJ+PB7Cgr9ePaI2d6fBIy9
	700jEopruhcdHidfTy1Uc99cv/6PmJuC4IlTaqzhZ5HS7tZrqPLXRj21eHylQae7
	+PS6pU9tSiXRDftuBdleg==
X-ME-Sender: <xms:2QTVZI4BskEgJKCZqaW9T6cVebBv73sep3XPTRb9GwgVjwneXd5ttA>
    <xme:2QTVZJ5ZDsH3H-ZBsSNbLZteMsqI5Qnm8sdfWhCGuc5IPU6_W8OabeaHSREUflMx0
    wnM6UoJ2DdMdXhphw>
X-ME-Received: <xmr:2QTVZHd0qLBs_Niww9UOlANxIrakQzPEvFLNf735c437VOudmuGi8qPo9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrleeigdeltdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheplfhushhtihhnuceurhhonhguvghruceojhhssghrohhnuggv
    rhestgholhguqdhfrhhonhhtrdhorhhgqeenucggtffrrghtthgvrhhnpeevteehuddule
    dtheeigeefveetfedtteevhfdvgfejudfgieeiieffudehhffgteenucffohhmrghinhep
    ghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepjhhssghrohhnuggvrhestgholhguqdhfrhhonhhtrdhorhhg
X-ME-Proxy: <xmx:2QTVZNLs82TKxLMnPsDN3H0DeENfyP_8yapFJ9cjvSCScJZhCXeURQ>
    <xmx:2QTVZMJFfMx8xA2Eq7kR-yqNLGpeB7oOrhZwSUBnwIPhGgJl5hECsg>
    <xmx:2QTVZOybVMM8pHARwwhQGvVwj2OcK6ncCByAumd8DfYOfp3LfxFaZg>
    <xmx:2QTVZGwJjUxWos-4a02vcuBdf0Mxk0GNmrQ1BLG8hZyXB3tynhzVeQ>
Feedback-ID: iea0042cb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Aug 2023 11:40:09 -0400 (EDT)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Cc: Justin Bronder <jsbronder@cold-front.org>
Subject: [meta-python][PATCH 4/5] python3-mypy: upgrade 0.971 -> 1.5.0
Date: Thu, 10 Aug 2023 11:39:51 -0400
Message-ID: <20230810153953.17293-4-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230810153953.17293-1-jsbronder@cold-front.org>
References: <20230810153953.17293-1-jsbronder@cold-front.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Aug 2023 15:40:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104328

Switched RDEPEND to python3-modules as this is a complex package that is
still under fairly heavy development by python core contributors.  It's
likely that the dependency list will change from release to release and
unlikely that anyone wanting type-checking will be object to having a
full python installation.

Note for anyone attempting to backport this, you'll need to add
python3-tomli to RDEPENDS as python < 3.11 won't be in the stdlib.

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 .../python/python3-mypy_0.971.bb              | 23 -------------------
 .../python/python3-mypy_1.5.0.bb              | 23 +++++++++++++++++++
 2 files changed, 23 insertions(+), 23 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-mypy_0.971.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-mypy_1.5.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-mypy_0.971.bb b/meta-python/recipes-devtools/python/python3-mypy_0.971.bb
deleted file mode 100644
index 31fcb06c9..000000000
--- a/meta-python/recipes-devtools/python/python3-mypy_0.971.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "Optional static typing for Python 3 and 2 (PEP 484)"
-HOMEPAGE = "https://github.com/python/mypy"
-LICENSE = "MIT & Python-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6ba8ec528da02073b7e1f4124c0f836f"
-
-PYPI_PACKAGE = "mypy"
-
-inherit pypi python_setuptools_build_meta
-
-SRC_URI[sha256sum] = "40b0f21484238269ae6a57200c807d80debc6459d444c0489a102d7c6a75fa56"
-
-BBCLASSEXTEND = "native"
-
-RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-mypy-extensions \
-    ${PYTHON_PN}-typed-ast \
-    ${PYTHON_PN}-typing-extensions \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-compression \
-    ${PYTHON_PN}-pprint \
-    ${PYTHON_PN}-difflib \
-    ${PYTHON_PN}-toml \
-"
diff --git a/meta-python/recipes-devtools/python/python3-mypy_1.5.0.bb b/meta-python/recipes-devtools/python/python3-mypy_1.5.0.bb
new file mode 100644
index 000000000..46730aa23
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-mypy_1.5.0.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Optional static typing for Python 3 and 2 (PEP 484)"
+HOMEPAGE = "https://github.com/python/mypy"
+LICENSE = "MIT & Python-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6ba8ec528da02073b7e1f4124c0f836f"
+
+inherit pypi python_setuptools_build_meta
+
+SRC_URI[sha256sum] = "f3460f34b3839b9bc84ee3ed65076eb827cd99ed13ed08d723f9083cada4a212"
+
+BBCLASSEXTEND = "native"
+
+DEPENDS += " \
+    python3-mypy-extensions-native \
+    python3-types-psutil-native \
+    python3-types-setuptools-native \
+    python3-typing-extensions-native \
+"
+
+RDEPENDS:${PN} += " \
+    python3-modules \
+    python3-mypy-extensions \
+    python3-typing-extensions \
+"
-- 
2.41.0


