Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IhVLy-0001ko-7c
	for openembedded-devel@openembedded.org; Mon, 15 Oct 2007 21:11:50 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l9FJ5QIt032264
	for <openembedded-devel@openembedded.org>;
	Mon, 15 Oct 2007 20:05:26 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31982-07 for <openembedded-devel@openembedded.org>;
	Mon, 15 Oct 2007 20:05:19 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l9FJ5Go6032257
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Mon, 15 Oct 2007 20:05:16 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <47137EDD.9070000@student.utwente.nl>
References: <200710151419.07302.openembedded@haerwu.biz>
	<47137EDD.9070000@student.utwente.nl>
Date: Mon, 15 Oct 2007 20:05:15 +0100
Message-Id: <1192475115.25543.72.camel@localhost.localdomain>
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
X-List-Received-Date: Mon, 15 Oct 2007 19:11:51 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2007-10-15 at 16:53 +0200, Koen Kooi wrote:
> Marcin Juszkiewicz schreef:
> > In OpenedHand we got hit by virtual/update-alternatives and packaging. 
> > Poky contains two providers for virtual/u-a:
> > 
> > 1. update-alternatives-cworth
> > 2. update-alternatives-dpkg
> > 
> > First one comes from IPKG source and is written in pure shell. Second one 
> > is in Perl so it fetch too much to be usable.
> > 
> > The problem comes when you build both of them (it happens on our 
> > autobuilder due to 'world' build) - package manager (ipkg) selects random 
> > one - in our case it is always 'update-alternatives-dpkg' so generated 
> > rootfs is too big to be usable.
> 
> Heh, I asked about that a while back and was told "everything works in poky". So much for
> 'working' ;)

Well, it did. Nothing showed any errors and it all seemed to work until
I changed some things... ;-)

Cheers,

Richard



