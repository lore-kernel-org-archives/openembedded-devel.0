Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 45184731E6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jan 2016 06:42:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u066gbY3000263
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 5 Jan 2016 22:42:38 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.162.180) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Tue, 5 Jan 2016 22:42:36 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Jan 2016 14:42:46 +0800
Message-ID: <8c5ec63204082be592adaa5a0e7e5f10355206c5.1452061871.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452061871.git.jackie.huang@windriver.com>
References: <cover.1452061871.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 5/7 v3] samba: fix the incorrect tmpfiles installed directory
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
X-List-Received-Date: Wed, 06 Jan 2016 06:42:38 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

- The tmpfiles are always installed in /usr/lib
  even for multilib.
- It makes no sense to have two tmpfiles in both
  /usr/lib/tmpfiles.d and /etc/tmpfiles.d, install
  it as one in /etc/tmpfiles.d.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.1.12.bb | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
index a51d31f..fa35038 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
@@ -117,8 +117,9 @@ do_install_append() {
             -i ${D}${systemd_unitdir}/system/*.service
 
 	install -d ${D}${sysconfdir}/tmpfiles.d
-	echo "d ${localstatedir}/log/samba 0755 root root -" \
-            > ${D}${sysconfdir}/tmpfiles.d/99-${BPN}.conf
+        install -m644 packaging/systemd/samba.conf.tmp ${D}${sysconfdir}/tmpfiles.d/samba.conf
+        echo "d ${localstatedir}/log/samba 0755 root root -" \
+            >> ${D}${sysconfdir}/tmpfiles.d/samba.conf
     elif ${@bb.utils.contains('PACKAGECONFIG', 'lsb', 'true', 'false', d)}; then
 	install -d ${D}${sysconfdir}/init.d
 	install -m 0755 packaging/LSB/samba.sh ${D}${sysconfdir}/init.d
@@ -135,9 +136,6 @@ do_install_append() {
     echo "127.0.0.1 localhost" > ${D}${sysconfdir}/samba/lmhosts
     install -m644 packaging/LSB/smb.conf ${D}${sysconfdir}/samba/smb.conf
 
-    install -d ${D}${libdir}/tmpfiles.d
-    install -m644 packaging/systemd/samba.conf.tmp ${D}${libdir}/tmpfiles.d/samba.conf
-
     install -d ${D}${sysconfdir}/sysconfig/
     install -m644 packaging/systemd/samba.sysconfig ${D}${sysconfdir}/sysconfig/samba
 }
@@ -281,7 +279,6 @@ FILES_libnss-winbind = "${libdir}/libnss_*${SOLIBS} \
 "
 
 FILES_${PN} += "${base_libdir}/security/pam_smbpass.so \
-                ${libdir}/tmpfiles.d/* \
 "
 
 SMB_SERVICE="${systemd_unitdir}/system/nmb.service ${systemd_unitdir}/system/smb.service"
-- 
1.9.1


