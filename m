Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 394B97713C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Sep 2016 00:35:26 +0000 (UTC)
Received: from svr-orw-fem-03.mgc.mentorg.com ([147.34.97.39])
	by relay1.mentorg.com with esmtp 
	id 1biWGU-0003eh-GI from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Sep 2016 17:35:26 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.3.224.2; Fri, 9 Sep 2016
	17:35:25 -0700
Received: by burninator (Postfix, from userid 1000)	id 421AC580455; Fri,  9
	Sep 2016 20:35:25 -0400 (EDT)
Date: Fri, 9 Sep 2016 20:35:25 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20160910003524.GA18761@mentor.com>
References: <cover.1473388166.git.jackie.huang@windriver.com>
	<b21847dcc8605a8522be2bea1c0a1b4788cf841e.1473388166.git.jackie.huang@windriver.com>
	<20160909204446.GB5631@mentor.com>
	<CALbNGRSRPaVEkYqD8sQoD07Mv7Mk4eFB-VHFzJt12haS3KdMpA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRSRPaVEkYqD8sQoD07Mv7Mk4eFB-VHFzJt12haS3KdMpA@mail.gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH 2/2 v2] samba: restrict the blacklist to ARM only
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 10 Sep 2016 00:35:29 -0000
X-Groupsio-MsgNum: 63047
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="T4sUOijqQbZv57TR"
Content-Disposition: inline

--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH 2/2 v2] samba: restrict the blacklist to =
ARM only] On 16.09.10 (Sat 00:03) Andreas M=FCller wrote:

> On Fri, Sep 9, 2016 at 10:44 PM, Joe MacDonald <Joe_MacDonald@mentor.com>=
 wrote:
> > [[oe] [meta-networking][PATCH 2/2 v2] samba: restrict the blacklist to =
ARM only] On 16.09.09 (Fri 10:34) jackie.huang@windriver.com wrote:
> >
> >> From: Jackie Huang <jackie.huang@windriver.com>
> >>
> >> It builds fine except for arm now, and the do_package
> >> and libpam issue is fixed by:
> >> "waf-samba.bbclass: Add PACKAGECONFIG_CONFARGS to CONFIGUREOPTS"
> >
> > Did you confirm that you're still seeing the failure for arm?
> >
> > -J.
> >
> >>
> >> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> >> ---
> >>  meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 6 +++---
> >>  1 file changed, 3 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb=
 b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> >> index 042203e..c34adcb 100644
> >> --- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> >> +++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> >> @@ -319,6 +319,6 @@ RDEPENDS_${PN}-pidl_append =3D " perl"
> >>  FILES_${PN}-pidl =3D "${bindir}/pidl ${datadir}/perl5/Parse"
> >>
> >>  # http://errors.yoctoproject.org/Errors/Details/81004/
> >> -# before this issue it was also failing in do_package and
> >> -# autodetecting libpam dependency
> >> -PNBLACKLIST[samba] ?=3D "BROKEN: fails to build with new binutils-2.2=
7"
> >> +BLACKLIST_REASON ?=3D ""
> >> +BLACKLIST_REASON_arm =3D "BROKEN: fails to build with new binutils-2.=
27"
> >> +PNBLACKLIST[samba] ?=3D "${BLACKLIST_REASON}"
> >> --
> >> 2.8.3
> >>
> > --
> > -Joe MacDonald.
> > :wq
> >
> Did you see [1] - it fixes build for arm.
>=20
> [1] http://lists.openembedded.org/pipermail/openembedded-devel/2016-Septe=
mber/108972.html

I didn't, actually, but I had picked it up in my tree anyway when I
scooped up the latest set of changes in master-next.  The reason I was
asking was because I wasn't seeing a failure anymore in samba on arm and
was curious why Jackie was still seeing it if I wasn't and I hadn't seen
an explicit patch to resolve the issue.  But there it is, mystery
solved.  Thanks for the heads-up, Andreas.

--=20
-Joe MacDonald.
:wq

--T4sUOijqQbZv57TR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJX01VMAAoJEEn8ffcsOfaW6IcH/j2vGQ7ndj+YF8sXHmsGkivM
SKy8ISJHbZug52R+wPFW5672PaqHwGVcY1uCEpCnus3601qjvucHHKEbgxirOGD1
G2PS48EDAEFCA4xzSLC8rnbym5qkUhdH+CtUVOkq/oOiE7XTnF8Q+AWYpNpOEUJR
mbCxhi/IAW5sPVi18CbJvq2z8NbIaf9Zg8sDSIBsZ7eBM3hFlpaZEXae5cdht5VR
cdMQKkkgBk3V58H3vuZEov42M+0vleA1gwzw0BXXszylpnuT9t964eq+uL7fqUOJ
pN4HpoPhQl09mpkbNInSHiiiWZAlkailUmWWicefkFE4LKTt6wtH306bdRzRlZU=
=IfWD
-----END PGP SIGNATURE-----

--T4sUOijqQbZv57TR--
