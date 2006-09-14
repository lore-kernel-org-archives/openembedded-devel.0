Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GNtD6-0000C8-MP
	for openembedded-devel@openembedded.org; Thu, 14 Sep 2006 17:33:04 +0200
Received: from [172.20.1.6] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	k8EFTKw4012129 for <openembedded-devel@openembedded.org>;
	Thu, 14 Sep 2006 17:29:20 +0200
Message-ID: <45097550.40702@dominion.kabel.utwente.nl>
Date: Thu, 14 Sep 2006 17:29:20 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.5 (Macintosh/20060719)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.94.0.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: uclibc questions
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Sep 2006 15:33:04 -0000
Content-Type: multipart/mixed; boundary="------------060906060304000807010504"

--------------060906060304000807010504
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

For the past week I've been trying to build against uclibc svn, and with a lot of help
from Adrian and googling I now have a nano ipk in my deploydir. I did need the attached
patch (which lacks DEPENDS += virtual/kernel), and I'm wondering if that's the right way
to solve it. Any comments from people that are using uclibc?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (Darwin)

iD8DBQFFCXVQMkyGM64RGpERAq8CAKCz5KsVzvEMXLUIf5snuD6Erk8pygCffj9y
lKlngTp9h8xO2ppmJE5f2w0=
=8N2p
-----END PGP SIGNATURE-----
# 
# old_revision [48ef04347217f482864106eff428115a91d608d0]
# 
# patch "packages/uclibc/uclibc_svn.bb"
#  from [5a7f4512e8db684a2b373962bc1087b490106a06]
#    to [6b0058e8cb24e58ce64a906da9911d86d52264e7]
# 
============================================================
--- packages/uclibc/uclibc_svn.bb	5a7f4512e8db684a2b373962bc1087b490106a06
+++ packages/uclibc/uclibc_svn.bb	6b0058e8cb24e58ce64a906da9911d86d52264e7
@@ -9,29 +9,22 @@ PR = "r2"
 UCLIBC_BASE ?= "0.9.28"
 PV = "${UCLIBC_BASE}+svn${SRCDATE}"
 PR = "r2"
+
 #DEFAULT_PREFERENCE is 0 (empty), releases have a preference of 1 so take
 # precedence.
 
 require uclibc.inc
 
+PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
+
+#recent versions uclibc require real kernel headers 
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-cvs', '${FILE_DIRNAME}/uclibc-${UCLIBC_BASE}', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
 
-# This is the correct KERNEL_SOURCE location, if the uClibc
-# fix_includes.sh script is run (see nokernelheader.patch below)
-# this must be correct.
-KERNEL_SOURCE = "${CROSS_DIR}/${TARGET_SYS}"
+#as stated above, uclibc needs real kernel-headers
+KERNEL_SOURCE = "${STAGING_KERNEL_DIR}"
 
 SRC_URI += "svn://uclibc.org/trunk;module=uClibc"
 
 S = "${WORKDIR}/uClibc"
 
-#*** PATCHES ***
-#
-# The nokernelheadercheck patch removes the check on the include
-# files in ${KERNEL_SOURCE}, however this check seems to be
-# functioning correct now so the patch is not included.  It may
-# be necessary to add this for architectures which do not initially
-# have a 'good' set of kernel header files in the cross directory.
-#UCLIBC_PATCHES += "file://nokernelheadercheck.patch;patch=1"
-#
-

--------------060906060304000807010504--
