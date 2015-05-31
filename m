Return-Path: <kergoth@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id BD632756C5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 May 2015 00:32:36 +0000 (UTC)
Received: by wgv5 with SMTP id 5so88352513wgv.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 May 2015 17:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=Y+Itw0/OrmOcfkyJ2rg4g9OGRd3yE+UbMqBIbxwn5AI=;
	b=YXJhy9UD3ewGrbF6wp7LPGDLS96DGU05HhlZnyt8ewC56YSJVpP69MHgHcvs5iIuU0
	FgC9YmzQejJswDWrOP1J+Zlg9m4qHAczjVzFZT20HnLTNfVmOolLvpXFV3NIT/LSVUlt
	om7dVpcjch9XInOPaOMtCfFd7QTqX0iHoEA3Mi3BQc4YTWcs+vZo79sAjTiO/LmTXfZn
	d1gDotU/BQsxej72bG2CndSy/JOpzVnRi1xJrkaDBKyzoEckxKxcZ6pBNLlsdNFkqOtp
	Rd/bKNkzAxzAsijeg/s5XrnxJtAgenyyT7d0E+0v579s2rDT5MbMxeBj5X+3erhq+2l0
	IK2w==
X-Received: by 10.194.172.72 with SMTP id ba8mr28164902wjc.136.1433032356626; 
	Sat, 30 May 2015 17:32:36 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id u6sm14863313wja.40.2015.05.30.17.32.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 30 May 2015 17:32:35 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 30 May 2015 17:31:59 -0700
Message-Id: <1433032319-13061-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.2.1
Subject: [PATCH] ntimed: add recipe to meta-networking (git version)
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
X-List-Received-Date: Sun, 31 May 2015 00:32:39 -0000

Ntimed is an unreleased ntpd replacement being sponsored by the Linux
Foundation. Currently it only includes a work-in-progress client, but for
future use this recipe emits an ntimed-client package and an ntimed meta
package which will pull in client and server.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 .../ntimed/ntimed/use-ldflags.patch                | 16 +++++++++
 .../recipes-support/ntimed/ntimed_git.bb           | 41 ++++++++++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 meta-networking/recipes-support/ntimed/ntimed/use-ldflags.patch
 create mode 100644 meta-networking/recipes-support/ntimed/ntimed_git.bb

diff --git a/meta-networking/recipes-support/ntimed/ntimed/use-ldflags.patch b/meta-networking/recipes-support/ntimed/ntimed/use-ldflags.patch
new file mode 100644
index 0000000..87a7778
--- /dev/null
+++ b/meta-networking/recipes-support/ntimed/ntimed/use-ldflags.patch
@@ -0,0 +1,16 @@
+Obey LDFLAGS.
+
+Signed-off-by: Christopher Larson <kergoth@gmail.com>
+Upstream-Status: Pending
+
+--- Ntimed.orig/configure	2015-05-30 11:57:59.927796993 -0700
++++ Ntimed/configure	2015-05-30 11:58:26.143948894 -0700
+@@ -142,7 +142,7 @@
+ 
+ 	echo
+ 	echo "ntimed-client:	${l}"
+-	echo "	\${CC} \${CFLAGS} -o ntimed-client ${l} -lm"
++	echo "	\${CC} \${CFLAGS} -o ntimed-client ${l} \${LDFLAGS} -lm"
+ 	echo
+ 	echo "clean:"
+ 	echo "	rm -f ${l} ntimed-client"
diff --git a/meta-networking/recipes-support/ntimed/ntimed_git.bb b/meta-networking/recipes-support/ntimed/ntimed_git.bb
new file mode 100644
index 0000000..0990541
--- /dev/null
+++ b/meta-networking/recipes-support/ntimed/ntimed_git.bb
@@ -0,0 +1,41 @@
+SUMMARY = "Network time synchronization software, NTPD replacement"
+DESCRIPTION = "This is a preview/early-access/alpha/buzzword-of-the-times \
+release of a new FOSS project written to gradually take over the world of \
+networked timekeeping."
+HOMEPAGE = "https://github.com/bsdphk/Ntimed"
+SECTION = "console/network"
+
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://main.c;startline=2;endline=24;md5=eda11d21005319bb76cbb6f911f0f66d"
+
+SRC_URI = "git://github.com/bsdphk/Ntimed \
+           file://use-ldflags.patch"
+
+PV = "0.0+git${SRCPV}"
+SRCREV = "db0abbb4c80f2ecef6bc5d9639bca5bea28532a2"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE = "\
+    'CC=${CC}' \
+    'CFLAGS=${CFLAGS}' \
+    'LDFLAGS=${LDFLAGS}' \
+"
+
+do_configure () {
+    sh ./configure
+}
+
+do_compile () {
+    oe_runmake
+}
+
+do_install () {
+    install -D -m 0755 ntimed-client ${D}${sbindir}/ntimed-client
+}
+
+ALLOW_EMPTY_${PN} = "1"
+RDEPENDS_${PN} += "ntimed-client"
+
+PACKAGE_BEFORE_PN += "ntimed-client"
+FILES_ntimed-client = "${sbindir}/ntimed-client"
-- 
2.2.1


