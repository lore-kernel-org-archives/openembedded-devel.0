Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1OCrlf-0001GS-7u
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 12:05:20 +0200
Received: from cpe00142a336e11-cm001ac318e826.cpe.net.cable.rogers.com
	([174.113.191.234] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1OCrhr-000839-Vt for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 06:01:24 -0400
Date: Fri, 14 May 2010 06:01:22 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@lynx
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTinqyTnfMhBuyQFIntIcPSdyD8loK0iwJreBkBIr@mail.gmail.com>
Message-ID: <alpine.DEB.2.00.1005140601060.29014@lynx>
References: <alpine.DEB.2.00.1005131412550.6436@lynx>
	<AANLkTinqyTnfMhBuyQFIntIcPSdyD8loK0iwJreBkBIr@mail.gmail.com>
User-Agent: Alpine 2.00 (DEB 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: bitbake fetch vs fetchall?
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
X-List-Received-Date: Fri, 14 May 2010 10:05:21 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-750760615-1273831285=:29014"

--8323329-750760615-1273831285=:29014
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 13 May 2010, Khem Raj wrote:

> On Thu, May 13, 2010 at 11:18 AM, Robert P. J. Day
> <rpjday@crashcourse.ca> wrote:
> >
> > =A0 based on a quick google, i realize i'm not the only person who's
> > once been burned by not knowing about the bitbake "fetchall" command
> > versus the "fetch" command. =A0and i'm aware that, if one wants to fetc=
h
> > absolutely *all* software required for a given target, one must use
> > "fetchall".
> >
> > =A0so, first, what's the difference between these two commands? =A0and,
> > second, there's precious little explanation in the current OE user
> > manual about "fetchall". =A0in fact, in the user manual, there is the
> > explanation:
> >
> > fetch
> >
> > =A0 =A0Try to download all of the required source files, but don't do
> > anything else with them.
> >
> > which would seem to be slightly misleading and is bound to trip
> > someone up. =A0should not the user manual be extended to describe
> > "fetchall"?
> >
>
> yes it could be improved and probably also point distinction between
> fetch and fetchall. Care to make a patch :)

  i'll give it a shot later today.

rday

--=20

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

--8323329-750760615-1273831285=:29014--
