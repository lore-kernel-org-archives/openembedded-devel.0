Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 58E5470101
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2016 01:08:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6I18XXh015905
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jul 2016 18:08:34 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Sun, 17 Jul 2016 18:08:32 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 18 Jul 2016 09:06:06 +0800
Message-ID: <1468803966-9809-3-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <1468803966-9809-1-git-send-email-kai.kang@windriver.com>
References: <1468803966-9809-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] cfengine: add recipe and base policy
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
X-List-Received-Date: Mon, 18 Jul 2016 01:08:36 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Add recipes of cfengine and cfengine-masterfiles which provides base
policy files.

There are 3 optional database backend: qdbm, tokyocabinet and lmdb with
descending priority. Package tokyocabinet is released as a rework of
qdbm by same upstream author, so it is choosen to be default database
backend.

See:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=452657

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../remove-policy-of-usr-local-sbin.patch          | 28 +++++++++
 .../cfengine/cfengine-masterfiles_3.9.0.bb         | 37 +++++++++++
 .../cfengine/change-hard-coded-lib-path.patch      | 28 +++++++++
 .../cfengine/set-path-of-default-config-file.patch | 23 +++++++
 .../recipes-extended/cfengine/cfengine_3.9.0.bb    | 71 ++++++++++++++++++++++
 5 files changed, 187 insertions(+)
 create mode 100644 meta-oe/recipes-extended/cfengine/cfengine-masterfiles/remove-policy-of-usr-local-sbin.patch
 create mode 100644 meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.9.0.bb
 create mode 100644 meta-oe/recipes-extended/cfengine/cfengine/change-hard-coded-lib-path.patch
 create mode 100644 meta-oe/recipes-extended/cfengine/cfengine/set-path-of-default-config-file.patch
 create mode 100644 meta-oe/recipes-extended/cfengine/cfengine_3.9.0.bb

diff --git a/meta-oe/recipes-extended/cfengine/cfengine-masterfiles/remove-policy-of-usr-local-sbin.patch b/meta-oe/recipes-extended/cfengine/cfengine-masterfiles/remove-policy-of-usr-local-sbin.patch
new file mode 100644
index 0000000..3f8debc
--- /dev/null
+++ b/meta-oe/recipes-extended/cfengine/cfengine-masterfiles/remove-policy-of-usr-local-sbin.patch
@@ -0,0 +1,28 @@
+Upstream-Status: Inappropriate [configuration]
+
+Directory /usr/local is not used for us. Remove the policy that not to install
+binaries to /usr/local/sbin.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+diff --git a/cfe_internal/update/update_bins.cf b/cfe_internal/update/update_bins.cf
+index 1796caa..697af0d 100644
+--- a/cfe_internal/update/update_bins.cf
++++ b/cfe_internal/update/update_bins.cf
+@@ -55,16 +55,6 @@ bundle agent cfe_internal_bins
+       depth_search => u_recurse_basedir("inf"),
+       action => u_immediate;
+ 
+-      "/usr/local/sbin/$(agents)"
+-      comment => "Create symlinks of CFE binaries in /usr/local/sbin",
+-      handle => canonify("cfe_internal_bins_files_sbin_$(agents)"),
+-      move_obstructions => "true",
+-      link_from => u_ln_s("$(sys.workdir)/bin/$(agents)");
+-
+-      "/usr/local/sbin/$(agents).cfsaved"
+-      comment => "Remove all .cfsaved file extension",
+-      handle => canonify("cfe_internal_bins_files_remove_$(agent)_cfsaved"),
+-      delete => u_tidy;
+ }
+ 
+ bundle agent cfe_internal_update_bins
diff --git a/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.9.0.bb b/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.9.0.bb
new file mode 100644
index 0000000..9d01c51
--- /dev/null
+++ b/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.9.0.bb
@@ -0,0 +1,37 @@
+#
+# Copyright (C) 2014 - 2016 Wind River Systems, Inc.
+#
+SUMMARY = "Base policy for CFEngine"
+
+DESCRIPTION = "CFEngine is an IT infrastructure automation framework \
+that helps engineers, system administrators and other stakeholders \
+in an IT system to manage and understand IT infrastructure throughout \
+its lifecycle. CFEngine takes systems from Build to Deploy, Manage and Audit. \
+ \
+This package is intended to provide a stable base policy for \
+installations and upgrades, and is used by CFEngine 3.6 and newer. \
+ \
+The contents of this packge are intended to live in `/var/cfengine/masterfiles` \
+or wherever `$(sys.masterdir)` points. \
+"
+
+HOMEPAGE = "http://cfengine.com"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=52cd3d13af93180822888ab0088e9328"
+
+SRC_URI = "https://cfengine-package-repos.s3.amazonaws.com/tarballs/${BP}.tar.gz \
+           file://remove-policy-of-usr-local-sbin.patch \
+"
+SRC_URI[md5sum] = "b101ddcd546738af6ec91be5c297cb24"
+SRC_URI[sha256sum] = "63dec2f8649f5f2788cd463dccf47f8dbe941522acfcf3093517f983bbfa0606"
+
+inherit autotools
+
+export EXPLICIT_VERSION="${PV}"
+
+EXTRA_OECONF = "--prefix=${localstatedir}/cfengine"
+
+FILES_${PN} += "${localstatedir}/cfengine"
+
+RDEPENDS_${PN} += "python-core"
diff --git a/meta-oe/recipes-extended/cfengine/cfengine/change-hard-coded-lib-path.patch b/meta-oe/recipes-extended/cfengine/cfengine/change-hard-coded-lib-path.patch
new file mode 100644
index 0000000..2295e41
--- /dev/null
+++ b/meta-oe/recipes-extended/cfengine/cfengine/change-hard-coded-lib-path.patch
@@ -0,0 +1,28 @@
+Upstream-Status: Inappropriate [configuration]
+
+projlibdir use a hard coded lib path, this will cause error when build a 64bit
+target. So change it to suitable path.
+
+Signed-off-by: Song.Li <Song.Li@windriver.com>
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 38e2b9c..bc6b996 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -188,7 +188,7 @@ AS_IF([test x"$enable_fhs" = xyes], [
+   fi
+ 
+   sbindir='${exec_prefix}/bin' # /var/cfengine/bin despite being sbin_?
+-  projlibdir='${exec_prefix}/lib'
++  projlibdir='${libdir}'
+   mandir='${exec_prefix}/share/man'
+ ])
+ 
+-- 
+1.7.1
+
diff --git a/meta-oe/recipes-extended/cfengine/cfengine/set-path-of-default-config-file.patch b/meta-oe/recipes-extended/cfengine/cfengine/set-path-of-default-config-file.patch
new file mode 100644
index 0000000..b9526f2
--- /dev/null
+++ b/meta-oe/recipes-extended/cfengine/cfengine/set-path-of-default-config-file.patch
@@ -0,0 +1,23 @@
+Upstream-Status: Inappropriate [configuration]
+
+Set the path of default configure file.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+diff --git a/misc/init.d/cfengine3.in b/misc/init.d/cfengine3.in
+index d6ae26f..1dee283 100644
+--- a/misc/init.d/cfengine3.in
++++ b/misc/init.d/cfengine3.in
+@@ -101,11 +101,7 @@ if [ -z "$LOCKDIR" ]; then
+ fi
+ 
+ # default control file
+-if [ "$DEBIAN" = "1" ]; then
+-    DEFAULT=/etc/default/cfengine3
+-else
+-    DEFAULT=/etc/sysconfig/cfengine3
+-fi
++DEFAULT=/etc/default/cfengine3
+ 
+ if [ -f $DEFAULT ]; then
+     . $DEFAULT
diff --git a/meta-oe/recipes-extended/cfengine/cfengine_3.9.0.bb b/meta-oe/recipes-extended/cfengine/cfengine_3.9.0.bb
new file mode 100644
index 0000000..0bd5f32
--- /dev/null
+++ b/meta-oe/recipes-extended/cfengine/cfengine_3.9.0.bb
@@ -0,0 +1,71 @@
+#
+# Copyright (C) 2014 - 2016 Wind River Systems, Inc.
+#
+SUMMARY = "CFEngine is an IT infrastructure automation framework"
+
+DESCRIPTION = "CFEngine is an IT infrastructure automation framework \
+that helps engineers, system administrators and other stakeholders \
+in an IT system to manage and understand IT infrastructure throughout \
+its lifecycle. CFEngine takes systems from Build to Deploy, Manage and Audit."
+
+HOMEPAGE = "http://cfengine.com"
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=cd59c3650c8b7ff36bab1cc6587b097a"
+
+DEPENDS = "attr tokyocabinet"
+
+SRC_URI = "https://cfengine-package-repos.s3.amazonaws.com/tarballs/${BP}.tar.gz \
+           file://change-hard-coded-lib-path.patch \
+           file://set-path-of-default-config-file.patch \
+"
+
+SRC_URI[md5sum] = "63da39655cfca30ca885fcc4a1bf8aa4"
+SRC_URI[sha256sum] = "32a38aedf1199c2361e1335e0d4a1d98f9efa7cd591bcb647f35c7395bb66f2d"
+
+inherit autotools systemd
+
+export EXPLICIT_VERSION="${PV}"
+
+SYSTEMD_SERVICE_${PN} = "cfengine3.service cfengine3-web.service"
+SYSTEMD_AUTO_ENABLE_${PN} = "disable"
+
+PACKAGECONFIG ??= "libpcre openssl \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
+"
+PACKAGECONFIG[libxml2] = "--with-libxml2=yes,--with-libxml2=no,libxml2,"
+PACKAGECONFIG[mysql] = "--with-mysql=yes,--with-mysql=no,mysql,"
+PACKAGECONFIG[postgresql] = "--with-postgresql=yes,--with-postgresql=no,postgresql,"
+PACKAGECONFIG[acl] = "--with-libacl=yes,--with-libacl=no,acl,"
+PACKAGECONFIG[libvirt] = "--with-libvirt=yes,--with-libvirt=no,libvirt,"
+PACKAGECONFIG[libpcre] = "--with-pcre=yes,--with-pcre=no,libpcre,"
+PACKAGECONFIG[openssl] = "--with-openssl=yes,--with-openssl=no,openssl,"
+PACKAGECONFIG[pam] = "--with-pam=yes,--with-pam=no,libpam,"
+PACKAGECONFIG[libyaml] = "--with-libyaml,--without-libyaml,libyaml,"
+PACKAGECONFIG[systemd] = "--with-systemd-service=${systemd_system_unitdir},--without-systemd-service"
+PACKAGECONFIG[libcurl] = "--with-libcurl,--without-libcurl,curl,"
+
+EXTRA_OECONF = "hw_cv_func_va_copy=yes --with-init-script=${sysconfdir}/init.d --with-tokyocabinet"
+
+do_install_append() {
+	install -d ${D}${localstatedir}/${BPN}/bin
+	for f in `ls ${D}${bindir}`; do
+	    ln -s ${bindir}/`basename $f` ${D}${localstatedir}/${BPN}/bin/
+	done
+
+	install -d ${D}${sysconfdir}/default
+	cat << EOF > ${D}${sysconfdir}/default/cfengine3
+RUN_CF_SERVERD=1
+RUN_CF_EXECD=1
+RUN_CF_MONITORD=1
+RUN_CF_HUB=0
+EOF
+
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+		install -m 0755 -D ${D}${sysconfdir}/init.d/cfengine3 ${D}${datadir}/${BPN}/cfengine3
+		sed -i -e 's#/etc/init.d#${datadir}/${BPN}#' ${D}${systemd_system_unitdir}/*.service
+	fi
+}
+
+RDEPENDS_${PN} += "${BPN}-masterfiles"
-- 
2.6.1


