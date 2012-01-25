Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jekhor@gmail.com>) id 1Rq0sh-0004Q6-6d
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jan 2012 12:19:11 +0100
Received: by bkaq10 with SMTP id q10so4070568bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2012 03:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=xh3qOSTNxZMhIGLNBRDze84tzcF2Gjr8yazkaZXSYl0=;
	b=a+Sob70SYdR8ZZ+u4Kds05tctobkzcJDMUIx7120TIjqtmz+uY6YK9FgPUIFEtXXdK
	jvBliiNQ//pWfYw+dZ3d6b+na7WxLHTR2L4mpSTlMSJDSbD3EnsZrG7okVB3i5BagQvk
	ol7HjQsiqscK/IVkNX4dHUEttMox6tm/6yyyk=
Received: by 10.204.174.13 with SMTP id r13mr6723724bkz.122.1327489884745;
	Wed, 25 Jan 2012 03:11:24 -0800 (PST)
Received: from localhost.localdomain (mx2.promwad.com. [195.222.87.218])
	by mx.google.com with ESMTPS id d2sm140121bky.11.2012.01.25.03.11.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jan 2012 03:11:24 -0800 (PST)
Sender: Yauhen Kharuzhy <jekhor@gmail.com>
Received: from jek by localhost.localdomain with local (Exim 4.77)
	(envelope-from <jek@jeknote.loshitsa1.net>)
	id 1Rq0l7-0007a9-6m; Wed, 25 Jan 2012 14:11:21 +0300
From: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jan 2012 14:11:19 +0300
Message-Id: <1327489879-29117-1-git-send-email-yauhen.kharuzhy@promwad.com>
X-Mailer: git-send-email 1.7.8.3
Subject: [PATCH 09/10] Add recipe for krb5
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
X-List-Received-Date: Wed, 25 Jan 2012 11:19:11 -0000

Add building of MIT Kerberos implementation.

The recipe was picked from OE-Classic & updated to new version

Signed-off-by: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
---
 meta/recipes-connectivity/krb5/krb5_1.8.5.bb |   98 ++++++++++++++++++++++++++
 1 files changed, 98 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-connectivity/krb5/krb5_1.8.5.bb

diff --git a/meta/recipes-connectivity/krb5/krb5_1.8.5.bb b/meta/recipes-connectivity/krb5/krb5_1.8.5.bb
new file mode 100644
index 0000000..2004213
--- /dev/null
+++ b/meta/recipes-connectivity/krb5/krb5_1.8.5.bb
@@ -0,0 +1,98 @@
+DESCRIPTION = "A network authentication protocol"
+HOMEPAGE = "http://web.mit.edu/Kerberos/"
+SECTION = "console/network"
+PR = "r0"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${S}/../README;md5=5595a75ae6fab5f825f579a817baa618"
+DEPENDS = "perl-native ncurses util-linux e2fsprogs-native"
+
+inherit autotools binconfig
+
+SRC_URI = "http://web.mit.edu/kerberos/dist/krb5/1.8/krb5-1.8.5-signed.tar"
+
+S = "${WORKDIR}/${PN}-${PV}/src/"
+
+# Will clean this up...
+EXTRA_OECONF += " --without-tcl krb5_cv_attr_constructor_destructor=yes ac_cv_func_regcomp=yes \
+                  ac_cv_printf_positional=yes ac_cv_file__etc_environment=yes \
+                  ac_cv_file__etc_TIMEZONE=no --with-system-et"
+CFLAGS_append += "-DDESTRUCTOR_ATTR_WORKS=1 -I${STAGING_INCDIR}/et"
+LDFLAGS_append += "-lpthread"
+
+FILES_${PN}-doc += /usr/share/examples
+
+krb5_do_unpack() {
+	tar xzf ${WORKDIR}/krb5-1.8.5.tar.gz -C ${WORKDIR}/
+}
+
+python do_unpack() {
+	bb.build.exec_func('base_do_unpack', d)
+	bb.build.exec_func('krb5_do_unpack', d)
+}
+
+do_configure() {
+	oe_runconf
+}
+
+#do_install_append () {
+#	mv ${D}${bindir}/ftp ${D}${bindir}/ftp.${PN}
+#	mv ${D}${sbindir}/ftpd ${D}${sbindir}/ftpd.${PN}
+#	mv ${D}${bindir}/telnet ${D}${bindir}/telnet.${PN}
+#	mv ${D}${sbindir}/telnetd ${D}${sbindir}/telnetd.${PN}
+#}
+
+pkg_postinst_${PN} () {
+#!/bin/sh
+	update-alternatives --install ${bindir}/ftp ftp ftp.${PN} 100
+	update-alternatives --install ${sbindir}/ftpd ftpd ftpd.${PN} 100
+	update-alternatives --install ${bindir}/telnet telnet telnet.${PN} 100
+	update-alternatives --install ${sbindir}/telnetd telnetd telnetd.${PN} 100
+}
+
+pkg_prerm_${PN} () {
+#!/bin/sh
+	update-alternatives --remove ftp ftp.${PN} 100
+	update-alternatives --remove ftpd ftpd.${PN} 100
+	update-alternatives --remove telnet telnet.${PN} 100
+	update-alternatives --remove telnetd telnetd.${PN} 100
+}
+
+#do_install() {
+#	oe_libinstall -so -C util/support libkrb5support ${STAGING_LIBDIR}
+#	oe_libinstall -so -C util/et libcom_err ${STAGING_LIBDIR}
+#	oe_libinstall -so -C lib/crypto libk5crypto ${STAGING_LIBDIR}
+#	oe_libinstall -so -C lib/krb5 libkrb5 ${STAGING_LIBDIR}
+#	oe_libinstall -so -C lib/gssapi libgssapi_krb5 ${STAGING_LIBDIR}
+#	oe_libinstall -so -C lib/rpc libgssrpc ${STAGING_LIBDIR}
+#	oe_libinstall -so -C lib/kdb libkdb5 ${STAGING_LIBDIR}
+#	oe_libinstall -so -C lib/kadm5/clnt libkadm5clnt ${STAGING_LIBDIR}
+#	oe_libinstall -so -C lib/kadm5/srv libkadm5srv ${STAGING_LIBDIR}
+#
+#	install -d ${STAGING_INCDIR}/krb5
+#	for X in krb5.h locate_plugin.h
+#	do
+#		install -m 0644 ${S}/include/krb5/$X ${STAGING_INCDIR}/krb5/$X
+#	done
+#
+#	install -d ${STAGING_INCDIR}/gssapi
+#	for X in gssapi_generic.h gssapi.h gssapi_krb5.h
+#	do
+#		install -m 0644 ${S}/include/gssapi/$X ${STAGING_INCDIR}/gssapi/$X
+#	done
+#	install -m 0644 ${S}/lib/gssapi/mechglue/mechglue.h ${STAGING_INCDIR}/gssapi/mechglue.h
+#
+#	install -d ${STAGING_INCDIR}/gssrpc
+#	for X in auth.h auth_gss.h auth_gssapi.h auth_unix.h clnt.h netdb.h pmap_clnt.h pmap_prot.h pmap_rmt.h rename.h rpc.h rpc_msg.h svc.h svc_auth.h xdr.h types.h
+#	do
+#		install -m 0644 ${S}/include/gssrpc/$X ${STAGING_INCDIR}/gssrpc/$X
+#	done
+#
+#	# com_err.h needs to be added here if you choose to use this builtin
+#	for X in krb5.h profile.h gssapi.h
+#	do
+#		install -m 0644 ${S}/include/$X ${STAGING_INCDIR}/$X
+#	done
+#}
+
+SRC_URI[md5sum] = "48b17caedf19d07d714a8d7a25422c95"
+SRC_URI[sha256sum] = "7d6989efaaf0b3330ce5b329edb1d0bf33250ca78b789fdd117e02c49c238812"
-- 
1.7.6.4



