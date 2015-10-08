Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 447E975A52
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Oct 2015 15:24:14 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so30405092wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Oct 2015 08:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=NmjceHynQnDx9l0CZgxJr0jmsIYdlgTEgKjw/Fgs33Y=;
	b=U4R9dodc0coT2uwph2zW8nETH4Y6aWVCo47fWBuD5IecDIidsv3fHMpc5zq55qekI8
	n5ruC86sQLOBNACEZ0RnpGwatPHS879WCTiS7Ojip/8ZgetaaCUBnpo+rzaIIhqcM4D+
	8vYAZT+qXeQJcwXbLiS58KBOJ2ja+ndgZMr4wIIeMbqfKzzrzjNLJs2aJVMI74W70E/m
	hmB1wyvfSqpENpLCoT+PE4D/JUx6bw58cgaUgjB1dIZlUolkw2uHW5AOFzh0KhfHKaiu
	fR5e4sY+Z19Tdt6G5o6Fbbyaq6aboT/qji5hYBvuge0qHR96wS8rJpPLpODn92ay03n/
	jYeA==
X-Received: by 10.180.106.4 with SMTP id gq4mr5081010wib.53.1444317854815;
	Thu, 08 Oct 2015 08:24:14 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id i3sm2201230wij.9.2015.10.08.08.24.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Oct 2015 08:24:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 8 Oct 2015 17:24:25 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151008152425.GL2385@jama>
References: <1443950022-18541-1-git-send-email-manuel.bachmann@iot.bzh>
	<CAP9ODKo0weXR60NYM_SUMDd-jZTxTVyq4ki90V5PDoBNdVihdg@mail.gmail.com>
	<20151006222919.GC2383@jama>
	<33DC3C44-62D2-4C8E-A7FE-FCCB11A83AFA@gmail.com>
MIME-Version: 1.0
In-Reply-To: <33DC3C44-62D2-4C8E-A7FE-FCCB11A83AFA@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH][meta-oe] freerdp: get out of "nonworking", fix build, improve
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Oct 2015 15:24:15 -0000
X-Groupsio-MsgNum: 57739
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hdW7zL/qDS6RXdAL"
Content-Disposition: inline

--hdW7zL/qDS6RXdAL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 07, 2015 at 06:36:41PM -0700, Khem Raj wrote:
>=20
> > On Oct 6, 2015, at 3:29 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> >=20
> > On Tue, Oct 06, 2015 at 06:58:25PM -0300, Otavio Salvador wrote:
> >> On Sun, Oct 4, 2015 at 6:13 AM, Manuel Bachmann <manuel.bachmann@iot.b=
zh> wrote:
> >>> We make the "freerdp" recipe active again, fix the build
> >>> by pulling a more recent version (the "stable" branches are
> >>> buggy and useless), and fix ARM runtime with -fPIC.
> >>>=20
> >>> We can then :
> >>> - make X11 non-mandatory ;
> >>> - add support for Wayland ("wlfreerdp" client) ;
> >>> - add support for DirectFB ("dfreerdp" client) ;
> >>> - add support for GStreamer 1.0 ;
> >>> - make "heavy" features such as pulseaudio, cups...
> >>> non-mandatory.
> >>>=20
> >>> We really want to install the "winpr-makecert" tool to have
> >>> TLS, but CMake does not position its RPATH cleanly, so let
> >>> us have a custom patch for that until it gets sorted out.
> >>>=20
> >>> Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
> >>=20
> >> I fully agree with the changes and those are very welcome. However, it
> >> would be good if you could move from nonworking in one patch and do
> >> the changes here in another patch.
> >=20
> > I wanted to get rid of all nonworking directories, I'm sending patch
> > series which reverts the recipe moves and replaces it with PNBLACKLIST.
>=20
> PNBLACKLIST still causes parsing overhead. I would suggest to move it to =
a layer under meta-openembedded
> like meta-trash or some such, if someone gets it to work move it back to =
the appropriate layer.

Lets move all blacklisted recipes to meta-broken or some such after
jethro is branched.

Big advantage of PNBLACKLIST is that it's easy to unblacklist from
distro/local.conf and that bbappends in upper layer are still parsed
corectly, moving the recipes to separate layer (which wont be included
in any sane buidls) will force bbappends to be removed and then possibly
reintroduced when the original recipe is fixed and moved back to
appropriate layer.

>=20
> >=20
> >> Do you mind to rework it?
> >=20
> > Please rebase it on top of current master-next which already has such
> > reverts.
> >=20
> >>=20
> >> --
> >> Otavio Salvador                             O.S. Systems
> >> http://www.ossystems.com.br        http://code.ossystems.com.br
> >> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >=20
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20



> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hdW7zL/qDS6RXdAL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYWiqkACgkQN1Ujt2V2gBxjswCgsVnWmND2nXfDLTCNKoykWVip
07kAn1cr174DP0mVO/QOa76R98S0demi
=t3VR
-----END PGP SIGNATURE-----

--hdW7zL/qDS6RXdAL--
