Return-Path: <krzk@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id 48F5F76066
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2018 15:55:58 +0000 (UTC)
Received: from localhost.localdomain (xdsl-188-155-58-14.adslplus.ch
	[188.155.58.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id D4D45208EC;
	Tue, 10 Jul 2018 15:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1531238159;
	bh=4Tr48kmNkI+kxDBVo69bEUviIASQBSyFTPPrHFwLTLc=;
	h=From:To:Cc:Subject:Date:From;
	b=DPZOTtBtCysNkATngcsb7z40k98B+UzQZaieWmQz8qqGnY2pE6ES83ibKuu5LRd7e
	1ma9MstRTCrybDLw4AaBzcuMRyD4q6lI8G9aSoqHk+VZDToYNi9E5lGdpPygH20a9o
	8lFM9gTKhfgwt1JvN12aUKfHdLQrgmZUQNJhYRHI=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Jul 2018 17:55:32 +0200
Message-Id: <20180710155532.6127-1-krzk@kernel.org>
X-Mailer: git-send-email 2.14.1
Subject: [meta-oe][PATCH] libkcapi: Add new recipe for v1.1.1
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
X-List-Received-Date: Tue, 10 Jul 2018 15:55:58 -0000

Add new recipe with libkcapi v1.1.1, Linux Kernel Crypto API User Space
Interface Library.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb

diff --git a/meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb b/meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb
new file mode 100644
index 000000000000..be25d6e390ea
--- /dev/null
+++ b/meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Linux Kernel Crypto API User Space Interface Library"
+HOMEPAGE = "http://www.chronox.de/libkcapi.html"
+LICENSE = "BSD | GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d0421cf231423bda10cea691b613e866"
+
+DEPENDS = "libtool"
+
+S = "${WORKDIR}/git"
+# Use v1.1.1 with changes on top for building in OE
+SRCREV = "342b50fc9225a991c224126c13c188ad9f1ef9f9"
+PV = "1.1.1+git${SRCPV}"
+SRC_URI = "git://github.com/smuellerDD/libkcapi.git"
+
+inherit autotools
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[testapp] = "--enable-kcapi-test,,,"
+PACKAGECONFIG[apps] = "--enable-kcapi-speed --enable-kcapi-hasher --enable-kcapi-rngapp --enable-kcapi-encapp --enable-kcapi-dgstapp,,,"
+
+do_install_append() {
+    # bindir contains testapp and apps.  However it is always created, even
+    # when no binaries are installed (empty bin_PROGRAMS in Makefile.am),
+    rmdir --ignore-fail-on-non-empty ${D}${bindir}
+}
-- 
2.14.1


