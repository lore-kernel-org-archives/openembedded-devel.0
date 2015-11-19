Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1CD57601A5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2015 05:37:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAJ5bR4C018364
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2015 21:37:28 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 18 Nov 2015 21:37:27 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 19 Nov 2015 13:37:21 +0800
Message-ID: <81d3fc73632987316f7fe60607157dc6deea03ae.1447910888.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1447910888.git.jackie.huang@windriver.com>
References: <cover.1447910888.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 5/7 v2] samba: fix the incorrect tmpfiles installed directory
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
X-List-Received-Date: Thu, 19 Nov 2015 05:37:27 -0000
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
index cb29ab9..ab6f08a 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
@@ -110,8 +110,9 @@ do_install_append() {
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
@@ -128,9 +129,6 @@ do_install_append() {
     echo "127.0.0.1 localhost" > ${D}${sysconfdir}/samba/lmhosts
     install -m644 packaging/LSB/smb.conf ${D}${sysconfdir}/samba/smb.conf
 
-    install -d ${D}${libdir}/tmpfiles.d
-    install -m644 packaging/systemd/samba.conf.tmp ${D}${libdir}/tmpfiles.d/samba.conf
-
     install -d ${D}${sysconfdir}/sysconfig/
     install -m644 packaging/systemd/samba.sysconfig ${D}${sysconfdir}/sysconfig/samba
 }
@@ -139,7 +137,6 @@ PACKAGES += "${PN}-python ${PN}-python-dbg ${PN}-pidl libwinbind libwinbind-dbg
 
 FILES_${PN} += "/run \
                 ${base_libdir}/security/pam_smbpass.so \
-                ${libdir}/tmpfiles.d/* \
                "
 
 SMB_SERVICE="${systemd_unitdir}/system/nmb.service ${systemd_unitdir}/system/smb.service"
-- 
1.9.1


