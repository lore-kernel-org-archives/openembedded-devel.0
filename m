Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 35C5D71D8C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 02:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id AB5B911A038
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 03:10:13 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id ozrnYEv46yCc
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 03:10:12 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id BC7162E698
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 03:10:12 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AA6D81A064
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 03:10:12 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9EB851A05B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 03:10:12 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 03:10:12 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 9257C5E3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 03:10:12 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v1I2ACTR032038
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 03:10:12 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v1I2ACf1032037
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Feb 2017 03:10:12 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Feb 2017 03:10:07 +0100
Message-Id: <20170218021012.31978-3-pkj@axis.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20170218021012.31978-1-pkj@axis.com>
References: <20170218021012.31978-1-pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [meta-oe][PATCH 3/8] lvm2: Standardize how PACKAGECONFIG is defined
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 18 Feb 2017 02:10:14 -0000

The change in 4071e6b4b0 broke support for redefining PACKAGECONFIG in
a bbappend without having to resort to use PACKAGECONFIG_class-target.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index f69acde..7c4bbb9 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -16,11 +16,14 @@ S = "${WORKDIR}/LVM2.${PV}"
 
 inherit autotools-brokensep pkgconfig systemd
 
-PACKAGECONFIG_class-target ??= " \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
-                   thin-provisioning-tools \
+LVM2_PACKAGECONFIG = ""
+LVM2_PACKAGECONFIG_append_class-target = " \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
+    thin-provisioning-tools \
 "
 
+PACKAGECONFIG ??= "${LVM2_PACKAGECONFIG}"
+
 # odirect is always enabled because there currently is a bug in
 # lib/device/dev-io.c which prevents compiling without it. It is
 # better to stick to configurations that were actually tested by
-- 
2.9.0


