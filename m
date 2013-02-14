Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Aws.Ismail@windriver.com>) id 1U65wP-00031B-83
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Feb 2013 22:02:02 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1EKjx8o014229
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Feb 2013 12:45:59 -0800 (PST)
Received: from localhost.localdomain (128.224.147.212) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.318.4; Thu, 14 Feb 2013 12:45:57 -0800
From: Aws Ismail <aws.ismail@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 14 Feb 2013 15:39:22 -0500
Message-ID: <1360874362-25860-4-git-send-email-aws.ismail@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1360874362-25860-1-git-send-email-aws.ismail@windriver.com>
References: <1360874362-25860-1-git-send-email-aws.ismail@windriver.com>
MIME-Version: 1.0
Cc: joe.macdonald@windriver.com
Subject: [meta-networking][PATCH 3/3] accel-ppp: resolve QA warnings and satisfy multilib
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
X-List-Received-Date: Thu, 14 Feb 2013 21:02:06 -0000
Content-Type: text/plain

Create -libs and -dbg splits to include .so and .debug
files, respectively to resolve the QA warning:
lib64-accel-ppp rdepends on lib64-accel-ppp-dev when
multilib is being used.

Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
---
 .../recipes-protocols/accel-ppp/accel-ppp_git.bb   |    7 +++++++
 .../traceroute/traceroute_2.0.18.bb                |    4 ++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb b/meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb
index 9eb9bf8..d17cc78 100644
--- a/meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb
+++ b/meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb
@@ -8,6 +8,7 @@ DEPENDS = "openssl libpcre"
 
 inherit cmake
 
+PR = "r1"
 PV = "1.7.3+git"
 
 SRCREV = "4acfa46c321a344b9a6ce4128e72d1e02828d8a0"
@@ -23,3 +24,9 @@ EXTRA_OECMAKE = " \
                  -DRADIUS=FALSE \
                  -DNETSNMP=FALSE \
                 "
+FILES_${PN}-dbg += "/usr/lib/${BPN}/.debug/*"
+
+PACKAGES =+ "${PN}-libs"
+FILES_${PN}-libs = "${libdir}/${BPN}/*.so /usr/lib/${BPN}/*.so"
+INSANE_SKIP_${PN}-libs = "dev-so"
+RDEPENDS_${PN} += "${PN}-libs"
diff --git a/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb b/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
index f5f96b2..f523140 100644
--- a/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
+++ b/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
@@ -34,8 +34,8 @@ do_install() {
 
     install -d ${D}${mandir}
     install -p -m644 ${BPN}/${BPN}.8 ${D}${mandir}
-    ln -s ${PN}.8 ${D}${mandir}/${BPN}6.8
-    ln -s ${PN}.8 ${D}${mandir}/tcptraceroute.8
+    ln -s ${BPN}.8 ${D}${mandir}/${BPN}6.8
+    ln -s ${BPN}.8 ${D}${mandir}/tcptraceroute.8
 
 }
 
-- 
1.7.0.4



