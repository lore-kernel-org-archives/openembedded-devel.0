Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9Hey-0002gq-FP
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Sep 2011 16:32:24 +0200
Received: by bke11 with SMTP id 11so745109bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Sep 2011 07:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6QydpQkZhlJIfBVyFH1NNXPmyy+R4r4vI9YUWjlgS64=;
	b=DsvmWPylwiI0ECnIMIhdCQlybdUbS6O78pIH6/HRIquNCU+6RcEbLDz0xw4F9TnIkb
	tGLhvuwFIHkprP2/OtbK7FP83wjAFupWNG0YGxyOp/LVgBjRh0rM5cLjw6SGfPyS/2ku
	n0JLn23OKEvPk1QPrldepkAky/W7moWTfzwxI=
Received: by 10.204.137.210 with SMTP id x18mr1537955bkt.354.1317306413170;
	Thu, 29 Sep 2011 07:26:53 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b17sm1968001bkd.8.2011.09.29.07.26.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 29 Sep 2011 07:26:52 -0700 (PDT)
Date: Thu, 29 Sep 2011 16:26:43 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110929142643.GD5030@jama.jama.net>
References: <20110929092859.GB5030@jama.jama.net>
	<1317304678-27094-1-git-send-email-Martin.Jansa@gmail.com>
	<CAMKF1spa2wDNGzmOxPPhxEKKyHGo1RxjLEkNasfk8vP+65PFFg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spa2wDNGzmOxPPhxEKKyHGo1RxjLEkNasfk8vP+65PFFg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] gcc-4.6: drop/update few patches from gcc-4_6-branch-linaro-backports.inc
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
X-List-Received-Date: Thu, 29 Sep 2011 14:32:24 -0000
X-Groupsio-MsgNum: 34505
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AkbCVLjbJ9qUtAXD"
Content-Disposition: inline

--AkbCVLjbJ9qUtAXD
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 29, 2011 at 07:18:15AM -0700, Khem Raj wrote:
> On Thu, Sep 29, 2011 at 6:57 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > * they need to be rebased after
> > =A0http://git.openembedded.org/cgit.cgi/openembedded-core/commit/?id=3D=
ed7deecb9503420fbf8071445e077c32beda8dc4
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>=20
> I had a patch which should have addressed it. I was waiting for update in=
 core
> can you try this one out ? this should address this issue as well.
>=20
> http://patches.openembedded.org/patch/12407/

Thanks, I'll try your patch.. not sure why I haven't seen it on ML (or
was it sent just now? - if yes, can you please send such patch at the
same time as patch for oe-core? so people willing to test it can do it
before applying oe-core patch?).

Regards,

>=20
> > ---
> > =A0.../gcc-4.6/linaro/gcc-4.6-linaro-r106741.patch =A0 =A0| =A0 =A04 ++=
--
> > =A0.../gcc-4.6/linaro/gcc-4.6-linaro-r106742.patch =A0 =A0| =A0 =A09 ++=
++-----
> > =A0.../gcc/gcc-4_6-branch-linaro-backports.inc =A0 =A0 =A0 =A0| =A0 =A0=
2 --
> > =A03 files changed, 6 insertions(+), 9 deletions(-)
> >
> > diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106741.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106741.patch
> > index 84f6f64..f76914f 100644
> > --- a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r10674=
1.patch
> > +++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r10674=
1.patch
> > @@ -188,8 +188,8 @@
> > =A0 =A0 =A0 =A0{
> > =A0 =A0 =A0 =A0 =A0/* Try to simplify the expression further. =A0*/
> > =A0 =A0 =A0 =A0 =A0rtx tor =3D simplify_gen_binary (IOR, mode, XEXP (x,=
 0), XEXP (x, 1));
> > -- =A0 =A0 =A0 =A0temp =3D combine_simplify_rtx (tor, mode, in_dest);
> > -+ =A0 =A0 =A0 =A0temp =3D combine_simplify_rtx (tor, mode, in_dest, 0);
> > +- =A0 =A0 =A0 =A0temp =3D combine_simplify_rtx (tor, VOIDmode, in_dest=
);
> > ++ =A0 =A0 =A0 =A0temp =3D combine_simplify_rtx (tor, VOIDmode, in_dest=
, 0);
> >
> > =A0 =A0 =A0 =A0 =A0/* If we could, great. =A0If not, do not go ahead wi=
th the IOR
> > =A0 =A0 =A0 =A0 =A0 =A0 replacement, since PLUS appears in many special=
 purpose
> > diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106742.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro=
-r106742.patch
> > index d14f06c..836b76f 100644
> > --- a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r10674=
2.patch
> > +++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r10674=
2.patch
> > @@ -1582,15 +1582,14 @@
> > =A0=3D=3D=3D modified file 'gcc/config/arm/predicates.md'
> > =A0--- old/gcc/config/arm/predicates.md =A0 2011-04-07 10:52:12 +0000
> > =A0+++ new/gcc/config/arm/predicates.md =A0 2011-05-03 15:14:56 +0000
> > -@@ -683,3 +683,7 @@
> > - =A0 =A0}
> > - =A0 return true;
> > - })
> > +@@ -686,3 +686,7 @@
> > +
> > + (define_special_predicate "add_operator"
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(match_code "plus"))
> > =A0+
> > =A0+(define_special_predicate "neon_struct_operand"
> > =A0+ =A0(and (match_code "mem")
> > =A0+ =A0 =A0 =A0 (match_test "TARGET_32BIT && neon_vector_mem_operand (=
op, 2)")))
> > -
> > =A0=3D=3D=3D modified file 'gcc/doc/tm.texi'
> > =A0--- old/gcc/doc/tm.texi =A0 =A0 =A0 =A02011-01-22 19:35:10 +0000
> > =A0+++ new/gcc/doc/tm.texi =A0 =A0 =A0 =A02011-05-03 15:17:25 +0000
> > diff --git a/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backpor=
ts.inc b/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
> > index 86dceab..e256e15 100644
> > --- a/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
> > +++ b/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
> > @@ -21,11 +21,9 @@ file://linaro/gcc-4.6-linaro-r106755.patch \
> > =A0file://linaro/gcc-4.6-linaro-r106759.patch \
> > =A0file://linaro/gcc-4.6-linaro-r106761.patch \
> > =A0file://linaro/gcc-4.6-linaro-r106762.patch \
> > -file://linaro/gcc-4.6-linaro-r106763.patch \
> > =A0file://linaro/gcc-4.6-linaro-r106764.patch \
> > =A0file://linaro/gcc-4.6-linaro-r106766.patch \
> > =A0file://linaro/gcc-4.6-linaro-r106768.patch \
> > -file://linaro/gcc-4.6-linaro-r106769.patch \
> > =A0file://linaro/gcc-4.6-linaro-r106770.patch \
> > =A0file://linaro/gcc-4.6-linaro-r106771.patch \
> > =A0file://linaro/gcc-4.6-linaro-r106772.patch \
> > --
> > 1.7.6.1
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--AkbCVLjbJ9qUtAXD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6EgCMACgkQN1Ujt2V2gBzxgQCfU16sI+jakSpdQpIJDtXyV+K2
fN4AoKsKynQMMZTAO7MuoecH/uT+Fa5q
=Vgva
-----END PGP SIGNATURE-----

--AkbCVLjbJ9qUtAXD--
