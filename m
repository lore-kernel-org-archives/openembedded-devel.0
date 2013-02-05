Received: from mail-yh0-f41.google.com ([209.85.213.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U2jp5-0007rA-Tp
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Feb 2013 15:48:44 +0100
Received: by mail-yh0-f41.google.com with SMTP id 47so24252yhr.14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Feb 2013 06:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=s8SBaPKp7oyMG7vy4jBEXdUB6rxRo0Nk9h/89Lj3z7s=;
	b=KDkpfeoQymamkXEK+60rdx0i+hvoAkpY20goOvTJ8sR4Kq4vG3k8SJwxOIcW5LWJYk
	6XyI4+vSGkAAz5i/NoWvB4HXGdbI9mCpSmBwOlREaZipX4dzHtuP89W4qLXK1dgiNHFy
	gYucKl3HW8TmT0OYPxDAWDS6o6Y/MZqJzaRh8UYKu9/yIeu60vNH6/Lz3eg2+/v2g9Bp
	SJcOpGZL4aZzTm+4UWeBV5X2zTZc+S9C2z8KA3Sf26s7bECdO78I9Jt/HraVfQd/lGuz
	wboWCyPv4HRaG9fQQlk7ASgOkzI07wjX/ePjBrO34+k+J2rRMxbrVX+AURqzI99lUi9o
	PySQ==
X-Received: by 10.236.85.76 with SMTP id t52mr31398409yhe.61.1360074765678;
	Tue, 05 Feb 2013 06:32:45 -0800 (PST)
Received: from localhost.localdomain ([187.23.144.59])
	by mx.google.com with ESMTPS id f3sm13213721ani.3.2013.02.05.06.32.43
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 05 Feb 2013 06:32:45 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Feb 2013 12:32:38 -0200
Message-Id: <1360074758-6672-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v3] samba: Split libnss-winbind package
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
X-List-Received-Date: Tue, 05 Feb 2013 14:48:45 -0000

This allows for applications to resolv wins without the winbindd and
sambad.

Change-Id: Iaa86154a59e758b37f28796963e6550ed2d30464
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
Changes for v3:
-Fixes a parsing error

 meta-oe/recipes-connectivity/samba/samba-basic.inc |    9 +++++----
 meta-oe/recipes-connectivity/samba/samba.inc       |    2 +-
 meta-oe/recipes-connectivity/samba/samba_3.6.8.bb  |    2 +-
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-connectivity/samba/samba-basic.inc b/meta-oe/recipes-connectivity/samba/samba-basic.inc
index af4e04e..05a5b3a 100644
--- a/meta-oe/recipes-connectivity/samba/samba-basic.inc
+++ b/meta-oe/recipes-connectivity/samba/samba-basic.inc
@@ -9,7 +9,7 @@ EXTRA_OECONF += "\
         --without-ldap \
         --without-krb5"
 
-PACKAGES =+ "libwbclient libwinbind libwinbind-dbg winbind winbind-dbg libnetapi libtdb libsmbsharemodes libsmbclient libsmbclient-dev cifs cifs-doc swat"
+PACKAGES =+ "libwbclient libwinbind libwinbind-dbg libnss-winbind winbind winbind-dbg libnetapi libtdb libsmbsharemodes libsmbclient libsmbclient-dev cifs cifs-doc swat"
 
 FILES_winbind-dbg = "${libdir}/idmap/.debug/*.so \
                      ${libdir}/security/.debug/pam_winbind.so \
@@ -41,13 +41,14 @@ FILES_winbind = "${sbindir}/winbindd \
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
 "
 
+FILES_libnss-winbind = "${libdir}/libnss_*${SOLIBS} \
+                        ${libdir}/nss_info"
+
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



