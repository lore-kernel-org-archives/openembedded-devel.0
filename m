Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 398B1601F5
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Dec 2014 15:56:33 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id h11so35198471wiw.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Dec 2014 07:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=VkvXUqeMsaRDYvTRULhrTHm2eXUbtw+6IP39FdYfVK4=;
	b=T8Qj8jtaCWgmfMf0tqYe0HrN07M+FbCMQvIzmI+JT6MloCj0bD1Dy9Jk+5Kb6ir5Rt
	Hyr4EqztLpLxAGUTPJXp9LaJM3Jhi2RP+C5c88gaqSgv4WQxz2VdiVcheOd38gK2v49o
	KpinpRxObLn0U5vEO8BXfFiW3xSlHLN0fSQ/KNPvsZffC4daNHPICSDjEQO4CiywYUFI
	wjkA3hJtAyupg/JC9/QFNsCstFj2QrNTx5IaC7byWZq9F4g80bKIpjwtNPaIaoRwccgv
	UNfCI5xpMVF9FJJinscm2JsqZ8JrvK80xBT3xWOrfGVVc+RL7bBw5rDftWl16gIHGJvO
	v8dg==
X-Received: by 10.180.89.70 with SMTP id bm6mr50268223wib.56.1417708594093;
	Thu, 04 Dec 2014 07:56:34 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	e7sm41031978wjx.31.2014.12.04.07.56.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Dec 2014 07:56:33 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 4 Dec 2014 16:56:36 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141204155636.GD2453@jama>
References: <1417697009-9094-1-git-send-email-rapphil@gmail.com>
	<CAENGNheKVaQD13gwSFU-cjm7K_aUAHujZLQMMs=nq=fR6nWxWg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAENGNheKVaQD13gwSFU-cjm7K_aUAHujZLQMMs=nq=fR6nWxWg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] acpitest: fixing failing recipe
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
X-List-Received-Date: Thu, 04 Dec 2014 15:56:43 -0000
X-Groupsio-MsgNum: 53194
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NtwzykIc2mflq5ck"
Content-Disposition: inline

--NtwzykIc2mflq5ck
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 04, 2014 at 01:09:18PM -0200, Raphael Philipe wrote:
> I noticed two typos in my patch. First i didn't use the prefix
> [meta-oe], and second, in the subject, it is acpitestS the name of the
> module.
>=20
> It will not happen again :)

Cool, will fix when cherry-picking to master-next.

> regards,
>=20
> On Thu, Dec 4, 2014 at 10:43 AM, Raphael Silva <rapphil@gmail.com> wrote:
> > Removed from blacklist and fixed do_compile error due to sysroot poison=
ing.
> > Fixed removing the redefinition of CC.
> >
> > Signed-off-by: Raphael Silva <rapphil@gmail.com>
> > ---
> >  meta-oe/recipes-extended/acpica/acpitests_20140828.bb | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/meta-oe/recipes-extended/acpica/acpitests_20140828.bb b/me=
ta-oe/recipes-extended/acpica/acpitests_20140828.bb
> > index 75e10f6..93c20af 100644
> > --- a/meta-oe/recipes-extended/acpica/acpitests_20140828.bb
> > +++ b/meta-oe/recipes-extended/acpica/acpitests_20140828.bb
> > @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://tests/aapits/atexec.c;begi=
nline=3D1;endline=3D115;md5=3De92
> >
> >  DEPENDS =3D "bison flex"
> >
> > -PNBLACKLIST[acpitests] =3D "fails to find string.h since sysroot poiso=
ning was added in internal toolchain"
> >
> >  SRC_URI =3D "https://acpica.org/sites/acpica/files/acpitests-unix-${PV=
}.tar.gz;name=3Dacpitests \
> >             https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.ta=
r.gz;name=3Dacpica \
> > @@ -20,7 +19,7 @@ SRC_URI[acpica.sha256sum] =3D "01d8867656c5ba41dec307=
c4383ce676196ad4281ac2c9dec9f
> >
> >  S =3D "${WORKDIR}/acpitests-unix-${PV}"
> >
> > -EXTRA_OEMAKE =3D "'CC=3D${TARGET_PREFIX}gcc ${HOST_CC_ARCH}' 'OPT_CFLA=
GS=3D-Wall'"
> > +EXTRA_OEMAKE =3D "'${HOST_CC_ARCH}' 'OPT_CFLAGS=3D-Wall'"
> >
> >  # The Makefiles expect a specific layout
> >  do_compile() {
> > --
> > 1.9.1
> >
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NtwzykIc2mflq5ck
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSAhDQACgkQN1Ujt2V2gBwppgCgt0ttGenbIGItd2BWF7M2qNt8
/BgAnRtUUJ1sodzthHDv1+GQypi1OcLr
=905H
-----END PGP SIGNATURE-----

--NtwzykIc2mflq5ck--
