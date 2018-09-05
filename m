Return-Path: <zhe.he@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 982AD65C8F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Sep 2018 08:50:05 +0000 (UTC)
Received: from ala-blade48.wrs.com (ala-blade48.wrs.com [147.11.105.68])
	by mail.windriver.com (8.15.2/8.15.1) with SMTP id w858o5Ne021026
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 5 Sep 2018 01:50:05 -0700 (PDT)
Received: by ala-blade48.wrs.com (sSMTP sendmail emulation);
	Wed, 05 Sep 2018 01:50:05 -0700
From: He Zhe <zhe.he@windriver.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Sep 2018 01:50:05 -0700
Message-Id: <20180905085005.35608-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-networking][PATCH v2] spice: Upgrade 0.14.0 -> 0.14.1
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
X-List-Received-Date: Wed, 05 Sep 2018 08:50:05 -0000

Adjust location of spice-common source as new spice asks spice-common
to be put under "subprojects" directory.

Disable -Werror when building with clang for the moment. Some non-trivial
changes need to be made to fix the warnings clang give.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 meta-networking/recipes-support/spice/spice_git.bb | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
index 38b8bf306..871bb0fe9 100644
--- a/meta-networking/recipes-support/spice/spice_git.bb
+++ b/meta-networking/recipes-support/spice/spice_git.bb
@@ -13,18 +13,19 @@ architectures."
 LICENSE = "BSD & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-PV = "0.14.0+git${SRCPV}"
+PV = "0.14.1+git${SRCPV}"
 
-SRCREV_spice = "f1050bfc76c9c4146257e087baf74e0b62d7d218"
-SRCREV_spice-common = "95743f40a2da39e0a19859c305e69e2c99d39e42"
+SRCREV_spice = "eaa07ef15cfc3bf57a69da2576af66f028787774"
+SRCREV_spice-common = "6b93b3fce8909b836ef1d1434d191900d8aa00be"
 
 SRCREV_FORMAT = "spice_spice-common"
 
 SRC_URI = " \
     git://anongit.freedesktop.org/spice/spice;name=spice \
-    git://anongit.freedesktop.org/spice/spice-common;destsuffix=git/spice-common;name=spice-common \
+    git://anongit.freedesktop.org/spice/spice-common;destsuffix=git/subprojects/spice-common;name=spice-common \
     file://0001-Convert-pthread_t-to-be-numeric.patch \
 "
+
 FOO = "\
     file://0001-build-allow-separated-src-and-build-dirs.patch \
 "
@@ -55,3 +56,5 @@ PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama,libxinerama,"
 COMPATIBLE_HOST = '(x86_64|i.86).*-linux'
 
 BBCLASSEXTEND = "native nativesdk"
+
+EXTRA_OECONF_toolchain-clang += "--disable-werror"
-- 
2.11.0


