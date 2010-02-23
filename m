Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Nk1C9-0006pL-RB
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 21:17:29 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Nk19U-000516-BS from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 12:14:40 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 23 Feb 2010 12:14:39 -0800
Received: from 172.30.80.81 ([172.30.80.81]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Tue, 23 Feb 2010 20:14:39 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	23 Feb 2010 13:14:39 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <19c1b8a91002231151g6fbe4a1ck97668729e5cc69d6@mail.gmail.com>
References: <1266951776.18176.47.camel@trini-m4400>
	<19c1b8a91002231151g6fbe4a1ck97668729e5cc69d6@mail.gmail.com>
Organization: Mentor Graphics Corporation
Date: Tue, 23 Feb 2010 13:14:39 -0700
Message-ID: <1266956079.18176.61.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 23 Feb 2010 20:14:39.0731 (UTC)
	FILETIME=[D4072C30:01CAB4C4]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Fix busybox SUID support
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
X-List-Received-Date: Tue, 23 Feb 2010 20:17:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2010-02-23 at 11:51 -0800, Khem Raj wrote:
> On Tue, Feb 23, 2010 at 11:02 AM, Tom Rini <tom_rini@mentor.com> wrote:
> > I was about to just push this and I noticed that a number of
> > distributions (SlugOS, Angstrom, Kaelios, micro) currently set
> > FEATURE_SUID=3Dy, but it's not actually install SUID.  And since I reca=
ll
> > some way-back-when's of "busybox SUID is dangerous / crap!", I thought
> > it best to post the patch first and let folks speak up / ask me to drop
> > FEATURE_SUID=3Dy when I do this.  So, here's the patch:
> >
> > diff --git a/recipes/busybox/busybox.inc b/recipes/busybox/busybox.inc
> > index 5f52850..b165d0f 100644
> > --- a/recipes/busybox/busybox.inc
> > +++ b/recipes/busybox/busybox.inc
> > @@ -11,7 +11,7 @@ LICENSE =3D "GPL"
> >  SECTION =3D "base"
> >  PRIORITY =3D "required"
> >
> > -INC_PR =3D "r24"
> > +INC_PR =3D "r25"
> >
> >  SRC_URI =3D "\
> >   file://busybox-cron \
> > @@ -96,7 +96,11 @@ do_install () {
> >        # Install /bin/busybox, and the /bin/sh link so the postinst scr=
ipt
> >        # can run. Let update-alternatives handle the rest.
> >        install -d ${D}${base_bindir}
> > -       install -m 0755 ${S}/busybox ${D}${base_bindir}
> > +       if grep -q "CONFIG_FEATURE_SUID=3Dy" ${WORKDIR}/defconfig; then
>=20
> may be you should grep it in ${S}/.config because thats what defconfig
> turns into finally
> and used by busybox build.

I'd be fine doing a follow-up to clean them all up, but today
busybox.inc does all of its checks to ${WORKDIR}/defconfig.

> > +               install -m 4755 ${S}/busybox ${D}${base_bindir}
>=20
> what does 4755 translate to ? (curiosity)

4 is suid (2 is sgid, 1 is i forget the name but what you stick on /tmp
& such).

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


