Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4AC5471A26
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 12:04:10 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 3630BB81F96; Wed, 30 Nov 2016 13:04:06 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2016 13:03:52 +0100
Message-Id: <1480507445-20746-4-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480507445-20746-1-git-send-email-obi@opendreambox.org>
References: <1480507445-20746-1-git-send-email-obi@opendreambox.org>
Subject: [meta-networking][PATCH 04/17] samba: remove superflous listing of pam_smbpass.so
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
X-List-Received-Date: Wed, 30 Nov 2016 12:04:10 -0000

EXTRA_OECONF includes --with-pammodulesdir=${base_libdir}/security
when pam is enabled.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index 57eba0f..e9f082f 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -240,7 +240,7 @@ FILES_${PN} += "${libdir}/vfs/*.so \
                 ${libdir}/charset/*.so \
                 ${libdir}/*.dat \
                 ${libdir}/auth/*.so \
-                ${libdir}/security/pam_smbpass.so \
+                ${base_libdir}/security/pam_smbpass.so \
 "
 
 FILES_libwbclient = "${libdir}/libwbclient.so.* ${libdir}/samba/libwinbind-client.so"
@@ -257,9 +257,6 @@ FILES_libnss-winbind = "${libdir}/libnss_*${SOLIBS} \
                         ${libdir}/nss_info \
 "
 
-FILES_${PN} += "${base_libdir}/security/pam_smbpass.so \
-"
-
 FILES_libwinbind = "${base_libdir}/security/pam_winbind.so \
                     ${systemd_system_unitdir}/winbind.service"
 FILES_libwinbind-krb5-locator = "${libdir}/winbind_krb5_locator.so"
-- 
2.7.4


