Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe.slater@windriver.com>) id 1U695Q-0000vA-H7
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Feb 2013 01:23:32 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1ELe7gg014864
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Feb 2013 13:40:07 -0800 (PST)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Thu, 14 Feb 2013 13:40:05 -0800
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 14 Feb 2013 13:40:04 -0800
Message-ID: <1360878004-11267-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH] arptables: defeat multi-job for install
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
X-List-Received-Date: Fri, 15 Feb 2013 00:23:33 -0000
Content-Type: text/plain

CQID: 399299

The make install target is not parallel job
safe, but doesn't do all that much, so we
limit make to one job for that.

The make target is of the form

install: x y z

Unfortunately, z depends on y, so if z is started
before y (almost) completes, we will fail.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 recipes-support/arptables/arptables_0.0.3-4.bb |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/recipes-support/arptables/arptables_0.0.3-4.bb b/recipes-support/arptables/arptables_0.0.3-4.bb
index 2faccec..de3f62d 100644
--- a/recipes-support/arptables/arptables_0.0.3-4.bb
+++ b/recipes-support/arptables/arptables_0.0.3-4.bb
@@ -3,6 +3,8 @@ PRIORITY = "optional"
 LICENSE = "GPL-2.0"
 SECTION = "console/network"
 
+PR = "r2"
+
 RDEPENDS_${PN} += "perl"
 
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
@@ -20,6 +22,11 @@ do_compile () {
 	oe_runmake
 }
 
+# the install target is not multi-job safe, but it doesn't do much
+# so we just install seriatim
+#
+PARALLEL_MAKEINST = "-j1"
+
 fakeroot do_install () {
 	oe_runmake 'BINDIR=${sbindir}' 'MANDIR=${mandir}/' 'DESTDIR=${D}' install
 }
-- 
1.7.3.4



