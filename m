Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SAfGu-0000Hz-Ip
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Mar 2012 11:29:32 +0100
Received: by wibhj13 with SMTP id hj13so456841wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2012 03:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=FYLg6PHOYuc8f9s8cslDPQ0VqOceGuHQptsGVRcZnOo=;
	b=TQouScQ/mVxXFCnczife6JguCAbY7iDAwsJi3CDNG+UA4faLgYA8B/Va4Q2OAPewHL
	fgrFSzwbdK3su1zpY8WNx2NVJgm0+ZM2sJYREJOGlevBJRccr84Z5HCgzBIiwtFXdH7p
	CeS5L+rGeb4TwcCKT7pPyM2nlQeX1nEVVKwvG33sKQQ8jsZ9OZjz/xvuZGyRwtKgxgIH
	+zPwMQReupROOa2Zj0g2kpNBwyW+M0oarOSlMiUv30z2fLzWswuLTGLnWnxqZDcD02m1
	1K8K6s3LbYcAN8YMChD9s3MsXgSkVq+Rx7SQc5uyAHawMXzInn3tzjZ1CyH5p/18l2pB
	f2Dg==
Received: by 10.216.135.141 with SMTP id u13mr4178675wei.79.1332411637968;
	Thu, 22 Mar 2012 03:20:37 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id df3sm4168540wib.1.2012.03.22.03.20.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 03:20:37 -0700 (PDT)
Date: Thu, 22 Mar 2012 11:20:36 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120322102036.GH4010@jama.jama.net>
References: <1332410499-18183-1-git-send-email-koen@dominion.thruhere.net>
	<20120322100758.GG4010@jama.jama.net>
	<20120322111208.4530c234@eb-e6520>
MIME-Version: 1.0
In-Reply-To: <20120322111208.4530c234@eb-e6520>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [RFC][meta-oe][meta-toolchain][PATCH] meta-toolchain: populate with gcc and binutils from meta-oe
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
X-List-Received-Date: Thu, 22 Mar 2012 10:29:32 -0000
X-Groupsio-MsgNum: 37916
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6cMF9JLEeZkfJjkP"
Content-Disposition: inline

--6cMF9JLEeZkfJjkP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 22, 2012 at 11:12:08AM +0100, Eric B=E9nard wrote:
> Le Thu, 22 Mar 2012 11:07:58 +0100,
> Martin Jansa <martin.jansa@gmail.com> a =E9crit :
>=20
> > On Thu, Mar 22, 2012 at 11:01:39AM +0100, Koen Kooi wrote:
> > > Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> >=20
> > Why not move them?
> >=20
> > Or create stub of meta-toolchain in 1st patch for people to add it to
> > bblayers and then move it in 2nd.
> >=20
> > If it was copied just that people doesn't have to=20
> > update bblayers at the same time as git pull from meta-oe.
> >=20
> I think the next step is a patch removing them from meta-oe to make
> the change less intrusive than a one shot move and give people the
> time to update their bblayers.conf.

yup that's why I proposed to create empty, but valid meta-toolchain stub
so people can add it to bblayers.conf now and later we can populate it
by git move with whatever we decide we want :).

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6cMF9JLEeZkfJjkP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9q/PQACgkQN1Ujt2V2gBxnGwCgibSTET2w+qV32CJXtR1AsYut
xHQAn1gu8GZeAJrbei0vqbLi6RvuwyJe
=Yxzx
-----END PGP SIGNATURE-----

--6cMF9JLEeZkfJjkP--
