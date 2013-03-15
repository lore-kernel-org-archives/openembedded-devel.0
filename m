Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1UGOso-0007zN-5C
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Mar 2013 08:16:54 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2F6g2qa017850
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Mar 2013 23:42:02 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 14 Mar 2013 23:42:02 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 15 Mar 2013 14:41:56 +0800
Message-ID: <1363329716-14169-3-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1363329716-14169-1-git-send-email-jackie.huang@windriver.com>
References: <1363329716-14169-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
Cc: Jackie.Huang@windriver.com
Subject: [meta-webserver][PATCH 3/3] phpmyadmin: fix PN->BPN in do_install for multilibs
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
X-List-Received-Date: Fri, 15 Mar 2013 07:16:55 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-php/phpmyadmin/phpmyadmin_3.5.2.2.bb   |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_3.5.2.2.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_3.5.2.2.bb
index e3a581c..1118e23 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_3.5.2.2.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_3.5.2.2.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv2 & LGPLv3 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=eb723b61539feef013de476e68b5c50a \
                     file://libraries/tcpdf/LICENSE.TXT;md5=5c87b66a5358ebcc495b03e0afcd342c"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/phpmyadmin/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-languages.tar.xz \
            file://apache.conf"
@@ -18,13 +18,13 @@ S = "${WORKDIR}/phpMyAdmin-${PV}-all-languages"
 inherit allarch
 
 do_install() {
-	install -d ${D}${datadir}/${PN}
-	cp -a * ${D}${datadir}/${PN}
+	install -d ${D}${datadir}/${BPN}
+	cp -a * ${D}${datadir}/${BPN}
 
 	install -d ${D}${sysconfdir}/apache2/conf.d
 	install -m 0644 ${WORKDIR}/apache.conf ${D}${sysconfdir}/apache2/conf.d/phpmyadmin.conf
 }
 
-FILES_${PN} = "${datadir}/${PN} \
+FILES_${PN} = "${datadir}/${BPN} \
                ${sysconfdir}/apache2/conf.d"
 
-- 
1.7.4.1



