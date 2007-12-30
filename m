Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1J8vlh-0006W4-D8
	for openembedded-devel@openembedded.org; Sun, 30 Dec 2007 11:51:45 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lBUAjfJh032123
	for <openembedded-devel@openembedded.org>; Sun, 30 Dec 2007 10:45:41 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31741-09 for <openembedded-devel@openembedded.org>;
	Sun, 30 Dec 2007 10:45:33 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lBUAjUTW032107
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Sun, 30 Dec 2007 10:45:31 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <200712291630.29205.valentin.longchamp@epfl.ch>
References: <200712291630.29205.valentin.longchamp@epfl.ch>
Date: Sun, 30 Dec 2007 10:45:29 +0000
Message-Id: <1199011529.4654.4.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: New arch in OE
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
X-List-Received-Date: Sun, 30 Dec 2007 10:51:46 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Sat, 2007-12-29 at 16:30 +0100, Valentin Longchamp wrote:
> I would like to add a new arch to OE since I have been building a distro for 
> our new system using this system.

I think we need to clear up some terminology here!

To most OE devs an "arch" or architecture is the fundamental processor
type/instruction set. In your case this is ARM and OE already has good
ARM support.

I also doubt you want to create your own distribution since its a lot of
work and its more about policy rather than image content.

> The system is a robotics aimed custom-designed board which is based on a 
> i.MX31 SoC. I have a custom kernel, so I will need a new kernel recipe 
> (already exists, based on mx31ads kernel recipe by Liam) and I have added a 
> few custom config files for our needs (for USB networking config and drivers 
> for instance).
> 
> I would like to include all these changes to the OE "mainline" and become the 
> maintainer for this arch. How could I do this easily ?

The first step is to post what you have to the bugzilla, we can then
review it.

> My second question is more about the chosen distro. I have been using 
> Angstrom, because it is one the most well known disto based on OE and use the 
> minimal images of Angstrom to have a usable but light system. Is this good or 
> is there a distro that is better suited to my needs (for instance I don't 
> need for now avahi or these kind of things) ?

It sounds like you might want to create a customised image. The contents
of an image is not really related to the distribution.

> Thank you, best regards and I wish you all the best for 2008 (keep rocking on 
> with OE !)

Thanks!

Cheers,

Richard




