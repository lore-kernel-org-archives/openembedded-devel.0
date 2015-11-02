Return-Path: <Jackie.Huang@windriver.com>
X-Greylist: delayed 691 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 02 Nov 2015 12:00:01 UTC
Received: from mail5.wrs.com (unknown [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6DAB6770A7
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Nov 2015 12:00:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tA2BmSxd010799
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 2 Nov 2015 03:48:30 -0800
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 2 Nov 2015 03:48:28 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 2 Nov 2015 19:48:51 +0800
Message-ID: <1446464931-351-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] samba: fix the incorrect tmpfiles installed directory
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Nov 2015 12:00:06 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

- The tmpfiles are always installed in /usr/lib
  even for multilib.
- It makes no sense to have two tmpfiles in both
  /usr/lib/tmpfiles.d and /etc/tmpfiles.d, install
  it as one in /etc/tmpfiles.d.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-connectivity/samba/samba_4.1.12.bb | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-connectivity/samba/samba_4.1.12.bb b/meta-oe/recipes-connectivity/samba/samba_4.1.12.bb
index 22c2bb4..45fdaa7 100644
--- a/meta-oe/recipes-connectivity/samba/samba_4.1.12.bb
+++ b/meta-oe/recipes-connectivity/samba/samba_4.1.12.bb
@@ -94,18 +94,16 @@ do_install_append() {
             -e 's,@SBINDIR@,${sbindir},g' \
             -i ${D}${systemd_unitdir}/system/*.service
 
-	install -d ${D}${sysconfdir}/tmpfiles.d
-	echo "d ${localstatedir}/log/samba 0755 root root -" \
-            > ${D}${sysconfdir}/tmpfiles.d/99-${BPN}.conf
+        install -d ${D}${sysconfdir}/tmpfiles.d
+        install -m644 packaging/systemd/samba.conf.tmp ${D}${sysconfdir}/tmpfiles.d/samba.conf
+        echo "d ${localstatedir}/log/samba 0755 root root -" \
+            >> ${D}${sysconfdir}/tmpfiles.d/samba.conf
     fi
 
     install -d ${D}${sysconfdir}/samba
     echo "127.0.0.1 localhost" > ${D}${sysconfdir}/samba/lmhosts
     install -m644 packaging/LSB/smb.conf ${D}${sysconfdir}/samba/smb.conf
 
-    install -d ${D}${libdir}/tmpfiles.d
-    install -m644 packaging/systemd/samba.conf.tmp ${D}${libdir}/tmpfiles.d/samba.conf
-
     install -d ${D}${sysconfdir}/sysconfig/
     install -m644 packaging/systemd/samba.sysconfig ${D}${sysconfdir}/sysconfig/samba
 }
@@ -114,7 +112,6 @@ PACKAGES += "${PN}-python ${PN}-python-dbg ${PN}-pidl libwinbind libwinbind-dbg
 
 FILES_${PN} += "/run \
                 ${libdir}/security/pam_smbpass.so \
-                ${libdir}/tmpfiles.d/* \
                "
 
 SMB_SERVICE="${systemd_unitdir}/system/nmb.service ${systemd_unitdir}/system/smb.service"
-- 
1.9.1


