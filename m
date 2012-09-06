Received: from [78.110.170.148] (helo=tinyArch.localdomain)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9bvV-0005e9-62
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 15:15:21 +0200
Received: from archHP.dbnet.local (unknown [195.171.99.130])
	by tinyArch.localdomain (Postfix) with ESMTPSA id 12A07407CB;
	Thu,  6 Sep 2012 10:29:37 +0100 (BST)
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Sep 2012 14:03:58 +0100
Message-Id: <1346936638-12503-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.7.12
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [meta-oe][PATCH] Jansson: new recipe, library for creating and manipulating JSON strings in C
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Sep 2012 13:15:21 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
---
 meta-oe/recipes-extended/jansson/jansson_2.3.1.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-oe/recipes-extended/jansson/jansson_2.3.1.bb

diff --git a/meta-oe/recipes-extended/jansson/jansson_2.3.1.bb b/meta-oe/recipes-extended/jansson/jansson_2.3.1.bb
new file mode 100644
index 0000000..85aade4
--- /dev/null
+++ b/meta-oe/recipes-extended/jansson/jansson_2.3.1.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Jansson is a C library for encoding, decoding and manipulating JSON data."
+HOMEPAGE = "http://www.digip.org/jansson/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6946b728e700de875e60ebb453cc3a20"
+
+SRC_URI = "http://www.digip.org/jansson/releases/${PN}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "28848fbc02d7657d930f97ce74f80d93"
+SRC_URI[sha256sum] = "5f2ebf63580c73cc115634861b5da1c919499dde37d2e73b16e28b0c8ddc3921"
+
+inherit autotools pkgconfig
+
-- 
1.7.12



