Received: from [209.85.216.204] (helo=mail-px0-f204.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MQmbs-0005WN-Ay
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Jul 2009 20:20:18 +0200
Received: by pxi42 with SMTP id 42so2383820pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jul 2009 11:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=5SctYrrfJ9sMc8VhWuaIGWHZ+A43wZ9QAoxMPUTB8aY=;
	b=cE7HAtisbqiIfCeToz7kVYphXm4bIcqS6nVf/uMtrgxtCVUyWzcDjWt5zUafdAWaA8
	lxn6QPnECCPCewUFbok5H6B9B16yj8n+nrsRNqhrEzmzCYFqxmTNmbFwZZBP7KMDAHqO
	kxxpkkkZGHD9ykHoLwE+rbT2Hckq7IUOCkFWc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=OG0ahdctx71eNLUHS+FH688oTFKDo5nfv+l+N4Vj2cLZnY+rChRh8qaTbLbRr7i/UZ
	OTWy5BgFEsa/9t0UF4QMUKK6bb6DdSEjVOk+WgQeNdzFhhg5fW+gHW3N6VYdEabVtrfp
	tTzu7qT5zTHPDsMX39U+xmAZrJ65EPEuBkT3w=
Received: by 10.114.88.1 with SMTP id l1mr10959878wab.97.1247594811032;
	Tue, 14 Jul 2009 11:06:51 -0700 (PDT)
Received: from localhost (adsl-71-146-11-93.dsl.pltn13.sbcglobal.net
	[71.146.11.93])
	by mx.google.com with ESMTPS id m34sm11612214waf.22.2009.07.14.11.06.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 14 Jul 2009 11:06:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Jul 2009 11:06:48 -0700
Message-Id: <1247594808-5676-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <>
References: <>
Subject: [PATCH] eglibc_2.10: Add new eglibc 2.10 recipes.
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
X-List-Received-Date: Tue, 14 Jul 2009 18:20:25 -0000

	eglibc 2.10 has been released.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/eglibc/eglibc-initial_2.10.bb |    6 ++
 recipes/eglibc/eglibc_2.10.bb         |   99 +++++++++++++++++++++++++++++++++
 2 files changed, 105 insertions(+), 0 deletions(-)
 create mode 100644 recipes/eglibc/eglibc-initial_2.10.bb
 create mode 100644 recipes/eglibc/eglibc_2.10.bb

diff --git a/recipes/eglibc/eglibc-initial_2.10.bb b/recipes/eglibc/eglibc-initial_2.10.bb
new file mode 100644
index 0000000..787c762
--- /dev/null
+++ b/recipes/eglibc/eglibc-initial_2.10.bb
@@ -0,0 +1,6 @@
+require eglibc_${PV}.bb
+require eglibc-initial.inc
+
+do_configure_prepend () {
+        unset CFLAGS
+}
diff --git a/recipes/eglibc/eglibc_2.10.bb b/recipes/eglibc/eglibc_2.10.bb
new file mode 100644
index 0000000..414bb86
--- /dev/null
+++ b/recipes/eglibc/eglibc_2.10.bb
@@ -0,0 +1,99 @@
+require eglibc.inc
+
+DEPENDS += "gperf-native"
+DEFAULT_PREFERENCE = "1"
+FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/eglibc-svn"
+PV = "2.10"
+PR = "${INC_PR}.1"
+SVN_REV="8632"
+EGLIBC_BRANCH="eglibc-2_10"
+SRC_URI = "svn://svn.eglibc.org/branches;module=eglibc-2_10;rev=${SVN_REV};proto=svn \
+           file://eglibc-svn-arm-lowlevellock-include-tls.patch;patch=1 \
+           file://etc/ld.so.conf \
+           file://generate-supported.mk"
+S = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
+B = "${WORKDIR}/build-${TARGET_SYS}"
+
+PACKAGES_DYNAMIC = "libc6*"
+RPROVIDES_${PN}-dev = "libc6-dev virtual-libc-dev"
+PROVIDES_${PN}-dbg = "glibc-dbg"
+
+# the -isystem in bitbake.conf screws up glibc do_stage
+BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
+TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${layout_includedir}"
+
+GLIBC_ADDONS ?= "ports,nptl,libidn"
+
+GLIBC_BROKEN_LOCALES = " _ER _ET so_ET yn_ER sid_ET tr_TR mn_MN gez_ET gez_ER bn_BD te_IN"
+
+#
+# For now, we will skip building of a gcc package if it is a uclibc one
+# and our build is not a uclibc one, and we skip a glibc one if our build
+# is a uclibc build.
+#
+# See the note in gcc/gcc_3.4.0.oe
+#
+
+python __anonymous () {
+    import bb, re
+    uc_os = (re.match('.*uclibc$', bb.data.getVar('TARGET_OS', d, 1)) != None)
+    if uc_os:
+        raise bb.parse.SkipPackage("incompatible with target %s" %
+                                   bb.data.getVar('TARGET_OS', d, 1))
+}
+
+EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
+                --without-cvs --disable-profile --disable-debug --without-gd \
+                --enable-clocale=gnu \
+                --enable-add-ons=${GLIBC_ADDONS},ports \
+                --with-headers=${STAGING_INCDIR} \
+                --without-selinux \
+                ${GLIBC_EXTRA_OECONF}"
+
+EXTRA_OECONF += "${@get_eglibc_fpu_setting(bb, d)}"
+
+do_unpack_append() {
+	bb.build.exec_func('do_move_ports', d)
+}
+
+do_move_ports() {
+        if test -d ${WORKDIR}/${EGLIBC_BRANCH}/ports ; then
+	    rm -rf ${S}/ports
+	    mv ${WORKDIR}/${EGLIBC_BRANCH}/ports ${S}/
+	fi
+}
+
+do_configure () {
+# override this function to avoid the autoconf/automake/aclocal/autoheader
+# calls for now
+# don't pass CPPFLAGS into configure, since it upsets the kernel-headers
+# version check and doesn't really help with anything
+        if [ -z "`which rpcgen`" ]; then
+                echo "rpcgen not found.  Install glibc-devel."
+                exit 1
+        fi
+        (cd ${S} && gnu-configize) || die "failure in running gnu-configize"
+        find ${S} -name "configure" | xargs touch
+        CPPFLAGS="" oe_runconf
+}
+
+rpcsvc = "bootparam_prot.x nlm_prot.x rstat.x \
+	  yppasswd.x klm_prot.x rex.x sm_inter.x mount.x \
+	  rusers.x spray.x nfs_prot.x rquota.x key_prot.x"
+
+do_compile () {
+	# -Wl,-rpath-link <staging>/lib in LDFLAGS can cause breakage if another glibc is in staging
+	unset LDFLAGS
+	base_do_compile
+	(
+		cd ${S}/sunrpc/rpcsvc
+		for r in ${rpcsvc}; do
+			h=`echo $r|sed -e's,\.x$,.h,'`
+			rpcgen -h $r -o $h || oewarn "unable to generate header for $r"
+		done
+	)
+}
+
+require eglibc-stage.inc
+
+require eglibc-package.bbclass
-- 
1.5.4.3



