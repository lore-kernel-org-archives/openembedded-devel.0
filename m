Received: from [64.233.162.231] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <hvontres@gmail.com>) id 1J0fxl-0007LJ-PI
	for openembedded-devel@openembedded.org; Fri, 07 Dec 2007 17:22:06 +0100
Received: by nz-out-0506.google.com with SMTP id q3so308788nzb
	for <openembedded-devel@openembedded.org>;
	Fri, 07 Dec 2007 08:18:15 -0800 (PST)
Received: by 10.142.242.8 with SMTP id p8mr210001wfh.1197044294630;
	Fri, 07 Dec 2007 08:18:14 -0800 (PST)
Received: by 10.143.11.12 with HTTP; Fri, 7 Dec 2007 08:18:14 -0800 (PST)
Message-ID: <a7f8874a0712070818h1e0192d1h6c9e91cf48c0c85c@mail.gmail.com>
Date: Fri, 7 Dec 2007 08:18:14 -0800
From: "Hans Henry von Tresckow" <hvontres@gmail.com>
To: "Richard Purdie" <rpurdie@rpsys.net>
In-Reply-To: <1197027528.4661.12.camel@localhost.localdomain>
MIME-Version: 1.0
References: <200711121044.32094.u.luckas@road.de>
	<200711121102.51877.u.luckas@road.de>
	<a7f8874a0712051306i3cebae60sfd0a10987612afd0@mail.gmail.com>
	<4759292B.3060300@road.de>
	<1197027528.4661.12.camel@localhost.localdomain>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Cc: openembedded-devel@openembedded.org, Uli Luckas <u.luckas@road.de>
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
X-List-Received-Date: Fri, 07 Dec 2007 16:22:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Dec 7, 2007 3:38 AM, Richard Purdie <rpurdie@rpsys.net> wrote:

> On Fri, 2007-12-07 at 11:06 +0000, Uli Luckas wrote:
> > Hans Henry, thanks for testing. Good to know it worked for you. Let's
> > see how we can get this thing pushed upstream.
> >
> > 1) I put this on the OE list as the original code is maintained in OE.
> And
> > that's why I'd like the code to be pushed to the OE repository first.
> > I am not really an OE developer though. Is someone willing to do the OE
> > integration to give my patch a home?
>
> I'm happy for the userspace side of things to be added in OE. I have
> some reservations about the way the kernel patch is added to the zaurus
> code, particularly about the way the kernel commandline is handled from
> the broken bootloader and I need to find some time to look at that. I'm
> fine with the patch in principle though, I just want it right when its
> added (and preferably upstream too, the existing zaurus changes will not
> be accepted upstream).
>
> > 2) I need to push the kernel patch via Russell. Mike, I have not heard
> your
> > opinion. Will you support this patch?
> >
> > 3) I need to push my userspace work. My work is based on code by Richard
> > though. Richard, please jump in and let us know how you'd like to
> proceede?
>
> I did try and find the kexec-tools maintainer but got distracted and
> never got back to it. Does anyone know who we need to send this to? I
> will try and get that done this weekend...
>
> > I'd really like to see kexec working on arm without any patches soon.
>
> Agreed. I'm sorry I haven't found time to look at this yet, I will try
> hard to do so this weekend.
>
> Regards,
>
> Richard
>
>
>
> Richard,

I updated http://bugs.openembedded.org/show_bug.cgi?id=3397 with a new patch
to filter out the Sharp command line (for poodle at least). Let me know if
that approach makes more sense.

http://bugs.openembedded.org/show_bug.cgi?id=3430 has the userspace kexec
patch.

Thanks for taking a look at this.


-- 
Henry von Tresckow (hvontres)

