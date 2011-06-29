Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefflance01@gmail.com>) id 1QbxnE-0006Z7-HV
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Jun 2011 18:39:13 +0200
Received: by yxe1 with SMTP id 1so581142yxe.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jun 2011 09:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=KTGCgzAYiOwlOivyNbQhDqp34EpuyudU6SLQK20b/5Q=;
	b=SqVkHYIbSDiQRAE1WPuJRKt61AQA1rvI1yF2CRn9MmjpZcwmD4bgy/U5lyi2LF2HoD
	R3/5JUsvhRseNSZRdX8+5NTFgs6ZZiEZ1GtemTf/2E0tq0H9LmTpr6KTU/zE4x4ktN3v
	CJErlg5M0Jlinwv5hYxyjDGx/ST4g5J16Ht1s=
Received: by 10.100.146.4 with SMTP id t4mr818732and.29.1309365328644;
	Wed, 29 Jun 2011 09:35:28 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id c21sm1198544ana.50.2011.06.29.09.35.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Jun 2011 09:35:28 -0700 (PDT)
From: Jeff Lance <jefflance01@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Jun 2011 11:33:06 -0500
Message-Id: <1309365186-10742-1-git-send-email-j-lance1@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Jeff Lance <j-lance1@ti.com>
Subject: [PATCH v2 1/1] am-benchmarks: Remove platform dependencies
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
X-List-Received-Date: Wed, 29 Jun 2011 16:39:14 -0000

* Remove platform dependencies and use architecture dependencies instead
* Use OE BASE_PACKAGE_ARCH to determine architecture
* Update the SRCREV to revision 66
* Update the recipe revision to 1.3
* Removed INSANE_SKIP
NOTE - architecture dependency can be removed once CFLAGS can be passed into CCSv5 project makefile

Signed-off-by: Jeff Lance <j-lance1@ti.com>
---
Updated in version 2:
  Removed INSANE_SKIP directive
  updated SRCREV from 65 to 66
  used find-copies-harder to show differences with previous recipe
--
 recipes/ti/am-benchmarks_1.3.bb |   33 +++++++++++++++++++++++++++++++++
 1 files changed, 33 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ti/am-benchmarks_1.3.bb

diff --git a/recipes/ti/am-benchmarks_1.3.bb b/recipes/ti/am-benchmarks_1.3.bb
new file mode 100644
index 0000000..8ac9b74
--- /dev/null
+++ b/recipes/ti/am-benchmarks_1.3.bb
@@ -0,0 +1,33 @@
+#NOTE: This package is currently only supported for the Angstrom
+#      distribution.  Other distributions and toolchains may or
+#      may not work.
+
+DESCRIPTION = "AM Benchmarks"
+HOMEPAGE = "https://gforge.ti.com/gf/project/am_benchmarks/"
+LICENSE = "BSD"
+SECTION = "system"
+PRIORITY = "optional"
+
+SRCREV = "66"
+PR = "r2+svnr${SRCPV}"
+
+SRC_URI = "svn://gforge.ti.com/svn/am_benchmarks/;module=trunk;proto=https;user=anonymous;pswd=''"
+
+S = "${WORKDIR}/trunk"
+
+do_configure() {
+        sed -i -e 's|LIBS :=|LIBS := ${LDFLAGS} |' Release/objects.mk
+}
+
+do_compile() {
+	# don't build debug version
+	touch debug
+	export CROSS_COMPILE=${TARGET_PREFIX}
+	export ARCH=${BASE_PACKAGE_ARCH}
+	make release 
+}
+
+do_install() {
+	export ARCH=${BASE_PACKAGE_ARCH}
+	make DESTDIR=${D} install
+}
-- 
1.7.0.4



