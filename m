Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mario.goulart@gmail.com>) id 1TdnZV-0001lq-W7
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Nov 2012 20:45:26 +0100
Received: by mail-ob0-f175.google.com with SMTP id vb8so11938285obc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Nov 2012 11:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=Spx2IbkbVPOz67lNv/Oac9WC43wwxNXE7C5vgV+Ninw=;
	b=cRYyrTUL7zCZNKnPNPHSjJxIyM9Wpo5z5JujvB3jBHDK2r/rCrAdBg1Va5XjzvvRyO
	oHATF6IlSFzi/CYjqBYEQgAl6e3VbeLt++jhJfu7likaen/BbeDni9WpwD4OvobOxKoM
	Gtfi+kZMNjYmVJJdqKzjmy0muF+Jmi8SqQA+95mfwF50aGWLhLSbbXG1OMl5Qryd3p9z
	ayWYh1PBZMszn+RaV9sviPZ+v2plVBO0De/EiUdwbTDhd0dnRdlIsjz0ntpbycrN7VvW
	Z10dkHPa5mkCfQF/PBc3Tb8u5MfYhP0NzSy0V8sE4boXtDkCzWoFWrwfHcgIrZWEAzjl
	iAPw==
Received: by 10.182.162.69 with SMTP id xy5mr5282396obb.95.1354131073265;
	Wed, 28 Nov 2012 11:31:13 -0800 (PST)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id h2sm19267644obn.11.2012.11.28.11.31.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Nov 2012 11:31:12 -0800 (PST)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Nov 2012 17:30:40 -0200
Message-Id: <1354131040-9077-6-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1354131040-9077-1-git-send-email-mario@ossystems.com.br>
References: <1354131040-9077-1-git-send-email-mario@ossystems.com.br>
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [meta-oe][PATCH 6/6] samba: split winbind into winbind and libwinbind
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
X-List-Received-Date: Wed, 28 Nov 2012 19:45:26 -0000

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 meta-oe/recipes-connectivity/samba/samba-basic.inc |   21 ++++++++++---------
 meta-oe/recipes-connectivity/samba/samba_3.6.8.bb  |    2 +-
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/meta-oe/recipes-connectivity/samba/samba-basic.inc b/meta-oe/recipes-connectivity/samba/samba-basic.inc
index 5d816f9..d1b905a 100644
--- a/meta-oe/recipes-connectivity/samba/samba-basic.inc
+++ b/meta-oe/recipes-connectivity/samba/samba-basic.inc
@@ -9,7 +9,7 @@ EXTRA_OECONF += "\
         --without-ldap \
         --without-krb5"
 
-PACKAGES =+ "winbind winbind-dbg libnetapi libtdb libsmbsharemodes libsmbclient libsmbclient-dev cifs cifs-doc swat"
+PACKAGES =+ "libwinbind libwinbind-dbg winbind winbind-dbg libnetapi libtdb libsmbsharemodes libsmbclient libsmbclient-dev cifs cifs-doc swat"
 
 FILES_winbind-dbg = "${libdir}/idmap/.debug/*.so \
                      ${libdir}/security/.debug/pam_winbind.so \
@@ -35,17 +35,18 @@ FILES_cifs = "${base_sbindir}/mount.cifs ${base_sbindir}/umount.cifs"
 FILES_cifs-doc = "${mandir}/man8/mount.cifs.8 ${mandir}/man8/umount.cifs.8"
 FILES_libsmbclient = "${libdir}/libsmbclient.so.*"
 FILES_libsmbclient-dev = "${libdir}/libsmbclient.so ${includedir}"
-FILES_winbind = "${sysconfdir}/init.d/winbind \
-                 ${libdir}/libnss_*${SOLIBS} \
-                 ${sbindir}/winbindd \
+FILES_winbind = "${sbindir}/winbindd \
                  ${bindir}/wbinfo \
                  ${bindir}/ntlm_auth \
-                 ${libdir}/idmap/*.so \
-                 ${libdir}/nss_info \
-                 ${libdir}/pdb \
-                 ${libdir}/gpext \
-                 ${libdir}/perfcount \
-                 ${libdir}/security/pam_winbind.so \
+                 ${sysconfdir}/init.d/winbind \
+"
+FILES_libwinbind = "${libdir}/libnss_*${SOLIBS} \
+                    ${libdir}/idmap/*.so \
+                    ${libdir}/nss_info \
+                    ${libdir}/pdb \
+                    ${libdir}/gpext \
+                    ${libdir}/perfcount \
+                    ${libdir}/security/pam_winbind.so \
 "
 
 FILES_swat       = "${sbindir}/swat ${datadir}/swat ${libdir}/*.msg"
diff --git a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
index cc09a48..7c54dae 100644
--- a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
+++ b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
@@ -3,7 +3,7 @@ require samba-basic.inc
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI += "\
     file://config-h.patch \
-- 
1.7.2.5



