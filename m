Received: from mail-ey0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R1CWp-0005r4-DJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Sep 2011 09:26:35 +0200
Received: by eyb7 with SMTP id 7so4988473eyb.18
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Sep 2011 00:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=S90hWftzqe6Owt4he0qJJTKijpY3w0YP+KMujkVu82U=;
	b=IFU/NLY2wDnrPoLPgPa9EbejzrpvKXAiuZ7kz76gOGl5m/YBz1CiCamNydnaW7IcPh
	PvS64TvExUxejJU7WEvjQh6Le03u8HSMLHIfZUhoJ/2UFOtuTDJTt5U7sUymIlNGpTTR
	8U+2W01RWcu2D5gaOZIbFFY5ilvqz1zLgRCjQ=
Received: by 10.213.29.207 with SMTP id r15mr1797435ebc.7.1315380093298;
	Wed, 07 Sep 2011 00:21:33 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w19sm4818065eeh.6.2011.09.07.00.21.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Sep 2011 00:21:32 -0700 (PDT)
Date: Wed, 7 Sep 2011 09:21:25 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110907072125.GC20853@jama.jama.net>
References: <CACrTVgL3To0AH5H35aBYSuhVif8EK69eAaf2DeB+-7z-y8hDVA@mail.gmail.com>
	<1315304074.4717.6.camel@mattotaupa>
	<CACrTVgJnDNks+eJhBP4Pj8o6PLqaZi2sVR62Nw67jKz=Sqj4iA@mail.gmail.com>
	<1315305904.4717.9.camel@mattotaupa>
	<CACrTVg+Zig-sAR=gUR2yt+8pRtzx_+gSBYLUnL4qro=A8t9L-Q@mail.gmail.com>
	<CACrTVgJv6yroaXzacnXL2Uo1yNvb1wc6YndSufS9iVF78MdkBA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACrTVgJv6yroaXzacnXL2Uo1yNvb1wc6YndSufS9iVF78MdkBA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: [PATCH] binutils_2.21: recipes updates to new version 2.21.1
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
X-List-Received-Date: Wed, 07 Sep 2011 07:26:35 -0000
X-Groupsio-MsgNum: 34106
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="l76fUT7nc3MelDdI"
Content-Disposition: inline

--l76fUT7nc3MelDdI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 07, 2011 at 09:15:52AM +0200, Sylvain Par=C3=A9 wrote:
> Hi Paul,
>=20
> There is a mistake in my last patch.
> As I changed the version of binutils ( + '.1') then patches are not good
> fetched, they are looked for in files/ and not in binutils-2.21/
> What is the best way to fix this ?
> copy binutils-2.21/ into binutils-2.21.1/ with all its patches or update =
the
> binutils-2.21.1.bb recipe to point to binutils-2.21/ ?
>=20
> I will then push propose a new version of my patch.

git mv binutils-2.21 binutils-2.21.1
as no recipe using binutils-2.21 directory is left

don't forget to update preferred version in sane-toolchain.inc as I said=20
yesterday on IRC

Regards,

> Thanks.
> regards,
>=20
> Sylvain
>=20
>=20
> 2011/9/6 Sylvain Par=C3=A9 <sylvain.pare@gmail.com>
>=20
> > Paul,
> > I had already resent my patch with proper -M -C option.
> > Sorry for the noise. It is missing the v2 thing. is it ok?
> > Thanks again. and next I hope it will be good from the start.
> > Greetings,
> > Sylvain
> >
> >
> >
> > 2011/9/6 Paul Menzel <paulepanter@users.sourceforge.net>
> >
> >> Am Dienstag, den 06.09.2011, 12:22 +0200 schrieb Sylvain Par=C3=A9:
> >>
> >> > thank you. I was just seing these *@# line breaks..
> >> > So yes I will use git-send.
> >> >
> >> > So about my patch I re-send a new one right?
> >>
> >> Yeah, fix the commit message with `git commit -s --amend` or `git reba=
se
> >> -i =E2=80=A6`, create a new file with
> >>
> >>        git format-patch -s -1 -M -M -C -C -C --subject-prefix=3D"PATCH
> >>        v2"
> >>
> >> and use `git send-email =E2=80=A6`.
> >>
> >>
> >> Thanks,
> >>
> >> Paul
> >>
> >>
> >> [1]
> >> http://openembedded.org/index.php/How_to_submit_a_patch_to_OpenEmbedded
> >>
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >>
> >>
> >
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--l76fUT7nc3MelDdI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk5nG3UACgkQN1Ujt2V2gBxGfACeOFWP1PNe8ubgVjeOTIv1Z0+S
S5QAoIbk5wDAqgiU2fvsqhe/Ub28ERZR
=ZYca
-----END PGP SIGNATURE-----

--l76fUT7nc3MelDdI--
