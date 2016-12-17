Return-Path: <joe@deserted.net>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id 817E67743D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 16:04:51 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id b194so14925226ioa.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 08:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2Rm0Iq78qblK9zjwN8vQYoALWCv4Sz14WYRfcA4AyoQ=;
	b=ICRVwpAbsv7JwiMP8XIXkau9miiasWD7ORMPgpwm0OBPcrCSmTu2A0yJ+nR2NqfVj1
	GGtI3EAbamQQGX+yvNc34RZOPL12qDyRAT8GhRtcSGyDdgJUPyyou1JQTMvV8MtQS+Le
	t3ji3dKafWb4efWDRXZbDTGmePHGHzoDs0Lql0s3lDgSaEfz+A6lVz1xD0/d13NXpHZL
	81MIwHOxtcgoXzkvG+USzuqAmI6Xo/1jEObk1NnKsuoH0jmnMZjooRtLpPMTpcc4ozx+
	L/QaTGR4Gy5FTjReJwu/08xiIryTApunp5SZlVKu58YpgOCDADeB55P65+Jvml6kUdya
	8/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=2Rm0Iq78qblK9zjwN8vQYoALWCv4Sz14WYRfcA4AyoQ=;
	b=ZN2HyZqO6Tjlz+vYwguG1gonJLLgKI4Fp+nYg583mJ9SoImuEeejCskqITJYkF9/n4
	2+VdpmFfPOSQVvH14JIm725kJcJbX67FsWpYqdMLmTBI39J47oGpMq1L1tIb0/O4vY1e
	3R48q01pQ6DfX2tzxUPlHn8kRIWEFM2oXpiqJ9L7WntzF1Em56tCheKQG3Ntf0SKAguc
	LOZg37SAjLJIBTDbV+at/fCNb2eb+V2i0THnQP8tqyDiR0zBux9VKDr7lBPLBzSB/l26
	lSekgnckUinbshgUVpKJftlZlL1YWWjAu6VavYcgHPjz2JjVAQvAUZa9Z0C6gX0XAmWs
	+11g==
X-Gm-Message-State: AIkVDXJR0qkXL6FMulbXvZxlG1qMVNDjjXk9Lc3sNF+DLWSpskLSuUcCZ/JsZJCWdnJwSw==
X-Received: by 10.107.34.207 with SMTP id i198mr7744325ioi.16.1481990693259;
	Sat, 17 Dec 2016 08:04:53 -0800 (PST)
Received: from mir.deserted.net (23-233-31-74.cpe.pppoe.ca. [23.233.31.74])
	by smtp.gmail.com with ESMTPSA id
	c36sm3371303itd.18.2016.12.17.08.04.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 17 Dec 2016 08:04:52 -0800 (PST)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Dec 2016 11:04:54 -0500
Message-Id: <1481990698-15962-7-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1481990698-15962-1-git-send-email-joe_macdonald@mentor.com>
References: <1481940923-12914-1-git-send-email-joe_macdonald@mentor.com>
	<1481990698-15962-1-git-send-email-joe_macdonald@mentor.com>
Subject: [meta-networking][PATCH 06/10] samba: split libraries into their own packages
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
X-List-Received-Date: Sat, 17 Dec 2016 16:04:53 -0000

From: Andreas Oberritter <obi@opendreambox.org>

It's quite hard to track library dependencies manually between
releases. Splitting libraries into their own packages creates
some overhead but effectively uses less storage in minimal
installations.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 .../recipes-connectivity/samba/samba_4.4.5.bb      | 134 +++++----------------
 1 file changed, 30 insertions(+), 104 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index b17e0cf..c4b6298 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -153,11 +153,33 @@ do_install_append() {
     rm -rf ${D}/run ${D}${localstatedir}/run ${D}${localstatedir}/log
 }
 
-PACKAGES =+ "${PN}-python ${PN}-pidl libwinbind libwinbind-krb5-locator \
-             libwbclient libnss-winbind winbind libnetapi libsmbsharemodes \
-             libsmbclient lib${BPN}-base ${PN}-base ${PN}-ctdb-tests \
+PACKAGES =+ "${PN}-python ${PN}-pidl \
+             winbind \
+             ${PN}-common ${PN}-base ${PN}-ctdb-tests \
              smbclient"
 
+python samba_populate_packages() {
+    def module_hook(file, pkg, pattern, format, basename):
+        pn = d.getVar('PN', True)
+        d.appendVar('RRECOMMENDS_%s-base' % pn, ' %s' % pkg)
+
+    mlprefix = d.getVar('MLPREFIX', True) or ''
+    pam_libdir = d.expand('${base_libdir}/security')
+    pam_pkgname = mlprefix + 'pam-plugin%s'
+    do_split_packages(d, pam_libdir, '^pam_(.*)\.so$', pam_pkgname, 'PAM plugin for %s', extra_depends='', prepend=True)
+
+    libdir = d.getVar('libdir', True)
+    do_split_packages(d, libdir, '^lib(.*)\.so\..*$', 'lib%s', 'Samba %s library', extra_depends='${PN}-common', prepend=True, allow_links=True)
+    pkglibdir = '%s/samba' % libdir
+    do_split_packages(d, pkglibdir, '^lib(.*)\.so$', 'lib%s', 'Samba %s library', extra_depends='${PN}-common', prepend=True)
+    moduledir = '%s/samba/auth' % libdir
+    do_split_packages(d, moduledir, '^(.*)\.so$', 'samba-auth-%s', 'Samba %s authentication backend', hook=module_hook, extra_depends='', prepend=True)
+    moduledir = '%s/samba/pdb' % libdir
+    do_split_packages(d, moduledir, '^(.*)\.so$', 'samba-pdb-%s', 'Samba %s password backend', hook=module_hook, extra_depends='', prepend=True)
+}
+
+PACKAGESPLITFUNCS_prepend = "samba_populate_packages "
+
 RDEPENDS_${PN} += "${PN}-base"
 
 FILES_${PN}-base = "${sbindir}/nmbd \
@@ -178,121 +200,25 @@ FILES_${PN}-ctdb-tests = "${bindir}/ctdb_run_tests \
                           /run/ctdb \
                          "
 
-# figured out by
-# FILES="tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/samba/4.1.12-r0/image/usr/sbin/smbd tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/samba/4.1.12-r0/image/usr/sbin/nmbd"
-#
-# while [ "${FILES}" != "${OLDFILES}" ]
-# do
-#     OLDFILES="${FILES}"
-#     NEEDED=`tmp/sysroots/x86_64-linux/usr/libexec/arm-poky-linux-gnueabi.gcc-cross-initial-arm/gcc/arm-poky-linux-gnueabi/5.2.0/objdump -x ${FILES} | grep NEEDED | egrep -E 'so(.[0-9]|$)' | sort -u | perl -MData::Dumper -le 'while (<>) {chomp; push @lib, (split)[1]}; print "(", join("|", @lib), ")"'`
-#     NF=`find tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/samba/4.1.12-r0/image/usr/lib -type f | egrep "${NEEDED}" | sort -u`
-#
-#     FILES=`perl -le 'foreach (@ARGV) { $f{$_}++ }; print join(" ", sort keys %f)' ${FILES} ${NF}`
-# done
-#
-# LIBS=`echo ${FILES} | sed -e 's,tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/samba/4.1.12-r0/image/usr/lib,${libdir},g' -e 's,.so.[0-9]+.*$,.so.*,g'`
-# for l in ${LIBS}
-# do
-#     echo $l
-# done
-
-FILES_lib${BPN}-base = "\
-                    ${sysconfdir}/default \
-                    ${sysconfdir}/samba \
-                    ${libdir}/libdcerpc-binding.so.* \
-                    ${libdir}/libgensec.so.* \
-                    ${libdir}/libndr-krb5pac.so.* \
-                    ${libdir}/libndr-nbt.so.* \
-                    ${libdir}/libndr-standard.so.* \
-                    ${libdir}/libndr.so.* \
-                    ${libdir}/libnetapi.so.* \
-                    ${libdir}/libpdb.so.* \
-                    ${libdir}/libsamba-credentials.so.* \
-                    ${libdir}/libsamba-hostconfig.so.* \
-                    ${libdir}/libsamba-util.so.* \
-                    ${libdir}/libsamdb.so.* \
-                    ${libdir}/libsmbconf.so.* \
-                    ${libdir}/libtevent-util.so.* \
-                    ${libdir}/samba/libCHARSET3.so \
-                    ${libdir}/samba/libaddns.so \
-                    ${libdir}/samba/libads.so \
-                    ${libdir}/samba/libasn1util.so \
-                    ${libdir}/samba/libauth.so \
-                    ${libdir}/samba/libauth_sam_reply.so \
-                    ${libdir}/samba/libauthkrb5.so \
-                    ${libdir}/samba/libccan.so \
-                    ${libdir}/samba/libcli-ldap-common.so \
-                    ${libdir}/samba/libcli-nbt.so \
-                    ${libdir}/samba/libcli_cldap.so \
-                    ${libdir}/samba/libcli_smb_common.so \
-                    ${libdir}/samba/libcli_spoolss.so \
-                    ${libdir}/samba/libcliauth.so \
-                    ${libdir}/samba/libdbwrap.so \
-                    ${libdir}/samba/libdcerpc-samba.so \
-                    ${libdir}/samba/liberrors.so \
-                    ${libdir}/samba/libflag_mapping.so \
-                    ${libdir}/samba/libgse.so \
-                    ${libdir}/samba/libinterfaces.so \
-                    ${libdir}/samba/libkrb5samba.so \
-                    ${libdir}/samba/libldbsamba.so \
-                    ${libdir}/samba/liblibcli_lsa3.so \
-                    ${libdir}/samba/liblibcli_netlogon3.so \
-                    ${libdir}/samba/liblibsmb.so \
-                    ${libdir}/samba/libmsrpc3.so \
-                    ${libdir}/samba/libndr-samba.so \
-                    ${libdir}/samba/libndr-samba4.so \
-                    ${libdir}/samba/libnpa_tstream.so \
-                    ${libdir}/samba/libntdb.so.* \
-                    ${libdir}/samba/libpopt_samba3.so \
-                    ${libdir}/samba/libprinting_migrate.so \
-                    ${libdir}/samba/libsamba-modules.so \
-                    ${libdir}/samba/libsamba-security.so \
-                    ${libdir}/samba/libsamba-sockets.so \
-                    ${libdir}/samba/libsamba3-util.so \
-                    ${libdir}/samba/libsamdb-common.so \
-                    ${libdir}/samba/libsecrets3.so \
-                    ${libdir}/samba/libserver-role.so \
-                    ${libdir}/samba/libsmb_transport.so \
-                    ${libdir}/samba/libsmbd_base.so \
-                    ${libdir}/samba/libsmbd_conn.so \
-                    ${libdir}/samba/libsmbd_shim.so \
-                    ${libdir}/samba/libsmbregistry.so \
-                    ${libdir}/samba/libtdb-wrap.so \
-                    ${libdir}/samba/libutil_cmdline.so \
-                    ${libdir}/samba/libutil_ntdb.so \
-                    ${libdir}/samba/libutil_reg.so \
-                    ${libdir}/samba/libutil_setid.so \
-                    ${libdir}/samba/libutil_tdb.so \
-                    ${libdir}/samba/pdb/smbpasswd.so \
-                    ${libdir}/samba/pdb/tdbsam.so \
-                    ${libdir}/samba/pdb/wbc_sam.so \
+FILES_${BPN}-common = "${sysconfdir}/default \
+                       ${sysconfdir}/samba \
 "
 
 FILES_${PN} += "${libdir}/vfs/*.so \
                 ${libdir}/charset/*.so \
                 ${libdir}/*.dat \
                 ${libdir}/auth/*.so \
-                ${base_libdir}/security/pam_smbpass.so \
 "
 
-FILES_libwbclient = "${libdir}/libwbclient.so.* ${libdir}/samba/libwinbind-client.so"
-FILES_libnetapi = "${libdir}/libnetapi.so.*"
-FILES_libsmbsharemodes = "${libdir}/libsmbsharemodes.so.*"
-FILES_libsmbclient = "${libdir}/libsmbclient.so.*"
 FILES_winbind = "${sbindir}/winbindd \
                  ${bindir}/wbinfo \
                  ${bindir}/ntlm_auth \
+                 ${libdir}/samba/idmap \
+                 ${libdir}/samba/nss_info \
+                 ${libdir}/winbind_krb5_locator.so \
                  ${sysconfdir}/init.d/winbind \
                  ${systemd_system_unitdir}/winbind.service"
 
-FILES_libnss-winbind = "${libdir}/libnss_*${SOLIBS} \
-                        ${libdir}/nss_info \
-"
-
-FILES_libwinbind = "${base_libdir}/security/pam_winbind.so \
-                    ${systemd_system_unitdir}/winbind.service"
-FILES_libwinbind-krb5-locator = "${libdir}/winbind_krb5_locator.so"
-
 FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
 
 FILES_smbclient = "${bindir}/cifsdd \
-- 
1.9.1


