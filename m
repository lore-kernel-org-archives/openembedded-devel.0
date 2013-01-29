Received: from mail-yh0-f51.google.com ([209.85.213.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U0EnL-0003QA-Iy
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Jan 2013 18:16:35 +0100
Received: by mail-yh0-f51.google.com with SMTP id q1so94165yhf.38
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jan 2013 09:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=CH8Jn4GLUf6ClddUcFVH79n+LB9wrQO5Mt3+JKk2BQk=;
	b=Jc8fWEwGBRkOU5+b1D9uoxNgG8TjvePUv5JCj7muyHRuWghSSte9LmDO6JepQtzvwH
	z5JpVnwmxq595O8EV9iaydD5T2fRCy5I6/s6vP+BLi+Xt20Sd2zPie124k2mYpBicesp
	W5jYbAptgUgtWZyJhW8NQQEhhPR0zEyXdqe4KD5I+2XHlKXR83U6HW0hIHZgv/uMf0J/
	wkXiL3nG8mWbxnkzU0OkCrCqcnK7nf4lltIT9NqPmO6YttpoiOAFWIKckVVFEJMYGhFv
	8rj/8Gezh1cpTvYhjciKLu3OJ8bXjye7S/rVghxtwyiTa/bWnI2nTWxYta+eCKoL9HsO
	ldDQ==
X-Received: by 10.101.11.37 with SMTP id o37mr545894ani.42.1359478847192;
	Tue, 29 Jan 2013 09:00:47 -0800 (PST)
Received: from localhost.localdomain ([177.35.66.48])
	by mx.google.com with ESMTPS id z6sm7821406anh.13.2013.01.29.09.00.44
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 29 Jan 2013 09:00:46 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Jan 2013 15:00:38 -0200
Message-Id: <1359478838-321-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH] samba: Split libnss-winbind package
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
X-List-Received-Date: Tue, 29 Jan 2013 17:16:38 -0000

This allows for applications to resolv wins without the winbindd and
sambad.

Change-Id: Iaa86154a59e758b37f28796963e6550ed2d30464
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-connectivity/samba/samba-basic.inc |    7 ++++---
 meta-oe/recipes-connectivity/samba/samba.inc       |    2 +-
 meta-oe/recipes-connectivity/samba/samba_3.6.8.bb  |    2 +-
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-connectivity/samba/samba-basic.inc b/meta-oe/recipes-connectivity/samba/samba-basic.inc
index 5d816f9..efdda1a 100644
--- a/meta-oe/recipes-connectivity/samba/samba-basic.inc
+++ b/meta-oe/recipes-connectivity/samba/samba-basic.inc
@@ -9,7 +9,7 @@ EXTRA_OECONF += "\
         --without-ldap \
         --without-krb5"
 
-PACKAGES =+ "winbind winbind-dbg libnetapi libtdb libsmbsharemodes libsmbclient libsmbclient-dev cifs cifs-doc swat"
+PACKAGES =+ "winbind winbind-dbg libnss-winbind libnetapi libtdb libsmbsharemodes libsmbclient libsmbclient-dev cifs cifs-doc swat"
 
 FILES_winbind-dbg = "${libdir}/idmap/.debug/*.so \
                      ${libdir}/security/.debug/pam_winbind.so \
@@ -35,13 +35,14 @@ FILES_cifs = "${base_sbindir}/mount.cifs ${base_sbindir}/umount.cifs"
 FILES_cifs-doc = "${mandir}/man8/mount.cifs.8 ${mandir}/man8/umount.cifs.8"
 FILES_libsmbclient = "${libdir}/libsmbclient.so.*"
 FILES_libsmbclient-dev = "${libdir}/libsmbclient.so ${includedir}"
+FILES_libnss-winbind = "${libdir}/libnss_*${SOLIBS} \
+                        ${libdir}/nss_info"
+
 FILES_winbind = "${sysconfdir}/init.d/winbind \
-                 ${libdir}/libnss_*${SOLIBS} \
                  ${sbindir}/winbindd \
                  ${bindir}/wbinfo \
                  ${bindir}/ntlm_auth \
                  ${libdir}/idmap/*.so \
-                 ${libdir}/nss_info \
                  ${libdir}/pdb \
                  ${libdir}/gpext \
                  ${libdir}/perfcount \
diff --git a/meta-oe/recipes-connectivity/samba/samba.inc b/meta-oe/recipes-connectivity/samba/samba.inc
index faa2be0..4727c48 100644
--- a/meta-oe/recipes-connectivity/samba/samba.inc
+++ b/meta-oe/recipes-connectivity/samba/samba.inc
@@ -92,7 +92,7 @@ do_install_append() {
 
 
 
-pkg_postinst_winbind () {
+pkg_postinst_libnss-winbind () {
     # add wins to the list of resolvers
     ns=$D${sysconfdir}/nsswitch.conf
     if ! grep "hosts:.*wins" $ns > /dev/null; then
diff --git a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
index 7c54dae..7985199 100644
--- a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
+++ b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
@@ -3,7 +3,7 @@ require samba-basic.inc
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI += "\
     file://config-h.patch \
-- 
1.7.2.5



