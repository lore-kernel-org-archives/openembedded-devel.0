Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HVlVp-0003r8-Ie
	for openembedded-devel@openembedded.org; Mon, 26 Mar 2007 11:29:13 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l2Q9TCN1028587;
	Mon, 26 Mar 2007 10:29:12 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28002-07; Mon, 26 Mar 2007 10:29:09 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l2Q9T7Wr028573
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Mon, 26 Mar 2007 10:29:07 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <c384c5ea0703240813w6e575805n2471bd1d6aa2614a@mail.gmail.com>
References: <c384c5ea0703240813w6e575805n2471bd1d6aa2614a@mail.gmail.com>
Date: Mon, 26 Mar 2007 10:29:06 +0100
Message-Id: <1174901346.5805.6.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: False handling of image types (pls check assumptions of	your distro)
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
X-List-Received-Date: Mon, 26 Mar 2007 09:29:13 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2007-03-24 at 16:13 +0100, Leon Woestenberg wrote:
> classes/image.bbclass:96:               rm -f
> ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.*
> classes/image.bbclass:97:               ln -s
> ${IMAGE_NAME}.rootfs.$type
> ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.$type
> 
> The second regression seems that the IMAGE_CMD_tar now compresses into
> .tar.bz2.
> 
> conf/bitbake.conf:201:IMAGE_CMD_tar
> 
> However, we have the seperate "tar.bz2" type for that.

I agree it should generate an uncompressed tarball though and poky
already has that change. I'd support changing it in OE.dev, maybe after
vetting the machine.conf files to correct any users of tar to one of the
compressed types.

Just for future reference, regression implies that it once worked which
it didn't so its just a plain bug.

Cheers,

Richard



