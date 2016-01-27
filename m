Return-Path: <stephen.arnold42@gmail.com>
X-Greylist: delayed 510 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 27 Jan 2016 01:42:35 UTC
Received: from dent.vctlabs.com (dent.vctlabs.com [68.183.110.161])
	by mail.openembedded.org (Postfix) with ESMTP id 16E6B6FFE8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jan 2016 01:42:35 +0000 (UTC)
Received: by dent.vctlabs.com (Postfix, from userid 112)
	id 0282F280FE4; Tue, 26 Jan 2016 17:32:40 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on dent.vctlabs.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from ptolemy.arnolds.bogus (gatekeeper.gentoogeek.org
	[66.159.242.209])
	(using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by dent.vctlabs.com (Postfix) with ESMTPSA id 7553628086A;
	Tue, 26 Jan 2016 17:32:39 -0800 (PST)
From: Stephen Arnold <sarnold@vctlabs.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Jan 2016 17:29:21 -0800
Message-Id: <1453858161-27358-1-git-send-email-sarnold@vctlabs.com>
X-Mailer: git-send-email 2.6.4
Subject: [meta-networking][PATCH] net-snmp: fix cross-compile breakage, add libnl pkgconfig option
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
X-List-Received-Date: Wed, 27 Jan 2016 01:42:38 -0000

From: Stephen Arnold <stephen.arnold42@gmail.com>

This patch enhances a previously unapplied patch on jethro, plus adds
some flexibility in terms of required deps and a few cleanups.

Signed-off-by: Stephen Arnold <stephen.arnold42@gmail.com>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
index b32d842..93eb025 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
@@ -27,7 +27,7 @@ SRC_URI[sha256sum] = "e8dfc79b6539b71a6ff335746ce63d2da2239062ad41872fff4354cafe
 
 inherit autotools update-rc.d siteinfo systemd pkgconfig
 
-EXTRA_OEMAKE = "INSTALL_PREFIX=${D}"
+EXTRA_OEMAKE = "INSTALL_PREFIX=${D} OTHERLDFLAGS='${LDFLAGS}' HOST_CPPFLAGS='${BUILD_CPPFLAGS}'"
 
 PARALLEL_MAKE = ""
 CCACHE = ""
@@ -36,12 +36,13 @@ TARGET_CC_ARCH += "${LDFLAGS}"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[elfutils] = "--with-elf, --without-elf, elfutils"
+PACKAGECONFIG[libnl] = "--with-nl, --without-nl, libnl"
 
 EXTRA_OECONF = "--disable-embedded-perl \
                 --with-perl-modules=no \
-                --enable-shared \
                 --disable-manuals \
                 --with-defaults \
+                --with-install-prefix=${D} \
                 --with-persistent-directory=${localstatedir}/lib/net-snmp \
                 ${@base_conditional('SITEINFO_ENDIANNESS', 'le', '--with-endianness=little', '--with-endianness=big', d)}"
 
@@ -51,10 +52,15 @@ EXTRA_OECONF += "--with-mib-modules=smux"
 CACHED_CONFIGUREVARS = " \
     ac_cv_header_valgrind_valgrind_h=no \
     ac_cv_header_valgrind_memcheck_h=no \
+    ac_cv_ETC_MNTTAB=/etc/mtab \
+    lt_cv_shlibpath_overrides_runpath=yes \
 "
 
 do_configure_prepend() {
     export PERLPROG="${bindir}/env perl"
+    sed -i -e "s|I/usr/include|I${STAGING_INCDIR}|g" \
+        "${S}"/configure \
+        "${S}"/configure.d/config_os_libs2
 }
 
 do_install_append() {
-- 
2.6.4


