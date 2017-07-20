Return-Path: <romain.bazile@ubiant.com>
Received: from 20.mo1.mail-out.ovh.net (20.mo1.mail-out.ovh.net
	[188.165.45.168])
	by mail.openembedded.org (Postfix) with ESMTP id 692667828E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 08:12:42 +0000 (UTC)
Received: from player169.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id 146D3882CF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 09:57:14 +0200 (CEST)
Received: from UBI-2016-10.ubiant.me
	(LStLambert-656-1-42-23.w92-154.abo.wanadoo.fr [92.154.89.23])
	(Authenticated sender: romain.bazile@ubiant.com)
	by player169.ha.ovh.net (Postfix) with ESMTPSA id E6B29580097;
	Thu, 20 Jul 2017 09:57:12 +0200 (CEST)
From: Romain Bazile <romain.bazile@ubiant.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Jul 2017 09:56:51 +0200
Message-Id: <20170720075651.16444-1-romain.bazile@ubiant.com>
X-Mailer: git-send-email 2.13.3
X-Ovh-Tracer-Id: 7086695491757366088
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelkedrgeeggddufedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenuc
Subject: [meta-python][PATCH] python-pytun: addition of recipe for python and python3 using pipy
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
X-List-Received-Date: Thu, 20 Jul 2017 08:12:42 -0000

Signed-off-by: Romain Bazile <romain.bazile@ubiant.com>
---
 meta-python/recipes-connectivity/python-pytun/python-pytun.inc | 10 ++++++++++
 .../recipes-connectivity/python-pytun/python-pytun_2.2.1.bb    |  2 ++
 .../recipes-connectivity/python-pytun/python3-pytun_2.2.1.bb   |  2 ++
 3 files changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-connectivity/python-pytun/python-pytun.inc
 create mode 100644 meta-python/recipes-connectivity/python-pytun/python-pytun_2.2.1.bb
 create mode 100644 meta-python/recipes-connectivity/python-pytun/python3-pytun_2.2.1.bb

diff --git a/meta-python/recipes-connectivity/python-pytun/python-pytun.inc b/meta-python/recipes-connectivity/python-pytun/python-pytun.inc
new file mode 100644
index 000000000..79eddce99
--- /dev/null
+++ b/meta-python/recipes-connectivity/python-pytun/python-pytun.inc
@@ -0,0 +1,10 @@
+ SUMMARY = "Python TUN/TAP tunnel module"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=13f7629e8e4989b66b4a913ab05a91de"
+
+SRC_URI[md5sum] = "5b35b1cf80a02cca7ec72eb95d6b0192"
+SRC_URI[sha256sum] = "07595dadf85f5176eb08c8d4d9ba5b862a180e96633f670f91437c47a1bead0d"
+
+PYPI_PACKAGE = "python-pytun"
+
+inherit pypi 
diff --git a/meta-python/recipes-connectivity/python-pytun/python-pytun_2.2.1.bb b/meta-python/recipes-connectivity/python-pytun/python-pytun_2.2.1.bb
new file mode 100644
index 000000000..3fc587f3a
--- /dev/null
+++ b/meta-python/recipes-connectivity/python-pytun/python-pytun_2.2.1.bb
@@ -0,0 +1,2 @@
+require python-pytun.inc
+inherit setuptools
diff --git a/meta-python/recipes-connectivity/python-pytun/python3-pytun_2.2.1.bb b/meta-python/recipes-connectivity/python-pytun/python3-pytun_2.2.1.bb
new file mode 100644
index 000000000..938d9d739
--- /dev/null
+++ b/meta-python/recipes-connectivity/python-pytun/python3-pytun_2.2.1.bb
@@ -0,0 +1,2 @@
+require python-pytun.inc
+inherit setuptools3
-- 
2.13.3


