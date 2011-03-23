Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q2Quf-00033S-Vl
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Mar 2011 17:28:02 +0100
Received: by bwz10 with SMTP id 10so6665032bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2011 09:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=N8hNmsVs2AJn7FwtPo7EGhSmFJgmbYZNrbBnIVIvjl8=;
	b=wt9IMBLlJEG3m1Wz1U45DbNM+1ni9P+Zz7YHT+tUANr5/P0W2sjDWGWN19GrtgsQTI
	tuxa0dAhSsQvYlEQzI+AKT+0kxTwYQSlvRqV8CyKPHc7ECutV+no0wUv5LFldd+INc5E
	he2t8ByoFaESHYKMY6aVo+aZ9WR3bTfUyHjj8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=rdM6InFBnnNtFZ337/DKvt09DzjqMCjVrEPwqB+XClYE0IVm2A2ple2u67JRpj7O+T
	X0QS5GAezrpaoffY3up2avMoWrOypegGc1oIMYQB95TyLua0ZDHi1Y3wSihLf1WAKmyx
	9fzjI25/6r3VZZG4kllG9r8pBOk0qrMdOUrTY=
Received: by 10.204.188.66 with SMTP id cz2mr2545530bkb.90.1300897554798;
	Wed, 23 Mar 2011 09:25:54 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id l1sm6057304bkl.13.2011.03.23.09.25.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Mar 2011 09:25:53 -0700 (PDT)
Date: Wed, 23 Mar 2011 17:25:52 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110323162552.GH3418@jama.jama.net>
References: <1300456829-25755-1-git-send-email-Martin.Jansa@gmail.com>
	<20110323104755.GH21392@excalibur.local>
	<20110323112448.GE3418@jama.jama.net>
	<imcma4$hlu$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <imcma4$hlu$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 01/12] libnl: rename libnl2 to libnl as used in openembedded-core
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
X-List-Received-Date: Wed, 23 Mar 2011 16:28:02 -0000
X-Groupsio-MsgNum: 30556
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nFBW6CQlri5Qm8JQ"
Content-Disposition: inline

--nFBW6CQlri5Qm8JQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 23, 2011 at 12:41:55PM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 23-03-11 12:24, Martin Jansa wrote:
> > On Wed, Mar 23, 2011 at 11:47:55AM +0100, Stefan Schmidt wrote:
> >> Hello.
> >>
> >> On Fri, 2011-03-18 at 15:00, Martin Jansa wrote:
> >>> * libnl1/libnl2 still conflicts even when using separate includedir so
> >>>   it will be easier for distro maintainers to use only libnl1 or libn=
l2
> >>>   by PREFERRED_VERSION
> >>
> >> For distros that want to support network-manager that still means that
> >> both versions are being build and may clash as we have seen before.
> >=20
> > How do you build 2 versions of same package? Whole point of this patch
> > series is to force distromaintainers to use only libnl_2.0.0 or
> > libnl_1.1.0 based on PREFERRED_VERSION_libnl and this way keep them away
> > from shooting own foot by accident.
>=20
> I don't think that's an acceptable solution just yet since angstrom
> needs both iw and nm. I think the best way forward is:
>=20
> 1) configure libnl1 to only build a .a
> 2) rename that .a to libnl-old.a before installing it
> 3) patch nm to use -l:libnl-old.a
>=20
> or
>=20
> 1) configure libnl1 to only build a .a
> 2) move that .a to ${libdir}/libnl1/
> 3) patch nm to use -L${STAGING_LIBDIR}/libnl1 -l:libnl.a

OK, so we'll make special case from libnl1 instead of libnl2 (to be in
line with oe-core).=20

I have it ready, will send patch for libnl1 and networkmanager_git.=20

Please test, I'm not using nm on target so only build tested it.

Cheers

> A lot like
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D71e69ad8b=
551aa06f63160232d1bd87b8d801a1d
> but a bit cleaner.
>=20
> >> Just a remark. Personally I would like to go this route and maybe get
> >> rid of libnl1 at all.
> >=20
> > Yes this is step in direction to get rid of libnl1 :). I'm using
> > libnl_2.0.0 from oe-core in meta-shr, so this change is making diff
> > between recipes in oe.dev and meta-shr smaller.
>=20
> regards,
>=20
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>=20
> iD8DBQFNidyDMkyGM64RGpERAtrBAJ9j+q1b4dFMXW7C0T9g55y22GO/PACfeH1O
> 3NU5PzIAzmtbZy5rdk7ojhs=3D
> =3DVgfx
> -----END PGP SIGNATURE-----
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--nFBW6CQlri5Qm8JQ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk2KHxAACgkQN1Ujt2V2gBxp/gCfQO/bkNH2nTkNmsJAu2lLhC4L
iuIAnAwHnvE3ixgNYpcNmsxE3MzEm4xd
=6PgQ
-----END PGP SIGNATURE-----

--nFBW6CQlri5Qm8JQ--
