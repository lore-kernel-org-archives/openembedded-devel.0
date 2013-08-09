Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 029066B478
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Aug 2013 08:05:01 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id n15so1886593ead.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Aug 2013 01:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=GFW9EZlQUSdUWgh/qWOtbJy3ug9gND9Va/etE2qT/gc=;
	b=LkkLfS3gqc3iEEm8W5Dc55xsMFdCmXTtB2zEDbgNqIGoXVhFdAz200Nv9sTGvMrBiH
	FFgEDwWZIf7LUvESnZyYk5nPhubHjYTLN1Z+dwKTAzfSH4fC25RHo2PznNchDnTeGqVo
	DhKu6QLOB7YuLG7cZvVTiicAKMdeM63EaGBdsUFtUA3TP5JRcnikctcOzGMmWP78zx7d
	vo0D2TUtVWt0L7fL07dNSvoFggbG47qSh1uaYYC/V1hkiXvvVQDhjQdn1z1BCjrUsd9E
	hLYq+qJGBhandhYCOWkTRyaJQLBnvMUlsg2OR/YzOyo8JllsFW0TyQwGqjO+FN/Ne7Jf
	Zpcw==
X-Received: by 10.14.110.194 with SMTP id u42mr12084761eeg.112.1376035502036; 
	Fri, 09 Aug 2013 01:05:02 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n42sm26444286eeh.15.2013.08.09.01.05.00 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 09 Aug 2013 01:05:01 -0700 (PDT)
Date: Fri, 9 Aug 2013 10:05:47 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130809080547.GD17945@jama>
References: <BE65E360-0A4E-432B-9020-A3BCA9E05AF9@gmail.com>
	<CAGNsrLASK8YrYCgibnA-tZR5cecOzr_WW41QjB87b+E1rY-QLw@mail.gmail.com>
	<C3C519DD-1E4E-49C0-8C6C-B50BFFA89A5C@gmail.com>
	<CAAqcGHkBfysXdfJMSvLquAAtKJQ14Erfohj9pMTMaa865Ep4yA@mail.gmail.com>
	<CAMKF1sqp4j=_OEW0trRtRkCkVbyODyp1WSH7Zfvh0uBkiuGiJw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqp4j=_OEW0trRtRkCkVbyODyp1WSH7Zfvh0uBkiuGiJw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: parsing errors with angstrom/meta-linaro
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
X-List-Received-Date: Fri, 09 Aug 2013 08:05:02 -0000
X-Groupsio-MsgNum: 45610
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ieNMXl1Fr3cevapt"
Content-Disposition: inline

--ieNMXl1Fr3cevapt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 09, 2013 at 02:15:06AM -0500, Khem Raj wrote:
> On Thursday, August 8, 2013, Riku Voipio wrote:
>=20
> > Hi,
> >
> > The problem is that git.linaro.org is not providing good service and
> > often fails to respond to git requests. When bitbake fails to fetch
> > the latest git, it is unable to expand AUTOREV, and throws in the
> > towel. You can reproduce the issue easily with any recipe that has a
> > git:// url and AUTOREV by disconnecting the OE build machine from the
> > network.
> >
> > Could we make AUTOREV to expand to latest version found from
> > downloads/git2 in case the git fetch fails?
> >
> >
>=20
> I would suggest to not use autorev if git servers are flaky
> Secondly for external recipes its bad practice since it defeats
> BB_NO_NETWORK
> Feature which many use

Agreed, please add example to README how to enable it in local.conf, but use
known-to-work SRCREV in recipe for other people who enabled meta-linaro
layer, but maybe aren't even interested in any linux-linaro revision.

>=20
>=20
>=20
> > Riku
> >
> >
> >
> > On 8 August 2013 20:28, Khem Raj <raj.khem@gmail.com <javascript:;>>
> > wrote:
> > >
> > > On Aug 8, 2013, at 9:00 AM, Fathi Boudra <fathi.boudra@linaro.org<jav=
ascript:;>>
> > wrote:
> > >
> > >> Hi,
> > >>
> > >> On 8 August 2013 08:48, Khem Raj <raj.khem@gmail.com <javascript:;>>
> > wrote:
> > >>> Hi
> > >>>
> > >>> Often I see this error when parsing angstrom-next, has anyone seen
> > something similar or delved into the reason behind
> > >>> it ?
> > >>>
> > >>> NOTE: Started PRServer with DBfile:
> > /builds1/angstrom/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 45141, PID:
> > 6728
> > >>> Parsing recipes...ERROR: ExpansionError during parsing
> > /builds1/angstrom/sources/meta-linaro/meta-aarch64/recipes-kernel/linux/
> > linux-linaro_git.bb: Failure expanding variable SRCPV, expression was
> > ${@bb.fetch2.get_srcrev(d)} which triggered exception FetchError: Fetch=
er
> > failure: Fetch command failed with exit code 128, output:
> > >>> fatal: read error: Connection reset by peer
> > >>>
> > >>> ERROR: Command execution failed: Exited with 1
> > >>>
> > >>> Summary: There were 2 ERROR messages shown, returning a non-zero ex=
it
> > code.
> > >>
> > >> I'm seeing a similar issue[1] on another recipe (libhugetlbfs[2] for
> > instance).
> > >> It's worth mentioning:
> > >> - only on my local machine (it doesn't happen on daily builds using
> > >> EC2 instances)
> > >> - also from meta-linaro/meta-aarch64
> > >> - also code pull from git, using SRCPV/AUTOREV
> > >>
> > >> [1] Failure expanding variable SRCPV, expression was
> > ${@bb.fetch2.get_srcrev(d)}
> > >> [2]
> > https://git.linaro.org/gitweb?p=3Dopenembedded/meta-linaro.git;a=3Dblob=
;f=3Dmeta-aarch64/recipes-extended/libhugetlbfs/libhugetlbfs_2.16.bb;hb=3Dm=
aster
> > >
> > > if I pull out meta-aarch64 from the bblayers all works ok. I don't hit
> > this error at all
> > > so somethins is fishy with this layer
> > >
> > >>
> > >> Cheers,
> > >> Fathi
> > >
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org <javascript:;>
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ieNMXl1Fr3cevapt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlIEotsACgkQN1Ujt2V2gByTrACgtV8y3Jxnm46/iiy6C4sI091c
X5QAn0o4QXq4L5sliTJiRYpcIwNFNh6M
=/9lV
-----END PGP SIGNATURE-----

--ieNMXl1Fr3cevapt--
