Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1Ol2Kh-0000Wh-Bb
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 18:15:03 +0200
Received: by qwi2 with SMTP id 2so50254qwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 09:14:25 -0700 (PDT)
Received: by 10.229.248.84 with SMTP id mf20mr3830534qcb.16.1281975265608;
	Mon, 16 Aug 2010 09:14:25 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id e6sm7488239qcr.5.2010.08.16.09.14.23
	(version=SSLv3 cipher=RC4-MD5); Mon, 16 Aug 2010 09:14:24 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Aug 2010 11:14:22 -0500
Message-Id: <1281975262-31559-1-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] libgcrypt: Add symlink for mpi files
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
X-List-Received-Date: Mon, 16 Aug 2010 16:15:22 -0000

'configure' doesn't seem to include the necessary '../mpi' in the
symlinks that get generated.  This hack will make the symlinks that do
get created work.

Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
---
 recipes/libgcrypt/libgcrypt.inc |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/recipes/libgcrypt/libgcrypt.inc b/recipes/libgcrypt/libgcrypt.inc
index f29dc8d..0c44fff 100644
--- a/recipes/libgcrypt/libgcrypt.inc
+++ b/recipes/libgcrypt/libgcrypt.inc
@@ -4,6 +4,8 @@ PRIORITY = "optional"
 LICENSE = "GPL LGPL FDL"
 DEPENDS = "libgpg-error"
 
+PR = "r1"
+
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libgcrypt/libgcrypt-${PV}.tar.gz \
            file://add-pkgconfig-support.patch \
            file://mips-h-constraint.patch"
@@ -14,6 +16,10 @@ EXTRA_OECONF = "--without-pth --disable-asm --with-capabilities"
 
 ARM_INSTRUCTION_SET = "arm"
 
+do_configure_append() {
+	ln -s ${S}/mpi ${S}/mpi/mpi
+}
+
 do_install_append() {
 	install -d ${D}/${libdir}/pkgconfig/
 	cp ${S}/src/*.pc ${D}/${libdir}/pkgconfig/
-- 
1.5.6.4



