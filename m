Received: from [216.145.245.198] (helo=mx02)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mwester@dls.net>) id 1J1jSZ-0005Th-Ll
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Dec 2007 15:18:15 +0100
Received: from gw.mwester.net ([209.242.5.110] helo=twilight)
	by mx02 with esmtpa (Exim 4.63) (envelope-from <mwester@dls.net>)
	id 1J1jOY-0003Ph-Uf for openembedded-devel@lists.openembedded.org;
	Mon, 10 Dec 2007 08:14:07 -0600
Message-ID: <012601c83b36$d71b1c10$6e01a8c0@twilight>
From: "Mike \(mwester\)" <mwester@dls.net>
To: <openembedded-devel@lists.openembedded.org>
References: <200711121044.32094.u.luckas@road.de>	<200711121102.51877.u.luckas@road.de>	<a7f8874a0712051306i3cebae60sfd0a10987612afd0@mail.gmail.com>	<4759292B.3060300@road.de>	<1197027528.4661.12.camel@localhost.localdomain>	<a7f8874a0712070818h1e0192d1h6c9e91cf48c0c85c@mail.gmail.com><1197275254.4804.8.camel@localhost.localdomain>
	<475D1446.3060801@road.de>
Date: Mon, 10 Dec 2007 08:13:29 -0600
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2800.1914
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2800.1914
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
X-List-Received-Date: Mon, 10 Dec 2007 14:18:16 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Uli Luckas writes:
> Richard Purdie wrote:
> > On Fri, 2007-12-07 at 08:18 -0800, Hans Henry von Tresckow wrote:
> >
> >> I updated http://bugs.openembedded.org/show_bug.cgi?id=3397 with a new
> >> patch to filter out the Sharp command line (for poodle at least). Let
> >> me know if that approach makes more sense.
> >>
> >> http://bugs.openembedded.org/show_bug.cgi?id=3430 has the userspace
> >> kexec patch.
> >>
> >> Thanks for taking a look at this.
> >>
> >
> > I've had a look at the patches, have given them a lot of thought and I'm
> > not convinced the approach is quite right. I do have an alternative
> > proposal however
> Richard,
> I think we are talking about different approaches here. The patch Hans
> Henry but on bugs.openembedded.org is not what I posted. It still
> contains code from Mike which is not needed any more. Could you please
> reconsider export_atags_2.patch + the userspace patches only?

I haven't had time to follow this thread closely (I apologize, time is at a
premium at this time of year for me).  I think I should mention that what
used to be the 80-kexec-atags.patch will be part of the 2.6.24 kernel, so
the presence of that code should be taken into account with any patching.
With that patch, the buffer location for the stored atags is an exported
symbol; the intent was to permit other code (kexec, for example) to read and
modify the atags prior to a kexec.

I'll have a bit more time as soon as the year ends (silly year-end company
stuff, I'm afraid).

Mike (mwester)



