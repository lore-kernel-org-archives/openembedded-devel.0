Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mario.goulart@gmail.com>) id 1TfYj0-0006mv-1x
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Dec 2012 17:18:30 +0100
Received: by mail-ob0-f175.google.com with SMTP id vb8so2539248obc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 08:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=VKX9ICz+nBQFDRKKOrvkwQXabDqz60SDL5GDalPnUlk=;
	b=TKgfOIWA/YZaNUMh0TUA9TWVDLKW7MosGX0ylGV3FS8QT3af/Du2Mw1AL8X+ASFVVL
	pA9TBqJT5OcEQp5GKU82CFRAByTuJDRf+jr8nhkUmU/RnxibX3rPiuilfVXNhrn5Nidg
	qBqumcgM26q47/t/YucTSbDYwFe9f3Be0Ssy6+oFMcTxGKC9yJWHBqbL9YfcaW5+jGL0
	H78aYnEvH/0ge71wgiO7jVM2wIaxG76kk6Ijz8fQsH70N/ozS3Miryn5EnoizeKXuCNT
	FNlQH8vpInge/6zFbjFMHDXrfd+lKfc7Zs6SXjlp4GZ9Rsss3VlSkDuDEdxQoNoZHE4I
	Z12g==
Received: by 10.182.188.36 with SMTP id fx4mr4680592obc.6.1354550650724;
	Mon, 03 Dec 2012 08:04:10 -0800 (PST)
Received: from localhost.localdomain ([187.23.153.69])
	by mx.google.com with ESMTPS id el2sm13739774obc.9.2012.12.03.08.04.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 08:04:09 -0800 (PST)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Dec 2012 14:03:26 -0200
Message-Id: <1354550606-10377-6-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1354550606-10377-1-git-send-email-mario@ossystems.com.br>
References: <1354550606-10377-1-git-send-email-mario@ossystems.com.br>
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [meta-oe][PATCHv2 6/6] samba: split winbind into winbind and libwinbind
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
X-List-Received-Date: Mon, 03 Dec 2012 16:18:30 -0000

Change-Id: Ica6b3223805e35a0702bf20aad24ae13236b4f1c
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



