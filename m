Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IE2ja-0000Gf-9h
	for openembedded-devel@openembedded.org; Thu, 26 Jul 2007 14:46:26 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l6QCj01R028995 for <openembedded-devel@openembedded.org>;
	Thu, 26 Jul 2007 14:45:00 +0200
Message-ID: <46A89749.3050005@dominion.kabel.utwente.nl>
Date: Thu, 26 Jul 2007 14:44:57 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.5 (Macintosh/20070716)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <46A88A22.5010608@dominion.kabel.utwente.nl>	<46A88F8D.50003@dominion.kabel.utwente.nl>
	<1185453058.6132.19.camel@localhost.localdomain>
In-Reply-To: <1185453058.6132.19.camel@localhost.localdomain>
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
X-List-Received-Date: Thu, 26 Jul 2007 12:46:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
> On Thu, 2007-07-26 at 14:11 +0200, Koen Kooi wrote:
>>  For Spitz:
>>
>>  #!/bin/sh
>>  cd ${DEPLOY_DIR_IMAGE}
>>  mkdir ${IMAGE_NAME}-installkit/
>>  cp `ls zImage-2* | sort -b | uniq |tail -n1` ${IMAGE_NAME}-installkit/zImage.bin
>>  cp `ls ${IMAGE_NAME}.rootfs*gz | sort -b | uniq |tail -n1`
>>  ${IMAGE_NAME}-installkit/hdimage1.tgz
>>  cp updater.sh.${MACHINE} ${IMAGE_NAME}-installkit/updater.sh
>>  cp gnu-tar ${IMAGE_NAME}-installkit/
>>  tar czf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}-installkit.tar.gz
>> ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}-installkit/
>>
>>> Comments/improvements/flames?
> 
> Why not just write one decent script instead of 3+ forks?
> 
> if [ "${MACHINE}" = "spitz" ]; then
>     cp gnu-tar ${IMAGE_NAME}-installkit/
> fi

I was thinking of that just now :)

> etc.
> 
> This is probably suitable material for a do_deploy image.bbclass task.
> The guts of the task can live in the machine specific files (such as the
> zaurus common file) as a function added into the task by some new
> variable. Does that seem reasonable?

Very reasonable! Would this also be the time to discuss a kernel deploy task?

regards,

Koen


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGqJdJMkyGM64RGpERAgEOAKCWaIaePMGH4QVbjnDGy8s45Xdh0wCffQ3T
s3yx50FzrnKb/r98XL+JfiA=
=nZsH
-----END PGP SIGNATURE-----


