Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <carher@gmail.com>) id 1QA8H1-0001fp-82
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Apr 2011 00:10:55 +0200
Received: by yia13 with SMTP id 13so464883yia.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2011 15:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=fPSyo5hxNcQvG7og+0QW59nu1SfBo2hOZAHhSS2/nPk=;
	b=vUuUzBILqp5z2Nul7j51kahllRPuOfWzs4XXPqbF294p6henj28VZ7jvV+SRqkQNjW
	NWwV3PDVJBO9TychVXy36mtyBpH6iVcZEYfdHrSff522/sce19EvzjdvVBSR+YFvbZZp
	elGMx/TDnVca7XQ/TpVwM89mUqc4WzC1jfS7g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=HCFEYXqwW2ZesCv575eJiH6Vb6+7+Q0ZRT50yQvEFdfCFdLn9fe/dL5xg6XmL0MnsL
	YBRuP7Z3C0MVgwXZC8vQrY59F/R0Vpq/oQxyJpWHdEb4YjczZElHcdwddC9OwkK0L+/s
	haTLU1Ixk8irgaz9JQZWQKq59TeitwFN06fO8=
Received: by 10.91.67.13 with SMTP id u13mr225321agk.74.1302732515403;
	Wed, 13 Apr 2011 15:08:35 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id i8sm973325ang.5.2011.04.13.15.08.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 13 Apr 2011 15:08:34 -0700 (PDT)
From: Carlos Hernandez <carher@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Apr 2011 18:08:06 -0400
Message-Id: <1302732486-2777-1-git-send-email-c-hernandez8@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <yes>
References: <yes>
Cc: Carlos Hernandez <c-hernandez8@ti.com>
Subject: [PATCH 2/2] ltp-ddt: New recipe to build ltp-ddt test tool.
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
X-List-Received-Date: Wed, 13 Apr 2011 22:10:55 -0000

ltp-ddt is an open source test application for embedded linux devices.
It is based on the linux test project (ltp) but it has a smaller footprint
and it focus mainly on driver and system performance.
Design Highlights:
 * Based on LTP http://ltp.sourceforge.net/
 * Test cases are suitable for embedded devices w/ a limited shell.
 * Support dynamic selection/filtering of test cases based on platform.
 * Support test parameters overrides based on platform.

Signed-off-by: Carlos Hernandez <c-hernandez8@ti.com>
---
 recipes/ltp-ddt/ltp-ddt_0.0.1.bb |   54 ++++++++++++++++++++++++++++++++++++++
 1 files changed, 54 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ltp-ddt/ltp-ddt_0.0.1.bb

diff --git a/recipes/ltp-ddt/ltp-ddt_0.0.1.bb b/recipes/ltp-ddt/ltp-ddt_0.0.1.bb
new file mode 100644
index 0000000..157ee07
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
+EXTRA_OEMAKE_append = "prefix=/usr/ltp CROSS_COMPILE=${HOST_PREFIX} SKIP_IDCHECK=1 KERNEL_INC=${STAGING_KERNEL_DIR}/include"
+
+FILES_${PN}-dbg += "\
+ /usr/ltp/.debug \
+ /usr/ltp/bin/.debug \
+ /usr/ltp/runtest/.debug \
+ /usr/ltp/testcases/bin/.debug \
+ /usr/ltp/testcases/bin/*/bin/.debug \
+ /usr/ltp/testcases/bin/*/test/.debug \
+ /usr/ltp/testcases/bin/ddt/.debug \
+ /usr/ltp/testcases/bin/ddt/*/bin/.debug \
+ /usr/ltp/testcases/bin/ddt/*/test/.debug \
+"
+
+FILES_${PN} += "\
+ /usr/ltp/* \
+ /usr/ltp/bin/* \
+ /usr/ltp/runtest/* \
+ /usr/ltp/testcases/bin/* \
+ /usr/ltp/testcases/bin/*/bin/* \
+ /usr/ltp/testscripts/* \
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



