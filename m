Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 71CAB65CF7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Aug 2014 19:42:36 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1XF76b-0005OY-Uf from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Aug 2014 12:42:37 -0700
Received: from SVR-ORW-FEM-03.mgc.mentorg.com ([147.34.97.39]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 6 Aug 2014 12:42:37 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.2.247.3; Wed, 6 Aug 2014
	12:42:36 -0700
Received: by burninator (Postfix, from userid 1000)	id 761735819A3; Wed,  6
	Aug 2014 15:42:36 -0400 (EDT)
Date: Wed, 6 Aug 2014 15:42:36 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20140806194236.GH14621@mentor.com>
References: <1407332271-32696-1-git-send-email-joe_macdonald@mentor.com>
	<20140806183909.GO14848@jama> <20140806185145.GF14621@mentor.com>
	<20140806193732.GQ14848@jama>
MIME-Version: 1.0
In-Reply-To: <20140806193732.GQ14848@jama>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
X-OriginalArrivalTime: 06 Aug 2014 19:42:37.0594 (UTC)
	FILETIME=[939C17A0:01CFB1AE]
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
X-List-Received-Date: Wed, 06 Aug 2014 19:42:38 -0000
X-Groupsio-MsgNum: 51468
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tAmVnWIZ6lqEAvSf"
Content-Disposition: inline

--tAmVnWIZ6lqEAvSf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] wireshark: update to latest stable versi=
on] On 14.08.06 (Wed 21:37) Martin Jansa wrote:

> On Wed, Aug 06, 2014 at 02:51:45PM -0400, Joe MacDonald wrote:
> > [Re: [oe] [meta-networking][PATCH] wireshark: update to latest stable v=
ersion] On 14.08.06 (Wed 20:39) Martin Jansa wrote:
> >=20
> > > On Wed, Aug 06, 2014 at 09:37:51AM -0400, Joe MacDonald wrote:
> > > > Version 1.12.0 is out, update the SRC_URI and associated variables.
> > >=20
> > > One more issue:
> > >=20
> > > WARNING: QA Issue: wireshark rdepends on c-ares but its not a build
> > > dependency? [build-deps]
> > >=20
> > > it's strange, but it's new with 1.12.0 final.
> >=20
> > This is likely auto-detected and the behaviour is different depending on
> > the presence or absence of c-ares.  I'm inclined to disable the
> > dependency in wireshark, but calling it out explicitly is fine with me
> > too.
>=20
> That's what my test-dependencies.sh script is testing and it was
> returning clean result for rc2, that's why it's surprising, but
> wireshark isn't alone with this issue, so follow-up patch is completely
> fine (it can also include that PE bump).

Yeah, makes sense.  That's what I've done in the patch I just sent out.
I went ahead and disabled c-ares since that looked like the path of
least resistance, and it can be re-introduced later if required.
(Unless, of course, Armin already has an update for that part.)

-J.

>=20
> http://lists.openembedded.org/pipermail/openembedded-devel/2014-July/0972=
23.html
> libcap libnl libnl-genl libnl-nf libnl-route portaudio-v19 sbc were
> floating with rc2, all of them fixed (according to test-dependencies.sh)
> by
> http://lists.openembedded.org/pipermail/openembedded-devel/2014-July/0972=
55.html
>=20
> Regards,
>=20
> > > > Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> > > > ---
> > > >  .../wireshark/va_list-can-t-be-NULL-on-ARM.patch   | 99 ----------=
------------
> > > >  ...wireshark_1.12.0-rc2.bb =3D> wireshark_1.12.0.bb} | 10 +--
> > > >  2 files changed, 5 insertions(+), 104 deletions(-)
> > > >  delete mode 100644 meta-networking/recipes-support/wireshark/wires=
hark/va_list-can-t-be-NULL-on-ARM.patch
> > > >  rename meta-networking/recipes-support/wireshark/{wireshark_1.12.0=
-rc2.bb =3D> wireshark_1.12.0.bb} (81%)
> >=20
> >=20
> >=20
> > --=20
> > -Joe MacDonald.
> > :wq
>=20
>=20
>=20
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
>=20
--=20
-Joe MacDonald.
:wq

--tAmVnWIZ6lqEAvSf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJT4oUsAAoJEEn8ffcsOfaWWiwIAKCDowIhob8DWHZ1OId9i47I
HBJ7EcROGpeL/o3aD6XE9D40qwUg9FYiP3no5m5EQF2hVNamT09JQaap3RXbr4a8
572eFglFEHKZMU903xA4xdsT7/lCiqjjOH9G6h9VLC4XwFdcJt1PJS9qDP8+zX1H
9X8lPf3KOWUqkbX7MJaIyd4YoVJzYoaGZr93QomYI9FhmO7U/1u8Lhi5Z1P0uEov
ZgCilH4QVZ2jVb/9dZSfQ/niI/blE0Ov5pnUQQhgPETy1Sf6Z1Dbbj80PE/CFJqQ
UteyMnXjLh+a1B6eT2YLcmHTEVs3zswlCm5XP+UgikY9Sw2ZuvEkwpeeRBSSlig=
=Rh6F
-----END PGP SIGNATURE-----

--tAmVnWIZ6lqEAvSf--
