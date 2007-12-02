Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1IysZd-0006P4-Nf
	for openembedded-devel@openembedded.org; Sun, 02 Dec 2007 18:25:45 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lB2HMNQE002767;
	Sun, 2 Dec 2007 17:22:23 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02742-01; Sun,  2 Dec 2007 17:22:16 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lB2HMC0O002746
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Sun, 2 Dec 2007 17:22:12 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <4752D0C5.5080001@student.utwente.nl>
References: <475207FB.8020405@whitby.id.au>	<47522D46.1050309@whitby.id.au>
	<475269FD.60409@student.utwente.nl>
	<1196595074.6648.11.camel@localhost.localdomain>
	<4752B053.1040909@student.utwente.nl>
	<4752D0C5.5080001@student.utwente.nl>
Date: Sun, 02 Dec 2007 17:22:12 +0000
Message-Id: <1196616132.6648.20.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: angstrom-distro-devel@linuxtogo.org
Subject: Re: [Angstrom-devel] RFC: Add ipkg to minimal image
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
X-List-Received-Date: Sun, 02 Dec 2007 17:25:46 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2007-12-02 at 16:35 +0100, Koen Kooi wrote:
> To make it a bit more clear:
> 
> There are 3 seperate items being discusses here:
> 
>  1. how to stop a packagemanager getting into an image
>  2. selecting which packageformat the build should use
>  3. selecting which packagemanager handles which packageformat (ipkg can
> handle .debs for example)

An image built with rootfs_deb needs to dpkg+apt, an image built with
rootfs_ipk needs to use ipkg. The two will not currently work the other
way around.

Until that is addressed, points 2 and 3 are the same thing.

> ANGSTROM_PKG_FORMAT handles 2. and 3., but not 1. (yet)

The setting of IMG_PKGTYPE used or the inherit order of the package
classes determine this. Do we need the angstrom specific variable?

> I think having a flag indicating *which* packagemanager gets is (like
> Rods patch does) is a good thing, but a flag toggling the presence of
> the packagemanager wouldn't be, since you can't distinguish the
> resulting images from each other.
> I think creating e.g. <foo>-nopm.bb recipes that do 'require <foo>.bb ;
> PACKAGE_MANAGER = " "' would be the least confusing option.

I agree that specific images should have specific feature sets. This
comes back to my point about the machine=nslu2 needing to make the
console image usable.

Has anyone looked at how Poky does its IMAGE_FEATURES magic (see
poky-image.bbclass)? Adding package-manager as an IMAGE_FEATURE style
option and not as a DISTRO_FEATURE as I previously suggested could
perhaps be a way forward...

Cheers,

Richard




