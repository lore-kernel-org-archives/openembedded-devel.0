Received: from [92.198.50.35] (helo=metis.ext.pengutronix.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rsc@pengutronix.de>) id 1N3zUN-0005Dc-5g
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Oct 2009 22:58:34 +0100
Received: from octopus.hi.pengutronix.de ([2001:6f8:1178:2:215:17ff:fe12:23b0])
	by metis.ext.pengutronix.de with esmtp (Exim 4.63)
	(envelope-from <rsc@pengutronix.de>)
	id 1N3zTG-0001rJ-ME; Fri, 30 Oct 2009 22:57:22 +0100
Received: from rsc by octopus.hi.pengutronix.de with local (Exim 4.69)
	(envelope-from <rsc@pengutronix.de>)
	id 1N3zTF-0008Mx-SY; Fri, 30 Oct 2009 22:57:21 +0100
Date: Fri, 30 Oct 2009 22:57:21 +0100
From: Robert Schwebel <r.schwebel@pengutronix.de>
To: Leon Woestenberg <leon.woestenberg@gmail.com>
Message-ID: <20091030215721.GB22376@pengutronix.de>
References: <20091030204733.GZ22376@pengutronix.de>
	<c384c5ea0910301451w42249307w508aa4ca661cbdc8@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <c384c5ea0910301451w42249307w508aa4ca661cbdc8@mail.gmail.com>
X-Sent-From: Pengutronix Entwicklungszentrum Nord - Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Impressum: Pengutronix - Linux Solutions for Science and Industry
	Handelsregister:  Amtsgericht Hildesheim, HRA 2686 Peiner Strasse
	6-8, 31137 Hildesheim, Germany Phone: +49-5121-206917-0 |  Fax:
	+49-5121-206917-5555 Inhaber: Dipl.-Ing. Robert Schwebel
X-Message-Flag: See Message Headers for Impressum
X-Uptime: 22:54:42 up 18 days, 10:43,  1 user,  load average: 0.10, 0.05, 0.01
User-Agent: Mutt/1.5.18 (2008-05-17)
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 92.198.50.35
X-SA-Exim-Mail-From: rsc@pengutronix.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: RFC: Patch policy
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Oct 2009 21:58:34 -0000
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline

On Fri, Oct 30, 2009 at 10:51:02PM +0100, Leon Woestenberg wrote:
> Hello Robert and crews,
> 
> On Fri, Oct 30, 2009 at 9:47 PM, Robert Schwebel
> <r.schwebel@pengutronix.de> wrote:
> > Hi Marcin, Richard & OE crew,
> >
> > At ELC-E, we discussed how we could improve the collaboration between
> > the cross build systems out there. Although there are big differences
> > in what kind of tools people use, there is one thing that all cross
> > build systems have in common: patches for upstream packets.
> >
> > - patches have to be in the canonical patch format, as known from linux
> > - proper Signed-off-by: lines
> > ...
> > What do you think? Should we try to create a new patch stack which
> > follows these rules, in order to lower the ammount of duplicate work? At
> > least for us, this would be very interesting.
> >
> 
> - Standard naming of the patch (numbered series etc).

We use quilt series in ptxdist, i.e. an series file which contains the
names of the patches in order. This has the advantage that you don't
have to break the history by changing numbers when you have to insert a
patch between two others.

> - A shared (possibly distributed) patch server with patches against
> the package?

I could imagine a central patch server for that, as long as the
maintainers have a technique to "qualify" which patches to take for
their respective projects. It could for example be done in a way that
the maintainers add their Signed-off-by, and a script extracts things
automatically then.

rsc
-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


