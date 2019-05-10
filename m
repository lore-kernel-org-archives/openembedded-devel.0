Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 180BF7E087
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 11:55:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 450pYd5vHXzJm
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 13:55:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557489317;
	bh=blewbw02LYxYJE0kVJxwhTeJjdpz0kLUBku/IoejZQg=;
	h=From:To:Subject:Date:From;
	b=FIAE196kcBG9W+7v3XVUUB5TdMdeMvOVOvbtdTaG3Cf/uNuLGe2dTJDXVwvxvRybU
	4cvQ7MqU98BX1ZOXTXhG1pXd1Ds2zpeB0cMiJ3Li3/1BTpn81XkPJSOeqbpliWFWOW
	qPPd14jPqDu/mYHVEqpkgzEuvXsGvs0qEisQpLAEml4RI9EUn9mXjAwthNfHelgYIN
	9D3RVRAy85GCdcdlP8jzXoBulj61SXjvZFixIPDN0m3cqVcnLQ9lH7a+2fT0LplYC6
	nW4RPJoP4sTeo2m8HmP8ynR7ykt36PNUkeeN2EsXcNidJL1/1neU5WvrKV8JkqGeE7
	VyVDTwjCckRxr2Q178woKoR6akpGLVXY96xEdQkjtpIkRSLSeeuijK5j+vrA78n2Oi
	9ijZzan7byhsoCtH33uUKI8UdxXIr4AulgSVGxTWrCWZBYGtRyqiwnR9gaFNy/QGLi
	IFBTlVbUh3ulzUAGEYYLTriIbvqjhLaPIevtbGj3kY7wco1JRpNmXJqnvHGA9dTMH4
	MUFG9r1YKP52u+l9Yhp+CGqxHoAOlveQhsJRMsfXqxs2/0S9GEYgfKqhZ6kNNMc5jq
	t9cSL41ai/yJNFNcMZlCko/kG5AMPFeHcCJIOiMJ9gBZnzLKwVedJDX3ZrQjDkSunM
	lhIAmy0XxUmnPBxQsSBmxgdE=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 May 2019 14:55:01 +0300
Message-Id: <20190510115515.19491-5-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] libcec: Upgrade 4.0.2 -> 4.0.4
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
X-List-Received-Date: Fri, 10 May 2019 11:55:17 -0000

Remove patch applied upstream.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...xplicitly-use-python3-in-pyCecClient.patch | 24 -------------------
 meta-oe/recipes-extended/libcec/libcec_git.bb |  6 ++---
 2 files changed, 3 insertions(+), 27 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/libcec/files/0001-Explicitly-use-python3-in-pyCecClient.patch

diff --git a/meta-oe/recipes-extended/libcec/files/0001-Explicitly-use-python3-in-pyCecClient.patch b/meta-oe/recipes-extended/libcec/files/0001-Explicitly-use-python3-in-pyCecClient.patch
deleted file mode 100644
index ec1f5d0d5..000000000
--- a/meta-oe/recipes-extended/libcec/files/0001-Explicitly-use-python3-in-pyCecClient.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 16e8c072709572ccefa6c7f835136db01f031323 Mon Sep 17 00:00:00 2001
-From: Pascal Bach <pascal.bach@siemens.com>
-Date: Fri, 28 Sep 2018 16:56:14 +0200
-Subject: [PATCH] Explicitly use python3 in pyCecClient
-
-Upstream-Status: Submitted [https://github.com/Pulse-Eight/libcec/pull/433]
-
----
- src/pyCecClient/pyCecClient.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/pyCecClient/pyCecClient.py b/src/pyCecClient/pyCecClient.py
-index 6d47857..d0504ac 100755
---- a/src/pyCecClient/pyCecClient.py
-+++ b/src/pyCecClient/pyCecClient.py
-@@ -1,4 +1,4 @@
--#! /usr/bin/python
-+#! /usr/bin/python3
- ## demo of the python-libcec API
- 
- # This file is part of the libCEC(R) library.
--- 
-2.11.0
-
diff --git a/meta-oe/recipes-extended/libcec/libcec_git.bb b/meta-oe/recipes-extended/libcec/libcec_git.bb
index 4ad49971a..26664255d 100644
--- a/meta-oe/recipes-extended/libcec/libcec_git.bb
+++ b/meta-oe/recipes-extended/libcec/libcec_git.bb
@@ -9,11 +9,11 @@ DEPENDS = "p8platform udev ncurses swig-native python3"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libx11 libxrandr', '', d)}"
 DEPENDS_append_rpi = "${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', '', ' userland', d)}"
 
-PV = "4.0.2+gitr${SRCPV}"
+PV = "4.0.4"
 
-SRCREV = "0a97062dd4b196ceeb003ec41841c7a7edc36dd1"
+SRCREV = "3bbd4321618503d14008387a72fabb6743878831"
 SRC_URI = "git://github.com/Pulse-Eight/libcec.git \
-           file://0001-Explicitly-use-python3-in-pyCecClient.patch"
+"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


