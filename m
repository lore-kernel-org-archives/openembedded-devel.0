Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id B1FBD65D12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 01:33:16 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id e53so2321458eek.16
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Apr 2014 18:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tHSOkL9faSDEzwWgwCD7lkkwRK7CbADq/ISzqokOBcc=;
	b=uOXYmdoIc/u14q3M01Pc4IXqoCAkM3n144SRkQvnXUN9GomP+/FZVZBV4ezPX3dcix
	4aSxPnLnGAa2lX16IwDyJVPMetpfmqz6OW/iTvpYAWCywDU57lpyw1zOH1wSdLWPLLnu
	Tgac+Z/YLsMQtFxc8BbbcWhHDcSnznoCHvzODExMo0FjQObzA6LwSMK7BxjDMZZcfL3V
	yWI6LnZS4JLjH+DQhnG+xkll94HpASPNS32YfeYu+8jwR7Vq7gOzSF0WV/QOuxlLXdCY
	V4pDtQQElMN2AUGpNUNPh1p+QsiQM+iXT/uMCly/fFAaKfQNjCy3NXWaIpGgexa2AtlP
	TAUw==
X-Received: by 10.14.115.1 with SMTP id d1mr6246289eeh.30.1398389597543;
	Thu, 24 Apr 2014 18:33:17 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	q49sm20557590eem.34.2014.04.24.18.33.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Apr 2014 18:33:16 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 25 Apr 2014 03:33:26 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140425013326.GR2486@jama>
References: <1398323681-19373-1-git-send-email-Chong.Lu@windriver.com>
	<5358DE99.40604@dominion.thruhere.net>
	<5359B8A8.7010801@windriver.com>
MIME-Version: 1.0
In-Reply-To: <5359B8A8.7010801@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH V4] rrdtool: enable perl and python bindings
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
X-List-Received-Date: Fri, 25 Apr 2014 01:33:24 -0000
X-Groupsio-MsgNum: 49478
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DbLwIXqnMNXxdFHq"
Content-Disposition: inline

--DbLwIXqnMNXxdFHq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2014 at 09:21:44AM +0800, Chong Lu wrote:
>=20
> On 04/24/2014 05:51 PM, Koen Kooi wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > Chong Lu schreef op 24-04-14 09:14:
> >> 1. default enable perl and python bindings 2. rrdtool uses perl.real,
> >> perl.real doesn't know where the PERL5LIB should be when prebuilts are
> >> used. Use the wrapper perl instead, perl sets PERL5LIB and invokes
> >> perl.real 3. While using dash as /bin/sh, subsequent commands in
> >> functions will not use the environment variables passed to the function
> >> call line unless explicitly run "export ENV_VAR". 4. delete unrecogniz=
ed
> >> options: "--enable-local-libpng" and "--enable-local-zlib"
> >>
> >> Signed-off-by: Chong Lu <Chong.Lu@windriver.com> ---
> >> +DESCRIPTION_${PN}-perl =3D \ +"The ${PN}-perl package includes RRDtool
> >> bindings for perl." +FILES_${PN}-perl =3D
> >> "${libdir}/perl/vendor_perl/*/*.pm ${datadir}/${PN}/examples \ +
> >> ${libdir}/perl/vendor_perl/*/auto/RRDs/RRDs.*" +RDEPENDS_${PN}-perl =3D
> >> "perl perl-module-lib perl-module-getopt-long perl-module-time-hires \=
 +
> >> perl-module-io-file perl-module-ipc-open2 perl-module-io-socket"
> >> +RPROVIDES_${PN} +=3D "${PN}-perl"
> > Why do you need RPROVIDES?
> >
> >
> >> + +DESCRIPTION_${PN}-python =3D \ +"The ${PN}-python package includes
> >> RRDtool bindings for python." +FILES_${PN}-python =3D
> >> "${libdir}/python${PYTHON_BASEVERSION}/site-packages/*"
> >> +RDEPENDS_${PN}-python =3D "python" +RPROVIDES_${PN} +=3D "${PN}-pytho=
n"
> > Why do you need RPROVIDES?
> If I put rrdtool-python into image.
> I got following errors when I built image.
>      Nothing RPROVIDES 'rrdtool-python'
> So, I added RPROVIDES.

Doesn't it make things even worse? It can happily install "rrdtool"
package as "rrdtool-python" provider which is not what one would expect
after adding rrdtool-python to image.

You need to add rrdtool-python rrdtool-perl to PACKAGES.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--DbLwIXqnMNXxdFHq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNZu2YACgkQN1Ujt2V2gBwTAwCeNhEsviZ/bPQ0a0N+ImHhiMsI
S7oAoIpsUHfyGDX7LXQrxZrxIWTof5Lx
=RvYO
-----END PGP SIGNATURE-----

--DbLwIXqnMNXxdFHq--
