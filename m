Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q2MDA-0007FH-Aw
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Mar 2011 12:26:48 +0100
Received: by bwz10 with SMTP id 10so6411356bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2011 04:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=8yk9eLjMPSWKo0hOoiX/sj8zqSkuXTNhwN8QAX+UqhM=;
	b=o3EuA0XRbWmsO9vMNPS2/5Fpbkpz/kEeWBAEqev/C85ixUMaV1hFCOfVMrdxMfSwxT
	94+RV2EkDna2X9QmOR2+zE0swZz+AeFrJvR5KJcMrpFhFqAi59fhN/kRJmvAVw5gt24m
	6b8Xt2wlAeWMeHVuqyaxYs51szKSnjLJZDVJ0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Uhc9wJaIiDert1fDQBE9l9uaGVS5Am33vlsGQJnUkvP1xizroObXSInvEQ9Fp4GJ4M
	BfsSvx0bEXh2tJs2rsSfk1TnufXYVdJ+CYzYdwSkWS0r1vdzbNJE2tM8xdNYtSCNEOHM
	5lfuKm5p4s6BWjH82QYO64jEWcCWL95JFMlvE=
Received: by 10.204.20.134 with SMTP id f6mr6018519bkb.165.1300879497301;
	Wed, 23 Mar 2011 04:24:57 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id rb14sm540472bkb.9.2011.03.23.04.24.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Mar 2011 04:24:55 -0700 (PDT)
Date: Wed, 23 Mar 2011 12:24:48 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110323112448.GE3418@jama.jama.net>
References: <1300456829-25755-1-git-send-email-Martin.Jansa@gmail.com>
	<20110323104755.GH21392@excalibur.local>
MIME-Version: 1.0
In-Reply-To: <20110323104755.GH21392@excalibur.local>
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
X-List-Received-Date: Wed, 23 Mar 2011 11:26:48 -0000
X-Groupsio-MsgNum: 30546
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="imjhCm/Pyz7Rq5F2"
Content-Disposition: inline

--imjhCm/Pyz7Rq5F2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 23, 2011 at 11:47:55AM +0100, Stefan Schmidt wrote:
> Hello.
>=20
> On Fri, 2011-03-18 at 15:00, Martin Jansa wrote:
> > * libnl1/libnl2 still conflicts even when using separate includedir so
> >   it will be easier for distro maintainers to use only libnl1 or libnl2
> >   by PREFERRED_VERSION
>=20
> For distros that want to support network-manager that still means that
> both versions are being build and may clash as we have seen before.

How do you build 2 versions of same package? Whole point of this patch
series is to force distromaintainers to use only libnl_2.0.0 or
libnl_1.1.0 based on PREFERRED_VERSION_libnl and this way keep them away
=66rom shooting own foot by accident.

> Just a remark. Personally I would like to go this route and maybe get
> rid of libnl1 at all.

Yes this is step in direction to get rid of libnl1 :). I'm using
libnl_2.0.0 from oe-core in meta-shr, so this change is making diff
between recipes in oe.dev and meta-shr smaller.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--imjhCm/Pyz7Rq5F2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk2J2IAACgkQN1Ujt2V2gBz1KwCgtiGLxtbu2QCW0wZr8cqJKvMj
0gsAnR+Oy8w9yTSuAuoCAtW61lZ31oyi
=z4aq
-----END PGP SIGNATURE-----

--imjhCm/Pyz7Rq5F2--
