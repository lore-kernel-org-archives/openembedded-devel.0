Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Sen.Zhang@windriver.com>) id 1UAvPS-0002ma-Ol
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Feb 2013 05:48:01 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1S4Vct7024682
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Feb 2013 20:31:38 -0800 (PST)
Received: from jesse-wrs-desktop.wrs.com (128.224.162.230) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.328.9; Wed, 27 Feb 2013 20:31:36 -0800
From: Jesse Zhang <sen.zhang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <joe.macdonald@windriver.com>
Date: Thu, 28 Feb 2013 12:31:34 +0800
Message-ID: <1362025894-15350-1-git-send-email-sen.zhang@windriver.com>
X-Mailer: git-send-email 1.7.11.7
MIME-Version: 1.0
Subject: [meta-networking][PATCH] pptp-linux: Add dependency to fix parallel build
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
X-List-Received-Date: Thu, 28 Feb 2013 04:48:03 -0000
X-List-Received-Date: Thu, 28 Feb 2013 04:48:03 -0000
Content-Type: text/plain

CQID: WIND00405538

Add dependency on the generated config.h file for pptp.c and version.c.

Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
---
 .../pptp-linux-1.7.2/fix-parallel-build.patch         | 19 +++++++++++++++++++
 recipes-protocols/pptp-linux/pptp-linux_1.7.2.bb      |  6 ++++--
 2 files changed, 23 insertions(+), 2 deletions(-)
 create mode 100644 recipes-protocols/pptp-linux/pptp-linux-1.7.2/fix-parallel-build.patch

diff --git a/recipes-protocols/pptp-linux/pptp-linux-1.7.2/fix-parallel-build.patch b/recipes-protocols/pptp-linux/pptp-linux-1.7.2/fix-parallel-build.patch
new file mode 100644
index 0000000..77722b0
--- /dev/null
+++ b/recipes-protocols/pptp-linux/pptp-linux-1.7.2/fix-parallel-build.patch
@@ -0,0 +1,19 @@
+pptp.c and version.c depend on config.h
+
+Upstream-Status: Backport
+
+Upstream has already similar fixes. Will be available on next release.
+
+Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
+
+--- a/Makefile	2013-02-27 17:09:24.431226665 +0800
++++ b/Makefile	2013-02-27 17:09:03.442075550 +0800
+@@ -43,6 +43,8 @@
+ pptpsetup.8: pptpsetup
+ 	pod2man $? > $@
+ 
++pptp.o version.o: config.h
++
+ config.h: 
+ 	echo "/* text added by Makefile target config.h */" > config.h
+ 	echo "#define PPTP_LINUX_VERSION \"$(VERSION)$(RELEASE)\"" >> config.h
diff --git a/recipes-protocols/pptp-linux/pptp-linux_1.7.2.bb b/recipes-protocols/pptp-linux/pptp-linux_1.7.2.bb
index ac3f8f6..c173af4 100644
--- a/recipes-protocols/pptp-linux/pptp-linux_1.7.2.bb
+++ b/recipes-protocols/pptp-linux/pptp-linux_1.7.2.bb
@@ -9,10 +9,12 @@ SECTION = "network"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/sourceforge/pptpclient/pptp-${PV}.tar.gz \
-           file://options.pptp"
+           file://options.pptp \
+           file://fix-parallel-build.patch \
+           "
 
 SRC_URI[md5sum] = "4c3d19286a37459a632c7128c92a9857"
 SRC_URI[sha256sum] = "e98ae0065d2a39fa3131654ff28cb7070e996f668ed6d0e7d9a445b8d37694bc"
-- 
1.7.11.7



