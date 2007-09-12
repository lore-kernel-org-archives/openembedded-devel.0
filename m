Received: from [62.169.194.61] (helo=memova2.tellas.gr)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <skoroneos@digital-opsis.com>) id 1IVLGO-0006bC-97
	for openembedded-devel@openembedded.org; Wed, 12 Sep 2007 07:59:48 +0200
Received: from dias (62.169.211.226) by memova2.tellas.gr (7.3.118.8)
	id 4638635B02FD925E for openembedded-devel@openembedded.org;
	Wed, 12 Sep 2007 07:55:30 +0200
From: "Stelios Koroneos" <skoroneos@digital-opsis.com>
To: <openembedded-devel@openembedded.org>
Date: Wed, 12 Sep 2007 08:56:34 +0300
Message-ID: <HOECLKEKOHLAMMGDLLBHGENPMDAA.skoroneos@digital-opsis.com>
MIME-Version: 1.0
X-Priority: 3 (Normal)
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook IMO, Build 9.0.2416 (9.0.2911.0)
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3138
In-Reply-To: <c384c5ea0709111555p25aa8680v3c59a1742b5e841b@mail.gmail.com>
Importance: Normal
Subject: Re: Task-base is big :(
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
X-List-Received-Date: Wed, 12 Sep 2007 05:59:48 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

> > The difference to the original python .bb is the removing of
> >  DEPEND: tk
> >   This would build a whole X11 system, and I definitely don't want that.
> >
>
> Same here, but I guess we are using OE for similar purposes. Using
> OpenEmbedded for embedded applications you build a kernel, need a
> *few* packages (say 10) and some custom stuff (say 20 packages).
>

True.
As more people start to use OE and as these people would be mostly
interested in "vertical" solutions (develop an app or add apps to an
existing distro without having to rebuild everything) i think we need to
have a closer look at the OE SDK vs build everything from scratch.
Having a "standard" toolchain availiable (and the way to use it) for people
that are not interested in developing distro's would IMHO provide additional
"user friendliness" and make OE an even more attractive solution.

Stelios S. Koroneos

Digital OPSiS - Embedded Intelligence
http://www.digital-opsis.com


> -----Original Message-----
> From: openembedded-devel-bounces@openembedded.org
> [mailto:openembedded-devel-bounces@openembedded.org]On Behalf Of
> Leon Woestenberg
> Sent: Wednesday, September 12, 2007 1:55 AM
> To: openembedded-devel@openembedded.org
> Subject: Re: [oe] Task-base is big :(
>
>
> Hello,
>
> On 9/12/07, Detlef Vollmann <dv@vollmann.ch> wrote:
> > Richard Purdie wrote:
> > > Is this overlay public? Even if we can't use it directly a summary of
> > > what you find unacceptable of the current approach in OE
> would be useful
> > > to see.
> > I don't have a full overlay, but here's an example:
> > $ cat python-my_2.5.1.bb
>
> Removing stuff like X or XML dependencies from the bitbake of those
> handful of packages allows me to build reasonably quick and especially
> the build does not break when any of the redundant packages breaks.
>
> I plan to bring a OE monotone and package mirror and the overlay
> online soon. I also have spare hours on a build server that could be
> used to build public targets, I would like to dedicate this to
> regression testing.
>
> Regards,
> --
> Leon
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>




