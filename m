Received: from [72.29.79.205] (helo=rhodos.klever.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <hacker@klever.net>) id 1IELWW-0003IP-W1
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Jul 2007 10:50:15 +0200
Received: from pd9538c02.dip0.t-ipconnect.de ([217.83.140.2]
	helo=olympus.klever.net)
	by rhodos.klever.net with esmtpsa (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.67) (envelope-from <hacker@klever.net>) id 1IELV8-0002x1-GM
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Jul 2007 10:48:47 +0200
Message-ID: <46A9B10A.4020308@klever.net>
Date: Fri, 27 Jul 2007 10:47:06 +0200
From: Michael Krelin <hacker@klever.net>
User-Agent: Thunderbird 2.0.0.4 (X11/20070619)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <46A88A22.5010608@dominion.kabel.utwente.nl>	<46A89F67.5080907@klever.net>	<46A8DB81.5070900@dominion.kabel.utwente.nl>	<1185475190.6132.53.camel@localhost.localdomain>
	<46A9AC1C.1070508@dominion.kabel.utwente.nl>
In-Reply-To: <46A9AC1C.1070508@dominion.kabel.utwente.nl>
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
X-List-Received-Date: Fri, 27 Jul 2007 08:50:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

>>> Michael Krelin schreef:
>>>> I have never looked into all this machinery, but since we have, e.g.
>>>> x11-image-spitz.tar.gz 
> 
> IMAGE_NAME = "${IMAGE_BASENAME}-${MACHINE}-${DATETIME}" :)
> 
>>>> and zImage-spitz.bin symlinks, I'd guess that we 
>>>> can do without these somewhat ugly when unnecessary `ls|sort|uniq|tail` 
>>>> things, can't we?
>>> Won't tar package up the symlinks instead of the real files in that case?
>> Yes, but we can use readlink to work out the real file...
> 
> How about this:
> 
> cd ${DEPLOY_DIR_IMAGE}
> mkdir ${IMAGE_NAME}-installkit/
> 
> # Get the latest kernel using the zImage-<machine>.bin symlink
> cp `readlink zImage-${MACHINE}.bin` ${IMAGE_NAME}-installkit/zImage.bin

hmm.. isn't that equivalent to

cp zImage-${MACHINE}.bin ${IMAGE_NAME}-installkit/zImage.bin

? cp surely will dereference symlink unless asked not to.

Love,
H

> 
> if [ "${MACHINE}" = "spitz" ]; then
>     cp gnu-tar ${IMAGE_NAME}-installkit/
>     cp ${IMAGE_NAME}.rootfs.tar.gz ${IMAGE_NAME}-installkit/hdimage1.tgz
> else
>     cp ${IMAGE_NAME}.rootfs.jffs2 ${IMAGE_NAME}-installkit/initrd.bin
> fi
> 
> # All zaurus machines except collie need updater.sh
> if [ "${MACHINE}" != "collie" ]; then
>     cp updater.sh.${MACHINE} ${IMAGE_NAME}-installkit/updater.sh
> fi
> 
> tar czf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}-installkit.tgz {IMAGE_NAME}-installkit/
> rm -rf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}-installkit/
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> 
> iD8DBQFGqawcMkyGM64RGpERAvEQAKC3czWwnPBjw6gvh06AcVj3aoU7pQCgvJpc
> hhLFEF/cZBgUB9TGMZMPkFk=
> =/QP0
> -----END PGP SIGNATURE-----
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


