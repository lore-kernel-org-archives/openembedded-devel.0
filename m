Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RGcpr-00067f-Q8
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Oct 2011 22:34:00 +0200
Received: by bkat8 with SMTP id t8so2823575bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Oct 2011 13:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=OUM+NoVR0eD4JlihOKFoojdj4+j/iXr1QTcipMrb2iM=;
	b=pNVRvFjtUP/TNg7aUCNDVnzi/2k8B0pbjW186Tz0lvogC0Qj782jtAPhMCBCPXIUoz
	XU9i/Wwc5gdPG3nrmsCHhppBN4w2u6FIKZGIKwSJr8CRC5C/fnQb8nj87mVl4tGAImG1
	2EbNGENIdz8uNutSk7PMFUDufoGUatBHEGoNI=
Received: by 10.204.148.68 with SMTP id o4mr6088966bkv.21.1319056084104;
	Wed, 19 Oct 2011 13:28:04 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e14sm7309400bka.0.2011.10.19.13.28.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 19 Oct 2011 13:28:02 -0700 (PDT)
Date: Wed, 19 Oct 2011 22:27:57 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111019202757.GF3522@jama.jama.net>
References: <1319037014-29473-1-git-send-email-ulf_samuelsson@telia.com>
	<1319037014-29473-2-git-send-email-ulf_samuelsson@telia.com>
	<4E9EF092.3080300@gmail.com> <4E9F3005.5040203@telia.com>
MIME-Version: 1.0
In-Reply-To: <4E9F3005.5040203@telia.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 2/3] Use linux2 when configuring python-2.6.6
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
X-List-Received-Date: Wed, 19 Oct 2011 20:34:00 -0000
X-Groupsio-MsgNum: 34909
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5Mfx4RzfBqgnTE/w"
Content-Disposition: inline

--5Mfx4RzfBqgnTE/w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 19, 2011 at 10:16:05PM +0200, Ulf Samuelsson wrote:
> 2011-10-19 17:45, Khem Raj skrev:
> > On 10/19/2011 8:10 AM, ulf_samuelsson@telia.com wrote:
> >> From: Ulf Samuelsson<ulf_samuelsson@telia.com>
> >>
> >> Signed-off-by: Ulf Samuelsson<ulf.samuelsson@telia.com>
> >>
> >> ---
> >>   ...64-bit-host.-Use-linux2-instead-of-linux3.patch |   40=20
> >> ++++++++++++++++++++
> >>   recipes/python/python_2.6.6.bb                     |    1 +
> >>   2 files changed, 41 insertions(+), 0 deletions(-)
> >>   create mode 100644=20
> >> recipes/python/python-2.6.6/0001-Support-64-bit-host.-Use-linux2-inste=
ad-of-linux3.patch
> >>
> >> diff --git=20
> >> a/recipes/python/python-2.6.6/0001-Support-64-bit-host.-Use-linux2-ins=
tead-of-linux3.patch=20
> >> b/recipes/python/python-2.6.6/0001-Support-64-bit-host.-Use-linux2-ins=
tead-of-linux3.patch=20
> >>
> >> new file mode 100644
> >> index 0000000..46ce713
> >> --- /dev/null
> >> +++=20
> >> b/recipes/python/python-2.6.6/0001-Support-64-bit-host.-Use-linux2-ins=
tead-of-linux3.patch
> >> @@ -0,0 +1,40 @@
> >> +From 3fbd3d4aa2f9b0aaa806ec9f19dc589a0928ef0c Mon Sep 17 00:00:00 2001
> >> +From: Ulf Samuelsson<ulf_samuelsson@telia.com>
> >> +Date: Wed, 19 Oct 2011 15:46:32 +0200
> >> +Subject: [PATCH] Support 64 bit host. Use linux2 instead of linux3
> >
> >
> > can you explain why this change is needed.
>=20
> I tried building on Ubuntu 11.10 x64 and Python, openssl and binutils fai=
ls.
> openssl I backported as recommended, and I then found the buildroot
> patch after some searching.
>=20
> Here is the comment from the Buildroot patch:
>=20
> When compiling Python on a host running Linux 3.0, the sys.platform
> constant is set at "linux3". A lot of code (inside the interpreter
> itself, its build system and third party apps and libraries) relies on
> it to be linux2 on a Linux system.

Or you can use this patch
http://git.openembedded.org/openembedded-core/commit/?id=3D4b7e7b004dacb698=
ed637f35661a60d2402c00cd

Regards,

> This leads to the build of the target python package to break.
>=20
> This behaviour has been reported on the Python bugtracker but is not
> fixed yet.
>=20
>=20
> ---
> After I applied the three patches in the patchset,
> I managed to complete the build without errors.
>=20
> >
> >> +
> >> +Imported from the Buildroot project.
> >> +
> >> +Signed-off-by: Ulf Samuelsson<ulf.samuelsson@telia.com>
> >> +---
> >> + configure    |    1 +
> >> + configure.in |    1 +
> >> + 2 files changed, 2 insertions(+), 0 deletions(-)
> >> +
> >> +diff --git a/configure b/configure
> >> +index d0731c3..dc8d029 100755
> >> +--- a/configure
> >> ++++ b/configure
> >> +@@ -2814,6 +2814,7 @@ then
> >> +     darwin*) MACHDEP=3D"darwin";;
> >> +     atheos*) MACHDEP=3D"atheos";;
> >> +         irix646) MACHDEP=3D"irix6";;
> >> ++    linux*)    MACHDEP=3D"linux2";;
> >> +     '')    MACHDEP=3D"unknown";;
> >> +     esac
> >> + fi
> >> +diff --git a/configure.in b/configure.in
> >> +index 609d8f2..8b8b77c 100644
> >> +--- a/configure.in
> >> ++++ b/configure.in
> >> +@@ -264,6 +264,7 @@ then
> >> +     darwin*) MACHDEP=3D"darwin";;
> >> +     atheos*) MACHDEP=3D"atheos";;
> >> +         irix646) MACHDEP=3D"irix6";;
> >> ++    linux*)    MACHDEP=3D"linux2";;
> >> +     '')    MACHDEP=3D"unknown";;
> >> +     esac
> >> + fi
> >> +--
> >> +1.7.5.4
> >> +
> >> diff --git a/recipes/python/python_2.6.6.bb=20
> >> b/recipes/python/python_2.6.6.bb
> >> index eacc5c2..ae057a2 100644
> >> --- a/recipes/python/python_2.6.6.bb
> >> +++ b/recipes/python/python_2.6.6.bb
> >> @@ -18,6 +18,7 @@ SRC_URI =3D "\
> >>     file://python-module-rpath-fix.patch \
> >>     file://sitecustomize.py \
> >>     file://pkgconfig-support.patch \
> >> +  file://0001-Support-64-bit-host.-Use-linux2-instead-of-linux3.patch=
 \
> >>   "
> >>   SRC_URI[md5sum] =3D "cf4e6881bb84a7ce6089e4a307f71f14"
> >>   SRC_URI[sha256sum] =3D=20
> >> "134c5e0736bae2e5570d0b915693374f11108ded63c35a23a35d282737d2ce83"
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
>=20
> --=20
> Best Regards
> Ulf Samuelsson
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5Mfx4RzfBqgnTE/w
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6fMs0ACgkQN1Ujt2V2gBzZLwCggFmJvbuTMh/O4Bti2iFct+Wm
OosAnRIuhdeInF4J248Nrqf5Wm71+M0p
=Cwyy
-----END PGP SIGNATURE-----

--5Mfx4RzfBqgnTE/w--
