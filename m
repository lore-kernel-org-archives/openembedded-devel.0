Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HThLC-0003Uu-4r
	for openembedded-devel@openembedded.org; Tue, 20 Mar 2007 17:37:44 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l2KGbfmx028075
	for <openembedded-devel@openembedded.org>; Tue, 20 Mar 2007 16:37:41 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27779-03 for <openembedded-devel@openembedded.org>;
	Tue, 20 Mar 2007 16:37:38 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l2KGbbk0028067
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Tue, 20 Mar 2007 16:37:37 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <45FF3942.5040900@whitby.id.au>
References: <74d0deb30701310740p73af77a7j25a8b4597345903a@mail.gmail.com>
	<1174346093.5824.89.camel@localhost.localdomain>
	<45FF29BF.1040008@whitby.id.au>
	<74BCF2CF-3650-4464-9E51-CA853E3DCDFA@gmx.net>
	<45FF3942.5040900@whitby.id.au>
Date: Tue, 20 Mar 2007 16:37:36 +0000
Message-Id: <1174408657.5852.22.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] Epoch support for bitbake
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
X-List-Received-Date: Tue, 20 Mar 2007 16:37:50 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2007-03-20 at 12:00 +1030, Rod Whitby wrote:
> Holger Freyther wrote:
> > Am 20.03.2007 um 01:24 schrieb Rod Whitby:
> >> Richard Purdie wrote:
> >>> Thanks for this, I just checked it in unchanged to bitbake trunk
> >>> (1.9.x). If people test it and are happy, I'm happy for it to be
> >>> backported for 1.8.2 too, at which point OE.dev can maybe start to  
> >>> rely
> >>> upon it.
> >> Dunno whether this is important or not, but OpenMoko (which is now  
> >> using svn overlaying OE .dev, not a frozen OE version) uses bitbake 1.6.x  
> >> with custom svnnow patches.
> > I assume that henryk will port his work to bitbake trunk/1.8 and it  
> > is highly likely (actually pretty obvious) that we will accept the  
> > patch. And at this point it is a potential backporting candidate for  
> > 1.8.2.
> 
> So does that mean that changing OE.dev to _rely_ on epoch support should
> be held off until that happens?

We won't rely on epoch support until our users have a stable version of
bitbake available to them. "users" includes the openmoko developers. The
indicator will be the bitbake minimum version requirement set in the
sanity checker - once the version that points to has epoch support, we
can rely on it.

I'm hoping omoko will update to use bitbake 1.8.x. If they don't, we
might consider backporting the epoch code to 1.6.x. Lets see how things
work out...

I do want to ultimately solve the X11R7 mess though.

Cheers,

Richard



