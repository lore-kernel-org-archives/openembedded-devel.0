Received: from mail-ye0-f170.google.com ([209.85.213.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U2jlF-0007X2-JB
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Feb 2013 15:44:47 +0100
Received: by mail-ye0-f170.google.com with SMTP id m12so58599yen.15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Feb 2013 06:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=SkG/Rv7J7D80ZcMY8oEPwFmeulRASbYvj4O5XZhAn+A=;
	b=JfDGYHfELqstcQJpSaH5L+p+P57Ptge8JBK+lHylpjq1CpG9qBz1LfkKZ8y7DRaJEd
	bRNFUHJZQhWEN/yQShKUjUuoSEHY+K3hwfZtkL6CSR+XV0JjpWpsM2eXbNUQ5Gq5OxHq
	Oaqiq/AMH/rWBBJVLb0eVJ3Vy85zwu1pih3j0I4M+y9dBmX68RTTeMlLgUcBtapP7Ye7
	VTQMmZgPMJ45ZqmKQg/PTyMs+YbsbJXxw/jHimphigP7PqJJv1hGw9pRzyXmnGri73/s
	WCQbg7ispiuoMELWibF2YU2l5U/heG1guxWY8Cr5ZVM79QUCUle/lOWqInI6KyzTIJbN
	75Lw==
X-Received: by 10.236.130.178 with SMTP id k38mr3210700yhi.117.1360074527537; 
	Tue, 05 Feb 2013 06:28:47 -0800 (PST)
Received: from localhost.localdomain ([187.23.144.59])
	by mx.google.com with ESMTPS id d4sm18966067anh.21.2013.02.05.06.28.45
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 05 Feb 2013 06:28:46 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Feb 2013 12:28:39 -0200
Message-Id: <1360074519-4380-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v2] samba: Split libnss-winbind package
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
X-List-Received-Date: Tue, 05 Feb 2013 14:44:48 -0000

This allows for applications to resolv wins without the winbindd and
sambad.

Change-Id: Iaa86154a59e758b37f28796963e6550ed2d30464
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-connectivity/samba/samba-basic.inc |   10 +++++-----
 meta-oe/recipes-connectivity/samba/samba.inc       |    2 +-
 meta-oe/recipes-connectivity/samba/samba_3.6.8.bb  |    2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-connectivity/samba/samba-basic.inc b/meta-oe/recipes-connectivity/samba/samba-basic.inc
index af4e04e..d534e31 100644
--- a/meta-oe/recipes-connectivity/samba/samba-basic.inc
+++ b/meta-oe/recipes-connectivity/samba/samba-basic.inc
@@ -9,7 +9,7 @@ EXTRA_OECONF += "\
         --without-ldap \
         --without-krb5"
 
-PACKAGES =+ "libwbclient libwinbind libwinbind-dbg winbind winbind-dbg libnetapi libtdb libsmbsharemodes libsmbclient libsmbclient-dev cifs cifs-doc swat"
+PACKAGES =+ "libwbclient libwinbind libwinbind-dbg libnss-winbind winbind winbind-dbg libnetapi libtdb libsmbsharemodes libsmbclient libsmbclient-dev cifs cifs-doc swat"
 
 FILES_winbind-dbg = "${libdir}/idmap/.debug/*.so \
                      ${libdir}/security/.debug/pam_winbind.so \
@@ -41,13 +41,13 @@ FILES_winbind = "${sbindir}/winbindd \
                  ${bindir}/ntlm_auth \
                  ${sysconfdir}/init.d/winbind \
 "
-FILES_libwinbind = "${libdir}/libnss_*${SOLIBS} \
-                    ${libdir}/idmap/*.so \
-                    ${libdir}/nss_info \
+FILES_libwinbind = "${libdir}/idmap/*.so \
                     ${libdir}/pdb \
                     ${libdir}/gpext \
                     ${libdir}/perfcount \
                     ${libdir}/security/pam_winbind.so \
-"
+
+FILES_libnss-winbind = "${libdir}/libnss_*${SOLIBS} \
+                        ${libdir}/nss_info"
 
 FILES_swat       = "${sbindir}/swat ${datadir}/swat ${libdir}/*.msg"
diff --git a/meta-oe/recipes-connectivity/samba/samba.inc b/meta-oe/recipes-connectivity/samba/samba.inc
index a86c8be..3ee43ad 100644
--- a/meta-oe/recipes-connectivity/samba/samba.inc
+++ b/meta-oe/recipes-connectivity/samba/samba.inc
@@ -96,7 +96,7 @@ do_install_append() {
 
 
 
-pkg_postinst_winbind () {
+pkg_postinst_libnss-winbind () {
     # add wins to the list of resolvers
     ns=$D${sysconfdir}/nsswitch.conf
     if ! grep "hosts:.*wins" $ns > /dev/null; then
diff --git a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
index f144de3..35d20c5 100644
--- a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
+++ b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
@@ -3,7 +3,7 @@ require samba-basic.inc
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "r6"
+PR = "r7"
 
 SRC_URI += "\
     file://config-h.patch \
-- 
1.7.2.5



