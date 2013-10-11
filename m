Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 38F616CC7F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2013 08:55:50 +0000 (UTC)
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Oct 2013 09:55:43 +0100
Message-Id: <1381481745-17613-2-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.4
In-Reply-To: <1381481745-17613-1-git-send-email-ml@communistcode.co.uk>
References: <1381481745-17613-1-git-send-email-ml@communistcode.co.uk>
Cc: Jack Mitchell <jmitchell@cbnl.com>
Subject: [PATCH 1/3] json-c: add 0.11
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
X-List-Received-Date: Fri, 11 Oct 2013 08:55:53 -0000

From: Jack Mitchell <jmitchell@cbnl.com>

---
 meta-oe/recipes-support/json-c/json-c_0.11.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-oe/recipes-support/json-c/json-c_0.11.bb

diff --git a/meta-oe/recipes-support/json-c/json-c_0.11.bb b/meta-oe/recipes-support/json-c/json-c_0.11.bb
new file mode 100644
index 0000000..f94091b
--- /dev/null
+++ b/meta-oe/recipes-support/json-c/json-c_0.11.bb
@@ -0,0 +1,11 @@
+SUMMARY = "JSON-C implements a reference counting object model that allows you to easily construct JSON objects in C"
+HOMEPAGE = "https://github.com/json-c/json-c/wiki"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
+
+SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${P}.tar.gz"
+
+SRC_URI[md5sum] = "aa02367d2f7a830bf1e3376f77881e98"
+SRC_URI[sha256sum] = "28dfc65145dc0d4df1dfe7701ac173c4e5f9347176c8983edbfac9149494448c"
+
+inherit autotools
-- 
1.8.4


