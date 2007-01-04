Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1H2aEl-0004vb-6m
	for openembedded-devel@openembedded.org; Thu, 04 Jan 2007 22:34:59 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l04LXeAs002267;
	Thu, 4 Jan 2007 21:33:40 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02127-04; Thu,  4 Jan 2007 21:33:35 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l04LXY4c002244
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Thu, 4 Jan 2007 21:33:34 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: koen@dominion.kabel.utwente.nl, angstrom-distro-devel@linuxtogo.org
In-Reply-To: <459D7001.8040507@dominion.kabel.utwente.nl>
References: <53610736.20061228191750@gmail.com>
	<459403F2.4080102@dominion.kabel.utwente.nl>
	<1167337946.5596.77.camel@localhost.localdomain>
	<1065634639.20061229040545@gmail.com>
	<1167392044.5616.16.camel@localhost.localdomain>
	<271237233.20070104210332@gmail.com>
	<1167944118.7757.164.camel@localhost.localdomain>
	<459D7001.8040507@dominion.kabel.utwente.nl>
Date: Thu, 04 Jan 2007 21:33:36 +0000
Message-Id: <1167946416.7757.177.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel@openembedded.org
Subject: Re: [Angstrom-devel] [RFC] Get rid of adhoc machine-specific	messing with [linux-handhelds-2.6] kernel packages
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
X-List-Received-Date: Thu, 04 Jan 2007 21:34:59 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2007-01-04 at 22:22 +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Richard Purdie schreef:
> > On Thu, 2007-01-04 at 21:03 +0200, Paul Sokolovsky wrote:
> >>   No. My original mail said that it lead to broken snapshots released
> >> for hx4700, so I RFCed its removal for it, and for another PocketPC
> >> machine, htcuniversal, because I'm pretty sure it can live without it.
> > 
> > Why were the snapshots broken? Was the problem not the total lack of a
> > zImage file. The fact that doesn't automatically deploy atm is actually
> > a bitbake trunk issue as it doesn't see any dependency to trigger that.
> 
> Worked around in the buildscripts by doing 'bitbake virtual/kernel' before the image.

the proper fix might be something like:

do_rootfs[recrdeptas] = "do_package_write do_deploy" in image.bbclass

but that could also blow up. I'll think a bit more about it :)

Cheers,

Richard




