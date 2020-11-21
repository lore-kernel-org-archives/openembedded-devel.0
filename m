Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web10.1726.1605929320139653142
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Nov 2020 19:28:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=gjNgy3OW;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Received: from sinanubuntu.ckuic5o5zete5ommc4uz5anrqg.bx.internal.cloudapp.net (unknown [23.96.20.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 084F122269;
	Sat, 21 Nov 2020 03:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605929319;
	bh=TYO2avNd8H1v2cjsDgj6ge6cZo44NK5KE+5LUzXY6ec=;
	h=From:To:Cc:Subject:Date:From;
	b=gjNgy3OWMtlMyqEsH//bdkBbo+AW+kvnO50hGaJiHlgxUopWKupM3UEbTWL9M4UkL
	 7tuf376z/7NizaxKNKqXaDEIcSVkmUu9TByiUV1mziy0bfUU8Aqd+8JEwPmPe4FUba
	 6AU8U4ALLF/rGx8fJqqp0SxCVknw5AZTvPTsWNwI=
From: "Sinan Kaya" <okaya@kernel.org>
To: openembedded-devel@lists.openembedded.org
Cc: Sinan Kaya <okaya@kernel.org>
Subject: [meta-oe][PATCH] cpp-netlib: add bitbake recipe
Date: Sat, 21 Nov 2020 03:28:32 +0000
Message-Id: <20201121032832.21540-1-okaya@kernel.org>
X-Mailer: git-send-email 2.17.1

Adding recipe for cpp-net library.

Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 .../cpp-netlib/cpp-netlib_git.bb              | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb

diff --git a/meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb b/meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb
new file mode 100644
index 0000000000..472b72fc2e
--- /dev/null
+++ b/meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "Modern C++ network programming libraries."
+
+# This library provides general purpose network functionality such as
+# socket communication to agent libraries. It was designed to be merged
+# into boost at some point and follows similar header library approach
+# for most functionality.
+
+SECTION = "libs"
+LICENSE = "BSL-1.0 & MIT & Python-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
+
+SRC_URI = "\
+    git://github.com/cpp-netlib/cpp-netlib.git;protocol=https;branch=0.13-release  \
+"
+SRC_URI[sha256sum] = "0b9255bb0668d89867a1f367d770f12d7038db4f5b6111774ef032f669cccad4"
+
+SRCREV = "ca95f04d140acf619892ee02a82e930dd91ff7d4"
+
+S = "${WORKDIR}/git"
+
+inherit cmake pkgconfig
+
+DEPENDS = "zlib boost openssl"
+
+EXTRA_OECMAKE_append = " -DCPP-NETLIB_BUILD_TESTS=OFF -DCPP-NETLIB_BUILD_EXAMPLES=OFF"
+
-- 
2.17.1

