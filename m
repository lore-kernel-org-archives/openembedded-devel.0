Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id D13C370889
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Aug 2014 18:51:46 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1XF6JQ-0001Na-0x from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Aug 2014 11:51:48 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 6 Aug 2014 11:51:47 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.2.247.3; Wed, 6 Aug 2014
	11:51:46 -0700
Received: by burninator (Postfix, from userid 1000)	id E5631580DB1; Wed,  6
	Aug 2014 14:51:45 -0400 (EDT)
Date: Wed, 6 Aug 2014 14:51:45 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20140806185145.GF14621@mentor.com>
References: <1407332271-32696-1-git-send-email-joe_macdonald@mentor.com>
	<20140806183909.GO14848@jama>
MIME-Version: 1.0
In-Reply-To: <20140806183909.GO14848@jama>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
X-OriginalArrivalTime: 06 Aug 2014 18:51:47.0807 (UTC)
	FILETIME=[79CB86F0:01CFB1A7]
Subject: Re: [meta-networking][PATCH] wireshark: update to latest stable version
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
X-List-Received-Date: Wed, 06 Aug 2014 18:51:53 -0000
X-Groupsio-MsgNum: 51463
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oyqLL/JqMvClXZi1"
Content-Disposition: inline

--oyqLL/JqMvClXZi1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] wireshark: update to latest stable versi=
on] On 14.08.06 (Wed 20:39) Martin Jansa wrote:

> On Wed, Aug 06, 2014 at 09:37:51AM -0400, Joe MacDonald wrote:
> > Version 1.12.0 is out, update the SRC_URI and associated variables.
>=20
> One more issue:
>=20
> WARNING: QA Issue: wireshark rdepends on c-ares but its not a build
> dependency? [build-deps]
>=20
> it's strange, but it's new with 1.12.0 final.

This is likely auto-detected and the behaviour is different depending on
the presence or absence of c-ares.  I'm inclined to disable the
dependency in wireshark, but calling it out explicitly is fine with me
too.

-J.

>=20
> > Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> > ---
> >  .../wireshark/va_list-can-t-be-NULL-on-ARM.patch   | 99 --------------=
--------
> >  ...wireshark_1.12.0-rc2.bb =3D> wireshark_1.12.0.bb} | 10 +--
> >  2 files changed, 5 insertions(+), 104 deletions(-)
> >  delete mode 100644 meta-networking/recipes-support/wireshark/wireshark=
/va_list-can-t-be-NULL-on-ARM.patch
> >  rename meta-networking/recipes-support/wireshark/{wireshark_1.12.0-rc2=
=2Ebb =3D> wireshark_1.12.0.bb} (81%)



--=20
-Joe MacDonald.
:wq

--oyqLL/JqMvClXZi1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJT4nlBAAoJEEn8ffcsOfaWXksIAJ7/biNN9gT3FtI75EjAqRSg
A57ipHLb3H51Yz5gcPOYTp8xK91J3JOg+YLxQ3J53/P7PTOZI4QTdGdKdrN/i52G
57e272CINaQYrNZli61otj2EMRzQ5l0nCwBossLtMRJxKW3RTjN7mVP8w6x0SOe1
wDVlMmb2OroqVZSQebx9+C2mjrp1JzVxvocb5AAnSEqsZ1TODgbeRiypyVkFsd7/
VTbigyDeExJmLBUSvIU6VYZ9YcvJX8lpv5zMjPcoGjWwjp4ZQTArvSH44q4dnYWZ
nPSCOXaFpASn1S+b4L1jhtwxk9ZMmhmlKo+FV8qBdP8BGa8K7y2XI6mwfiOJbTo=
=ar4T
-----END PGP SIGNATURE-----

--oyqLL/JqMvClXZi1--
