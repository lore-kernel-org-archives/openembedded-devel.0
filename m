Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.11133.1605215254470735046
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2020 13:07:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: gpanders.com, ip: 217.70.183.199, mailfrom: greg@gpanders.com)
X-Originating-IP: 98.32.4.57
Received: from localhost (c-98-32-4-57.hsd1.nm.comcast.net [98.32.4.57])
	(Authenticated sender: greg@gpanders.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id DBA84FF804;
	Thu, 12 Nov 2020 21:07:30 +0000 (UTC)
From: "Gregory Anders" <greg@gpanders.com>
To: openembedded-devel@lists.openembedded.org
Cc: Trevor Gamblin <trevor.gamblin@windriver.com>,
	Gregory Anders <greg@gpanders.com>
Subject: [meta-python][PATCH v4] Add python3-cvxopt
Date: Thu, 12 Nov 2020 14:06:45 -0700
Message-Id: <20201112210645.26343-1-greg@gpanders.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Gregory Anders <greg@gpanders.com>
---
 .../packagegroups/packagegroup-meta-python.bb |  1 +
 .../python/python3-cvxopt_1.2.5.bb            | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index b8265fcc5..142687f30 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -428,6 +428,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-transitions \
     python3-dill \
     python3-cerberus \
+    python3-cvxopt \
 "
 
 RDEPENDS_packagegroup-meta-python3-extended = "\
diff --git a/meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb b/meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb
new file mode 100644
index 000000000..b440d62bd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Convex optimization package"
+HOMEPAGE = "http://cvxopt.org"
+LICENSE = "GPL-3.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4905701d14049b3f8e4774c290aeee21"
+
+SRC_URI = "git://github.com/cvxopt/cvxopt;protocol=https"
+
+SRCREV = "5b59d87007bf6fdea464e14875543b35255b84b2"
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

