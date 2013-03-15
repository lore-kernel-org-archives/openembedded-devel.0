Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1UGOsr-0007zN-7l
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Mar 2013 08:16:58 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2F6fwZQ017815
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Mar 2013 23:41:58 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 14 Mar 2013 23:41:58 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 15 Mar 2013 14:41:54 +0800
Message-ID: <1363329716-14169-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Cc: Jackie.Huang@windriver.com
Subject: [meta-networking][PATCH 1/3] inetutils: fix PN -> BPN in do_install for multilibs
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
X-List-Received-Date: Fri, 15 Mar 2013 07:16:58 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../inetutils/inetutils_1.9.1.bb                   |   35 ++++++++++---------
 1 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
index 81457d7..155befe 100644
--- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
@@ -8,6 +8,7 @@ LICENSE = "GPLv3"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=0c7051aef9219dc7237f206c5c4179a7"
 
+PR = "r1"
 
 SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
            file://disable-pre-ANSI-compilers.patch \
@@ -37,27 +38,27 @@ do_configure_prepend () {
 do_install () {
 	autotools_do_install
 	install -d ${D}${base_sbindir} ${D}${base_bindir}
-	mv ${D}${bindir}/tftp ${D}${bindir}/tftp.${PN}
-	mv ${D}${bindir}/telnet ${D}${bindir}/telnet.${PN}
-	mv ${D}${bindir}/logger ${D}${bindir}/logger.${PN}
-	mv ${D}${bindir}/traceroute ${D}${bindir}/traceroute.${PN}
-	mv ${D}${bindir}/hostname ${D}${base_bindir}/hostname.${PN}
-	mv ${D}${bindir}/ifconfig ${D}${base_sbindir}/ifconfig.${PN}
+	mv ${D}${bindir}/tftp ${D}${bindir}/tftp.${BPN}
+	mv ${D}${bindir}/telnet ${D}${bindir}/telnet.${BPN}
+	mv ${D}${bindir}/logger ${D}${bindir}/logger.${BPN}
+	mv ${D}${bindir}/traceroute ${D}${bindir}/traceroute.${BPN}
+	mv ${D}${bindir}/hostname ${D}${base_bindir}/hostname.${BPN}
+	mv ${D}${bindir}/ifconfig ${D}${base_sbindir}/ifconfig.${BPN}
 }
 
 pkg_postinst_${PN} () {
-	update-alternatives --install ${bindir}/tftp tftp tftp.${PN} 100
-	update-alternatives --install ${bindir}/telnet telnet telnet.${PN} 100
-	update-alternatives --install ${bindir}/logger logger logger.${PN} 100
-	update-alternatives --install ${bindir}/traceroute traceroute traceroute.${PN} 100
-	update-alternatives --install ${base_bindir}/hostname hostname hostname.${PN} 100
-	update-alternatives --install ${base_sbindir}/ifconfig ifconfig ifconfig.${PN} 100
+	update-alternatives --install ${bindir}/tftp tftp tftp.${BPN} 100
+	update-alternatives --install ${bindir}/telnet telnet telnet.${BPN} 100
+	update-alternatives --install ${bindir}/logger logger logger.${BPN} 100
+	update-alternatives --install ${bindir}/traceroute traceroute traceroute.${BPN} 100
+	update-alternatives --install ${base_bindir}/hostname hostname hostname.${BPN} 100
+	update-alternatives --install ${base_sbindir}/ifconfig ifconfig ifconfig.${BPN} 100
 }
 
 pkg_prerm_${PN} () {
-	update-alternatives --remove tftp tftp.${PN}
-	update-alternatives --remove telnet telnet.${PN}
-	update-alternatives --remove logger logger.${PN}
-	update-alternatives --remove traceroute traceroute.${PN}
-	update-alternatives --remove ifconfig ifconfig.${PN}
+	update-alternatives --remove tftp tftp.${BPN}
+	update-alternatives --remove telnet telnet.${BPN}
+	update-alternatives --remove logger logger.${BPN}
+	update-alternatives --remove traceroute traceroute.${BPN}
+	update-alternatives --remove ifconfig ifconfig.${BPN}
 }
-- 
1.7.4.1



