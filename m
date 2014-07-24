Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8803E7069F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jul 2014 08:18:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6O8IJpH010924
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jul 2014 01:18:19 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 24 Jul 2014 01:18:18 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 24 Jul 2014 16:18:24 +0800
Message-ID: <1406189904-25165-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH][meta-networking] snort: do not hardcoded the libdir
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
X-List-Received-Date: Thu, 24 Jul 2014 08:18:22 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

libdir is defined as ${pref_exec}/lib/, but we want it to support multilib path

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 .../snort/files/not-hardcoded-libdir.patch         |  279 ++++++++++++++++++++
 .../recipes-connectivity/snort/snort_2.9.6.0.bb    |    1 +
 2 files changed, 280 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/snort/files/not-hardcoded-libdir.patch

diff --git a/meta-networking/recipes-connectivity/snort/files/not-hardcoded-libdir.patch b/meta-networking/recipes-connectivity/snort/files/not-hardcoded-libdir.patch
new file mode 100644
index 0000000..075ec13
--- /dev/null
+++ b/meta-networking/recipes-connectivity/snort/files/not-hardcoded-libdir.patch
@@ -0,0 +1,279 @@
+[PATCH] do not hardcoded libdir
+
+Upstream-Status: Pending
+
+libdir is hardcoded to ${exec_prefix}/lib, but we want it to support multilib
+
+Signed-off-by: Roy.Li <rongqing.li@windriver.com>
+---
+ src/dynamic-examples/dynamic-preprocessor/Makefile.am | 2 +-
+ src/dynamic-examples/dynamic-rule/Makefile.am         | 2 +-
+ src/dynamic-plugins/sf_engine/Makefile.am             | 2 +-
+ src/dynamic-preprocessors/dcerpc2/Makefile.am         | 2 +-
+ src/dynamic-preprocessors/dnp3/Makefile.am            | 2 +-
+ src/dynamic-preprocessors/dns/Makefile.am             | 2 +-
+ src/dynamic-preprocessors/file/Makefile.am            | 2 +-
+ src/dynamic-preprocessors/ftptelnet/Makefile.am       | 2 +-
+ src/dynamic-preprocessors/gtp/Makefile.am             | 2 +-
+ src/dynamic-preprocessors/imap/Makefile.am            | 2 +-
+ src/dynamic-preprocessors/modbus/Makefile.am          | 2 +-
+ src/dynamic-preprocessors/pop/Makefile.am             | 2 +-
+ src/dynamic-preprocessors/reputation/Makefile.am      | 2 +-
+ src/dynamic-preprocessors/rzb_saac/Makefile.am        | 2 +-
+ src/dynamic-preprocessors/sdf/Makefile.am             | 2 +-
+ src/dynamic-preprocessors/sip/Makefile.am             | 2 +-
+ src/dynamic-preprocessors/smtp/Makefile.am            | 2 +-
+ src/dynamic-preprocessors/ssh/Makefile.am             | 2 +-
+ src/dynamic-preprocessors/ssl/Makefile.am             | 2 +-
+ 19 files changed, 19 insertions(+), 19 deletions(-)
+
+diff --git a/src/dynamic-examples/dynamic-preprocessor/Makefile.am b/src/dynamic-examples/dynamic-preprocessor/Makefile.am
+index 255755e..1cafead 100644
+--- a/src/dynamic-examples/dynamic-preprocessor/Makefile.am
++++ b/src/dynamic-examples/dynamic-preprocessor/Makefile.am
+@@ -3,7 +3,7 @@ AUTOMAKE_OPTIONS=foreign no-dependencies
+ 
+ INCLUDES = -I../include
+ 
+-noinst_libdir = ${exec_prefix}/lib/snort_dynamicpreprocessor
++noinst_libdir = ${exec_prefix}${base_libdir}/snort_dynamicpreprocessor
+ 
+ noinst_lib_LTLIBRARIES = lib_sfdynamic_preprocessor_example.la
+ 
+diff --git a/src/dynamic-examples/dynamic-rule/Makefile.am b/src/dynamic-examples/dynamic-rule/Makefile.am
+index e5338d2..82eb212 100644
+--- a/src/dynamic-examples/dynamic-rule/Makefile.am
++++ b/src/dynamic-examples/dynamic-rule/Makefile.am
+@@ -3,7 +3,7 @@ AUTOMAKE_OPTIONS=foreign no-dependencies
+ 
+ INCLUDES = -I../include
+ 
+-noinst_libdir = ${exec_prefix}/lib/snort_dynamicrules
++noinst_libdir = ${exec_prefix}${base_libdir}/snort_dynamicrules
+ 
+ noinst_lib_LTLIBRARIES = lib_sfdynamic_example_rule.la
+ 
+diff --git a/src/dynamic-plugins/sf_engine/Makefile.am b/src/dynamic-plugins/sf_engine/Makefile.am
+index d6a6200..3d270c3 100644
+--- a/src/dynamic-plugins/sf_engine/Makefile.am
++++ b/src/dynamic-plugins/sf_engine/Makefile.am
+@@ -5,7 +5,7 @@ INCLUDES = @INCLUDES@
+ 
+ lib_LTLIBRARIES = libsf_engine.la
+ 
+-libdir = ${exec_prefix}/lib/snort_dynamicengine
++libdir = ${exec_prefix}${base_libdir}/snort_dynamicengine
+ 
+ libsf_engine_la_LDFLAGS = -export-dynamic -module @XCCFLAGS@
+ 
+diff --git a/src/dynamic-preprocessors/dcerpc2/Makefile.am b/src/dynamic-preprocessors/dcerpc2/Makefile.am
+index 9843073..8a0caa5 100644
+--- a/src/dynamic-preprocessors/dcerpc2/Makefile.am
++++ b/src/dynamic-preprocessors/dcerpc2/Makefile.am
+@@ -3,7 +3,7 @@ AUTOMAKE_OPTIONS=foreign no-dependencies
+ 
+ INCLUDES = -I../include -I${srcdir}/../libs -I$(srcdir)/includes
+ 
+-libdir = ${exec_prefix}/lib/snort_dynamicpreprocessor
++libdir = ${exec_prefix}${base_libdir}/snort_dynamicpreprocessor
+ 
+ lib_LTLIBRARIES = libsf_dce2_preproc.la
+ 
+diff --git a/src/dynamic-preprocessors/dnp3/Makefile.am b/src/dynamic-preprocessors/dnp3/Makefile.am
+index 1358862..18e2178 100644
+--- a/src/dynamic-preprocessors/dnp3/Makefile.am
++++ b/src/dynamic-preprocessors/dnp3/Makefile.am
+@@ -3,7 +3,7 @@ AUTOMAKE_OPTIONS=foreign no-dependencies
+ 
+ INCLUDES = -I../include -I${srcdir}/../libs
+ 
+-libdir = ${exec_prefix}/lib/snort_dynamicpreprocessor
++libdir = ${exec_prefix}${base_libdir}/snort_dynamicpreprocessor
+ 
+ lib_LTLIBRARIES = libsf_dnp3_preproc.la
+ 
+diff --git a/src/dynamic-preprocessors/dns/Makefile.am b/src/dynamic-preprocessors/dns/Makefile.am
+index f22d90e..49d2f55 100644
+--- a/src/dynamic-preprocessors/dns/Makefile.am
++++ b/src/dynamic-preprocessors/dns/Makefile.am
+@@ -3,7 +3,7 @@ AUTOMAKE_OPTIONS=foreign no-dependencies
+ 
+ INCLUDES = -I../include -I${srcdir}/../libs
+ 
+-libdir = ${exec_prefix}/lib/snort_dynamicpreprocessor
++libdir = ${exec_prefix}${base_libdir}/snort_dynamicpreprocessor
+ 
+ lib_LTLIBRARIES = libsf_dns_preproc.la
+ 
+diff --git a/src/dynamic-preprocessors/file/Makefile.am b/src/dynamic-preprocessors/file/Makefile.am
+index d71c0fd..834f7ac 100644
+--- a/src/dynamic-preprocessors/file/Makefile.am
++++ b/src/dynamic-preprocessors/file/Makefile.am
+@@ -3,7 +3,7 @@ AUTOMAKE_OPTIONS=foreign no-dependencies
+ 
+ INCLUDES = -I../include -I${srcdir}/../libs -I./include   
+ 
+-libdir = ${exec_prefix}/lib/snort_dynamicpreprocessor
++libdir = ${exec_prefix}${base_libdir}/snort_dynamicpreprocessor
+ 
+ lib_LTLIBRARIES = libsf_file_preproc.la
+ 
+diff --git a/src/dynamic-preprocessors/ftptelnet/Makefile.am b/src/dynamic-preprocessors/ftptelnet/Makefile.am
+index fe73835..3457231 100644
+--- a/src/dynamic-preprocessors/ftptelnet/Makefile.am
++++ b/src/dynamic-preprocessors/ftptelnet/Makefile.am
+@@ -3,7 +3,7 @@ AUTOMAKE_OPTIONS=foreign no-dependencies
+ 
+ INCLUDES = -I../include -I${srcdir}/../libs -I$(srcdir)/includes
+ 
+-libdir = ${exec_prefix}/lib/snort_dynamicpreprocessor
++libdir = ${exec_prefix}${base_libdir}/snort_dynamicpreprocessor
+ 
+ lib_LTLIBRARIES = libsf_ftptelnet_preproc.la
+ 
+diff --git a/src/dynamic-preprocessors/gtp/Makefile.am b/src/dynamic-preprocessors/gtp/Makefile.am
+index 51c961a..d7fb9b2 100644
+--- a/src/dynamic-preprocessors/gtp/Makefile.am
++++ b/src/dynamic-preprocessors/gtp/Makefile.am
+@@ -3,7 +3,7 @@ AUTOMAKE_OPTIONS=foreign no-dependencies
+ 
+ INCLUDES = -I../include -I${srcdir}/../libs -I$(srcdir)/includes
+ 
+-libdir = ${exec_prefix}/lib/snort_dynamicpreprocessor
++libdir = ${exec_prefix}${base_libdir}/snort_dynamicpreprocessor
+ 
+ lib_LTLIBRARIES = libsf_gtp_preproc.la
+ 
+diff --git a/src/dynamic-preprocessors/imap/Makefile.am b/src/dynamic-preprocessors/imap/Makefile.am
+index 533e43d..9efcbc4 100644
+--- a/src/dynamic-preprocessors/imap/Makefile.am
++++ b/src/dynamic-preprocessors/imap/Makefile.am
+@@ -3,7 +3,7 @@ AUTOMAKE_OPTIONS=foreign no-dependencies
+ 
+ INCLUDES = -I../include -I${srcdir}/../libs
+ 
+-libdir = ${exec_prefix}/lib/snort_dynamicpreprocessor
++libdir = ${exec_prefix}${base_libdir}/snort_dynamicpreprocessor
+ 
+ lib_LTLIBRARIES = libsf_imap_preproc.la
+ 
+diff --git a/src/dynamic-preprocessors/modbus/Makefile.am b/src/dynamic-preprocessors/modbus/Makefile.am
+index 05fc63e..e4f1415 100644
+--- a/src/dynamic-preprocessors/modbus/Makefile.am
++++ b/src/dynamic-preprocessors/modbus/Makefile.am
+@@ -3,7 +3,7 @@ AUTOMAKE_OPTIONS=foreign no-dependencies
+ 
+ INCLUDES = -I../include -I${srcdir}/../libs
+ 
+-libdir = ${exec_prefix}/lib/snort_dynamicpreprocessor
++libdir = ${exec_prefix}${base_libdir}/snort_dynamicpreprocessor
+ 
+ lib_LTLIBRARIES = libsf_modbus_preproc.la
+ 
+diff --git a/src/dynamic-preprocessors/pop/Makefile.am b/src/dynamic-preprocessors/pop/Makefile.am
+index d4b07b3..1345bc6 100644
+--- a/src/dynamic-preprocessors/pop/Makefile.am
++++ b/src/dynamic-preprocessors/pop/Makefile.am
+@@ -3,7 +3,7 @@ AUTOMAKE_OPTIONS=foreign no-dependencies
+ 
+ INCLUDES = -I../include -I${srcdir}/../libs
+ 
+-libdir = ${exec_prefix}/lib/snort_dynamicpreprocessor
++libdir = ${exec_prefix}${base_libdir}/snort_dynamicpreprocessor
+ 
+ lib_LTLIBRARIES = libsf_pop_preproc.la
+ 
+diff --git a/src/dynamic-preprocessors/reputation/Makefile.am b/src/dynamic-preprocessors/reputation/Makefile.am
+index 4e16142..14ba0cb 100644
+--- a/src/dynamic-preprocessors/reputation/Makefile.am
++++ b/src/dynamic-preprocessors/reputation/Makefile.am
+@@ -3,7 +3,7 @@ AUTOMAKE_OPTIONS=foreign no-dependencies
+ 
+ INCLUDES = -I../include -I${srcdir}/../libs -I$(srcdir)/includes
+ 
+-libdir = ${exec_prefix}/lib/snort_dynamicpreprocessor
++libdir = ${exec_prefix}${base_libdir}/snort_dynamicpreprocessor
+ 
+ lib_LTLIBRARIES = libsf_reputation_preproc.la
+ 
+diff --git a/src/dynamic-preprocessors/rzb_saac/Makefile.am b/src/dynamic-preprocessors/rzb_saac/Makefile.am
+index f0b0912..6ebe04e 100644
+--- a/src/dynamic-preprocessors/rzb_saac/Makefile.am
++++ b/src/dynamic-preprocessors/rzb_saac/Makefile.am
+@@ -3,7 +3,7 @@ AUTOMAKE_OPTIONS=foreign no-dependencies
+ 
+ INCLUDES = -I../include -I${srcdir}/../libs
+ 
+-pkglibdir = ${exec_prefix}/lib/snort_dynamicpreprocessor
++pkglibdir = ${exec_prefix}${base_libdir}/snort_dynamicpreprocessor
+ 
+ pkglib_LTLIBRARIES = sf_rzb_saac_preproc.la
+ 
+diff --git a/src/dynamic-preprocessors/sdf/Makefile.am b/src/dynamic-preprocessors/sdf/Makefile.am
+index 97b416e..04b5ce5 100644
+--- a/src/dynamic-preprocessors/sdf/Makefile.am
++++ b/src/dynamic-preprocessors/sdf/Makefile.am
+@@ -3,7 +3,7 @@ AUTOMAKE_OPTIONS=foreign no-dependencies
+ 
+ INCLUDES = -I../include -I${srcdir}/../libs
+ 
+-libdir = ${exec_prefix}/lib/snort_dynamicpreprocessor
++libdir = ${exec_prefix}${base_libdir}/snort_dynamicpreprocessor
+ 
+ lib_LTLIBRARIES = libsf_sdf_preproc.la
+ 
+diff --git a/src/dynamic-preprocessors/sip/Makefile.am b/src/dynamic-preprocessors/sip/Makefile.am
+index 67ac1e1..b4f360f 100644
+--- a/src/dynamic-preprocessors/sip/Makefile.am
++++ b/src/dynamic-preprocessors/sip/Makefile.am
+@@ -3,7 +3,7 @@ AUTOMAKE_OPTIONS=foreign no-dependencies
+ 
+ INCLUDES = -I../include -I${srcdir}/../libs -I$(srcdir)/includes
+ 
+-libdir = ${exec_prefix}/lib/snort_dynamicpreprocessor
++libdir = ${exec_prefix}${base_libdir}/snort_dynamicpreprocessor
+ 
+ lib_LTLIBRARIES = libsf_sip_preproc.la
+ 
+diff --git a/src/dynamic-preprocessors/smtp/Makefile.am b/src/dynamic-preprocessors/smtp/Makefile.am
+index 3b5893f..96750df 100644
+--- a/src/dynamic-preprocessors/smtp/Makefile.am
++++ b/src/dynamic-preprocessors/smtp/Makefile.am
+@@ -3,7 +3,7 @@ AUTOMAKE_OPTIONS=foreign no-dependencies
+ 
+ INCLUDES = -I../include -I${srcdir}/../libs
+ 
+-libdir = ${exec_prefix}/lib/snort_dynamicpreprocessor
++libdir = ${exec_prefix}${base_libdir}/snort_dynamicpreprocessor
+ 
+ lib_LTLIBRARIES = libsf_smtp_preproc.la
+ 
+diff --git a/src/dynamic-preprocessors/ssh/Makefile.am b/src/dynamic-preprocessors/ssh/Makefile.am
+index 0eab645..5ae9b80 100644
+--- a/src/dynamic-preprocessors/ssh/Makefile.am
++++ b/src/dynamic-preprocessors/ssh/Makefile.am
+@@ -3,7 +3,7 @@ AUTOMAKE_OPTIONS=foreign no-dependencies
+ 
+ INCLUDES = -I../include -I${srcdir}/../libs
+ 
+-libdir = ${exec_prefix}/lib/snort_dynamicpreprocessor
++libdir = ${exec_prefix}${base_libdir}/snort_dynamicpreprocessor
+ 
+ lib_LTLIBRARIES = libsf_ssh_preproc.la
+ 
+diff --git a/src/dynamic-preprocessors/ssl/Makefile.am b/src/dynamic-preprocessors/ssl/Makefile.am
+index 4ac2943..8d3abe3 100644
+--- a/src/dynamic-preprocessors/ssl/Makefile.am
++++ b/src/dynamic-preprocessors/ssl/Makefile.am
+@@ -3,7 +3,7 @@ AUTOMAKE_OPTIONS=foreign no-dependencies
+ 
+ INCLUDES = -I../include -I${srcdir}/../libs
+ 
+-libdir = ${exec_prefix}/lib/snort_dynamicpreprocessor
++libdir = ${exec_prefix}${base_libdir}/snort_dynamicpreprocessor
+ 
+ lib_LTLIBRARIES = libsf_ssl_preproc.la
+ 
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
index aba2850..66279e9 100644
--- a/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
@@ -11,6 +11,7 @@ SRC_URI = " ${GENTOO_MIRROR}/${BP}.tar.gz;name=tarball \
             file://disable-inaddr-none.patch \
             file://disable-dap-address-space-id.patch \
             file://0001-libpcap-search-sysroot-for-headers.patch \
+            file://not-hardcoded-libdir.patch \
 "
 
 SRC_URI[tarball.md5sum] = "18111f6de3989ca89add36077a7c2659"
-- 
1.7.10.4


