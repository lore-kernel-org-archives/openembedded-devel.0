Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IELAo-0002t2-6D
	for openembedded-devel@openembedded.org; Fri, 27 Jul 2007 10:27:46 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l6R8Q71R009236 for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2007 10:26:08 +0200
Message-ID: <46A9AC1C.1070508@dominion.kabel.utwente.nl>
Date: Fri, 27 Jul 2007 10:26:04 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.5 (Macintosh/20070716)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <46A88A22.5010608@dominion.kabel.utwente.nl>	<46A89F67.5080907@klever.net>	<46A8DB81.5070900@dominion.kabel.utwente.nl>
	<1185475190.6132.53.camel@localhost.localdomain>
In-Reply-To: <1185475190.6132.53.camel@localhost.localdomain>
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
X-List-Received-Date: Fri, 27 Jul 2007 08:27:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
> On Thu, 2007-07-26 at 19:36 +0200, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Michael Krelin schreef:
>>> I have never looked into all this machinery, but since we have, e.g.
>>> x11-image-spitz.tar.gz 

IMAGE_NAME = "${IMAGE_BASENAME}-${MACHINE}-${DATETIME}" :)

>>> and zImage-spitz.bin symlinks, I'd guess that we 
>>> can do without these somewhat ugly when unnecessary `ls|sort|uniq|tail` 
>>> things, can't we?
>> Won't tar package up the symlinks instead of the real files in that case?
> 
> Yes, but we can use readlink to work out the real file...

How about this:

cd ${DEPLOY_DIR_IMAGE}
mkdir ${IMAGE_NAME}-installkit/

# Get the latest kernel using the zImage-<machine>.bin symlink
cp `readlink zImage-${MACHINE}.bin` ${IMAGE_NAME}-installkit/zImage.bin

if [ "${MACHINE}" = "spitz" ]; then
    cp gnu-tar ${IMAGE_NAME}-installkit/
    cp ${IMAGE_NAME}.rootfs.tar.gz ${IMAGE_NAME}-installkit/hdimage1.tgz
else
    cp ${IMAGE_NAME}.rootfs.jffs2 ${IMAGE_NAME}-installkit/initrd.bin
fi

# All zaurus machines except collie need updater.sh
if [ "${MACHINE}" != "collie" ]; then
    cp updater.sh.${MACHINE} ${IMAGE_NAME}-installkit/updater.sh
fi

tar czf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}-installkit.tgz {IMAGE_NAME}-installkit/
rm -rf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}-installkit/
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGqawcMkyGM64RGpERAvEQAKC3czWwnPBjw6gvh06AcVj3aoU7pQCgvJpc
hhLFEF/cZBgUB9TGMZMPkFk=
=/QP0
-----END PGP SIGNATURE-----


