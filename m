Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web08.29120.1606097367023624878
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2020 18:09:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=Kk5rq4VF;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Received: from sinanubuntu.ckuic5o5zete5ommc4uz5anrqg.bx.internal.cloudapp.net (unknown [23.96.20.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 2809220936;
	Mon, 23 Nov 2020 02:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606097366;
	bh=SDM4sSyEt+Oq14ftoFeG2bncdz55/6LYB6QGeFu7nqc=;
	h=From:To:Cc:Subject:Date:From;
	b=Kk5rq4VFjYMEWdkbfAl6S4iNgH485mol2RYKAAdaMlzXUnnvEav6S5DLWGPdxx5MO
	 UbiPh1W1wEH7pbiPzmloFjOpVRu/M8bHFxTnzw0KcpeF4L0nj+JHZHyzkT2iyfRBhV
	 evnj+hN+gp9dbQ2OiU/RsVt/0VV730ZhQqQDxtQo=
From: "Sinan Kaya" <okaya@kernel.org>
To: openembedded-devel@lists.openembedded.org
Cc: Sinan Kaya <okaya@kernel.org>
Subject: [meta-oe][PATCH v5] heaptrack: add bitbake recipe
Date: Mon, 23 Nov 2020 02:09:19 +0000
Message-Id: <20201123020919.5556-1-okaya@kernel.org>
X-Mailer: git-send-email 2.17.1

Add this useful tool to the devtools list.

Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 .../packagegroups/packagegroup-meta-oe.bb      |  1 +
 .../heaptrack/heaptrack_git.bb                 | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/heaptrack/heaptrack_git.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 9ac60b26c8..02ac44d13b 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -227,6 +227,7 @@ RDEPENDS_packagegroup-meta-oe-devtools ="\
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "geany-plugins geany", "", d)} \
     lemon \
     flatbuffers \
+    heaptrack \
     libubox \
     ltrace \
     lua \
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

