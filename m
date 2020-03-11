Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B3C9E6059C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2020 08:42:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 02B8gOdX007612
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2020 01:42:34 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.487.0; Wed, 11 Mar 2020 01:42:06 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 11 Mar 2020 16:42:05 +0800
Message-ID: <1583916125-405729-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] conf/layer.conf: add BBFILES_DYNAMIC and dynamic layers
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
X-List-Received-Date: Wed, 11 Mar 2020 08:42:43 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

some recipes under meta-oe have dependency on meta-python,
and test_world of yocto-check-layer will failed with error
like:

ERROR: test_world (common.CommonCheckLayer)
ERROR: Nothing PROVIDES 'python3-pytoml-native' (but
/meta-openembedded/meta-oe/recipes-extended/mozjs/mozjs_60.9.0.bb
DEPENDS on or otherwise requires it). Close matches:
  python3-numpy-native
  python3-pycairo-native
  python3-rpm-native
ERROR: Required build target 'meta-world-pkgdata' has no buildable
providers.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
'mozjs', 'python3-pytoml-native']

fix by make these recipes only active when identified layers are
present

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/conf/layer.conf                                              | 5 +++++
 .../recipes-benchmark/speedtest-cli/speedtest-cli_2.1.2.bb           | 0
 .../{ => dynamic-layers/meta-python}/recipes-bsp/rwmem/rwmem_1.2.bb  | 0
 .../lirc/lirc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch | 0
 .../meta-python}/recipes-connectivity/lirc/lirc/lirc.tmpfiles        | 0
 .../meta-python}/recipes-connectivity/lirc/lirc/lirc_options.conf    | 0
 .../meta-python}/recipes-connectivity/lirc/lirc/lircd.conf           | 0
 .../meta-python}/recipes-connectivity/lirc/lirc/lircd.init           | 0
 .../meta-python}/recipes-connectivity/lirc/lirc/lircd.service        | 0
 .../meta-python}/recipes-connectivity/lirc/lirc/lircexec.init        | 0
 .../meta-python}/recipes-connectivity/lirc/lirc/pollfd.patch         | 0
 .../meta-python}/recipes-connectivity/lirc/lirc_0.9.4d.bb            | 0
 .../meta-python}/recipes-core/packagegroups/packagegroup-meta-oe.bb  | 0
 .../0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch      | 0
 .../0001-Mark-one-of-strerror_r-implementation-glibc-specific.patch  | 0
 .../mongodb/mongodb/0001-Support-deprecated-resolver-functions.patch | 0
 .../0001-Tell-scons-to-use-build-settings-from-environment-va.patch  | 0
 .../0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch  | 0
 .../mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch      | 0
 .../mongodb/mongodb/0001-asio-Dont-use-experimental-with-clang.patch | 0
 .../0002-Add-a-definition-for-the-macro-__ELF_NATIVE_CLASS.patch     | 0
 .../mongodb/mongodb/0002-Fix-default-stack-size-to-256K.patch        | 0
 .../recipes-dbs/mongodb/mongodb/0003-Fix-unknown-prefix-env.patch    | 0
 .../mongodb/mongodb/0004-wiredtiger-Disable-strtouq-on-musl.patch    | 0
 .../meta-python}/recipes-dbs/mongodb/mongodb/arm64-support.patch     | 0
 .../meta-python}/recipes-dbs/mongodb/mongodb_git.bb                  | 0
 .../0001-Fix-parallel-build-fix-port-internal-make-dependenci.patch  | 0
 .../lcdproc/0002-Include-limits.h-for-PATH_MAX-definition.patch      | 0
 .../lcdproc/lcdproc/0003-Fix-non-x86-platforms-on-musl.patch         | 0
 .../meta-python}/recipes-extended/lcdproc/lcdproc_git.bb             | 0
 .../recipes-extended/mozjs/mozjs/0001-Port-build-to-python3.patch    | 0
 .../0002-js.pc.in-do-not-include-RequiredDefines.h-for-depend.patch  | 0
 .../mozjs/mozjs/0003-fix-cross-compilation-on-i586-targets.patch     | 0
 .../mozjs/mozjs/0004-do-not-create-python-environment.patch          | 0
 .../recipes-extended/mozjs/mozjs/0005-fix-cannot-find-link.patch     | 0
 .../mozjs/mozjs/0006-workaround-autoconf-2.13-detection-failed.patch | 0
 .../mozjs/mozjs/0007-fix-do_compile-failed-on-mips.patch             | 0
 .../recipes-extended/mozjs/mozjs/0008-add-riscv-support.patch        | 0
 .../mozjs/mozjs/0009-mozjs-fix-coredump-caused-by-getenv.patch       | 0
 .../recipes-extended/mozjs/mozjs/0010-format-overflow.patch          | 0
 .../mozjs/mozjs/0011-To-fix-build-error-on-arm32BE.patch             | 0
 .../recipes-extended/mozjs/mozjs/0012-JS_PUBLIC_API.patch            | 0
 .../mozjs/mozjs/0013-riscv-Disable-atomic-operations.patch           | 0
 .../mozjs/mozjs/0014-fallback-to-2011-C++-standard.patch             | 0
 .../mipsarchn32/0001-fix-compiling-failure-on-mips64-n32-bsp.patch   | 0
 .../recipes-extended/mozjs/mozjs/musl/0001-support-musl.patch        | 0
 .../mozjs/mozjs/musl/0002-js-Fix-build-with-musl.patch               | 0
 .../meta-python}/recipes-extended/mozjs/mozjs_60.9.0.bb              | 0
 .../smem/smem/0001-smem-fix-support-for-source-option-python3.patch  | 0
 .../meta-python}/recipes-support/smem/smem_1.5.bb                    | 0
 50 files changed, 5 insertions(+)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-benchmark/speedtest-cli/speedtest-cli_2.1.2.bb (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-bsp/rwmem/rwmem_1.2.bb (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-connectivity/lirc/lirc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-connectivity/lirc/lirc/lirc.tmpfiles (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-connectivity/lirc/lirc/lirc_options.conf (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-connectivity/lirc/lirc/lircd.conf (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-connectivity/lirc/lirc/lircd.init (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-connectivity/lirc/lirc/lircd.service (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-connectivity/lirc/lirc/lircexec.init (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-connectivity/lirc/lirc/pollfd.patch (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-connectivity/lirc/lirc_0.9.4d.bb (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-core/packagegroups/packagegroup-meta-oe.bb (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-dbs/mongodb/mongodb/0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-dbs/mongodb/mongodb/0001-Mark-one-of-strerror_r-implementation-glibc-specific.patch (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-dbs/mongodb/mongodb/0001-Support-deprecated-resolver-functions.patch (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-dbs/mongodb/mongodb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-dbs/mongodb/mongodb/0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-dbs/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-dbs/mongodb/mongodb/0001-asio-Dont-use-experimental-with-clang.patch (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-dbs/mongodb/mongodb/0002-Add-a-definition-for-the-macro-__ELF_NATIVE_CLASS.patch (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-dbs/mongodb/mongodb/0002-Fix-default-stack-size-to-256K.patch (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-dbs/mongodb/mongodb/0003-Fix-unknown-prefix-env.patch (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-dbs/mongodb/mongodb/0004-wiredtiger-Disable-strtouq-on-musl.patch (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-dbs/mongodb/mongodb/arm64-support.patch (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-dbs/mongodb/mongodb_git.bb (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-extended/lcdproc/lcdproc/0001-Fix-parallel-build-fix-port-internal-make-dependenci.patch (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-extended/lcdproc/lcdproc/0002-Include-limits.h-for-PATH_MAX-definition.patch (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-extended/lcdproc/lcdproc/0003-Fix-non-x86-platforms-on-musl.patch (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-extended/lcdproc/lcdproc_git.bb (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-extended/mozjs/mozjs/0001-Port-build-to-python3.patch (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-extended/mozjs/mozjs/0002-js.pc.in-do-not-include-RequiredDefines.h-for-depend.patch (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-extended/mozjs/mozjs/0003-fix-cross-compilation-on-i586-targets.patch (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-extended/mozjs/mozjs/0004-do-not-create-python-environment.patch (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-extended/mozjs/mozjs/0005-fix-cannot-find-link.patch (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-extended/mozjs/mozjs/0006-workaround-autoconf-2.13-detection-failed.patch (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-extended/mozjs/mozjs/0007-fix-do_compile-failed-on-mips.patch (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-extended/mozjs/mozjs/0008-add-riscv-support.patch (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-extended/mozjs/mozjs/0009-mozjs-fix-coredump-caused-by-getenv.patch (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-extended/mozjs/mozjs/0010-format-overflow.patch (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-extended/mozjs/mozjs/0011-To-fix-build-error-on-arm32BE.patch (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-extended/mozjs/mozjs/0012-JS_PUBLIC_API.patch (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-extended/mozjs/mozjs/0013-riscv-Disable-atomic-operations.patch (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-extended/mozjs/mozjs/0014-fallback-to-2011-C++-standard.patch (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-extended/mozjs/mozjs/mipsarchn32/0001-fix-compiling-failure-on-mips64-n32-bsp.patch (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-extended/mozjs/mozjs/musl/0001-support-musl.patch (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-extended/mozjs/mozjs/musl/0002-js-Fix-build-with-musl.patch (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-extended/mozjs/mozjs_60.9.0.bb (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-support/smem/smem/0001-smem-fix-support-for-source-option-python3.patch (100%)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-support/smem/smem_1.5.bb (100%)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index c537736..652a378 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -23,6 +23,11 @@ BBFILE_PATTERN_openembedded-layer := "^${LAYERDIR}/"
 
 BBFILE_PRIORITY_openembedded-layer = "6"
 
+# only activates content when identified layers are present,
+# to ensure yocto compatibility check pass
+BBFILES_DYNAMIC += "meta-python:${LAYERDIR}/dynamic-layers/meta-python/recipes-*/*/*.bb \
+"
+
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
 LAYERVERSION_openembedded-layer = "1"
diff --git a/meta-oe/recipes-benchmark/speedtest-cli/speedtest-cli_2.1.2.bb b/meta-oe/dynamic-layers/meta-python/recipes-benchmark/speedtest-cli/speedtest-cli_2.1.2.bb
similarity index 100%
rename from meta-oe/recipes-benchmark/speedtest-cli/speedtest-cli_2.1.2.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-benchmark/speedtest-cli/speedtest-cli_2.1.2.bb
diff --git a/meta-oe/recipes-bsp/rwmem/rwmem_1.2.bb b/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb
similarity index 100%
rename from meta-oe/recipes-bsp/rwmem/rwmem_1.2.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb
diff --git a/meta-oe/recipes-connectivity/lirc/lirc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/lirc/lirc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
diff --git a/meta-oe/recipes-connectivity/lirc/lirc/lirc.tmpfiles b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/lirc.tmpfiles
similarity index 100%
rename from meta-oe/recipes-connectivity/lirc/lirc/lirc.tmpfiles
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/lirc.tmpfiles
diff --git a/meta-oe/recipes-connectivity/lirc/lirc/lirc_options.conf b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/lirc_options.conf
similarity index 100%
rename from meta-oe/recipes-connectivity/lirc/lirc/lirc_options.conf
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/lirc_options.conf
diff --git a/meta-oe/recipes-connectivity/lirc/lirc/lircd.conf b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/lircd.conf
similarity index 100%
rename from meta-oe/recipes-connectivity/lirc/lirc/lircd.conf
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/lircd.conf
diff --git a/meta-oe/recipes-connectivity/lirc/lirc/lircd.init b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/lircd.init
similarity index 100%
rename from meta-oe/recipes-connectivity/lirc/lirc/lircd.init
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/lircd.init
diff --git a/meta-oe/recipes-connectivity/lirc/lirc/lircd.service b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/lircd.service
similarity index 100%
rename from meta-oe/recipes-connectivity/lirc/lirc/lircd.service
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/lircd.service
diff --git a/meta-oe/recipes-connectivity/lirc/lirc/lircexec.init b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/lircexec.init
similarity index 100%
rename from meta-oe/recipes-connectivity/lirc/lirc/lircexec.init
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/lircexec.init
diff --git a/meta-oe/recipes-connectivity/lirc/lirc/pollfd.patch b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/pollfd.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/lirc/lirc/pollfd.patch
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/pollfd.patch
diff --git a/meta-oe/recipes-connectivity/lirc/lirc_0.9.4d.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.9.4d.bb
similarity index 100%
rename from meta-oe/recipes-connectivity/lirc/lirc_0.9.4d.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.9.4d.bb
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bb
similarity index 100%
rename from meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bb
diff --git a/meta-oe/recipes-dbs/mongodb/mongodb/0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch
similarity index 100%
rename from meta-oe/recipes-dbs/mongodb/mongodb/0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch
rename to meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch
diff --git a/meta-oe/recipes-dbs/mongodb/mongodb/0001-Mark-one-of-strerror_r-implementation-glibc-specific.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Mark-one-of-strerror_r-implementation-glibc-specific.patch
similarity index 100%
rename from meta-oe/recipes-dbs/mongodb/mongodb/0001-Mark-one-of-strerror_r-implementation-glibc-specific.patch
rename to meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Mark-one-of-strerror_r-implementation-glibc-specific.patch
diff --git a/meta-oe/recipes-dbs/mongodb/mongodb/0001-Support-deprecated-resolver-functions.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Support-deprecated-resolver-functions.patch
similarity index 100%
rename from meta-oe/recipes-dbs/mongodb/mongodb/0001-Support-deprecated-resolver-functions.patch
rename to meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Support-deprecated-resolver-functions.patch
diff --git a/meta-oe/recipes-dbs/mongodb/mongodb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch
similarity index 100%
rename from meta-oe/recipes-dbs/mongodb/mongodb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch
rename to meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch
diff --git a/meta-oe/recipes-dbs/mongodb/mongodb/0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch
similarity index 100%
rename from meta-oe/recipes-dbs/mongodb/mongodb/0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch
rename to meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch
diff --git a/meta-oe/recipes-dbs/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch
similarity index 100%
rename from meta-oe/recipes-dbs/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch
rename to meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch
diff --git a/meta-oe/recipes-dbs/mongodb/mongodb/0001-asio-Dont-use-experimental-with-clang.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-asio-Dont-use-experimental-with-clang.patch
similarity index 100%
rename from meta-oe/recipes-dbs/mongodb/mongodb/0001-asio-Dont-use-experimental-with-clang.patch
rename to meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-asio-Dont-use-experimental-with-clang.patch
diff --git a/meta-oe/recipes-dbs/mongodb/mongodb/0002-Add-a-definition-for-the-macro-__ELF_NATIVE_CLASS.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0002-Add-a-definition-for-the-macro-__ELF_NATIVE_CLASS.patch
similarity index 100%
rename from meta-oe/recipes-dbs/mongodb/mongodb/0002-Add-a-definition-for-the-macro-__ELF_NATIVE_CLASS.patch
rename to meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0002-Add-a-definition-for-the-macro-__ELF_NATIVE_CLASS.patch
diff --git a/meta-oe/recipes-dbs/mongodb/mongodb/0002-Fix-default-stack-size-to-256K.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0002-Fix-default-stack-size-to-256K.patch
similarity index 100%
rename from meta-oe/recipes-dbs/mongodb/mongodb/0002-Fix-default-stack-size-to-256K.patch
rename to meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0002-Fix-default-stack-size-to-256K.patch
diff --git a/meta-oe/recipes-dbs/mongodb/mongodb/0003-Fix-unknown-prefix-env.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0003-Fix-unknown-prefix-env.patch
similarity index 100%
rename from meta-oe/recipes-dbs/mongodb/mongodb/0003-Fix-unknown-prefix-env.patch
rename to meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0003-Fix-unknown-prefix-env.patch
diff --git a/meta-oe/recipes-dbs/mongodb/mongodb/0004-wiredtiger-Disable-strtouq-on-musl.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0004-wiredtiger-Disable-strtouq-on-musl.patch
similarity index 100%
rename from meta-oe/recipes-dbs/mongodb/mongodb/0004-wiredtiger-Disable-strtouq-on-musl.patch
rename to meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0004-wiredtiger-Disable-strtouq-on-musl.patch
diff --git a/meta-oe/recipes-dbs/mongodb/mongodb/arm64-support.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/arm64-support.patch
similarity index 100%
rename from meta-oe/recipes-dbs/mongodb/mongodb/arm64-support.patch
rename to meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/arm64-support.patch
diff --git a/meta-oe/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mongodb/mongodb_git.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
diff --git a/meta-oe/recipes-extended/lcdproc/lcdproc/0001-Fix-parallel-build-fix-port-internal-make-dependenci.patch b/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc/0001-Fix-parallel-build-fix-port-internal-make-dependenci.patch
similarity index 100%
rename from meta-oe/recipes-extended/lcdproc/lcdproc/0001-Fix-parallel-build-fix-port-internal-make-dependenci.patch
rename to meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc/0001-Fix-parallel-build-fix-port-internal-make-dependenci.patch
diff --git a/meta-oe/recipes-extended/lcdproc/lcdproc/0002-Include-limits.h-for-PATH_MAX-definition.patch b/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc/0002-Include-limits.h-for-PATH_MAX-definition.patch
similarity index 100%
rename from meta-oe/recipes-extended/lcdproc/lcdproc/0002-Include-limits.h-for-PATH_MAX-definition.patch
rename to meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc/0002-Include-limits.h-for-PATH_MAX-definition.patch
diff --git a/meta-oe/recipes-extended/lcdproc/lcdproc/0003-Fix-non-x86-platforms-on-musl.patch b/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc/0003-Fix-non-x86-platforms-on-musl.patch
similarity index 100%
rename from meta-oe/recipes-extended/lcdproc/lcdproc/0003-Fix-non-x86-platforms-on-musl.patch
rename to meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc/0003-Fix-non-x86-platforms-on-musl.patch
diff --git a/meta-oe/recipes-extended/lcdproc/lcdproc_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc_git.bb
similarity index 100%
rename from meta-oe/recipes-extended/lcdproc/lcdproc_git.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc_git.bb
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0001-Port-build-to-python3.patch b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0001-Port-build-to-python3.patch
similarity index 100%
rename from meta-oe/recipes-extended/mozjs/mozjs/0001-Port-build-to-python3.patch
rename to meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0001-Port-build-to-python3.patch
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0002-js.pc.in-do-not-include-RequiredDefines.h-for-depend.patch b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0002-js.pc.in-do-not-include-RequiredDefines.h-for-depend.patch
similarity index 100%
rename from meta-oe/recipes-extended/mozjs/mozjs/0002-js.pc.in-do-not-include-RequiredDefines.h-for-depend.patch
rename to meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0002-js.pc.in-do-not-include-RequiredDefines.h-for-depend.patch
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0003-fix-cross-compilation-on-i586-targets.patch b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0003-fix-cross-compilation-on-i586-targets.patch
similarity index 100%
rename from meta-oe/recipes-extended/mozjs/mozjs/0003-fix-cross-compilation-on-i586-targets.patch
rename to meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0003-fix-cross-compilation-on-i586-targets.patch
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0004-do-not-create-python-environment.patch b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0004-do-not-create-python-environment.patch
similarity index 100%
rename from meta-oe/recipes-extended/mozjs/mozjs/0004-do-not-create-python-environment.patch
rename to meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0004-do-not-create-python-environment.patch
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0005-fix-cannot-find-link.patch b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0005-fix-cannot-find-link.patch
similarity index 100%
rename from meta-oe/recipes-extended/mozjs/mozjs/0005-fix-cannot-find-link.patch
rename to meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0005-fix-cannot-find-link.patch
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0006-workaround-autoconf-2.13-detection-failed.patch b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0006-workaround-autoconf-2.13-detection-failed.patch
similarity index 100%
rename from meta-oe/recipes-extended/mozjs/mozjs/0006-workaround-autoconf-2.13-detection-failed.patch
rename to meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0006-workaround-autoconf-2.13-detection-failed.patch
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0007-fix-do_compile-failed-on-mips.patch b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0007-fix-do_compile-failed-on-mips.patch
similarity index 100%
rename from meta-oe/recipes-extended/mozjs/mozjs/0007-fix-do_compile-failed-on-mips.patch
rename to meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0007-fix-do_compile-failed-on-mips.patch
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0008-add-riscv-support.patch b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0008-add-riscv-support.patch
similarity index 100%
rename from meta-oe/recipes-extended/mozjs/mozjs/0008-add-riscv-support.patch
rename to meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0008-add-riscv-support.patch
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0009-mozjs-fix-coredump-caused-by-getenv.patch b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0009-mozjs-fix-coredump-caused-by-getenv.patch
similarity index 100%
rename from meta-oe/recipes-extended/mozjs/mozjs/0009-mozjs-fix-coredump-caused-by-getenv.patch
rename to meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0009-mozjs-fix-coredump-caused-by-getenv.patch
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0010-format-overflow.patch b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0010-format-overflow.patch
similarity index 100%
rename from meta-oe/recipes-extended/mozjs/mozjs/0010-format-overflow.patch
rename to meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0010-format-overflow.patch
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0011-To-fix-build-error-on-arm32BE.patch b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0011-To-fix-build-error-on-arm32BE.patch
similarity index 100%
rename from meta-oe/recipes-extended/mozjs/mozjs/0011-To-fix-build-error-on-arm32BE.patch
rename to meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0011-To-fix-build-error-on-arm32BE.patch
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0012-JS_PUBLIC_API.patch b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0012-JS_PUBLIC_API.patch
similarity index 100%
rename from meta-oe/recipes-extended/mozjs/mozjs/0012-JS_PUBLIC_API.patch
rename to meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0012-JS_PUBLIC_API.patch
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0013-riscv-Disable-atomic-operations.patch b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0013-riscv-Disable-atomic-operations.patch
similarity index 100%
rename from meta-oe/recipes-extended/mozjs/mozjs/0013-riscv-Disable-atomic-operations.patch
rename to meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0013-riscv-Disable-atomic-operations.patch
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0014-fallback-to-2011-C++-standard.patch b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0014-fallback-to-2011-C++-standard.patch
similarity index 100%
rename from meta-oe/recipes-extended/mozjs/mozjs/0014-fallback-to-2011-C++-standard.patch
rename to meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0014-fallback-to-2011-C++-standard.patch
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/mipsarchn32/0001-fix-compiling-failure-on-mips64-n32-bsp.patch b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/mipsarchn32/0001-fix-compiling-failure-on-mips64-n32-bsp.patch
similarity index 100%
rename from meta-oe/recipes-extended/mozjs/mozjs/mipsarchn32/0001-fix-compiling-failure-on-mips64-n32-bsp.patch
rename to meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/mipsarchn32/0001-fix-compiling-failure-on-mips64-n32-bsp.patch
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/musl/0001-support-musl.patch b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/musl/0001-support-musl.patch
similarity index 100%
rename from meta-oe/recipes-extended/mozjs/mozjs/musl/0001-support-musl.patch
rename to meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/musl/0001-support-musl.patch
diff --git a/meta-oe/recipes-extended/mozjs/mozjs/musl/0002-js-Fix-build-with-musl.patch b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/musl/0002-js-Fix-build-with-musl.patch
similarity index 100%
rename from meta-oe/recipes-extended/mozjs/mozjs/musl/0002-js-Fix-build-with-musl.patch
rename to meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/musl/0002-js-Fix-build-with-musl.patch
diff --git a/meta-oe/recipes-extended/mozjs/mozjs_60.9.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_60.9.0.bb
similarity index 100%
rename from meta-oe/recipes-extended/mozjs/mozjs_60.9.0.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_60.9.0.bb
diff --git a/meta-oe/recipes-support/smem/smem/0001-smem-fix-support-for-source-option-python3.patch b/meta-oe/dynamic-layers/meta-python/recipes-support/smem/smem/0001-smem-fix-support-for-source-option-python3.patch
similarity index 100%
rename from meta-oe/recipes-support/smem/smem/0001-smem-fix-support-for-source-option-python3.patch
rename to meta-oe/dynamic-layers/meta-python/recipes-support/smem/smem/0001-smem-fix-support-for-source-option-python3.patch
diff --git a/meta-oe/recipes-support/smem/smem_1.5.bb b/meta-oe/dynamic-layers/meta-python/recipes-support/smem/smem_1.5.bb
similarity index 100%
rename from meta-oe/recipes-support/smem/smem_1.5.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-support/smem/smem_1.5.bb
-- 
2.7.4


