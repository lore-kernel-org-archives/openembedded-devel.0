Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1J0bba-0003KQ-AE
	for openembedded-devel@openembedded.org; Fri, 07 Dec 2007 12:42:54 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lB7BcvcK025923;
	Fri, 7 Dec 2007 11:38:57 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25808-03; Fri,  7 Dec 2007 11:38:54 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lB7BcoOj025914
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Fri, 7 Dec 2007 11:38:50 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Uli Luckas <u.luckas@road.de>
In-Reply-To: <4759292B.3060300@road.de>
References: <200711121044.32094.u.luckas@road.de>
	<200711121102.51877.u.luckas@road.de>
	<a7f8874a0712051306i3cebae60sfd0a10987612afd0@mail.gmail.com>
	<4759292B.3060300@road.de>
Date: Fri, 07 Dec 2007 11:38:48 +0000
Message-Id: <1197027528.4661.12.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATHC] ATAG export for the linux kernel
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
X-List-Received-Date: Fri, 07 Dec 2007 11:42:55 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2007-12-07 at 11:06 +0000, Uli Luckas wrote:
> Hans Henry, thanks for testing. Good to know it worked for you. Let's 
> see how we can get this thing pushed upstream.
> 
> 1) I put this on the OE list as the original code is maintained in OE. And
> that's why I'd like the code to be pushed to the OE repository first.
> I am not really an OE developer though. Is someone willing to do the OE
> integration to give my patch a home?

I'm happy for the userspace side of things to be added in OE. I have
some reservations about the way the kernel patch is added to the zaurus
code, particularly about the way the kernel commandline is handled from
the broken bootloader and I need to find some time to look at that. I'm
fine with the patch in principle though, I just want it right when its
added (and preferably upstream too, the existing zaurus changes will not
be accepted upstream).

> 2) I need to push the kernel patch via Russell. Mike, I have not heard your
> opinion. Will you support this patch?
>
> 3) I need to push my userspace work. My work is based on code by Richard
> though. Richard, please jump in and let us know how you'd like to proceede?

I did try and find the kexec-tools maintainer but got distracted and
never got back to it. Does anyone know who we need to send this to? I
will try and get that done this weekend...

> I'd really like to see kexec working on arm without any patches soon.  

Agreed. I'm sorry I haven't found time to look at this yet, I will try
hard to do so this weekend.

Regards,

Richard





