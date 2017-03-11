Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3A8AF778AF
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 04:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 288C718415
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 05:59:02 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id oSm5xdtYEBSs
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 05:59:01 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 66A0C182F3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 05:59:01 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 543BC1A075
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 05:59:01 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4941D1A07C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 05:59:01 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 05:59:01 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 3DB6F747
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 05:59:01 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v2B4x1iK003798
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 05:59:01 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v2B4x1td003797
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Mar 2017 05:59:01 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Mar 2017 05:58:52 +0100
Message-Id: <20170311045855.3665-2-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170311045855.3665-1-pkj@axis.com>
References: <20170311045855.3665-1-pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 2/5] meson.bbclass: Add support for more standard installation directories
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
X-List-Received-Date: Sat, 11 Mar 2017 04:59:03 -0000

A couple of more standard installation directories are supported with
meson 0.37.1, so make sure they are configured.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/classes/meson.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/classes/meson.bbclass b/meta-oe/classes/meson.bbclass
index 4be4b1068..1362fd22b 100644
--- a/meta-oe/classes/meson.bbclass
+++ b/meta-oe/classes/meson.bbclass
@@ -18,13 +18,17 @@ def noprefix(var, d):
 
 MESONOPTS = " --prefix ${prefix} \
               --bindir ${@noprefix('bindir', d)} \
+              --sbindir ${@noprefix('sbindir', d)} \
               --datadir ${@noprefix('datadir', d)} \
               --libdir ${@noprefix('libdir', d)} \
               --libexecdir ${@noprefix('libexecdir', d)} \
               --includedir ${@noprefix('includedir', d)} \
               --mandir ${@noprefix('mandir', d)} \
+              --infodir ${@noprefix('infodir', d)} \
               --localedir ${@noprefix('localedir', d)} \
-              --sysconfdir ${sysconfdir}"
+              --sysconfdir ${sysconfdir} \
+              --localstatedir ${localstatedir} \
+              --sharedstatedir ${sharedstatedir}"
 
 MESON_C_ARGS = "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 
-- 
2.12.0


