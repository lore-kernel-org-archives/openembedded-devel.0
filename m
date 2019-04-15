Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E36027D8EF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2019 06:59:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3F6wlVY031580
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Apr 2019 23:58:57 -0700
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Sun, 14 Apr 2019 23:58:36 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Apr 2019 14:58:34 +0800
Message-ID: <1555311514-12809-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-networking][PATCH] netkit-rsh: security fixes
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
X-List-Received-Date: Mon, 15 Apr 2019 06:59:07 -0000
Content-Type: text/plain

Fix CVE-2019-7282, CVE-2019-7283

References:
https://nvd.nist.gov/vuln/detail/CVE-2019-7282
https://nvd.nist.gov/vuln/detail/CVE-2019-7283

Patch from:
https://sources.debian.org/src/netkit-rsh/0.17-20/debian/patches/fix-CVE-2018-20685-and-CVE-2019-6111.patch

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../CVE-2019-7282-and-CVE-2019-7283.patch          | 33 ++++++++++++++++++++++
 .../recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb   |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/CVE-2019-7282-and-CVE-2019-7283.patch

diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/CVE-2019-7282-and-CVE-2019-7283.patch b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/CVE-2019-7282-and-CVE-2019-7283.patch
new file mode 100644
index 0000000..4381f5b
--- /dev/null
+++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/CVE-2019-7282-and-CVE-2019-7283.patch
@@ -0,0 +1,33 @@
+From a7831a16c3e0e1463d5eb08a58af152cb75ca976 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Mon, 15 Apr 2019 06:05:58 +0000
+Subject: [PATCH] Fix CVE-2019-7282 and CVE-2019-7283
+
+Description: Fix CVE-2018-20685 and CVE-2019-6111
+Bug-Debian: https://bugs.debian.org/920486
+Origin: https://github.com/openssh/openssh-portable/commit/6010c0303a422a9c5fa8860c061bf7105eb7f8b2#diff-9f340c228413d5a9a9206ea2ed2bc624R1114
+
+Upstream-Status: Backport [Debian]
+[https://sources.debian.org/src/netkit-rsh/0.17-20/debian/patches/fix-CVE-2018-20685-and-CVE-2019-6111.patch]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ rcp/rcp.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/rcp/rcp.c b/rcp/rcp.c
+index ca61c18..77d8ff8 100644
+--- a/rcp/rcp.c
++++ b/rcp/rcp.c
+@@ -740,6 +740,11 @@ sink(int argc, char *argv[])
+ 			size = size * 10 + (*cp++ - '0');
+ 		if (*cp++ != ' ')
+ 			SCREWUP("size not delimited");
++		if (*cp == '\0' || strchr(cp, '/') != NULL ||
++		    strcmp(cp, ".") == 0 || strcmp(cp, "..") == 0) {
++			error("error: unexpected filename: %s", cp);
++			exit(1);
++		}
+ 		if (targisdir) {
+ 			static char *namebuf;
+ 			static int cursize;
diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
index d034cd8..6f203c5 100644
--- a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
@@ -16,6 +16,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/n/netkit-rsh/netkit-rsh_${PV}.orig.tar.gz;name=
             file://netkit-rsh-0.17-rexec-ipv6.patch \
             file://fix-host-variable.patch \
             file://fixup_wait3_api_change.patch \
+            file://CVE-2019-7282-and-CVE-2019-7283.patch \
 "
 
 SRC_URI[archive.md5sum] = "65f5f28e2fe22d9ad8b17bb9a10df096"
-- 
2.7.4


