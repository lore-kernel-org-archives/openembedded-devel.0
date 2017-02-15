Return-Path: <linus.svensson@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 2FFAE71AB9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2017 13:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 320DB2E232
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2017 14:42:29 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id G5fWsIGSETNL
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2017 14:42:28 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 172212E25A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2017 14:42:28 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0513C1A063
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2017 14:42:28 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ECB4B1A05F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2017 14:42:27 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2017 14:42:27 +0100 (CET)
Received: from lnxlinussn.se.axis.com (lnxlinussn.se.axis.com [10.94.48.1])
	by thoth.se.axis.com (Postfix) with ESMTP id DCCD378B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2017 14:42:27 +0100 (CET)
Received: by lnxlinussn.se.axis.com (Postfix, from userid 21014)
	id 995BB3A099; Wed, 15 Feb 2017 14:42:27 +0100 (CET)
From: linus.svensson@axis.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Feb 2017 14:41:54 +0100
Message-Id: <1487166114-3845-2-git-send-email-linus.svensson@axis.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1487166114-3845-1-git-send-email-linus.svensson@axis.com>
References: <1487166114-3845-1-git-send-email-linus.svensson@axis.com>
X-TM-AS-GCONF: 00
Subject: [meta-oe][PATCH 2/2] meson.bbclass: Add meson.bbclass
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
X-List-Received-Date: Wed, 15 Feb 2017 13:42:29 -0000

From: Linus Svensson <linussn@axis.com>

Add a class for packages that uses the meson build system.

Meson uses a cross-file that contain needed tools and information about
the host and target system. Such a file will be created in {WORKDIR}.

Meson only allows installation directories to be specified as relative
to prefix, except for sysconfdir, which can be absolute.

This patch is based on a prototype patch by
Ross Burton <ross.burton@intel.com>.

Signed-off-by: Linus Svensson <linussn@axis.com>
---
 meta-oe/classes/meson.bbclass | 86 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 meta-oe/classes/meson.bbclass

diff --git a/meta-oe/classes/meson.bbclass b/meta-oe/classes/meson.bbclass
new file mode 100644
index 0000000..5a04134
--- /dev/null
+++ b/meta-oe/classes/meson.bbclass
@@ -0,0 +1,86 @@
+inherit python3native
+
+DEPENDS_append = " meson-native ninja-native"
+
+# As Meson enforces out-of-tree builds we can just use cleandirs
+B = "${WORKDIR}/build"
+do_configure[cleandirs] = "${B}"
+
+# Where the meson.build build configuration is
+MESON_SOURCEPATH = "${S}"
+
+# These variables in the environment override the *native* tools not the cross,
+# so they need to be unexported.
+CC[unexport] = "1"
+
+def noprefix(var, d):
+    return d.getVar(var, True).replace(d.getVar('prefix', True) + '/', '', 1)
+
+MESONOPTS = " --prefix ${prefix} \
+              --bindir ${@noprefix('bindir', d)} \
+              --datadir ${@noprefix('datadir', d)} \
+              --libdir ${@noprefix('libdir', d)} \
+              --libexecdir ${@noprefix('libexecdir', d)} \
+              --includedir ${@noprefix('includedir', d)} \
+              --mandir ${@noprefix('mandir', d)} \
+              --localedir ${@noprefix('localedir', d)} \
+              --sysconfdir ${sysconfdir}"
+
+MESON_C_ARGS = "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
+
+MESON_HOST_ENDIAN = "${@bb.utils.contains('SITEINFO_ENDIANNESS', 'be', 'big', 'little', d)}"
+MESON_TARGET_ENDIAN = "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', 'big', 'little', d)}"
+
+EXTRA_OEMESON += "${PACKAGECONFIG_CONFARGS}"
+
+def meson_array(var, d):
+    return "', '".join(d.getVar(var, True).split()).join(("'", "'"))
+
+addtask write_config before do_configure
+do_write_config[vardeps] += "MESON_C_ARGS TOOLCHAIN_OPTIONS"
+do_write_config() {
+    # This needs to be Py to split the args into single-element lists
+    cat >${WORKDIR}/meson.cross <<EOF
+[binaries]
+c = '${HOST_PREFIX}gcc'
+cpp = '${HOST_PREFIX}gcc'
+ar = '${HOST_PREFIX}ar'
+ld = '${HOST_PREFIX}ld'
+strip = '${HOST_PREFIX}strip'
+readelf = '${HOST_PREFIX}readelf'
+pkgconfig = 'pkg-config'
+
+[properties]
+c_args = [${@meson_array('MESON_C_ARGS', d)}]
+c_link_args = [${@meson_array('TOOLCHAIN_OPTIONS', d)}]
+
+[host_machine]
+system = '${HOST_OS}'
+cpu_family = '${HOST_ARCH}'
+cpu = '${HOST_ARCH}'
+endian = '${MESON_HOST_ENDIAN}'
+
+[target_machine]
+system = '${TARGET_OS}'
+cpu_family = '${TARGET_ARCH}'
+cpu = '${TARGET_ARCH}'
+endian = '${MESON_TARGET_ENDIAN}'
+EOF
+}
+
+meson_do_configure() {
+    if ! meson ${MESONOPTS} "${MESON_SOURCEPATH}" "${B}" --cross-file ${WORKDIR}/meson.cross ${EXTRA_OEMESON}; then
+        cat ${B}/meson-logs/meson-log.txt
+        bbfatal_log meson failed
+    fi
+}
+
+meson_do_compile() {
+    ninja ${PARALLEL_MAKE}
+}
+
+meson_do_install() {
+    DESTDIR='${D}' ninja ${PARALLEL_MAKEINST} install
+}
+
+EXPORT_FUNCTIONS do_configure do_compile do_install
-- 
2.1.4


