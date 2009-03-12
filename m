Received: from [212.27.42.6] (helo=smtp6-g21.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <caratorn@gmail.com>) id 1LhhCU-0004jI-53
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Mar 2009 10:27:38 +0100
Received: from smtp6-g21.free.fr (localhost [127.0.0.1])
	by smtp6-g21.free.fr (Postfix) with ESMTP id B19E0E080AC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2009 10:27:24 +0100 (CET)
Received: from free.fr (tui75-3-88-168-237-15.fbx.proxad.net [88.168.237.15])
	by smtp6-g21.free.fr (Postfix) with ESMTP id CAA4FE080C7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2009 10:27:21 +0100 (CET)
Date: Thu, 12 Mar 2009 10:31:21 +0100
From: Charles =?iso-8859-1?Q?Cl=E9ment?= <caratorn@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090312093121.GA4534@sourdiere>
References: <20090312091654.GA4382@sourdiere>
MIME-Version: 1.0
In-Reply-To: <20090312091654.GA4382@sourdiere>
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH] Pyrex 0.9.8.5 Fix SRC_URI
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
X-List-Received-Date: Thu, 12 Mar 2009 09:27:38 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

There was a problem with the previous patch, resending


From f637f40a753bc4af7dec4f7be1c606ef605726f1 Mon Sep 17 00:00:00 2001
From: =3D?utf-8?q?Charles=3D20Cl=3DC3=3DA9ment?=3D <caratorn@gmail.com>
Date: Thu, 12 Mar 2009 10:27:51 +0100
Subject: [[oe] Update Pyrex SRC_URI] Pyrex 0.9.8.5 Fix SRC_URI
MIME-Version: 1.0
Content-Type: text/plain; charset=3Dutf-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Charles Cl=E9ment <caratorn@gmail.com>
---
 packages/python/python-pyrex_0.9.8.5.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/packages/python/python-pyrex_0.9.8.5.bb b/packages/python/py=
thon-pyrex_0.9.8.5.bb
index 94db793..d4d4baa 100644
--- a/packages/python/python-pyrex_0.9.8.5.bb
+++ b/packages/python/python-pyrex_0.9.8.5.bb
@@ -8,7 +8,7 @@ SRCNAME =3D "Pyrex"
 PR =3D "ml0"
=20
 SRC_URI =3D "\
-  http://nz.cosc.canterbury.ac.nz/~greg/python/${SRCNAME}/${SRCNAME}-${P=
V}.tar.gz \
+  http://www.cosc.canterbury.ac.nz/greg.ewing/python/${SRCNAME}/${SRCNAM=
E}-${PV}.tar.gz \
   file://pyrex-fix-optimized-mode.patch;patch=3D1 \
 "
 S =3D "${WORKDIR}/${SRCNAME}-${PV}"
--=20
1.6.2



On Thu, Mar 12, 2009 at 10:16:54AM +0100, =3D?utf-8?q?Charles=3D20Cl=3DC3=
=3DA9ment?=3D wrote:
> Hello,
>=20
> I had trouble downloading Pyrex archive, here's a patch
>=20
> Signed-off-by: Charles Cl=E9ment <caratorn@gmail.com>
> ---
>  packages/python/python-pyrex_0.9.8.5.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/packages/python/python-pyrex_0.9.8.5.bb b/packages/python/=
python-pyrex_0.9.8.5.bb
> index 94db793..f9e5dd0 100644
> --- a/packages/python/python-pyrex_0.9.8.5.bb
> +++ b/packages/python/python-pyrex_0.9.8.5.bb
> @@ -8,7 +8,7 @@ SRCNAME =3D "Pyrex"
>  PR =3D "ml0"
> =20
>  SRC_URI =3D "\
> -  http://nz.cosc.canterbury.ac.nz/~greg/python/${SRCNAME}/${SRCNAME}-$=
{PV}.tar.gz \
> +  http://www.cosc.canterbury.ac.nz/greg.ewing/python/${SRCNAME}/${SRCN=
AME}-${PV}.tar.gz
>    file://pyrex-fix-optimized-mode.patch;patch=3D1 \
>  "
>  S =3D "${WORKDIR}/${SRCNAME}-${PV}"
> --=20
> 1.6.2
>=20
>=20
> --=20
> Charles Cl=E9ment.
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Charles Cl=E9ment.


