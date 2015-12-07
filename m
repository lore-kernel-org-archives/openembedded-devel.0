Return-Path: <obi@opendreambox.org>
X-Greylist: delayed 598 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 07 Dec 2015 01:09:10 UTC
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 6ACEA601F6
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Dec 2015 01:09:10 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 Dec 2015 01:59:09 +0100
Message-Id: <1449449949-9463-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.9.1
Subject: [meta-python][PATCH] python-monotonic: new recipe, version 0.4
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
X-List-Received-Date: Mon, 07 Dec 2015 01:09:11 -0000

On Python 3.3 or newer, monotonic will be an alias of time.monotonic
from the standard library. On older versions, it will fall back to
an equivalent implementation.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 Tested on fido.

 meta-python/recipes-devtools/python/python-monotonic_0.4.bb | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-monotonic_0.4.bb

diff --git a/meta-python/recipes-devtools/python/python-monotonic_0.4.bb b/meta-python/recipes-devtools/python/python-monotonic_0.4.bb
new file mode 100644
index 0000000..3583a7e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-monotonic_0.4.bb
@@ -0,0 +1,8 @@
+SUMMARY = "An implementation of time.monotonic() for Python 2.0 through 3.2"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
+
+SRC_URI[md5sum] = "1919cc3aff2a1b907fe24c1f801343ef"
+SRC_URI[sha256sum] = "852f656adbf623ee859def6ca2f5498f4cae3256f8320d5c50570ee8a0592ab6"
+
+inherit pypi
-- 
1.9.1


