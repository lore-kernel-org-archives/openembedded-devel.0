Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Aws.Ismail@windriver.com>) id 1U673o-0005Dk-1L
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Feb 2013 23:14:01 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1ELvegZ000212
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Feb 2013 13:57:40 -0800 (PST)
Received: from localhost.localdomain (128.224.147.212) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.318.4; Thu, 14 Feb 2013 13:57:40 -0800
From: Aws Ismail <aws.ismail@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 14 Feb 2013 16:51:05 -0500
Message-ID: <1360878665-17503-4-git-send-email-aws.ismail@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1360878665-17503-1-git-send-email-aws.ismail@windriver.com>
References: <1360878665-17503-1-git-send-email-aws.ismail@windriver.com>
MIME-Version: 1.0
Cc: joe.macdonald@windriver.com
Subject: [meta-networking][PATCH 3/3] traceroute: resolve multilib issues
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
X-List-Received-Date: Thu, 14 Feb 2013 22:14:04 -0000
X-List-Received-Date: Thu, 14 Feb 2013 22:14:04 -0000
Content-Type: text/plain

Make recipe changes to enable successfull building
when multilib is being used.

Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
---
 .../traceroute/traceroute_2.0.18.bb                |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb b/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
index 6eca731..f523140 100644
--- a/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
+++ b/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
@@ -11,6 +11,8 @@ LICENSE = "GPL-2.0 LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff"
 
+PR = "r1"
+
 inherit update-alternatives
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/traceroute/traceroute/traceroute-2.0.18/traceroute-2.0.18.tar.gz \
@@ -26,14 +28,14 @@ do_compile() {
 
 do_install() {
     install -d ${D}${bindir}
-    install -m755 ${PN}/${PN} ${D}${bindir}
+    install -m755 ${BPN}/${BPN} ${D}${bindir}
 
     install -m755 wrappers/tcptraceroute ${D}${bindir}
 
     install -d ${D}${mandir}
-    install -p -m644 ${PN}/${PN}.8 ${D}${mandir}
-    ln -s ${PN}.8 ${D}${mandir}/${PN}6.8
-    ln -s ${PN}.8 ${D}${mandir}/tcptraceroute.8
+    install -p -m644 ${BPN}/${BPN}.8 ${D}${mandir}
+    ln -s ${BPN}.8 ${D}${mandir}/${BPN}6.8
+    ln -s ${BPN}.8 ${D}${mandir}/tcptraceroute.8
 
 }
 
-- 
1.7.0.4



