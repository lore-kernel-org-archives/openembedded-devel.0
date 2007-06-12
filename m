Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1Hy4YB-0002jN-PQ
	for openembedded-devel@openembedded.org; Tue, 12 Jun 2007 13:28:40 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l5CBPiXq001083
	for <openembedded-devel@openembedded.org>;
	Tue, 12 Jun 2007 12:25:44 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00699-08 for <openembedded-devel@openembedded.org>;
	Tue, 12 Jun 2007 12:25:28 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l5CBPNBw001053
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Tue, 12 Jun 2007 12:25:24 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <HOECLKEKOHLAMMGDLLBHEEEHLFAA.skoroneos@digital-opsis.com>
References: <HOECLKEKOHLAMMGDLLBHEEEHLFAA.skoroneos@digital-opsis.com>
Date: Tue, 12 Jun 2007 12:25:23 +0100
Message-Id: <1181647523.5628.8.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Gumstix machine support
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
X-List-Received-Date: Tue, 12 Jun 2007 11:28:44 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2007-06-12 at 12:46 +0300, Stelios Koroneos wrote:
> > >          There's also a problem when building images in that the
> > > "mkimage" command doesn't get installed, so I've been putting it
> > > elsewhere and adding it to my PATH.
> >
> > I think U-boot build installs mkimage into the staging directory, so
> > this issue should go away when you get your U-boot builds working.
> >
> 
> Yes it does install mkimage
> Magicbox and dht-walnut kernels process the kernel image with mkimage in
> order to output a u-boot "readable" image
> 
> I've be thinking of turning this into a class as there are more and more
> machines in OE that use u-boot and could benefit of something like that and
> people would not have to re-invent the wheel every time

The neatest way to do this is to add:

DEPENDS = "some u-boot native"
KERNEL_IMAGETYPE = "uImage"

to the kernel concerned.

Cheers,

Richard



