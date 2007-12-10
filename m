Received: from [64.233.162.233] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <hvontres@gmail.com>) id 1J1kkS-0007EL-7v
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Dec 2007 16:40:48 +0100
Received: by nz-out-0506.google.com with SMTP id l1so539402nzf
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Dec 2007 07:36:39 -0800 (PST)
Received: by 10.142.231.7 with SMTP id d7mr1188970wfh.1197300997193;
	Mon, 10 Dec 2007 07:36:37 -0800 (PST)
Received: by 10.143.11.12 with HTTP; Mon, 10 Dec 2007 07:36:37 -0800 (PST)
Message-ID: <a7f8874a0712100736l539b3b9dvea3cda7a33bbcd@mail.gmail.com>
Date: Mon, 10 Dec 2007 07:36:37 -0800
From: "Hans Henry von Tresckow" <hvontres@gmail.com>
To: "Uli Luckas" <u.luckas@road.de>
In-Reply-To: <475D0D46.2030303@road.de>
MIME-Version: 1.0
References: <200711121044.32094.u.luckas@road.de>
	<200711121102.51877.u.luckas@road.de>
	<a7f8874a0712051306i3cebae60sfd0a10987612afd0@mail.gmail.com>
	<4759292B.3060300@road.de>
	<1197027528.4661.12.camel@localhost.localdomain>
	<a7f8874a0712070818h1e0192d1h6c9e91cf48c0c85c@mail.gmail.com>
	<1197275254.4804.8.camel@localhost.localdomain>
	<475D0D46.2030303@road.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Mon, 10 Dec 2007 15:40:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Dec 10, 2007 1:56 AM, Uli Luckas <u.luckas@road.de> wrote:

> On Friday, 7. December 2007, Hans Henry von Tresckow wrote:
>  > On Dec 7, 2007 3:38 AM, Richard Purdie <rpurdie@rpsys.net> wrote:
>  > > On Fri, 2007-12-07 at 11:06 +0000, Uli Luckas wrote:
>  > > > Hans Henry, thanks for testing. Good to know it worked for you.
> Let's
>  > > > see how we can get this thing pushed upstream.
>  > > >
>  > > > 1) I put this on the OE list as the original code is maintained
> in OE.
>  > >
>  > > And
>  > >
>  > > > that's why I'd like the code to be pushed to the OE repository
> first.
>  > > > I am not really an OE developer though. Is someone willing to do
> the OE
>  > > > integration to give my patch a home?
>  > >
>  > > I'm happy for the userspace side of things to be added in OE. I have
>  > > some reservations about the way the kernel patch is added to the
> zaurus
>  > > code, particularly about the way the kernel commandline is handled
> from
>  > > the broken bootloader and I need to find some time to look at that.
> I'm
>  > > fine with the patch in principle though, I just want it right when
> its
>  > > added (and preferably upstream too, the existing zaurus changes
> will not
>  > > be accepted upstream).
>  > >
>  > > > 2) I need to push the kernel patch via Russell. Mike, I have not
> heard
>  > > your opinion. Will you support this patch?
>  > > >
>  > > > 3) I need to push my userspace work. My work is based on code by
>  > > > Richard though. Richard, please jump in and let us know how you'd
> like
>  > > > to
>  > >
>  > > proceede?
>  > >
>  > > I did try and find the kexec-tools maintainer but got distracted and
>  > > never got back to it. Does anyone know who we need to send this to? I
>  > > will try and get that done this weekend...
>  > >
>  > > > I'd really like to see kexec working on arm without any patches
> soon.
>  > >
>  > > Agreed. I'm sorry I haven't found time to look at this yet, I will
> try
>  > > hard to do so this weekend.
>  > >
>  > > Regards,
>  > >
>  > > Richard
>  > >
>  > >
>  > >
>  > > Richard,
>  >
>  > I updated http://bugs.openembedded.org/show_bug.cgi?id=3397 with a new
>  > patch to filter out the Sharp command line (for poodle at least). Let
> me
>  > know if that approach makes more sense.
>  >
> I think I am missing something here. Didn't you (Hans Henry) report my
> kernel
> patch to work on poodle?
> As I don't have a Sharp, could someone clue me in what problem you guys
> are
> trying to sove here?
>
>  > http://bugs.openembedded.org/show_bug.cgi?id=3430 has the userspace
> kexec
>  > patch.
>  >
>
Uli, the basic problem with Sharp machines is that the bootloader has the
default commandline for the old 2.4.x embeddix/lineo kernels. This
commandline is completely unusable by the 2.6 kernel series. To get mikes
and your patches working I have had to resort to one of two methods, either
of which Richard considers a no-no:
1) set up .boot_params at  0xa0000200 instead of the more standard
0xa0000100
2) patch the kernel to check the command line and reject it if it looks like
the standard Sharp one.

>
> Thanks for forwarding the patch to the right channel.
>
> Regards,
> Uli
>
> --
>
> ------- ROAD ...the handyPC Company - - -  ) ) )
>
> Uli Luckas
> Software Development
>
> ROAD GmbH
> Bennigsenstr. 14 | 12159 Berlin | Germany
> fon: +49 (30) 230069 - 64 | fax: +49 (30) 230069 - 69
> url: www.road.de
>
> Amtsgericht Charlottenburg: HRB 96688 B
> Managing directors: Hans-Peter Constien, Hubertus von Streit
>
>


-- 
Henry von Tresckow (hvontres)

