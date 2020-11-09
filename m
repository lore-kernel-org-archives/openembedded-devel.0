Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web12.16451.1604948454291268901
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2020 11:00:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: gpanders.com, ip: 217.70.183.195, mailfrom: greg@gpanders.com)
X-Originating-IP: 98.32.4.57
Received: from localhost.localdomain (c-98-32-4-57.hsd1.nm.comcast.net [98.32.4.57])
	(Authenticated sender: greg@gpanders.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 9F78160003;
	Mon,  9 Nov 2020 19:00:51 +0000 (UTC)
From: "Gregory Anders" <greg@gpanders.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gregory Anders <greg@gpanders.com>
Subject: [meta-python][PATCH v3] Add python3-cvxopt
Date: Mon,  9 Nov 2020 12:00:48 -0700
Message-Id: <20201109190048.26694-1-greg@gpanders.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
* Remove superfluous PV definition (not needed when version is in the 
  recipe name)
* Use actual git revision instead of tag name for SRCREV

 .../packagegroups/packagegroup-meta-python.bb |  1 +
 .../python/python3-cvxopt_1.2.5.bb            | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
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

