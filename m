Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3C82271A26
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 12:04:15 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id DD4E6B81F65; Wed, 30 Nov 2016 13:04:06 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2016 13:03:59 +0100
Message-Id: <1480507445-20746-11-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480507445-20746-1-git-send-email-obi@opendreambox.org>
References: <1480507445-20746-1-git-send-email-obi@opendreambox.org>
Subject: [meta-networking][PATCH 11/17] samba: simplify files list for samba-python
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
X-List-Received-Date: Wed, 30 Nov 2016 12:04:15 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 .../recipes-connectivity/samba/samba_4.4.5.bb          | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index 3f092f3..308d862 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -268,23 +268,7 @@ FILES_libwinbind = "${base_libdir}/security/pam_winbind.so \
                     ${systemd_system_unitdir}/winbind.service"
 FILES_libwinbind-krb5-locator = "${libdir}/winbind_krb5_locator.so"
 
-FILES_${PN}-python = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/*.so \
-                      ${libdir}/python${PYTHON_BASEVERSION}/site-packages/_ldb_text.py \
-                      ${libdir}/python${PYTHON_BASEVERSION}/site-packages/samba/*.py \
-                      ${libdir}/python${PYTHON_BASEVERSION}/site-packages/samba/*.so \
-                      ${libdir}/python${PYTHON_BASEVERSION}/site-packages/samba/dcerpc/*.so \
-                      ${libdir}/python${PYTHON_BASEVERSION}/site-packages/samba/dcerpc/*.py \
-                      ${libdir}/python${PYTHON_BASEVERSION}/site-packages/samba/external/* \
-                      ${libdir}/python${PYTHON_BASEVERSION}/site-packages/samba/kcc/* \
-                      ${libdir}/python${PYTHON_BASEVERSION}/site-packages/samba/netcmd/*.py \
-                      ${libdir}/python${PYTHON_BASEVERSION}/site-packages/samba/provision/*.py \
-                      ${libdir}/python${PYTHON_BASEVERSION}/site-packages/samba/samba3/*.py \
-                      ${libdir}/python${PYTHON_BASEVERSION}/site-packages/samba/samba3/*.so \
-                      ${libdir}/python${PYTHON_BASEVERSION}/site-packages/samba/subunit/* \
-                      ${libdir}/python${PYTHON_BASEVERSION}/site-packages/samba/tests/* \
-                      ${libdir}/python${PYTHON_BASEVERSION}/site-packages/samba/third_party/* \
-                      ${libdir}/python${PYTHON_BASEVERSION}/site-packages/samba/web_server/* \
-"
+FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
 
 FILES_smbclient = "${bindir}/cifsdd \
                    ${bindir}/rpcclient \
-- 
2.7.4


