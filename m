Return-Path: <morphis@gravedo.de>
Received: from gravedo.de (gravedo.de [85.214.79.159])
	by mail.openembedded.org (Postfix) with ESMTP id 5610060CFC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jun 2014 08:05:11 +0000 (UTC)
Received: by gravedo.de (Postfix, from userid 7791)
	id 240553B34110; Wed, 25 Jun 2014 09:55:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED
	autolearn=unavailable version=3.3.1
Received: from localhost (dslb-092-077-006-204.pools.arcor-ip.net
	[92.77.6.204]) by gravedo.de (Postfix) with ESMTPSA id 2911A3B340F7;
	Wed, 25 Jun 2014 09:55:20 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jun 2014 09:55:16 +0200
Message-Id: <1403682917-7598-2-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1403682917-7598-1-git-send-email-morphis@gravedo.de>
References: <1403682917-7598-1-git-send-email-morphis@gravedo.de>
Subject: [PATCH 1/2] ninja-native: add recipe
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
X-List-Received-Date: Wed, 25 Jun 2014 08:05:15 -0000

Needed to build qtwebengine. Taken from meta-browser.

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 recipes-devtools/ninja/ninja-native_1.4.0.bb | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 recipes-devtools/ninja/ninja-native_1.4.0.bb

diff --git a/recipes-devtools/ninja/ninja-native_1.4.0.bb b/recipes-devtools/ninja/ninja-native_1.4.0.bb
new file mode 100644
index 0000000..a115c2e
--- /dev/null
+++ b/recipes-devtools/ninja/ninja-native_1.4.0.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Ninja is a small build system with a focus on speed."
+LICENSE = "Apache-2"
+
+inherit native
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
+
+SRCREV="63d5b1013cafb2db95687cf446eb5bb68cf6a27a"
+SRCBRANCH="release"
+
+SRC_URI = "git://github.com/martine/ninja.git;branch=${SRCBRANCH}"
+
+S="${WORKDIR}/git"
+
+do_compile() {
+    python ${S}/bootstrap.py
+}
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 ${S}/ninja ${D}${bindir}/ninja
+}
-- 
1.9.1


