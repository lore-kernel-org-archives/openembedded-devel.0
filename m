Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IE2Dd-00046Q-3L
	for openembedded-devel@openembedded.org; Thu, 26 Jul 2007 14:13:25 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l6QCC01R023508 for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2007 14:12:00 +0200
Message-ID: <46A88F8D.50003@dominion.kabel.utwente.nl>
Date: Thu, 26 Jul 2007 14:11:57 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.5 (Macintosh/20070716)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <46A88A22.5010608@dominion.kabel.utwente.nl>
In-Reply-To: <46A88A22.5010608@dominion.kabel.utwente.nl>
X-Enigmail-Version: 0.95.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [RFC] make building working zaurus images easier
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
X-List-Received-Date: Thu, 26 Jul 2007 12:13:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Marcin wrote:

> Also we should use gzip compression for installkit tarballs as this will
> allow users to unpack them on devices (gzip is in busybox).

Koen Kooi schreef:

> I therefore want to propose 3 small scripts that can be run as EXTRA_IMAGECMD to make life
> a lot easier for both developers and users:
> 
> [beware of line wrapping]

For collie:

cd ${DEPLOY_DIR_IMAGE}
mkdir ${IMAGE_NAME}-installkit/
cp `ls zImage-2* | sort -b | uniq |tail -n1` ${IMAGE_NAME}-installkit/zImage.bin
cp `ls ${IMAGE_NAME}.rootfs*jffs2 | sort -b | uniq |tail -n1`
${IMAGE_NAME}-installkit/initrd.bin
tar czf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}-installkit.tar.gz
${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}-installkit/
rm -rf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}-installkit/


 For c7x0/poodle/tosa

 #!/bin/sh > cd ${DEPLOY_DIR_IMAGE}
 mkdir ${IMAGE_NAME}-installkit/
 cp `ls zImage-2* | sort -b | uniq |tail -n1` ${IMAGE_NAME}-installkit/zImage.bin
 cp `ls ${IMAGE_NAME}.rootfs*jffs2 | sort -b | uniq |tail -n1`
 ${IMAGE_NAME}-installkit/initrd.bin
 cp updater.sh.${MACHINE} ${IMAGE_NAME}-installkit/updater.sh
 tar czf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}-installkit.tar.gz
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
 tar czf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}-installkit.tar.gz
${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}-installkit/

> Comments/improvements/flames?


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGqI+NMkyGM64RGpERAh4MAJ0Zj+gfEm3ijOcrHDmGWIqxsG2LdACcDAcD
tuSqvMZvV73LpNIqhUhbjDo=
=2GJC
-----END PGP SIGNATURE-----


