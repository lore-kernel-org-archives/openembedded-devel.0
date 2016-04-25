Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 6961970034
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2016 14:54:47 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1auhuS-0005Qy-QV from Joe_MacDonald@mentor.com ;
	Mon, 25 Apr 2016 07:54:48 -0700
Received: from burninator (147.34.91.1) by SVR-ORW-FEM-06.mgc.mentorg.com
	(147.34.97.120) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 25 Apr 2016 07:54:48 -0700
Received: by burninator (Postfix, from userid 1000)	id 0EB76580A3B; Mon, 25
	Apr 2016 10:54:48 -0400 (EDT)
Date: Mon, 25 Apr 2016 10:54:48 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20160425145447.GD5188@mentor.com>
References: <1461013253-2350-1-git-send-email-joe_macdonald@mentor.com>
	<CAFSKS=OrhdjemW+1t1uMpGUbcnP0s5JX59Z4mvv_hqPpwBXG_w@mail.gmail.com>
	<20160425140147.GB5188@mentor.com> <571E2BEC.7030905@gmail.com>
MIME-Version: 1.0
In-Reply-To: <571E2BEC.7030905@gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Update Samba
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
X-List-Received-Date: Mon, 25 Apr 2016 14:54:49 -0000
X-Groupsio-MsgNum: 61151
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="B4IIlcmfBL/1gGOG"
Content-Disposition: inline

--B4IIlcmfBL/1gGOG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Armin,

[Re: [oe] Update Samba] On 16.04.25 (Mon 07:38) akuster808 wrote:

> Joe,
>=20
>=20
> On 04/25/2016 07:01 AM, Joe MacDonald wrote:
> > [Re: [oe] Update Samba] On 16.04.22 (Fri 11:30) George McCollister wrot=
e:
> >=20
> >> I'm looking forward to seeing these changes in krogoth as what is in
> >> there now is unusable from a security standpoint. I cherry picked the
> >> patches to krogoth and my builds suceeded but haven't gotten around to
> >> doing any operational testing yet.
> >=20
> > Agreed.
> >=20
> > Armin:  I've already done one merge directly to krogoth to resolve a
> > build breakage,
>=20
> I just finished a a build myself and am seeing this warnings. Are these
> covered by your changes? I can send patches if not.
>=20
> WARNING: samba-4.4.2-r0 do_package_qa: QA Issue: samba rdepends on
> libaio, but it isn't a build dependency, missing libaio in DEPENDS or
> PACKAGECONFIG? [build-deps]
> WARNING: samba-4.4.2-r0 do_package_qa: QA Issue: samba rdepends on
> lttng-ust, but it isn't a build dependency, missing lttng-ust in DEPENDS
> or PACKAGECONFIG? [build-deps]

No, neither of these are covered in my changes.  I hadn't seen either of
these, even with my autobuilder.  libaio is kind of a pain because in
the previous versions of samba there was a configure option to
enable/disable it, but that's gone in any version post 4.1, AFAICT.  I
hadn't seen anything related to lttng in any version.  Please send
patches and I'll merge them to both places and the samba update to
krogoth.

Thanks.
-J.

>=20
>  but since you're maintaining the branch I didn't want to
> > do any additional ones (even though we started talking about samba
> > specifically in the krogoth context) without an explicit go-ahead from
> > you.
> >=20
> > Do you want me to send you a patch set, a pull request or do you want me
> > to merge the samba changes directly?
>=20
> Go ahead and merged directly.
>=20
> - Armin
>=20
> > -J.
> >=20
> >>
> >> -George
> >>
> >> On Mon, Apr 18, 2016 at 4:00 PM, Joe MacDonald <joe_macdonald@mentor.c=
om> wrote:
> >>> I'm still doing some testing on this and I haven't built for all the
> >>> architectures yet, but it passed at least the most basic smoke-test. =
 Given the
> >>> number of outstanding CVEs against our current version of Samba (than=
ks Armin!
> >>> :-)) I think it's best fo rus to update this rather than trying to do=
 any
> >>> back-ports, but that also introduces a not-inconsiderable level of ri=
sk for
> >>> Samba users.  So please, if you're one of them, kick the tires on thi=
s as soon
> >>> as you can (or ping me back letting me know what your thoughts are on=
 this, at
> >>> least).
> >>>
> >>> Thanks all.
> >>>
> >>> --
> >>> -Joe MacDonald.
> >>> :wq
> >>>
> >>> --
> >>> _______________________________________________
> >>> Openembedded-devel mailing list
> >>> Openembedded-devel@lists.openembedded.org
> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
-Joe MacDonald.
:wq

--B4IIlcmfBL/1gGOG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJXHi+3AAoJEEn8ffcsOfaWFG4H/38sUyAb2h5X+fxKbR1YpCHI
5vAUChghPugVWHhpotQ0o59x3FgWRHSgBBE0U7f+k3WrQmaljBOIkuirWrKNETQG
kQZlJ5ZYMuVTniZ1fON0WyGEY5vp5ZF8R0Op9X9p5GEWdACbyL9AgJ/yO/lu5qIL
zci4VeIyBQZke22fR5kjMMdFjy0G/IPYDriE1k/rYKlIQ8AmMnmpzpnfUBIfOh7k
lP9U8mymIjMNNk4oYmQvD0P5MiQAWOklLN5lfw0J60oXYXpWTjMaCKxRahAFSoJi
lob4ZoJTf7zHaA/I/n1cY5AOytp9tW4YOXhOdoV9BxD7+Fsovv+/F0ACTqrSYzU=
=IcuN
-----END PGP SIGNATURE-----

--B4IIlcmfBL/1gGOG--
