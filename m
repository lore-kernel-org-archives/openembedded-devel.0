Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 13E5273C5A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Mar 2015 18:43:33 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Mar 2015 19:43:27 +0100
Message-Id: <1427395411-16303-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.9.1
Subject: [meta-python][PATCH 1/5] pypi.bbclass: new class to ease writing pypi recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Mar 2015 18:43:36 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta-python/classes/pypi.bbclass | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-python/classes/pypi.bbclass

diff --git a/meta-python/classes/pypi.bbclass b/meta-python/classes/pypi.bbclass
new file mode 100644
index 0000000..41a70e2
--- /dev/null
+++ b/meta-python/classes/pypi.bbclass
@@ -0,0 +1,21 @@
+def pypi_package(d):
+    bpn = d.getVar('BPN', True)
+    if bpn.startswith('python-'):
+        return bpn[7:]
+    return bpn
+
+PYPI_PACKAGE ?= "${@pypi_package(d)}"
+
+def pypi_src_uri(d):
+    package = d.getVar('PYPI_PACKAGE', True)
+    pv = d.getVar('PV', True)
+    return 'https://pypi.python.org/packages/source/%s/%s/%s-%s.tar.gz' % (package[0], package, package, pv)
+
+PYPI_SRC_URI ?= "${@pypi_src_uri(d)}"
+
+HOMEPAGE ?= "https://pypi.python.org/pypi/${PYPI_PACKAGE}/"
+SECTION = "devel/python"
+SRC_URI += "${PYPI_SRC_URI}"
+S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
+
+inherit setuptools
-- 
1.9.1


