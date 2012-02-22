Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0CB1-0000UL-0w
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Feb 2012 14:24:11 +0100
Received: by eekd41 with SMTP id d41so2681720eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2012 05:15:51 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.32.205 as permitted sender) client-ip=10.14.32.205; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.32.205 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.32.205])
	by 10.14.32.205 with SMTP id o53mr15743358eea.47.1329916551054
	(num_hops = 1); Wed, 22 Feb 2012 05:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=OpaEdsQ8R0FkIAPFBdmiYWCb+4Gqz4vnn7NStKN139Y=;
	b=aOriILtUVJqnynyPmraG5btxOrxaJ4G2OeL8T0CCrDe4p8ZhvKaByG2VwK0QUDS55R
	MxY/6iuyhJ14fv0iIz3LM+XaJb8oodrcAtI2aLJTWN+01wyYMCXAc/c15wsfjJVPVeNZ
	Ztii3j5httIC//O9YPJWjUbRxGnpiRDVrWTZE=
Received: by 10.14.32.205 with SMTP id o53mr12610968eea.47.1329916550869;
	Wed, 22 Feb 2012 05:15:50 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n52sm102558270eea.5.2012.02.22.05.15.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Feb 2012 05:15:49 -0800 (PST)
Date: Wed, 22 Feb 2012 14:15:48 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120222131548.GK3769@jama.jama.net>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<20120220124013.GG3953@jama.jama.net>
	<CALbNGRTeigkZyBQzHogt6EeZSzK80ZP05CKyqHwEOMnaJFZyuQ@mail.gmail.com>
	<20120220160415.GH3953@jama.jama.net>
	<CALbNGRQkNRcf3gHbscAvVFqZv0nGRR5_U2kTHSZ_uVCASWGtYQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRQkNRcf3gHbscAvVFqZv0nGRR5_U2kTHSZ_uVCASWGtYQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 22 Feb 2012 13:24:11 -0000
X-Groupsio-MsgNum: 37335
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ogUXNSQj4OI1q3LQ"
Content-Disposition: inline

--ogUXNSQj4OI1q3LQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2012 at 01:47:07PM +0100, Andreas M=FCller wrote:
> On Mon, Feb 20, 2012 at 5:04 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Mon, Feb 20, 2012 at 04:56:46PM +0100, Andreas M=FCller wrote:
> >> On Mon, Feb 20, 2012 at 1:40 PM, Martin Jansa <martin.jansa@gmail.com>=
 wrote:
> >> > On Thu, Feb 16, 2012 at 03:02:54AM +0100, Andreas M=FCller wrote:
> >> >> V1 -> V2:
> >> >> [2] =A0do not check configuration variables for cross and nativesdk
> >> >> [3] =A0rename systemd_package to systemd_generate_package_scripts
> >> >> [6] =A0parse unit files to determine the files to pack
> >> >> [7] =A0create warning if *-systemd package already rdepends
> >> >> =A0 =A0 =A0it's base package
> >> >> added in V2:
> >> >> [8]-[20] remove obsolet systemd code from recipes (these were used =
as
> >> >> =A0 =A0 =A0test cases)
> >> >> [21] dhcp-(relay) test case for multiple systemd packages
> >> >> [22] modified to start service
> >> >>
> >> >> The following tests were performed:
> >> >> * build from scratch with [1]-[7] / run test
> >> >> * build from scratch / apply patches / build -> check buildhistory =
diff
> >> >> * build from scratch w/o patches / build from scratch with patches =
-> check
> >> >> =A0 buildhistory diff
> >> >>
> >> >> Additional patches were prepared for other recipes inheriting syste=
md. These are
> >> >> not yet send because they move systemd support from ${PN} to ${PN}-=
systemd which
> >> >> currently needs modifications on tasks/images. I'd be happy if a co=
mmon accepted
> >> >> solution would be suggested/implemented (image-feature?).
> >> >
> >> > Today I've noticed one more issue (not sure if it's caused by this
> >> > patchset or not).
> >> I think it is
> >> >
> >> > Some images are failing for me with:
> >> > For package xserver-nodm-init-systemd SYSTEMD_SERVICE-entry xserver-=
nodm.service does not exist
> >> > from systemd.bbclass:populate_packages_prepend
> >> >
> >> > I guess it's because sstate package:
> >> > sstate-xserver-nodm-init-all-oe-linux-2.0-r13-all-2-2ac030a94ddbd202=
f54b99c2e32c6312_package.tgz
> >> >
> >> > has only
> >> > package/lib/systemd/system/xserver-nodm.service
> >> >
> >> > but systemd.bbclass:populate_packages_prepend is looking only in ${D}
> >> > (image directory).
> >> >
> >> I assume you are working with temp files deleted (don't know the exact
> >
> > Yes temp files were deleted (and inherit rm_work).
> >
> >> config option now). To fix: Is there a variable pointing to package
> >> dir?
> >
> > classes/package.bbclass:PKGD =A0 =A0=3D "${WORKDIR}/package"
> >
> > should help
> >
> I am working on this and checked rm_work.bbclass. Seems that complete
> package contents are retained / respectively are recovered by sstate.
> Hence I have another question:
>=20
> Will it cause problems to run the whole code in
> populate_packages_prepend only (once) in case ${D} exists? Any fallout
> to expect by this simple solution?

If I understand you right, then looks good to me.

> Please let me know if so because this would save me from long build tests.

For me this whole series can go in as it is now and my comments can be
implemented as followup patches (which will be easier to review then
whole patchset again).

Maybe only add that variable for /lib/systemd/system so I can push my
"systemd rework" patchset for meta-smartphone with this variable
already.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ogUXNSQj4OI1q3LQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9E6oQACgkQN1Ujt2V2gByI+gCfTSHzNParW0kMcAVqk3oIJMMa
FOsAoJ8nZalerJeEUJU8tbFZKZICpOL3
=qwH9
-----END PGP SIGNATURE-----

--ogUXNSQj4OI1q3LQ--
