Received: from [195.234.128.72] (helo=scotty.chl-informatik.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <christopher.lang@plus.cablesurf.de>)
	id 1HPbTi-0005gs-4w
	for openembedded-devel@openembedded.org; Fri, 09 Mar 2007 10:33:34 +0100
Received: from linux64.chl-informatik.de (linux64.chl-informatik.de
	[192.168.10.17])
	by scotty.chl-informatik.de (8.12.3/8.12.3/SuSE Linux 0.6) with ESMTP
	id l298j9fl012982 for <openembedded-devel@openembedded.org>;
	Fri, 9 Mar 2007 09:45:10 +0100
From: Christopher Lang <christopher.lang@plus.cablesurf.de>
To: openembedded-devel@openembedded.org
Date: Fri, 9 Mar 2007 10:33:41 +0100
User-Agent: KMail/1.9.1
References: <1173131731.5842.140.camel@localhost.localdomain>
	<200703082126.20092.christopher.lang@plus.cablesurf.de>
	<1173393085.5805.51.camel@localhost.localdomain>
In-Reply-To: <1173393085.5805.51.camel@localhost.localdomain>
MIME-Version: 1.0
Message-Id: <200703091033.41288.christopher.lang@plus.cablesurf.de>
Subject: Re: Bitbake Request for Testing of bitbake 1.8
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
X-List-Received-Date: Fri, 09 Mar 2007 09:33:35 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline


This is the output without -v without the 'GLIBC_ADDONS =3D "nptl"'. The "t=
riple=20
glibc" note does not show.

http://pastebin.ca/387372


This one is the original output (without the 'GLIBC_ADDONS =3D "nptl"') but=
 with=20
=2Dv. Only there you can see the line:
NOTE: multiple preferred providers are available for runtime libsegfault=20
(glibc, glibc, glibc);

http://pastebin.ca/387374

I thought that multiple identical PREFERRED_PROVIDERS might indicate an iss=
ue.=20


Chris



Am Donnerstag, 8. M=E4rz 2007 23:31 schrieb Richard Purdie:
> On Thu, 2007-03-08 at 21:26 +0100, Christopher Lang wrote:
> > adding:
> >
> > GLIBC_ADDONS =3D "nptl"
> > GLIBC_EXTRA_OECONF =3D "--with-tls"
> >
> > to the machine file fixes issues (2) and (3).
>
> Thats the correct fix for an x86 machine.
>
> Can you show the log output without the -v option so I can try and see
> what you mean by (1)?
>
> > > Using the "generic" distro and bb 1.8 there are some messages that "do
> > > not look good":
> > >
> > > (1) doesn't seem to make sense (3x glibc)
> > > (2) glibc 2.5 IS available
> > > (3) circular dependency
> > >
> > > see full bitbake -v output (annotated with (x) ) as well as
> > > distro/machine configuration below.
>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


