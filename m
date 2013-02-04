Received: from mail-ye0-f172.google.com ([209.85.213.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U2Pwv-0002Jm-KH
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Feb 2013 18:35:34 +0100
Received: by mail-ye0-f172.google.com with SMTP id m10so1592032yen.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Feb 2013 09:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=j8ZntmDHeRWv/91y9H014SvXvT17EBxFVlFzjhH85qM=;
	b=saLVJmJ6dlO/WVZrnKdqsL5Aflz3OXK1YC9pvqg9aMV4NQv8Qp3Hm5F3kYJq2ux+Gs
	qoiHHbUnzd8D7UqwHxnyIUFABx/WqAwpfM8+s30mmernbzKDAMp6LMfPpnKGT7nfMQsL
	NMoes4+MOVyHvfaDFzAcRkB5bX61FC3z42ShcFZGIV1Bw/zeff9SUiABvPVpH+/Tiusz
	qQg1yd2NtrimNJ2MkBoyCkr67x1GHo+wEUFdt2AvaD59tliOHj7F/1hntbkk1rd/hwW/
	6Xl7RI5I2/YlIuV77eoNK/C1fqyJB25hn+3vBQbgbvtqesACe7coSIHARJe8heATa6XR
	pnaQ==
X-Received: by 10.236.149.162 with SMTP id x22mr26584013yhj.37.1359998372892; 
	Mon, 04 Feb 2013 09:19:32 -0800 (PST)
Received: from localhost.localdomain ([187.23.144.59])
	by mx.google.com with ESMTPS id j13sm16235487ani.19.2013.02.04.09.19.30
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 04 Feb 2013 09:19:32 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Feb 2013 15:19:24 -0200
Message-Id: <1359998364-9245-1-git-send-email-otavio@ossystems.com.br>
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
X-List-Received-Date: Mon, 04 Feb 2013 17:35:34 -0000

This allows for applications to resolv wins without the winbindd and
sambad.

Change-Id: Iaa86154a59e758b37f28796963e6550ed2d30464
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-connectivity/samba/samba-basic.inc |    7 ++++---
 meta-oe/recipes-connectivity/samba/samba.inc       |    2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-connectivity/samba/samba-basic.inc b/meta-oe/recipes-connectivity/samba/samba-basic.inc
index 0b24879..d6d8d12 100644
--- a/meta-oe/recipes-connectivity/samba/samba-basic.inc
+++ b/meta-oe/recipes-connectivity/samba/samba-basic.inc
@@ -9,7 +9,7 @@ EXTRA_OECONF += "\
         --without-ldap \
         --without-krb5"
 
-PACKAGES =+ "libwbclient libwinbind libwinbind-dbg winbind winbind-dbg libnetapi libtdb libsmbsharemodes libsmbclient libsmbclient-dev cifs cifs-doc swat"
+PACKAGES =+ "libwbclient libwinbind libwinbind-dbg libnss-winbind winbind winbind-dbg libnetapi libtdb libsmbsharemodes libsmbclient libsmbclient-dev cifs cifs-doc swat"
 
 FILES_winbind-dbg = "${libdir}/idmap/.debug/*.so \
                      ${libdir}/security/.debug/pam_winbind.so \
@@ -36,13 +36,14 @@ FILES_cifs = "${base_sbindir}/mount.cifs ${base_sbindir}/umount.cifs"
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
index a86c8be..3ee43ad 100644
--- a/meta-oe/recipes-connectivity/samba/samba.inc
+++ b/meta-oe/recipes-connectivity/samba/samba.inc
@@ -96,7 +96,7 @@ do_install_append() {
 
 
 
-pkg_postinst_winbind () {
+pkg_postinst_libnss-winbind () {
     # add wins to the list of resolvers
     ns=$D${sysconfdir}/nsswitch.conf
     if ! grep "hosts:.*wins" $ns > /dev/null; then
-- 
1.7.2.5



