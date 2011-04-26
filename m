Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <carher@gmail.com>) id 1QEplt-000244-SD
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Apr 2011 23:26:14 +0200
Received: by yxn22 with SMTP id 22so259838yxn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2011 14:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=8QAFz3xPCy8xmc5bkingn5bwt9D/enP9FMH5U4s9VzY=;
	b=xkgryWukczf3ErFGUTLhha7RR3VPHzqPHi/P+2hBjVh1LD9fmN6NeAOxOfLs1U2CQf
	hwxYF/vWpjOlTDvd6e0QIs0wuvWVbCfFOgvCbhuzUbv3AZAyLIiMwMfY0AD/pfbLasOb
	sa0cd3aTPYI5rVsgwdSgxgmBuBUtISAKTpZRw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=STV8B9TdZzhct58WhYnSg926OEbtrVkaTQmGvu7lzbeuZkOi2yOyRZz8SjbwVABxAc
	BNhrpCT7Hkv7BV4Ddeen0CyFxeKqhg9hnTHbvYz62kNHu3F70cq6pOXteleyVkbPD8Tr
	gxxHTEJoncjBa93OX+BPlGOYr8F6KFciZVWco=
Received: by 10.150.247.2 with SMTP id u2mr1092469ybh.354.1303853023110;
	Tue, 26 Apr 2011 14:23:43 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id w15sm497247ybk.1.2011.04.26.14.23.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Apr 2011 14:23:41 -0700 (PDT)
From: Carlos Hernandez <carher@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Apr 2011 17:23:11 -0400
Message-Id: <1303852991-28469-1-git-send-email-c-hernandez8@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Carlos Hernandez <c-hernandez8@ti.com>
Subject: [PATCH v2] ltp-ddt: New recipe to build ltp-ddt test tool.
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
X-List-Received-Date: Tue, 26 Apr 2011 21:26:14 -0000

ltp-ddt is an open source test application for embedded linux devices.
It is based on the linux test project (ltp) but it has a smaller footprint
and it focus mainly on driver and system performance.
Design Highlights:
 * Based on LTP http://ltp.sourceforge.net/
 * Test cases are suitable for embedded devices w/ a limited shell.
 * Support dynamic selection/filtering of test cases based on platform.
 * Support test parameters overrides based on platform.

Signed-off-by: Carlos Hernandez <c-hernandez8@ti.com>

 Changed in version 2:
 * Install package under /opt instead of under /usr to comply with FHS per
   Denys' recommendation.
---
 recipes/ltp-ddt/ltp-ddt_0.0.1.bb |   54 ++++++++++++++++++++++++++++++++++++++
 1 files changed, 54 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ltp-ddt/ltp-ddt_0.0.1.bb

diff --git a/recipes/ltp-ddt/ltp-ddt_0.0.1.bb b/recipes/ltp-ddt/ltp-ddt_0.0.1.bb
new file mode 100644
index 0000000..2f8a1f2
--- /dev/null
+++ b/recipes/ltp-ddt/ltp-ddt_0.0.1.bb
@@ -0,0 +1,54 @@
+DESCRIPTION = "Embedded Linux Device Driver Tests based on Linux Test Project"
+HOMEPAGE = "http://arago-project.org/git/projects/?p=test-automation/ltp-ddt.git;a=summary"
+LICENSE = "GPL"
+SECTION = "console/utils"
+DEPENDS += "zip-native virtual/kernel"
+PR = "r0"
+
+inherit autotools
+
+BRANCH ?= "master"
+TAG ?= "ltp-ddt_${PV}"
+
+SRC_URI = "\
+git://arago-project.org/git/projects/test-automation/ltp-ddt.git;protocol=git;\
+branch=${BRANCH};\
+tag=${TAG}\
+"
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE_append = "prefix=/opt/ltp CROSS_COMPILE=${HOST_PREFIX} SKIP_IDCHECK=1 KERNEL_INC=${STAGING_KERNEL_DIR}/include"
+
+FILES_${PN}-dbg += "\
+ /opt/ltp/.debug \
+ /opt/ltp/bin/.debug \
+ /opt/ltp/runtest/.debug \
+ /opt/ltp/testcases/bin/.debug \
+ /opt/ltp/testcases/bin/*/bin/.debug \
+ /opt/ltp/testcases/bin/*/test/.debug \
+ /opt/ltp/testcases/bin/ddt/.debug \
+ /opt/ltp/testcases/bin/ddt/*/bin/.debug \
+ /opt/ltp/testcases/bin/ddt/*/test/.debug \
+"
+
+FILES_${PN} += "\
+ /opt/ltp/* \
+ /opt/ltp/bin/* \
+ /opt/ltp/runtest/* \
+ /opt/ltp/testcases/bin/* \
+ /opt/ltp/testcases/bin/*/bin/* \
+ /opt/ltp/testscripts/* \
+"
+
+do_configure(){
+        cp ${S}/include/config.h.default ${S}/include/config.h
+	cp ${S}/include/mk/config.mk.default ${S}/include/mk/config.mk
+	cp ${S}/include/mk/features.mk.default ${S}/include/mk/features.mk
+	echo "${TAG}" > ${S}/ChangeLog
+}
+
+do_install(){
+        oe_runmake DESTDIR=${D} install
+}
+
+
-- 
1.7.0.4



