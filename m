Return-Path: <zhe.he@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4A4AD75392
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Sep 2018 11:09:08 +0000 (UTC)
Received: from ala-blade48.wrs.com (ala-blade48.wrs.com [147.11.105.68])
	by mail.windriver.com (8.15.2/8.15.1) with SMTP id w84B98kc024397
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 4 Sep 2018 04:09:08 -0700 (PDT)
Received: by ala-blade48.wrs.com (sSMTP sendmail emulation);
	Tue, 04 Sep 2018 04:09:08 -0700
From: He Zhe <zhe.he@windriver.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Sep 2018 04:09:08 -0700
Message-Id: <20180904110908.1105-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-networking] [PATCH] spice: Upgrade 0.14.0 -> 0.14.1
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
X-List-Received-Date: Tue, 04 Sep 2018 11:09:08 -0000

- Fix the following build error.

../config.h:65: error: "HAVE_STDLIB_H" redefined [-Werror]

jpeglib.h from libjpeg contains the same definition of HAVE_STDLIB_H
which is supposed to be overwritten. -Werror changes the warning to
an error. This patches deletes the definition in jpeglib.h

- Adjust location of spice-common source as new spice asks spice-common
to be put under "subprojects" directory.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 meta-networking/recipes-support/spice/spice_git.bb | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
index 38b8bf306..5c0b2ca2a 100644
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
@@ -55,3 +56,7 @@ PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama,libxinerama,"
 COMPATIBLE_HOST = '(x86_64|i.86).*-linux'
 
 BBCLASSEXTEND = "native nativesdk"
+
+do_configure_append () {
+    sed -i -e '/#define HAVE_STDLIB_H/d' ${STAGING_DIR_HOST}/usr/include/jconfig.h
+}
-- 
2.11.0


