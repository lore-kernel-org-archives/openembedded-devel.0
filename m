Return-Path: <christian@poessinger.com>
X-Greylist: delayed 61660 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 21 Apr 2018 07:30:53 UTC
Received: from 2.mo176.mail-out.ovh.net (2.mo176.mail-out.ovh.net
	[46.105.35.152])
	by mail.openembedded.org (Postfix) with ESMTP id B2A8574620
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Apr 2018 07:30:53 +0000 (UTC)
Received: from ex2.mail.ovh.net (unknown [10.109.120.8])
	by mo176.mail-out.ovh.net (Postfix) with ESMTPS id AAC53C7E01
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Apr 2018 09:30:53 +0200 (CEST)
Received: from helix.mybll.net (164.132.53.29) by EX10.indiv2.local
	(172.16.2.10) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32;
	Sat, 21 Apr 2018 09:30:53 +0200
From: <christian@poessinger.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 21 Apr 2018 09:30:47 +0200
Message-ID: <20180421073047.31467-1-christian@poessinger.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [164.132.53.29]
X-ClientProxiedBy: EX2.indiv2.local (172.16.2.2) To EX10.indiv2.local
	(172.16.2.10)
X-Ovh-Tracer-Id: 16766056990914548040
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtgedrjeekgdduvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenuc
Subject: [meta-python][PATCH] python-pystache: add version 0.5.4
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
X-List-Received-Date: Sat, 21 Apr 2018 07:30:53 -0000
Content-Type: text/plain

From: Christian Poessinger <christian@poessinger.com>

Pystache is a Python implementation of Mustache. Mustache is a
framework-agnostic, logic-free templating system inspired by ctemplate and et.
Like ctemplate, Mustache "emphasizes separating logic from presentation: it is
impossible to embed application logic in this template language."

Signed-off-by: Christian Poessinger <christian@poessinger.com>
---
 meta-python/recipes-devtools/python/python-pystache.inc     | 13 +++++++++++++
 .../recipes-devtools/python/python-pystache_0.5.4.bb        |  2 ++
 2 files changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pystache.inc
 create mode 100644 meta-python/recipes-devtools/python/python-pystache_0.5.4.bb

diff --git a/meta-python/recipes-devtools/python/python-pystache.inc b/meta-python/recipes-devtools/python/python-pystache.inc
new file mode 100644
index 000000000..6dbc99f53
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pystache.inc
@@ -0,0 +1,13 @@
+SUMMARY = "Python implementation of Mustache"
+HOMEPAGE = "https://github.com/defunkt/pystache"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=eb4417802c56384aac71b34505528a60"
+
+SRC_URI[md5sum] = "485885e67a0f6411d5252e69b20a35ca"
+SRC_URI[sha256sum] = "f7bbc265fb957b4d6c7c042b336563179444ab313fb93a719759111eabd3b85a"
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-netserver \
+"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-pystache_0.5.4.bb b/meta-python/recipes-devtools/python/python-pystache_0.5.4.bb
new file mode 100644
index 000000000..a45501247
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pystache_0.5.4.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-pystache.inc
-- 
2.11.0


