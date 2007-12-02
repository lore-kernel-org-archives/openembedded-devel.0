Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1Iyn5u-0007Ya-CD
	for openembedded-devel@openembedded.org; Sun, 02 Dec 2007 12:34:42 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lB2BVMWx015266;
	Sun, 2 Dec 2007 11:31:22 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04713-10; Sun,  2 Dec 2007 11:31:18 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lB2BVEqu015260
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Sun, 2 Dec 2007 11:31:15 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <475269FD.60409@student.utwente.nl>
References: <475207FB.8020405@whitby.id.au> <47522D46.1050309@whitby.id.au>
	<475269FD.60409@student.utwente.nl>
Date: Sun, 02 Dec 2007 11:31:14 +0000
Message-Id: <1196595074.6648.11.camel@localhost.localdomain>
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
X-List-Received-Date: Sun, 02 Dec 2007 11:34:42 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2007-12-02 at 09:17 +0100, Koen Kooi wrote:
> Rod Whitby schreef:
> > Rod Whitby wrote:
> >> I just realised that minimal-image.bb doesn't include ipkg, whereas the
> >> first image which does include ipkg (console-image) includes a whole lot
> >> of other stuff which could be installed using ipkg after first boot and
> >> network access, and which make the image too big for a machine with
> >> limited flash space (like an NSLU2).
> > 
> > RFC #1:
> >> Is there a reason why minimal-image does not include ipkg?  What exactly
> >> is the definition of what should be in minimal-image which excludes the
> >> ability to install further packages?
> 
> Marcin and I had a discussion about that, but I can't remember the
> outcome. So "I have no strong opinions on that".

I think minimal was really intended for people trying to boot systems
for the first time and really is 'the bare essentials to boot'. Having
said that I appreciate the problem of creating an image cut down enough
for the NSLU2. 

Ideally, MACHINE=nslu2 should make the console image become small enough
to be usable for the device even if that different compared to the
minimal image is just the package manager due to size constraints...

On a related but different note, the presence of a package manager or
not sounds like an DISTRO_FEATURE. Perhaps we should add
"package-manager" as a DISTRO_FEATURE and then use this to decide
whether a package manager should be installed into an image. The package
manager to install should determined by the class building the image so
you end up with a package manager appropriate to the image - ipkg or
dpkg+apt currently.

Does that seem reasonable?

Cheers,

Richard



