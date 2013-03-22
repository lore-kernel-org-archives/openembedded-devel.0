Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1UJ45X-0001ji-Nm
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Mar 2013 16:41:11 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2MFO5ho008101
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2013 08:24:05 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Fri, 22 Mar 2013 08:24:06 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id E57997FD0	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2013 11:23:22 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 4E34A2000B; Fri,
	22 Mar 2013 11:24:05 -0400 (EDT)
Date: Fri, 22 Mar 2013 11:24:05 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130322152405.GC10961@windriver.com>
References: <1363902391-29945-1-git-send-email-kergoth@gmail.com>
	<514B857F.2000400@windriver.com>
	<CABcZANnt7WB5P2t--wO5q+U2_z0PzNwLZHx-Pn3CSx2B4daKVg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABcZANnt7WB5P2t--wO5q+U2_z0PzNwLZHx-Pn3CSx2B4daKVg@mail.gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][danny][PATCH] layer.conf: Use .= for adding to BBPATH and += to BBFILES
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
X-List-Received-Date: Fri, 22 Mar 2013 15:41:12 -0000
X-List-Received-Date: Fri, 22 Mar 2013 15:41:12 -0000
X-Groupsio-MsgNum: 43668
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aT9PWwzfKXlsBJM1"
Content-Disposition: inline

--aT9PWwzfKXlsBJM1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][danny][PATCH] layer.conf: Use .=3D for adding t=
o BBPATH and +=3D to BBFILES] On 13.03.21 (Thu 15:22) Chris Larson wrote:

> On Thu, Mar 21, 2013 at 3:11 PM, Mark Hatle <mark.hatle@windriver.com>wro=
te:
>=20
> > On 3/21/13 4:46 PM, Christopher Larson wrote:
> >
> >> From: Andrei Gherzan <andrei.gherzan@windriver.com>
> >>
> >> Fixes parsing errors which is appearing after this commit to
> >> meta-openembedded
> >>
> >> http://cgit.openembedded.org/**meta-openembedded/commit/?id=3D**
> >> 3c21a46020bd0816579648f684c41d**bd6333583e<http://cgit.openembedded.or=
g/meta-openembedded/commit/?id=3D3c21a46020bd0816579648f684c41dbd6333583e>
> >>
> >> This triggers
> >> exception NameError: name 'base_contains' is not defined
> >> without this change
> >>
> >> Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
> >> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> >> ---
> >>   meta-networking/conf/layer.**conf | 6 +++---
> >>   1 file changed, 3 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/meta-networking/conf/layer.**conf
> >> b/meta-networking/conf/layer.**conf
> >> index f26a172..1ea2bc2 100644
> >> --- a/meta-networking/conf/layer.**conf
> >> +++ b/meta-networking/conf/layer.**conf
> >> @@ -1,9 +1,9 @@
> >>   # We have a conf and classes directory, add to BBPATH
> >> -BBPATH :=3D "${BBPATH}:${LAYERDIR}"
> >> +BBPATH .=3D ":${LAYERDIR}"
> >>
> >>   # We have a packages directory, add to BBFILES
> >> -BBFILES :=3D "${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb \
> >> - ${LAYERDIR}/recipes-*/*/*.**bbappend"
> >> +BBFILES +=3D "${LAYERDIR}/recipes-*/*/*.bb \
> >> +            ${LAYERDIR}/recipes-*/*/*.**bbappend"
> >>
> >>   BBFILE_COLLECTIONS +=3D "networking"
> >>   BBFILE_PATTERN_networking :=3D "^${LAYERDIR}/"
> >>
> >>
> > Don't those two have to be ":=3D" so that 'LAYERDIR' is immediately
> > evaluated? LAYERDIR changes depending on which layer is currently being
> > processed
>=20
>=20
> Nope, bitbake has handled LAYERDIR specially since Wed Apr 14 14:30:09
> 2010. See commits 849dbd63244cbc4eaca0f1beedbb67baca024629 and
> 40778a6e9e82c7ea4673a74fc19574430fa63e8d in bitbake.

Okay, I had a quick look through bitbake to confirm the presence of
these on the danny branch, them merged the patch.  Thanks.

--=20
-Joe MacDonald.
:wq

--aT9PWwzfKXlsBJM1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlFMd5UACgkQPN8S4W6ZZnfN/gCbB5ND5FCDvrYK0lE9n/HIFs2v
J/UAnRmSQgL5hAiy8H229awElflsnqzY
=+xY9
-----END PGP SIGNATURE-----

--aT9PWwzfKXlsBJM1--
