Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web12.14491.1604940921035437104
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2020 08:55:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: gpanders.com, ip: 217.70.183.197, mailfrom: greg@gpanders.com)
X-Originating-IP: 98.32.4.57
Received: from localhost.localdomain (c-98-32-4-57.hsd1.nm.comcast.net [98.32.4.57])
	(Authenticated sender: greg@gpanders.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 8D3E41C0006;
	Mon,  9 Nov 2020 16:55:16 +0000 (UTC)
From: "Gregory Anders" <greg@gpanders.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gregory Anders <greg@gpanders.com>
Subject: [meta-python][PATCH] Add python3-cvxopt
Date: Mon,  9 Nov 2020 09:55:15 -0700
Message-Id: <20201109165515.15900-1-greg@gpanders.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
This depends on the SuiteSparse sparse matrix library, which I've also 
submitted a patch for.

 .../python/python3-cvxopt_1.2.5.bb            | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb

diff --git a/meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb b/meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb
new file mode 100644
index 000000000..7d01b22a1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Convex optimization package"
+HOMEPAGE = "http://cvxopt.org"
+LICENSE = "GPL-3.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4905701d14049b3f8e4774c290aeee21"
+
+SRC_URI = "git://github.com/cvxopt/cvxopt;protocol=https"
+
+SRCREV = "1.2.5"
+PV = "${SRCREV}"
+
+S = "${WORKDIR}/git"
+
+RDEPENDS_${PN} += "lapack suitesparse"
+DEPENDS += "lapack suitesparse"
+
+inherit setuptools3
+
+export CVXOPT_BLAS_LIB_DIR = "${STAGING_LIBDIR}"
+export CVXOPT_SUITESPARSE_LIB_DIR = "${STAGING_LIBDIR}"
+export CVXOPT_SUITESPARSE_INC_DIR = "${STAGING_INCDIR}"
-- 
2.29.2

