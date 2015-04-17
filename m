Return-Path: <Dmitry_Eremin@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 550316AC28
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Apr 2015 13:39:52 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1Yj6Ur-0006Ll-5Z from Dmitry_Eremin@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Apr 2015 06:39:53 -0700
Received: from fangorn.rup.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.3.224.2; Fri, 17 Apr 2015 14:39:52 +0100
From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 17 Apr 2015 16:39:50 +0300
Message-ID: <1429277990-3148-1-git-send-email-dmitry_eremin@mentor.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] meta-oe: override SECURITY_CFLAGS for a set of recipes
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
X-List-Received-Date: Fri, 17 Apr 2015 13:39:54 -0000
Content-Type: text/plain

Some of recipes produce errors if the distro has enabled usage of
security_flags.inc file. Fix those errors (and QA warnings) by providing
an additional include file that is require'd from conf/layer.conf.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
---
 meta-oe/conf/distro/include/meta_oe_security_flags.inc | 7 +++++++
 meta-oe/conf/layer.conf                                | 3 +++
 2 files changed, 10 insertions(+)
 create mode 100644 meta-oe/conf/distro/include/meta_oe_security_flags.inc

diff --git a/meta-oe/conf/distro/include/meta_oe_security_flags.inc b/meta-oe/conf/distro/include/meta_oe_security_flags.inc
new file mode 100644
index 0000000..dcc0e7a
--- /dev/null
+++ b/meta-oe/conf/distro/include/meta_oe_security_flags.inc
@@ -0,0 +1,7 @@
+# Build errors with the pie options enabled
+SECURITY_CFLAGS_pn-lvm2 = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-rrdtool = "${SECURITY_NO_PIE_CFLAGS}"
+
+# This has text relco errors with the pie options enabled
+SECURITY_CFLAGS_pn-mozjs = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-openldap = "${SECURITY_NO_PIE_CFLAGS}"
diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index e2a89cd..7af9b3d 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -44,3 +44,6 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
 "
 
 FREESMARTPHONE_GIT = "git://git.freesmartphone.org"
+
+# Override security flags
+require conf/distro/include/meta_oe_security_flags.inc
-- 
2.1.4


