Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.15836.1604946722602430121
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2020 10:32:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: gpanders.com, ip: 217.70.183.198, mailfrom: greg@gpanders.com)
X-Originating-IP: 98.32.4.57
Received: from localhost.localdomain (c-98-32-4-57.hsd1.nm.comcast.net [98.32.4.57])
	(Authenticated sender: greg@gpanders.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id D7439C0009;
	Mon,  9 Nov 2020 18:31:59 +0000 (UTC)
From: "Gregory Anders" <greg@gpanders.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gregory Anders <greg@gpanders.com>
Subject: [meta-python][PATCH v2] Add python3-cvxopt
Date: Mon,  9 Nov 2020 11:31:56 -0700
Message-Id: <20201109183156.25407-1-greg@gpanders.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
Added python3-cvxopt to meta-python packagegroup

 .../packagegroups/packagegroup-meta-python.bb |  1 +
 .../python/python3-cvxopt_1.2.5.bb            | 20 +++++++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 6a3061986..0120fb873 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -425,6 +425,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-pycurl \
     gyp \
     python3-jsonref \
+    python3-cvxopt \
 "
 
 RDEPENDS_packagegroup-meta-python3-extended = "\
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

