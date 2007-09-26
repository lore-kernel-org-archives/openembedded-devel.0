Received: from [85.10.209.111] (helo=mail.road.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <u.luckas@road.de>) id 1IaRHL-0006mm-J3
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Sep 2007 09:25:51 +0200
Received: from slimfast.dyndns.org (unknown [192.168.254.1])
	by mail.road.de (Postfix) with ESMTP id ED6CA390004;
	Wed, 26 Sep 2007 09:21:21 +0200 (CEST)
Received: from localhost.localdomain (ulitu.handy-pc.constin.de
	[192.168.116.44])
	by slimfast.dyndns.org (Postfix) with ESMTP id 833D6AD4006;
	Wed, 26 Sep 2007 09:21:21 +0200 (CEST)
Received: from ip6-localhost (unknown [IPv6:::1])
	by localhost.localdomain (Postfix) with ESMTP id 650B8D983FC;
	Wed, 26 Sep 2007 09:21:21 +0200 (CEST)
From: Uli Luckas <u.luckas@road.de>
Organization: Road GmbH
To: "Hans Henry von Tresckow" <hvontres@gmail.com>
Date: Wed, 26 Sep 2007 09:21:19 +0200
User-Agent: KMail/1.9.7
References: <a7f8874a0709212103h126eeea7y751fa5fd4256fb20@mail.gmail.com>
	<200709251620.52994.u.luckas@road.de>
	<a7f8874a0709250914te82f7b4sdd5d818459320baa@mail.gmail.com>
In-Reply-To: <a7f8874a0709250914te82f7b4sdd5d818459320baa@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200709260921.20447.u.luckas@road.de>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: RFC: Kexec Cmdline Support
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
X-List-Received-Date: Wed, 26 Sep 2007 07:25:51 -0000
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tuesday, 25. September 2007, Hans Henry von Tresckow wrote:
> On 9/25/07, Uli Luckas <u.luckas@road.de> wrote:
> > On Monday, 24. September 2007, Hans Henry von Tresckow wrote:
> > > (sorry for crossposting this,but I think more of the interested parties
> > > read oe-devel then angstrom-devel)
> > >
> > > A while back, mwester made some patches to add the ability to modify
> > > the cmdline when using kexec to load a kernel. I did some testing on
> > > poodle
> >
> > and
> >
> > > posted the results on the bug tracker
> > > (http://bugs.openembedded.org/show_bug.cgi?id=2969)
> > > I was wondering what the rest of the developers think of these.
> >
> > Hi Henry,
> > A while back I posted a different approach [1] to this mailing list for
> > review. To bad, there have not been any comments.
> >
> > The differences of my approach in contrast to mwester's approach have
> > been discussed on the arm kernel mailing list. If there is any interest
> > in this (userspace) approach at all, I will improve on the known problems
> > (like hard
> > coded ATAG base address).
> >
> > I'd really appreciate feedback from the developers.
> >
> > Best regerds
> > Uli
> >
> > 1)
> >
> > http://lists.linuxtogo.org/pipermail/openembedded-devel/2007-August/00284
> >0.html
> >
> > --
> >
> > ------- ROAD ...the handyPC Company - - -  ) ) )
> >
> > Uli Luckas
> > Software Development
> >
> > ROAD GmbH
> > Bennigsenstr. 14 | 12159 Berlin | Germany
> > fon: +49 (30) 230069 - 64 | fax: +49 (30) 230069 - 69
> > url: www.road.de
> >
> > Amtsgericht Charlottenburg: HRB 96688 B
> > Managing directors: Hans-Peter Constien, Hubertus von Streit
>
> Uli,
> Do you have a link to the kernel list discussion? 
>
kexec & 2 RAM banks [1] 

> At this point I am more 
> interested in getting cmdline support than in any particular
> implementation. I did try your patch on top of mike's but I had no luck.
>
My Patch is a pure user space implementation and is supposed to work with a 
vanilla kernel. 

> One of the issues I have run into is the BROKEN Sharp bootloader that makes
> things more interesting. Mike's patches can work around this problem by
> setting up a fake ATAG list at a non-standard location.
>
The Idea for both approaches is to take the running kenel's ATAG list as a 
template for the new kernel's ATAG list. Mike Westerhof has this already 
implemented. I kind of stalled on that one as no one showed any interest. If 
you feel like testing such an approach, I could put the missing pieces 
together for you.

> I would love to see more progress on this, since I would like to improve
> support for booting devices from non-standard locations (ie SD card)
> without custom kernels.
>
By the way, who is the original author of the arm-kexec-utils patch? I'd like 
to see kexec support pushed upstream which requires a sign-off of the 
original author.

> Thank you for your help,
>
> Henry von Tresckow (hvontres)

1) kexec & 2 RAM banks
http://marc.info/?l=linux-arm-kernel&m=118554158026945&w=4


-- 

------- ROAD ...the handyPC Company - - -  ) ) )

Uli Luckas
Software Development

ROAD GmbH
Bennigsenstr. 14 | 12159 Berlin | Germany
fon: +49 (30) 230069 - 64 | fax: +49 (30) 230069 - 69
url: www.road.de

Amtsgericht Charlottenburg: HRB 96688 B
Managing directors: Hans-Peter Constien, Hubertus von Streit


