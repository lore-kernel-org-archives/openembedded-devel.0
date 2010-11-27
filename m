Received: from mail.infrascan.de ([188.40.84.136] helo=infrascan.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <schwarzkopf@sensortherm.de>) id 1PMJp9-0008Ay-HY
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Nov 2010 13:24:17 +0100
Received: from localhost.localdomain (77-22-235-200-dynip.superkabel.de
	[77.22.235.200])
	by email.infrascan.de (Postfix) with ESMTPSA id A7FB21B421;
	Sat, 27 Nov 2010 13:24:17 +0100 (CET)
From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Nov 2010 13:22:14 +0100
Message-Id: <1290860534-8484-1-git-send-email-schwarzkopf@sensortherm.de>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 188.40.84.136
X-SA-Exim-Mail-From: schwarzkopf@sensortherm.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] dash_0.5.5.1: New download link for patch
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
X-List-Received-Date: Sat, 27 Nov 2010 12:24:17 -0000

The newest patch on the old download directory is dash_0.5.5.1-7.3.diff.gz
---
 recipes/dash/dash_0.5.5.1.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/dash/dash_0.5.5.1.bb b/recipes/dash/dash_0.5.5.1.bb
index 319917d..bf00d4c 100644
--- a/recipes/dash/dash_0.5.5.1.bb
+++ b/recipes/dash/dash_0.5.5.1.bb
@@ -1,9 +1,10 @@
 DESCRIPTION = "The Debian Almquist Shell is a POSIX compliant shell that is much smaller than 'bash'."
 PROVIDES = "virtual/sh"
 LICENSE = "BSD GPL"
+PR = "r0"
 
 SRC_URI = "http://ftp.debian.org/debian/pool/main/d/dash/dash_${PV}.orig.tar.gz;name=archive \
-	http://ftp.debian.org/debian/pool/main/d/dash/dash_${PV}-2.3.diff.gz;name=patch \
+	https://launchpad.net/debian/sid/+source/dash/0.5.5.1-2.3/+files/dash_${PV}-2.3.diff.gz;name=patch \
 	file://makefile-build-cc.diff"
 
 SRC_URI[archive.md5sum] = "7ac832b440b91f5a52cf8eb68e172616"
-- 
1.7.0.4



