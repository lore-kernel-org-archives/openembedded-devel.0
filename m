Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TMFKj-000224-Oa
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Oct 2012 11:45:37 +0200
Received: by mail-wg0-f43.google.com with SMTP id dq11so1086813wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Oct 2012 02:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=yIIIaeSHvujjKPRG/BoJUwM2u0RLOaRrfSDizHpsuwY=;
	b=AeNHswIZKDt6Wmq/u+gFwXDuXhmucnejv/wBWDCvKFUiiq3HpvfvqgktlyQNBAS2zm
	6dgjnhGpRebkITt+/r/7ahS2vROZhBa/wRS8yohwYWINSMcbA7CoJKtG8DBm85gLqUoU
	g9BYb6etiK14XPphf8a+ATpEOfYvDqGirE2JBAfMPqFiTpCX+2WSCNP/H4QeWeZfQvVV
	HWk46G1onjgO50+XI9GXTdhHC5DnvdSOjZkU1hOQa9mVwuheH40TGx6awQxl2GtI0Io7
	WmS7wSUZ42Kphk9NNHSx0W1hiFhWQGEoDEpemBefeqI/yQmqLWfpi0dzfEPf8+aHzcy1
	w93g==
Received: by 10.180.77.34 with SMTP id p2mr19377643wiw.0.1349947947879;
	Thu, 11 Oct 2012 02:32:27 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id bn7sm7724963wib.8.2012.10.11.02.32.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 11 Oct 2012 02:32:26 -0700 (PDT)
Date: Thu, 11 Oct 2012 11:32:22 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20121011093222.GB3589@jama.jama.net>
References: <20121010104253.EB7AB1034A@opal>
	<20121011090133.GA3589@jama.jama.net> <2029532.l8FLCLtnC1@helios>
MIME-Version: 1.0
In-Reply-To: <2029532.l8FLCLtnC1@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Otavio Salvador : libav: Change the PACKAGES_DYNAMIC expression to be more restrict
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
X-List-Received-Date: Thu, 11 Oct 2012 09:45:37 -0000
X-Groupsio-MsgNum: 41056
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BwCQnh7xodEAoBMC"
Content-Disposition: inline

--BwCQnh7xodEAoBMC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 11, 2012 at 10:05:51AM +0100, Paul Eggleton wrote:
> On Thursday 11 October 2012 11:01:33 Martin Jansa wrote:
> > On Wed, Oct 10, 2012 at 10:42:52AM +0000, git@git.openembedded.org wrot=
e:
> > > Module: meta-openembedded.git
> > > Branch: master
> > > Commit: 97350f52280ea9b2f3d7b36ef248be5ba3e7c696
> > > URL:  =20
> > > http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit;h=
=3D97350f522
> > > 80ea9b2f3d7b36ef248be5ba3e7c696
> > >=20
> > > Author: Otavio Salvador <otavio@ossystems.com.br>
> > > Date:   Sat Oct  6 20:18:30 2012 +0000
> > > ...
> > >=20
> > > -PACKAGES_DYNAMIC =3D "lib*"
> > > +PACKAGES_DYNAMIC =3D "lib(av(codec|device|filter|format|util)|postpr=
oc)*"
> >=20
> > Unfortunatelly this does not work, this regexp matches everything start=
ing
> > with 'lib', so it's only a bit more strict then old version which match=
ed
> > everything starting with 'li' :).
> >=20
> > Please change it to:
> > PACKAGES_DYNAMIC =3D "^lib(av(codec|device|filter|format|util)|postproc=
)"
> > or
> > PACKAGES_DYNAMIC =3D "^lib(av(codec|device|filter|format|util)|postproc=
).*"
> >=20
> > ^ isn't used in any PACKAGES_DYNAMIC in oe-core, but it could make matc=
hing
> > faster * is used wrong in all PACKAGES_DYNAMIC in oe-core (as in glob, =
but
> > not regexp), so all those last '-' are optional
>=20
> Are we going to fix this to actually be a glob or are we going to start=
=20
> treating it as a regex? Frankly I'd prefer to fix it to be a glob since t=
hat's=20
> what everyone has assumed it was since the beginning.

glob would make libav PACKAGES_DYNAMIC a bit longer (6 glob expressions)
and would need another bitbake version bump + bump of required version
in sanity test.

Or we can fix all PACKAGES_DYNAMIC expressions:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D3275

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--BwCQnh7xodEAoBMC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlB2kiYACgkQN1Ujt2V2gBzXrQCdEgNm5xL4AciPpZ21yeKRC/cj
Si4An13zT5y5BXcwBWz19BS7mkP/EWte
=OpSt
-----END PGP SIGNATURE-----

--BwCQnh7xodEAoBMC--
