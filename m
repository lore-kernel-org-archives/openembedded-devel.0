Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0D4DA72842
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 23:26:08 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id q59so8710368wes.38
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Jan 2015 15:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Kj/ECc4+R6YEsfQ9g/UtXqGuIR1FL8KU+g7N5pAM860=;
	b=tkXV2uZLd7sSXZJLsxozBVSFDK9FcJDvMqgIGaNPH+WlnSVYLssdoMLtXjYLMR779f
	FKXs3HTYjWP/+kdfnYf1CKKkxYZhyqku+hEJPJzDSJ8Xqgy9UiQ7LW6NuiJkWOT4s8A8
	3/UE8RKas62WRNUDTmtLDegvARPnjLWh1aPZc0bE3VJAiYquBZid03QZE55+OuszjfZw
	ZAVdrxNPSBzvo6VfF+vJcDvfK4BhVCgboU0+NRaO6H56539kMHu7z3ShUQ76Uv+T02Nw
	0PLkfQpXSgE6C9/+2pIXMKh0EcV75htwnvQ//H9z3etn94oo3PmLr45i1HvUW0vwUcvm
	r6ow==
X-Received: by 10.180.74.212 with SMTP id w20mr31088342wiv.22.1420500368480;
	Mon, 05 Jan 2015 15:26:08 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	dn2sm11691387wib.14.2015.01.05.15.26.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Jan 2015 15:26:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 6 Jan 2015 00:26:09 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150105232609.GB19402@jama>
References: <1420425013-19013-1-git-send-email-liezhi.yang@windriver.com>
	<20150105115903.GE2484@jama> <54AB1756.1040601@windriver.com>
MIME-Version: 1.0
In-Reply-To: <54AB1756.1040601@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe] [V2 PATCH 1/5] dash: use BP in SRC_URI
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
X-List-Received-Date: Mon, 05 Jan 2015 23:26:10 -0000
X-Groupsio-MsgNum: 53671
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="U+BazGySraz5kW0T"
Content-Disposition: inline

--U+BazGySraz5kW0T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 06, 2015 at 06:59:34AM +0800, Robert Yang wrote:
>=20
>=20
> On 01/05/2015 07:59 PM, Martin Jansa wrote:
> > Thanks for v2
> >
> > Please remember to update your old series as superseded when pushing
> > newer version, it would help me a lot when sorting the pending patches.
>=20
> Hi Matin, what did you mean about: "update your old series as superseded",
> please ? I can't understand this clearly.

See
http://www.openembedded.org/wiki/Patchwork
and list of patches here
http://patchwork.openembedded.org/project/oe/list/

It helps me a lot when the submitters update status of their patches
(because they usually don't have so many of them and they should know if
they were applied, rejected in e-mail review or superseded when they
send new version).

My multi-layer triage usually starts by finding duplicate changes,
marking all but latest as superseded, then adding them to right bundle
if they belong to layer with separate maintainer and then cherry-pick
the rest to master-next (or update it there).

Any help in this triage helps me to do it faster and possibly more often
(but even now I do it as often as I have jenkins server available for
another round of testing)

>=20
> // Robert
>=20
> >
> > On Sun, Jan 04, 2015 at 06:30:09PM -0800, Robert Yang wrote:
> >> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> >> ---
> >>   meta-oe/recipes-extended/dash/dash_0.5.8.bb |    2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta-oe/recipes-extended/dash/dash_0.5.8.bb b/meta-oe/rec=
ipes-extended/dash/dash_0.5.8.bb
> >> index c2b5249..4961d7b 100644
> >> --- a/meta-oe/recipes-extended/dash/dash_0.5.8.bb
> >> +++ b/meta-oe/recipes-extended/dash/dash_0.5.8.bb
> >> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db5262b4a1a1=
bff72b48e935531976d2e"
> >>
> >>   inherit autotools update-alternatives
> >>
> >> -SRC_URI =3D "http://gondor.apana.org.au/~herbert/dash/files/${PN}-${P=
V}.tar.gz"
> >> +SRC_URI =3D "http://gondor.apana.org.au/~herbert/${BPN}/files/${BP}.t=
ar.gz"
> >>   SRC_URI[md5sum] =3D "5c152209680dab3c319e8923f6c51378"
> >>   SRC_URI[sha256sum] =3D "c6db3a237747b02d20382a761397563d813b306c020a=
e28ce25a1c3915fac60f"
> >>
> >> --
> >> 1.7.9.5
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
> >
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--U+BazGySraz5kW0T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSrHZEACgkQN1Ujt2V2gBydDwCgrvfuT+P2u8ha2ekM1LB3EHk9
8SwAniDb+HV/bSDalPDdTXEUI26Tgfkj
=oCrs
-----END PGP SIGNATURE-----

--U+BazGySraz5kW0T--
