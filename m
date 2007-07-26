Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IE2Vy-0008O1-Ot
	for openembedded-devel@openembedded.org; Thu, 26 Jul 2007 14:32:22 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l6QCV3JJ007355
	for <openembedded-devel@openembedded.org>;
	Thu, 26 Jul 2007 13:31:03 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06955-10 for <openembedded-devel@openembedded.org>;
	Thu, 26 Jul 2007 13:30:59 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l6QCUwCa007348
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Thu, 26 Jul 2007 13:30:58 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <46A88F8D.50003@dominion.kabel.utwente.nl>
References: <46A88A22.5010608@dominion.kabel.utwente.nl>
	<46A88F8D.50003@dominion.kabel.utwente.nl>
Date: Thu, 26 Jul 2007 13:30:58 +0100
Message-Id: <1185453058.6132.19.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Thu, 26 Jul 2007 12:32:23 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2007-07-26 at 14:11 +0200, Koen Kooi wrote:
>  For Spitz:
> 
>  #!/bin/sh
>  cd ${DEPLOY_DIR_IMAGE}
>  mkdir ${IMAGE_NAME}-installkit/
>  cp `ls zImage-2* | sort -b | uniq |tail -n1` ${IMAGE_NAME}-installkit/zImage.bin
>  cp `ls ${IMAGE_NAME}.rootfs*gz | sort -b | uniq |tail -n1`
>  ${IMAGE_NAME}-installkit/hdimage1.tgz
>  cp updater.sh.${MACHINE} ${IMAGE_NAME}-installkit/updater.sh
>  cp gnu-tar ${IMAGE_NAME}-installkit/
>  tar czf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}-installkit.tar.gz
> ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}-installkit/
> 
> > Comments/improvements/flames?

Why not just write one decent script instead of 3+ forks?

if [ "${MACHINE}" = "spitz" ]; then
    cp gnu-tar ${IMAGE_NAME}-installkit/
fi

etc.

This is probably suitable material for a do_deploy image.bbclass task.
The guts of the task can live in the machine specific files (such as the
zaurus common file) as a function added into the task by some new
variable. Does that seem reasonable?

Richard





