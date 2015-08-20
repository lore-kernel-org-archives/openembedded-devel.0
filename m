Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 908CF73E11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 05:43:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7K5h9s9006133
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2015 22:43:10 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Wed, 19 Aug 2015 22:43:09 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 20 Aug 2015 13:39:14 +0800
Message-ID: <1440049155-4314-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/2][meta-oe] libsodium: create recipe
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
X-List-Received-Date: Thu, 20 Aug 2015 05:43:15 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

zeromq 4.1.3 requires libsodium

Sodium is a new, easy-to-use software library for encryption, decryption,
signatures, password hashing and more. It is a portable, cross-compilable,
installable, packageable fork of NaCl, with a compatible API, and an extended
API to improve usability even further. Its goal is to provide all of the core
operations needed to build higher-level cryptographic tools. The design
choices emphasize security, and "magic constants" have clear rationales.

The same cannot be said of NIST curves, where the specific origins of certain
constants are not described by the standards. And despite the emphasis on
higher security, primitives are faster across-the-board than most
implementations of the NIST standards.

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-oe/recipes-support/libsodium/libsodium_1.0.3.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-oe/recipes-support/libsodium/libsodium_1.0.3.bb

diff --git a/meta-oe/recipes-support/libsodium/libsodium_1.0.3.bb b/meta-oe/recipes-support/libsodium/libsodium_1.0.3.bb
new file mode 100644
index 0000000..d02bb9b
--- /dev/null
+++ b/meta-oe/recipes-support/libsodium/libsodium_1.0.3.bb
@@ -0,0 +1,11 @@
+SUMMARY = "The Sodium crypto library"
+HOMEPAGE = "http://libsodium.org/"
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=092a09b78c3be486fac807435bf17b7a"
+
+SRC_URI = "https://download.libsodium.org/libsodium/releases/${BPN}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "b3bcc98e34d3250f55ae196822307fab"
+SRC_URI[sha256sum] = "cbcfc63cc90c05d18a20f229a62c7e7054a73731d0aa858c0517152c549b1288"
+
+inherit autotools
-- 
1.9.1


