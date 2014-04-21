Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id A902465D1B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 17:25:22 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id d49so3853588eek.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 10:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=3eVyFlOTdO8NmFb3N8E/INAAbJvr1vyHQlOzcf4oIJg=;
	b=EQoLJoTfSwhkSYuwxcPeegh/gNV7wbgy5aohCU3OCDpwmX6X8YcT0PfotzjBPxSv2j
	7YMTy0BG7FioBjy9uoegLDjf2zPNUh93wVap6iNzFSQFRPfiHmS8ueYbX12aI/95tqQ0
	iCJdC75Q7FqRcvLtUoyex+Gk/7DSI4VnkgNhNBxntx2WChQOSkjvUZsx456HyrBVTnld
	Ss5zSBJcIX2aLSnN/ROt3LPMBIUF8CERp/xTP4UL1fasvLGHc7Wax2wWjZtS1CG3byr/
	8t8qui7TGQ0103S6TfFTNlAxX9iGiNYo0UmPTU+hv9fRFkP2wjoqCVyFNxQpBRSeuYKi
	NF3w==
X-Received: by 10.14.180.2 with SMTP id i2mr49323787eem.53.1398101122981;
	Mon, 21 Apr 2014 10:25:22 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	t44sm105270891eeo.6.2014.04.21.10.25.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Apr 2014 10:25:11 -0700 (PDT)
Date: Mon, 21 Apr 2014 19:25:11 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140421172511.GG2486@jama>
References: <20140420142506.GS2486@jama>
	<CAOLEWZUgsDTU4BqRdM0sDkGrjRtU-hPVWgncvzUbfFi_CaEzHw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOLEWZUgsDTU4BqRdM0sDkGrjRtU-hPVWgncvzUbfFi_CaEzHw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: meta-oe patch queue
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
X-List-Received-Date: Mon, 21 Apr 2014 17:25:25 -0000
X-Groupsio-MsgNum: 49406
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tNAYc2YbOB0rJD4X"
Content-Disposition: inline

--tNAYc2YbOB0rJD4X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2014 at 10:06:48AM -0700, Stephen Arnold wrote:
> Hi Martin:

Hi Steve,

> From what I can tell, it looks like the gnuplot patches got in but not all
> of the gd changes?  I also don't see the gpm DESTDIR patch.  Can you check
> if the gd license patch made it into your queue?  There was also gpm
> DESTDIR patch sent on 4 April; let me know if I need to resend.

These 2?

http://git.openembedded.org/meta-openembedded/commit/?id=3D19141207ba0861a8=
92b8bd6f65d5dde665fbeaa9
http://git.openembedded.org/meta-openembedded/commit/?id=3D445c72437e3d876c=
10ae8df97cf06d5e342134cc

> On Sun, Apr 20, 2014 at 7:25 AM, Martin Jansa <martin.jansa@gmail.com>wro=
te:
>=20
> > test-dependencies run finally finished, please see found issues in
> > "State of bitbake world, test-dependencies 2014-04-18" thread and
> > please help with cleaning those.
> >
> > That unblocked me to do verification builds on jenkins and merge most
> > pending patches.
> >
> > patchwork wasn't working correctly for few days so it's possible that
> > I've missed some patches from ML (I've tried to send replies to merged
> > patches again).
> >
> > Please double check if your pending patches are merged or at least in
> > master-next.
> >
> > Most master-next patches have some unresolved review e-mails on ML, if
> > you want to get your patch merged in daisy, please resolve them soon.
> >
> > Here is my list of pending changes:
> > hid .. means that the build was hidden by some other failure (e.g. gnup=
lot
> > by failing gd)
> > verify .. needs to wait for another verification build
> >       (now I've used only qemuarm + qemux86, qemux86-64 build will run
> > tonight)
> > review .. unresolved comments
> > fails .. fails in some configurations - issue was reported on ML
> >
> > pick 5c73b58 daq: Update from 2.0.1 to 2.0.2
> >   fails
> > pick 480d490 gnuplot: upgrade to 4.6.5
> >   hid
> > pick cefd609 gnuplot: added upstream license file and updated recipe to
> > match
> >   hid
> > pick e7bacbc eject: Fix wrong return value
> >   review
> > pick c17f754 fbreader: remove old, non-building version
> >   review
> > pick f878793 bdftopcf: add recipe
> >   review
> > pick 71a7c56 terminus-font: update DEPENDS
> >   review bdftopcf
> > pick 4bc7f0d ltrace: update to version 0.7.90
> >   review
> > pick de15695 iozone: update version to 414
> >   fails fetch
> > pick 8fd92ed mariadb: add perl to RDEPENDS
> >   review koen
> > pick d8e24f7 gd: update to version 2.1.0
> >   review
> > pick e0759f9 gd: add perl to RDEPENDS
> >   review
> > pick e9e94a2 gd: fix the subdir-objects error
> >   review
> > pick 5f1593b postgresql: add init script and enable some bindings
> >   review
> > pick f396e78 vim: add dependency and selinux and acl support control
> >   verify
> > pick c08f3eb vim: don't check acl header if acl support disabled
> >   verify
> > pick 64ad76a vim: add knob whether elf.h are checked
> >   verify
> > pick 4b1be3a gnome-themes: enables the path to the icon-name-mapping to=
 be
> > specified
> >   verify
> > c11f2e3 nodejs 0.8.18: update to 0.10.25
> >   verify
> > 9f30d08 dejagnu: recipe taken from openembedded
> >   verify
> > 17be66b glcompbench: Create 2012.08 version
> >   verify
> >
> > I've sent fix for gd now, so it's possible that gnuplot + 3 from 4 gd
> > patches will be
> > merged today.
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tNAYc2YbOB0rJD4X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNVVHcACgkQN1Ujt2V2gByq2wCgh8VM+FICe7ymHbbH5v0QCig0
lQkAn1EujAqSrLpflZ168kB+PpITvQd0
=Wzbk
-----END PGP SIGNATURE-----

--tNAYc2YbOB0rJD4X--
