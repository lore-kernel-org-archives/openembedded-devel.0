Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 42523770AD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 02:29:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9F2Tf2T009153
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2015 19:29:42 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 14 Oct 2015 19:29:41 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 15 Oct 2015 10:21:05 +0800
Message-ID: <1444875665-5203-2-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <1444875665-5203-1-git-send-email-kai.kang@windriver.com>
References: <1444875665-5203-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [meta-webserver][PATCH 2/2] phpmyadmin: 4.4.9 -> 4.5.0.2
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
X-List-Received-Date: Thu, 15 Oct 2015 02:29:43 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade phpmyadmin from 4.4.9 to 4.5.0.2 and SRC_URI is updated.

Accoring to release note, there is NO API changes for 4.5.0.x serial. So
upgrade to 4.5.0.2 rather than 4.4.15 which will only support for
security fixes only.

And license file has some text update. See:
https://github.com/phpmyadmin/phpmyadmin/commit/9d080a482fae73bde5049620088d4687da245163

Change files owner to fix [host-user-contaminated] warnings.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../phpmyadmin/{phpmyadmin_4.4.9.bb => phpmyadmin_4.5.0.2.bb}    | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_4.4.9.bb => phpmyadmin_4.5.0.2.bb} (72%)

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.4.9.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.5.0.2.bb
similarity index 72%
rename from meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.4.9.bb
rename to meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.5.0.2.bb
index 91a1cbf..e28b66a 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.4.9.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.5.0.2.bb
@@ -2,14 +2,14 @@ SUMMARY = "Web-based MySQL administration interface"
 HOMEPAGE = "http://www.phpmyadmin.net"
 # Main code is GPLv2, libraries/tcpdf is under LGPLv3, js/jquery is under MIT
 LICENSE = "GPLv2 & LGPLv3 & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=eb723b61539feef013de476e68b5c50a \
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://libraries/tcpdf/LICENSE.TXT;md5=5c87b66a5358ebcc495b03e0afcd342c"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/phpmyadmin/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-languages.tar.xz \
+SRC_URI = "https://files.phpmyadmin.net/phpMyAdmin/4.5.0.2/phpMyAdmin-4.5.0.2-all-languages.tar.xz \
            file://apache.conf"
 
-SRC_URI[md5sum] = "d60d80fabe1b27023122228dcf7ee73e"
-SRC_URI[sha256sum] = "b9a31d6ec3e7abe708160ce8dbc364c029015256766bac6f68134b84a836d766"
+SRC_URI[md5sum] = "2d08d2fcc8f70f88a11a14723e3ca275"
+SRC_URI[sha256sum] = "d2e90ea486d90b4ebe5eb02d7ad349ad2916c12a8981f98553395ef78d22a8ec"
 
 S = "${WORKDIR}/phpMyAdmin-${PV}-all-languages"
 
@@ -18,6 +18,7 @@ inherit allarch
 do_install() {
     install -d ${D}${datadir}/${BPN}
     cp -a * ${D}${datadir}/${BPN}
+    chown -R root:root ${D}${datadir}/${BPN}
     # Don't install patches to target
     rm -rf ${D}${datadir}/${BPN}/patches
 
-- 
2.6.1


