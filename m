Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IhScn-0002ip-59
	for openembedded-devel@openembedded.org; Mon, 15 Oct 2007 18:17:01 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l9FGAbas020553
	for <openembedded-devel@openembedded.org>;
	Mon, 15 Oct 2007 17:10:37 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20279-08 for <openembedded-devel@openembedded.org>;
	Mon, 15 Oct 2007 17:10:33 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l9FGAWw3020547
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Mon, 15 Oct 2007 17:10:32 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <200710151419.07302.openembedded@haerwu.biz>
References: <200710151419.07302.openembedded@haerwu.biz>
Date: Mon, 15 Oct 2007 17:10:32 +0100
Message-Id: <1192464632.25543.58.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] Handling of virtual/* namespace in packages
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
X-List-Received-Date: Mon, 15 Oct 2007 16:17:01 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2007-10-15 at 14:19 +0200, Marcin Juszkiewicz wrote:
> In OpenedHand we got hit by virtual/update-alternatives and packaging. 
> Poky contains two providers for virtual/u-a:
> 
> 1. update-alternatives-cworth
> 2. update-alternatives-dpkg
> 
> First one comes from IPKG source and is written in pure shell. Second one 
> is in Perl so it fetch too much to be usable.
> 
> The problem comes when you build both of them (it happens on our 
> autobuilder due to 'world' build) - package manager (ipkg) selects random 
> one - in our case it is always 'update-alternatives-dpkg' so generated 
> rootfs is too big to be usable.
> 
> Solution which came to my mind is quite simple. Our distro (Poky) already 
> prefers 'u-a-cworth' as provider for 'virtual/update-alternatives'. So if 
> package depends on 'virtual/update-alternatives' then let package.bbclass 
> mangle its dependencies in such way that 'u-a-cworth' (preferred by 
> distro) would be writen in package.
> 
> What do you think about it?

I really liked this idea and I did some experiments but they had mixed
results. The problem is if we have:

RDEPENDS_${PN} = "virtual/xyz" 

then bitbake gets upset as it can't work out what to build to fulfil
that. 

We also need to avoid cross contaminating the DEPENDS and RDEPENDS
namespaces, they're separate and people *need* to think of them
separately.

I've started thinking of lots of perverse edge cases with the above too,
the problem is PREFERRED_PROVIDER is just a preference, not an absolute
and bitbake can ignore it to make a build work, especially in -k
(continue on failure) mode.

I was thinking we could have bitbake eject a set of variables:

VRPROVIDER_xyz = "abc"
VRPROVIDER_wxy = "bcd"

etc. which would tell us which provider bitbake was planning on using.
We could also adjust bitbake internals to cope with "virtual-runtime/"
variables in the RDEPENDS space but even that isn't going to be enough.
Consider:

PREFERRED_PROVIDER_virtual/xserver = "xserver-kdrive"

and bitbake setting:

VRPROVIDER_xserver = "xserver-kdrive"

None of this fixes the existing problem of how to get
"xserver-kdrive-fbdev" back and bitbake is always going to need help to
work that one out...


So perhaps we should just standardise the existing xserver behaviour
into a dedicated namespace:

DEPENDS = "virtual/xserver"
RDEPENDS_xyz = "${VIRTUAL-RUNTIME_xserver}"

and the machine.conf in this case would say

PREFERRED_PROVIDER_virtual/xserver = "xserver-kdrive"
VIRTUAL-RUNTIME_xserver = "xserver-kdrive-fbdev"

I'd love to find a nicer solution but I just can't come up with one that
will work...

Cheers,

Richard





