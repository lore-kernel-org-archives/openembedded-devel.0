Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QQmFt-0001X4-TU
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 May 2011 22:06:33 +0200
Received: by fxm19 with SMTP id 19so2523298fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 May 2011 13:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=e6k7eWfoTkd5pp0tW4GOFelAteqhQjdOuRbHQgI8pVU=;
	b=V923GethDE8MowrwTggAnODoE2n31bl9XfhonyqQMfI1jdX8t+xLbSkdCkMQmeVluk
	qi1vrF3KA0GNkM+zrrShjX5jqvmFtRSvByg80nU4NUO0oA6izYQf3h3VASr+2T0ceyGP
	xMKI1STqSXHKYurW6c2Jd1/Hfc/kDnSiIw4y0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Qrq00CXAY1zxO0ouzzNWYsKtmx1H3NlCw54o+YnEljQ2YIwtB7CAulbA1rfcT6O2vt
	ICe4xp1UiYfTkPbqXrTcpUUBgVAhZbyaIRJdrQvF/tTABgVqq4b8q312Gm5LCMowrgam
	a42N5yN+JuKPA/gT3tOywZO9JYhLOSdtR/r0Y=
Received: by 10.223.98.82 with SMTP id p18mr46416fan.64.1306699406733;
	Sun, 29 May 2011 13:03:26 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id n7sm505465fam.43.2011.05.29.13.03.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 May 2011 13:03:25 -0700 (PDT)
Date: Sun, 29 May 2011 22:03:24 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110529200323.GB18119@jama.jama.net>
References: <cover.1306696348.git.Martin.Jansa@gmail.com>
	<iru7dr$di8$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <iru7dr$di8$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 00/16] Pull request #12
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
X-List-Received-Date: Sun, 29 May 2011 20:06:34 -0000
X-Groupsio-MsgNum: 32346
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WhfpMioaduB5tiZL"
Content-Disposition: inline

--WhfpMioaduB5tiZL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 29, 2011 at 09:39:39PM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 29-05-11 21:17, Martin Jansa wrote:
> > Hi,
> >=20
> > please merge this patchset, after this I have working 3 gps apps=20
> > and I'm closer to shr-full-image from shr-core.
> >=20
> > The following changes since commit 7d6edbf446e338643542beab81fecb23340a=
d65b:
> >=20
> >   policykit: drop recipes, oe-core has newer versions named right polki=
t (2011-05-28 16:42:55 +0200)
> >=20
> > are available in the git repository at:
> >   git+ssh://git@git.openembedded.org/meta-openembedded-contrib jansa/me=
ta-oe
> >   http://cgit.openembedded.org/cgit.cgi/git+ssh://git@git.openembedded.=
org/meta-openembedded-contrib/log/?h=3Djansa/meta-oe
> >=20
> > Martin Jansa (16):
> >   farsight2: fix LICENSE and add LIC_FILES_CHKSUM
> >   libnice: improve LICENSE and add LIC_FILES_CHKSUM
> >   tangogps: add LIC_FILES_CHKSUM and drop distro override
> >   pidgin: add LIC_FILES_CHKSUM
> >   evtest: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
> >   gpsd: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
> >   foxtrotgps: import from OE rev
> >     d4f0211e2078d5033ae0dee74664de5520d8392d
> >   tiff: add bbappned with native BBCLASSEXTEND
> >   gd: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
> >   librsvg: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
> >   imagemagick: import from OE rev
> >     d4f0211e2078d5033ae0dee74664de5520d8392d
> >   portaudio: import from OE rev
> >     d4f0211e2078d5033ae0dee74664de5520d8392d
> >   alsa-oss: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
> >   flite-alsa: import from OE rev
> >     d4f0211e2078d5033ae0dee74664de5520d8392d
> >   espeak: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
> >   navit: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
>=20
> Looks good to me, will push after running some test builds.

Thanks, I'm working on task-cli-tools(-debug) now.

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>=20
> iD8DBQFN4qD7MkyGM64RGpERApn8AJ9jaWO915KegUCO5uPbdlq3GJfwHQCghr/1
> Ktom2rVy084VWgi+jNd3TsE=3D
> =3DAmC4
> -----END PGP SIGNATURE-----
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WhfpMioaduB5tiZL
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk3iposACgkQN1Ujt2V2gBzE9ACeN18ePg+pb7uo6ZI132VR4rEW
IosAn3BhdqXSWHoMuYUjsFjfXfFQFydU
=s/xR
-----END PGP SIGNATURE-----

--WhfpMioaduB5tiZL--
