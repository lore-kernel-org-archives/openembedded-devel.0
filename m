Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6C95C77EBE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Apr 2017 14:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 3133F181CF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Apr 2017 16:23:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id N-hxVem-TdT7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Apr 2017 16:23:12 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 9E190181B2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Apr 2017 16:23:12 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 88C041A086
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Apr 2017 16:23:12 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7E0261A082
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Apr 2017 16:23:12 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Apr 2017 16:23:12 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 725362174
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Apr 2017 16:23:12 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v3SENC1A008063
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Apr 2017 16:23:12 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v3SENCMK008062
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Apr 2017 16:23:12 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Apr 2017 16:23:07 +0200
Message-Id: <20170428142307.8019-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [master][pyro][PATCH] meta_oe_security_flags.inc: Disable PIE for libdevmapper
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
X-List-Received-Date: Fri, 28 Apr 2017 14:23:14 -0000

Since libdevmapper was split out from lvm2, it now needs its own entry
to disable building with -fpie.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/conf/distro/include/meta_oe_security_flags.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/conf/distro/include/meta_oe_security_flags.inc b/meta-oe/conf/distro/include/meta_oe_security_flags.inc
index 815fb16c7..03868bfaf 100644
--- a/meta-oe/conf/distro/include/meta_oe_security_flags.inc
+++ b/meta-oe/conf/distro/include/meta_oe_security_flags.inc
@@ -1,5 +1,6 @@
 # Build errors with the pie options enabled
 SECURITY_CFLAGS_pn-libdbus-c++ = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-libdevmapper = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-lvm2 = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-rrdtool = "${SECURITY_NO_PIE_CFLAGS}"
 
-- 
2.12.0


