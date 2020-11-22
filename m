Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web08.26471.1606084891505482518
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2020 14:41:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=qzvd6c9f;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Received: from sinanubuntu.ckuic5o5zete5ommc4uz5anrqg.bx.internal.cloudapp.net (unknown [23.96.20.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id A7AC420776;
	Sun, 22 Nov 2020 22:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606084891;
	bh=kDzCxTv93tW/+bQ+I/K5Xfr9IgpbQiCN2d0G2ikbhU4=;
	h=From:To:Cc:Subject:Date:From;
	b=qzvd6c9fw30GxSlvzyX79rSpSWUexIOLlhImVuz3YrbKU5shjBQ9T9TMm+g5qecoy
	 lqQEr3ni1QkZ/kCn/D9k5CcxJBEqTgAB1Ar4Usjw5n/37pUVqUs0Lsz1D15ukJwOQe
	 o21KdDEg/sPsbEX7i8svyFZsz/THBE4mGI8tsqZU=
From: "Sinan Kaya" <okaya@kernel.org>
To: openembedded-devel@lists.openembedded.org
Cc: Sinan Kaya <okaya@kernel.org>
Subject: [meta-oe][PATCH v4] heaptrack: add bitbake recipe
Date: Sun, 22 Nov 2020 22:41:20 +0000
Message-Id: <20201122224120.2931-1-okaya@kernel.org>
X-Mailer: git-send-email 2.17.1

Add this useful tool to the devtools list.

Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 .../heaptrack/heaptrack_git.bb                 | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/heaptrack/heaptrack_git.bb

diff --git a/meta-oe/recipes-devtools/heaptrack/heaptrack_git.bb b/meta-oe/recipes-devtools/heaptrack/heaptrack_git.bb
new file mode 100644
index 0000000000..30d7b65bd7
--- /dev/null
+++ b/meta-oe/recipes-devtools/heaptrack/heaptrack_git.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Heaptrack"
+HOMEPAGE = "https://phabricator.kde.org/source/heaptrack/"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+DEPENDS = "zlib boost libunwind elfutils"
+
+SRC_URI = "git://github.com/KDE/heaptrack.git;protocol=https"
+
+SRCREV = "bc9e3744bcc47de978673d1e382f4125a1ab5fa8"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+EXTRA_OECMAKE += "-DHEAPTRACK_BUILD_GUI=OFF"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

