Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1OC6TN-0007E5-AW
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 May 2010 09:35:28 +0200
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 5CAF7491282
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 May 2010 09:31:25 +0200 (CEST)
Received: from fsc-480-012-88.intern.dresearch.de ([10.32.10.177]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.4675); 
	Wed, 12 May 2010 09:32:45 +0200
Received: by fsc-480-012-88.intern.dresearch.de (Postfix, from userid 10000)
	id 05B9672078; Wed, 12 May 2010 09:31:24 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 May 2010 09:31:23 +0200
Message-Id: <1273649483-25885-1-git-send-email-sledz@dresearch.de>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <1273585602-23919-1-git-send-email-sledz@dresearch.de>
References: <1273585602-23919-1-git-send-email-sledz@dresearch.de>
X-OriginalArrivalTime: 12 May 2010 07:32:45.0621 (UTC)
	FILETIME=[50840E50:01CAF1A5]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2] update-rc.d: allow link targets to be symlinks itself
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
X-List-Received-Date: Wed, 12 May 2010 07:35:29 -0000

Needed to be able to combine update-rc.d with update-alternatives.

Signed-off-by: Steffen Sledz <sledz@dresearch.de>
---
 recipes/update-rc.d/files/symlink.patch |   18 ++++++++++++++++++
 recipes/update-rc.d/update-rc.d_0.7.bb  |    5 +++--
 2 files changed, 21 insertions(+), 2 deletions(-)
 create mode 100644 recipes/update-rc.d/files/symlink.patch

diff --git a/recipes/update-rc.d/files/symlink.patch b/recipes/update-rc.d/files/symlink.patch
new file mode 100644
index 0000000..06d62e6
--- /dev/null
+++ b/recipes/update-rc.d/files/symlink.patch
@@ -0,0 +1,18 @@
+diff -Nurd update-rc.d.orig//update-rc.d update-rc.d/update-rc.d
+--- update-rc.d.orig//update-rc.d	2010-05-11 15:22:22.000000000 +0200
++++ update-rc.d/update-rc.d	2010-05-11 15:24:14.000000000 +0200
+@@ -148,12 +148,12 @@
+ shift
+ 
+ if [ $1 != "remove" ]; then
+-	if [ ! -f "$initd/$bn" ]; then
++	if [ ! \( -f "$initd/$bn" -o -L "$initd/$bn" \) ]; then
+ 		echo "update-rc.d: $initd/$bn: file does not exist" >&2
+ 		exit 1
+ 	fi
+ else
+-	if [ -f "$initd/$bn" ]; then
++	if [ -f "$initd/$bn" -o -L "$initd/$bn" ]; then
+ 		if [ $force -eq 1 ]; then
+ 			echo "update-rc.d: $initd/$bn exists during rc.d purge (continuing)" >&2
+ 		else
diff --git a/recipes/update-rc.d/update-rc.d_0.7.bb b/recipes/update-rc.d/update-rc.d_0.7.bb
index 3217dc1..794f6db 100644
--- a/recipes/update-rc.d/update-rc.d_0.7.bb
+++ b/recipes/update-rc.d/update-rc.d_0.7.bb
@@ -4,12 +4,13 @@ DESCRIPTION = "Manage symlinks in /etc/rcN.d"
 LICENSE = "GPL"
 S = "${WORKDIR}/update-rc.d"
 INHIBIT_DEFAULT_DEPS = "1"
-PR = "r1"
+PR = "r2"
 
 BBCLASSEXTEND = "native"
 
 SRC_URI = "${HANDHELDS_CVS};module=apps/update-rc.d;tag=r0_7 \
-           file://add-verbose.patch;patch=1"
+           file://add-verbose.patch;patch=1 \
+           file://symlink.patch;patch=1"
 
 PACKAGE_ARCH = "all"
 
-- 
1.6.4.2



