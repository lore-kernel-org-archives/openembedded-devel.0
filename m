Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IE1rG-0003fx-Nl
	for openembedded-devel@openembedded.org; Thu, 26 Jul 2007 13:50:19 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l6QBmr1R019144 for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2007 13:48:54 +0200
Message-ID: <46A88A22.5010608@dominion.kabel.utwente.nl>
Date: Thu, 26 Jul 2007 13:48:50 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.5 (Macintosh/20070716)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.95.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: [RFC] make building working zaurus images easier
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jul 2007 11:50:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

Building a working zaurus image is tedious since you have *manually* rename a bunch of
files before the on-board flashing software will accept it.

I therefore want to propose 2 small scripts that can be run as EXTRA_IMAGECMD to make life
a lot easier for both developers and users:

[beware of line wrapping]

For c7x0:

#!/bin/sh
cd ${DEPLOY_DIR_IMAGE}
mkdir ${IMAGE_NAME}-installkit/
cp `ls zImage-2* | sort -b | uniq |tail -n1` ${IMAGE_NAME}-installkit/zImage.bin
cp `ls ${IMAGE_NAME}.rootfs*jffs2 | sort -b | uniq |tail -n1`
${IMAGE_NAME}-installkit/initrd.bin
cp updater.sh.${MACHINE} ${IMAGE_NAME}-installkit/updater.sh
tar cjf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}-installkit.tar.bz2
${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}-installkit/
rm -rf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}-installkit/


For Spitz:

#!/bin/sh
cd ${DEPLOY_DIR_IMAGE}
mkdir ${IMAGE_NAME}-installkit/
cp `ls zImage-2* | sort -b | uniq |tail -n1` ${IMAGE_NAME}-installkit/zImage.bin
cp `ls ${IMAGE_NAME}.rootfs*gz | sort -b | uniq |tail -n1`
${IMAGE_NAME}-installkit/hdimage1.tgz
cp updater.sh.${MACHINE} ${IMAGE_NAME}-installkit/updater.sh
cp gnu-tar ${IMAGE_NAME}-installkit/
tar cjf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}-installkit.tar.bz2
${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}-installkit/
rm -rf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}-installkit/


These are just proof of concept scripts, but would something like this be acceptable to
the zaurus maintainers in OE? Having something like this would make live for distro people
a lot easier and should confuse OE newbies a bit less.

I have added something similar for bootldr based ipaqs in OE that writes out a reflash.ctl
automagically, which has been a great success.

Comments/improvements/flames?

regards,

Koen



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGqIoiMkyGM64RGpERApzOAJ9LGbvsDEOdsILrWbausHIFB8gCxACeIrR+
53PH8E27hgzdmkaYtC4EciE=
=6q4E
-----END PGP SIGNATURE-----


