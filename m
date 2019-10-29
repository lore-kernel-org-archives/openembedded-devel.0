Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 306C77FA20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 18:31:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 472gCM6f7nz65
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 19:31:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572373888;
	bh=jqf4zchcpWxnfOf1VqakTzdAhQcviPoB9IYy0DlABOU=;
	h=From:To:Subject:Date:From;
	b=MPSCfJviAdGVt7W9dLDa388BqpRSQhxC8FLNe9vv+GqLc2Aj8bDqsubiz2D2oWmja
	BfSQ7LpW9SdUc3X385voT0IcDaXysZ4ToyLQsQKSRfFQhNZBbjqbFL89Pl+NNCh66C
	4ErGeR7rbnZj8GBjVGXsXps6NphPLCtB1d8YBS17fgdtt26KKASsPY2A597MfZ7ugV
	HVASJ1lvOfFbp5w7Ts8wYHQj9gp5ESNzZbr0x083v7Uct1Zwjxa+rbK9b0qRHsvu1C
	x6A6YmtfEfbdSej+f5mAEm6gp9TKDQms/KwXXd8Lc406OF3YGIsO57rHY7U0zm1JnO
	70LzSHFZDudnMjQky2QGAARw7o6uXlfAQmFr2OnILUnd2qWsWOW+DaxV37+MhRGCuf
	m2CUU4ohW5BFUP8hRXB8zoLw0R7TsfvjAA1fE5kDg7WcWKwILHHI0ohHd8pLBayiZB
	N89yG5/AAcsy9JT8pwYltU7IoP1HaGtE7fz9WHliIGph+yoJWZtpLqnAGPDrGMQfBO
	XSSnxf5Ub7KZy322pBlmIOdAewZqMwCoxcrgXfIVo2/zNIij6AlxuXs1CgJl6hK6en
	G5XWeFLzNC7Ozdl5wIobWeQNA85ESQiM5BoHDqyE4gcH9r06UnkgWhnPtKwBEEyHiv
	8oc8sF129G47hU71lSjVCrBw=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Oct 2019 20:31:22 +0200
Message-Id: <20191029183123.1868-9-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] pegtl: Upgrade 2.1.4 -> 2.8.1
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
X-List-Received-Date: Tue, 29 Oct 2019 18:31:27 -0000

Removed patch for issue fixed upstream.
Year updated in LICENSE.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...clang-warning-about-non-virtual-dtor.patch | 25 -------------------
 meta-oe/recipes-extended/pegtl/pegtl_2.1.4.bb | 13 ----------
 meta-oe/recipes-extended/pegtl/pegtl_2.8.1.bb | 12 +++++++++
 3 files changed, 12 insertions(+), 38 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/pegtl/pegtl/0001-Fix-clang-warning-about-non-virtual-dtor.patch
 delete mode 100644 meta-oe/recipes-extended/pegtl/pegtl_2.1.4.bb
 create mode 100644 meta-oe/recipes-extended/pegtl/pegtl_2.8.1.bb

diff --git a/meta-oe/recipes-extended/pegtl/pegtl/0001-Fix-clang-warning-about-non-virtual-dtor.patch b/meta-oe/recipes-extended/pegtl/pegtl/0001-Fix-clang-warning-about-non-virtual-dtor.patch
deleted file mode 100644
index 0c79c4c09..000000000
--- a/meta-oe/recipes-extended/pegtl/pegtl/0001-Fix-clang-warning-about-non-virtual-dtor.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 340110292b35d367205953a59e7eab28e1f4a0bb Mon Sep 17 00:00:00 2001
-From: Daniel Frey <d.frey@gmx.de>
-Date: Sat, 7 Apr 2018 09:13:51 +0200
-Subject: [PATCH] Fix clang-warning about non-virtual dtor
-
-Upstream-Status: Backport [https://github.com/taocpp/PEGTL/commit/340110292b35d367205953a59e7eab28e1f4a0bb]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/example/pegtl/json_classes.hpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/src/example/pegtl/json_classes.hpp
-+++ b/src/example/pegtl/json_classes.hpp
-@@ -34,10 +34,7 @@ namespace examples
-          : type( in_type )
-       {
-       }
--
--      ~json_base()
--      {
--      }
-+      virtual ~json_base() = default;
-    };
- 
-    inline std::ostream& operator<<( std::ostream& o, const json_base& j )
diff --git a/meta-oe/recipes-extended/pegtl/pegtl_2.1.4.bb b/meta-oe/recipes-extended/pegtl/pegtl_2.1.4.bb
deleted file mode 100644
index 344a80524..000000000
--- a/meta-oe/recipes-extended/pegtl/pegtl_2.1.4.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-DESCRIPTION="header-only library for creating parsers according to Parsing Expression Grammar"
-HOMEPAGE="https://github.com/taocpp/PEGTL"
-LICENSE="MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=80cb066ab204c7fe022f1cfe0c2c6818"
-
-SRCREV = "776fa4a1e8bda860008524f6dd9473967c8375b1"
-SRC_URI = "git://git@github.com/taocpp/PEGTL.git;protocol=https;branch=master \
-           file://0001-Fix-clang-warning-about-non-virtual-dtor.patch \
-          "
-
-inherit cmake
-
-S = "${WORKDIR}/git"
diff --git a/meta-oe/recipes-extended/pegtl/pegtl_2.8.1.bb b/meta-oe/recipes-extended/pegtl/pegtl_2.8.1.bb
new file mode 100644
index 000000000..7333363ec
--- /dev/null
+++ b/meta-oe/recipes-extended/pegtl/pegtl_2.8.1.bb
@@ -0,0 +1,12 @@
+DESCRIPTION="header-only library for creating parsers according to Parsing Expression Grammar"
+HOMEPAGE="https://github.com/taocpp/PEGTL"
+LICENSE="MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ae77b0d903a788cb48f4f0926ffc468b"
+
+SRCREV = "7aff80da2ca4fcb0b47f32ba684ff2e1cd48c579"
+SRC_URI = "git://github.com/taocpp/PEGTL.git;protocol=https;branch=2.x \
+          "
+
+inherit cmake
+
+S = "${WORKDIR}/git"
-- 
2.17.1


