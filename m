Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2EA6465D9D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 12:33:53 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id b15so2777593eek.34
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 05:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=HjEP/s/UCyMShf71VY1Ec0VaUo8ene9L6Ao1A9K9i8g=;
	b=p3EOdte5a0+vMBX36QCNFp1tp8gjVoTp7vgCWlqBleRtKQci5dAF5R0G06D80aSitL
	RFIPDIyB0hwg9+sCSd34tltkut+CpTRgUgx++KM4HgP9uVj1Jp+s/peWENlVL8TLiBZA
	uMYpCgJuN5H0kJobHi/e5ldZAGVH7zj8wZ8pfH3XVH5GTvxHPAA6yXRurp4kOBQBPhv8
	hjIUSIvQ61nJMBAhyXKomct+cBIPzFP8h/ftSYcMCZlHAKY4DMDu9nbC+fwBPbOEELzG
	0jlIKYA5Q9eUjJ6ZXX/LgRe4Zku1OiVdDmQa2wB4t0C9fk1EAFfRtzifkMnH7So9PqTE
	ByPQ==
X-Received: by 10.14.87.7 with SMTP id x7mr10482660eee.44.1398429234095;
	Fri, 25 Apr 2014 05:33:54 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	w1sm24517618eel.16.2014.04.25.05.33.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Apr 2014 05:33:53 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 25 Apr 2014 14:34:03 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140425123403.GS2486@jama>
References: <1398392569-1412-1-git-send-email-Chong.Lu@windriver.com>
	<535A126F.1010300@dominion.thruhere.net>
	<535A1B2F.1010909@windriver.com>
MIME-Version: 1.0
In-Reply-To: <535A1B2F.1010909@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH V5] rrdtool: enable perl and python bindings
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
X-List-Received-Date: Fri, 25 Apr 2014 12:33:58 -0000
X-Groupsio-MsgNum: 49491
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tFjrZTgZYY8Y8fWe"
Content-Disposition: inline

--tFjrZTgZYY8Y8fWe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2014 at 04:22:07PM +0800, Chong Lu wrote:
>=20
> On 04/25/2014 03:44 PM, Koen Kooi wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > Chong Lu schreef op 25-04-14 04:22:
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
> >> meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb |  129
> >> ++++++++++++++++++++- 1 file changed, 123 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb
> >> b/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb index
> >> 533451f..36785cd 100644 ---
> >> a/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb +++
> >> b/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb @@ -15,25 +15,142 =
@@
> >> SRC_URI =3D "http://oss.oetiker.ch/rrdtool/pub/rrdtool-${PV}.tar.gz \
> >> SRC_URI[md5sum] =3D "ffe369d8921b4dfdeaaf43812100c38f" SRC_URI[sha256s=
um] =3D
> >> "956aaf431c955ba88dd7d98920ade3a8c4bad04adb1f9431377950a813a7af11"
> >>
> >> -inherit autotools gettext +inherit autotools gettext pythonnative
> >> perlnative python-dir
> >>
> >> EXTRA_AUTORECONF =3D "-I m4"
> >>
> >> -PACKAGECONFIG ??=3D "" +PACKAGECONFIG ??=3D "python perl" +
> >> +PACKAGES_DYNAMIC +=3D "^${PN}-perl ^${PN}-python"
> > No, just no. Martin said 'Add it to PACKAGES'.
> >
> If I add it to PACKAGES, I will get following errors:
> ERROR: QA Issue: rrdtool-perl is listed in PACKAGES multiple times, this=
=20
> leads to packaging errors.
> ERROR: QA Issue: rrdtool-python is listed in PACKAGES multiple times,=20
> this leads to packaging errors.

You need to remove mangling PACKAGES from populate_packages_prepend

> >> +python populate_packages_prepend() { +    def fill_more(name,
> >> rdep=3DNone): +        if name is None or name.strip() =3D=3D "": +
> >> return + +        fpack=3Dd.getVar('PACKAGES') or "" +
> >> fpack=3D"${PN}-" + name + " " + fpack +        d.setVar('PACKAGES', fp=
ack)
> >> +        if rdep is not None: +
> >> prdep=3Dd.getVar('RDEPENDS_${PN}-' + name) or "" +            prdep=3D=
rdep +
> >> " " + prdep +            d.setVar('RDEPENDS_${PN}-' + name, prdep) + +
> >> prdep=3Dd.getVar('RDEPENDS_${PN}-' + name) or "" +            bb.debug=
(1,
> >> "RDEPENDS_${PN}-" + name + "=3D" + prdep) + +
> >> conf=3D(d.getVar('PACKAGECONFIG', True) or "").split() +
> >> pack=3Dd.getVar('PACKAGES') or "" +    bb.debug(1, "PACKAGECONFIG=3D%s=
" %
> >> conf) +    bb.debug(1, "PACKAGES1=3D%s" % pack ) + +    if "perl" in c=
onf
> >> : +        fill_more("perl") + +    if "python" in conf: +
> >> fill_more("python") + +    pack=3Dd.getVar('PACKAGES', True) or "" +
> >> bb.debug(1, "PACKAGES after=3D%s" % pack) + +    #debug code +
> >> #prdep=3Dd.getVar('RDEPENDS_${PN}') or "" +    #bb.debug(1,
> >> "RDEPENDS_${PN}" + "=3D" + prdep) +    #prdep=3Dd.getVar('RDEPENDS') o=
r "" +
> >> #bb.debug(1, "RDEPENDS" + "=3D" + prdep) +}
> > What is this?
> > -----BEGIN PGP SIGNATURE-----
> > Version: GnuPG v1.4.5 (Darwin)
> > Comment: GPGTools - http://gpgtools.org
> >
> > iD8DBQFTWhJvMkyGM64RGpERArXTAJ4u1918rurp4h7aTEX6wW2/J0C+IgCeLLQc
> > ALaeAdoJhjuntnDEx23edT0=3D
> > =3D0QxD
> > -----END PGP SIGNATURE-----
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tFjrZTgZYY8Y8fWe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNaVjsACgkQN1Ujt2V2gBx0DgCaA02wAAOl+TdsBluu8pPzXL2i
3B0AnRigLAe6vsBhcJPjzdW7A0P7Fz5F
=6fO7
-----END PGP SIGNATURE-----

--tFjrZTgZYY8Y8fWe--
