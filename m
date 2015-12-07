Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5BF5B607AB
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Dec 2015 10:04:33 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 Dec 2015 11:04:32 +0100
Message-Id: <1449482672-7739-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.9.1
Subject: [meta-python][PATCH v2] python-monotonic: new recipe, version 0.4
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
X-List-Received-Date: Mon, 07 Dec 2015 10:04:37 -0000

On Python 3.3 or newer, monotonic will be an alias of time.monotonic
from the standard library. On older versions, it will fall back to
an equivalent implementation.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
v2: Added missing runtime dependencies.

Tested on fido.

 meta-python/recipes-devtools/python/python-monotonic_0.4.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-monotonic_0.4.bb

diff --git a/meta-python/recipes-devtools/python/python-monotonic_0.4.bb b/meta-python/recipes-devtools/python/python-monotonic_0.4.bb
new file mode 100644
index 0000000..c97ed48
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-monotonic_0.4.bb
@@ -0,0 +1,10 @@
+SUMMARY = "An implementation of time.monotonic() for Python 2.0 through 3.2"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
+
+SRC_URI[md5sum] = "1919cc3aff2a1b907fe24c1f801343ef"
+SRC_URI[sha256sum] = "852f656adbf623ee859def6ca2f5498f4cae3256f8320d5c50570ee8a0592ab6"
+
+inherit pypi
+
+RDEPENDS_${PN} += "${PYTHON_PN}-ctypes ${PYTHON_PN}-re"
-- 
1.9.1


