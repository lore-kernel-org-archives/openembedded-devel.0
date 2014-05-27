Return-Path: <martin.jansa@gmail.com>
Received: from mail-pa0-f53.google.com (unknown [209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id C728A6FADA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 May 2014 19:48:11 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id kp14so9668423pab.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 May 2014 12:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=m/pjPG12uh3Dqbp7xVWrWmjWfK80bGI9h0I5k7CdwWs=;
	b=v228NrTLnC5lJvMzXtiBp7nB/R3nC7X7PixQmahHaqWFfphD2etyWYF/J3wyKTA7xu
	C902urY23r6PnwxJvfk2lj/VvTG0OEGZKQvlaQHF5c1uLJeNsTgZLHdXZE3Vgjn64QsL
	ZLzFSYwBdd7mhVzNNSQpgYzXujYzpTYt+friT5UL1lABylN6Es5u8Iy8FhLNwibV5pq8
	HxdoZwOybqsXDdA8BCchzsiOQXajQzsP6BjpXHy/wyNxZ3fDPCCFS7wtZUR8ZFO2KjCI
	RGoK4IQh2/+8j7UtDn0NX61jwSzhqDmOyB2GU0cxrHJUAmPzMF9zvPzk5Mt9RnlbtoQl
	Frhg==
X-Received: by 10.68.194.134 with SMTP id hw6mr39552765pbc.49.1401220092460;
	Tue, 27 May 2014 12:48:12 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	jd5sm24679502pbb.18.2014.05.27.12.48.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 May 2014 12:48:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 27 May 2014 21:48:16 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140527194816.GC2426@jama>
References: <1401196396-2009-1-git-send-email-maxim.uvarov@linaro.org>
	<20140527142106.GB2426@jama> <5384A14C.70900@linaro.org>
MIME-Version: 1.0
In-Reply-To: <5384A14C.70900@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] daq fix compilation
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
X-List-Received-Date: Tue, 27 May 2014 19:48:12 -0000
X-Groupsio-MsgNum: 50086
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rQ2U398070+RC21q"
Content-Disposition: inline

--rQ2U398070+RC21q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2014 at 06:29:32PM +0400, Maxim Uvarov wrote:
> On 05/27/2014 06:21 PM, Martin Jansa wrote:
> > On Tue, May 27, 2014 at 05:13:16PM +0400, Maxim Uvarov wrote:
> >> preset paths to remove that error:
> >> /meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
> >> ./config.log:cc1: warning: include location "/usr/local/include" is un=
safe for cross-compilation [-Wpoison-system-directories]
> >>
> >> Also this patch add required libdnet dependency.
> >>
> >> Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> >> ---
> >>   meta-oe/recipes-connectivity/daq/daq_2.0.2.bb | 5 ++++-
> >>   1 file changed, 4 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb b/meta-oe/r=
ecipes-connectivity/daq/daq_2.0.2.bb
> >> index 4e85194..dcf38fc 100644
> >> --- a/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
> >> +++ b/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
> >> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df9ce51a65dd=
738dc1ae631d8b21c40e0"
> >>  =20
> >>   PARALLEL_MAKE =3D ""
> >>  =20
> >> -DEPENDS =3D "libpcap libpcre"
> >> +DEPENDS =3D "libpcap libpcre libdnet"
> >>  =20
> >>   SRC_URI =3D "http://fossies.org/linux/misc/daq-${PV}.tar.gz \
> >>               file://disable-run-test-program-while-cross-compiling.pa=
tch "
> >> @@ -15,6 +15,9 @@ SRC_URI =3D "http://fossies.org/linux/misc/daq-${PV}=
=2Etar.gz \
> >>   # daq/daq/latest lost dependency on  libdnet libmnl libnetfilter-que=
ue libnfnetlink
> >>   EXTRA_OECONF +=3D "--disable-nfq-module --disable-ipq-module"
> >>  =20
> >> +# never look to /usr/local lib while cross compiling
> >> +EXTRA_OECONF +=3D "--includedir=3D/usr/include --with-libpcap-include=
s=3D/usr/lib --with-dnet-includes=3D/usr/lib"
> > Does it look into /usr on host now?
>=20
> yes and it compiles after that change.

Because you don't have dnet headers in /usr, right?
Shouldn't it point to sysroot libdir/includedir paths to prevent any
host libraries/headers to sneak in?

Or better explicitly disable/enable dnet with PACKAGECONFIG?

> Maxim.
> >
> >>   SRC_URI[md5sum] =3D "865bf9b750a2a2ca632591a3c70b0ea0"
> >>   SRC_URI[sha256sum] =3D "d65d1e67c4994e02c3142c49a648642e780b7e3d942b=
4a51f605309beac269a8"
> >>  =20
> >> --=20
> >> 1.8.5.1.163.gd7aced9
> >>
> >> --=20
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rQ2U398070+RC21q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlOE7AAACgkQN1Ujt2V2gBwo1QCgp/8F4Nr58XrmDm0DzhbDF3Vn
50MAn2/q/UNc0vdguRwyEv+CNM2BakTD
=JCIW
-----END PGP SIGNATURE-----

--rQ2U398070+RC21q--
