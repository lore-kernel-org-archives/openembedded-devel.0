Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RzVqw-0007E0-CV
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Feb 2012 17:12:38 +0100
Received: by eekd41 with SMTP id d41so1952674eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2012 08:04:20 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.125.3 as permitted sender) client-ip=10.14.125.3; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.125.3 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.125.3])
	by 10.14.125.3 with SMTP id y3mr11174454eeh.9.1329753860709 (num_hops =
	1); Mon, 20 Feb 2012 08:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=KXG8XlEWrzf9hkoi5IVSHkz9bgdc8YomWwgnM3z5ObA=;
	b=foUmrjaHvGK5YcvUEu1hlwqCyoPmmhDlm6eKLamNr0+6JP3LTj7UU/7dGa/QfCMIuJ
	/y1HitlwA3+hBo2oGkjTJRjIVNp3qKP1eCvs2I7yqikUHetcXrsIuc0T51fphWbKlDmX
	R+CniQYB7MDSP3qqfhV3UUpq03d59Hruxeg7I=
Received: by 10.14.125.3 with SMTP id y3mr8910095eeh.9.1329753860628;
	Mon, 20 Feb 2012 08:04:20 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n17sm79022530eei.3.2012.02.20.08.04.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Feb 2012 08:04:17 -0800 (PST)
Date: Mon, 20 Feb 2012 17:04:15 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120220160415.GH3953@jama.jama.net>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<20120220124013.GG3953@jama.jama.net>
	<CALbNGRTeigkZyBQzHogt6EeZSzK80ZP05CKyqHwEOMnaJFZyuQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRTeigkZyBQzHogt6EeZSzK80ZP05CKyqHwEOMnaJFZyuQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][v2] 00/22] systemd rework
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
X-List-Received-Date: Mon, 20 Feb 2012 16:12:39 -0000
X-Groupsio-MsgNum: 37255
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QDd5rp1wjxlDmy9q"
Content-Disposition: inline

--QDd5rp1wjxlDmy9q
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 20, 2012 at 04:56:46PM +0100, Andreas M=FCller wrote:
> On Mon, Feb 20, 2012 at 1:40 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Thu, Feb 16, 2012 at 03:02:54AM +0100, Andreas M=FCller wrote:
> >> V1 -> V2:
> >> [2] =A0do not check configuration variables for cross and nativesdk
> >> [3] =A0rename systemd_package to systemd_generate_package_scripts
> >> [6] =A0parse unit files to determine the files to pack
> >> [7] =A0create warning if *-systemd package already rdepends
> >> =A0 =A0 =A0it's base package
> >> added in V2:
> >> [8]-[20] remove obsolet systemd code from recipes (these were used as
> >> =A0 =A0 =A0test cases)
> >> [21] dhcp-(relay) test case for multiple systemd packages
> >> [22] modified to start service
> >>
> >> The following tests were performed:
> >> * build from scratch with [1]-[7] / run test
> >> * build from scratch / apply patches / build -> check buildhistory diff
> >> * build from scratch w/o patches / build from scratch with patches -> =
check
> >> =A0 buildhistory diff
> >>
> >> Additional patches were prepared for other recipes inheriting systemd.=
 These are
> >> not yet send because they move systemd support from ${PN} to ${PN}-sys=
temd which
> >> currently needs modifications on tasks/images. I'd be happy if a commo=
n accepted
> >> solution would be suggested/implemented (image-feature?).
> >
> > Today I've noticed one more issue (not sure if it's caused by this
> > patchset or not).
> I think it is
> >
> > Some images are failing for me with:
> > For package xserver-nodm-init-systemd SYSTEMD_SERVICE-entry xserver-nod=
m.service does not exist
> > from systemd.bbclass:populate_packages_prepend
> >
> > I guess it's because sstate package:
> > sstate-xserver-nodm-init-all-oe-linux-2.0-r13-all-2-2ac030a94ddbd202f54=
b99c2e32c6312_package.tgz
> >
> > has only
> > package/lib/systemd/system/xserver-nodm.service
> >
> > but systemd.bbclass:populate_packages_prepend is looking only in ${D}
> > (image directory).
> >
> I assume you are working with temp files deleted (don't know the exact

Yes temp files were deleted (and inherit rm_work).

> config option now). To fix: Is there a variable pointing to package
> dir?

classes/package.bbclass:PKGD    =3D "${WORKDIR}/package"

should help

>=20
> Andreas
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--QDd5rp1wjxlDmy9q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9Cbv8ACgkQN1Ujt2V2gBzqcACdHbeMabbmmctlOzBnVeELaChd
0jMAn2VqD2DOyLHHOOFsccomXEo7xSq3
=BuKS
-----END PGP SIGNATURE-----

--QDd5rp1wjxlDmy9q--
