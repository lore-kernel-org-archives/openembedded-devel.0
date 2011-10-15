Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RF7O7-0000Tk-K4
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Oct 2011 18:47:07 +0200
Received: by bkat8 with SMTP id t8so3456973bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Oct 2011 09:41:21 -0700 (PDT)
Received: by 10.223.62.15 with SMTP id v15mr11975282fah.22.1318696880778;
	Sat, 15 Oct 2011 09:41:20 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id r6sm11332475fam.0.2011.10.15.09.41.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 15 Oct 2011 09:41:20 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Oct 2011 18:41:12 +0200
Message-Id: <1318696873-5478-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe 1/2] libdivecomputer: initial add
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
X-List-Received-Date: Sat, 15 Oct 2011 16:47:07 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../libdivecomputer/libdivecomputer_git.bb         |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb

diff --git a/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb b/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb
new file mode 100644
index 0000000..ac609a9
--- /dev/null
+++ b/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Libdivecomputer is a cross-platform and open source library for communication with dive computers from various manufacturers."
+HOMEPAGE = "http://www.divesoftware.org/libdc/"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+
+DEPENDS = "libusb1"
+
+inherit autotools pkgconfig
+
+PV = "0.0.0"
+SRCREV = "b7a6be15ca58cc8f89fbc8fa1a4c840e13d51092"
+SRC_URI = "git://libdivecomputer.git.sourceforge.net/gitroot/libdivecomputer/libdivecomputer"
+S = "${WORKDIR}/git"
+
+
-- 
1.6.6.1



