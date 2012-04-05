Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SFixG-0003JP-NR
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Apr 2012 11:26:10 +0200
Received: by wera1 with SMTP id a1so715947wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Apr 2012 02:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Z+luuTzzn7dnUuw6L4XyGYVl/oIwfVnxkbRj4YkowsU=;
	b=SnV+W7xXUm6VOyANojeWzJXrQYIUegVXu5jlJHQzrk/FFZl0SwDfBn8o60mADnmqL7
	7jmabEQQrQX2DQl5rA2i7j3EKveXujAR87mfshwi3Jcgm4rCBpIeTFu6NTPz8FwszioP
	JBmHrcPmhcHrvYbmnd/mPiQMOJKzOMG+2TRtyIB1vw7Q5NMbz8NgW7NuRZoNU6+PU2pq
	beuviW0xiur7HXH5HZF1MlE4+TcmVr+jGyeEzgVnCOvGZuDq0R6zRYVpzBKuwIvf5VEi
	aYYfJz3h5booytg2THBnAv8cJrmvpL7WwBPWBLUaO0oqxN3ucVX+Xrk1wiiSH/RPI4AH
	HuSA==
Received: by 10.216.144.138 with SMTP id n10mr1189444wej.56.1333617419357;
	Thu, 05 Apr 2012 02:16:59 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w10sm14636829wiy.3.2012.04.05.02.16.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Apr 2012 02:16:58 -0700 (PDT)
Date: Thu, 5 Apr 2012 11:16:58 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120405091658.GN4181@jama.jama.net>
References: <20120402210435.GA10553@hermes>
	<CAE4k239hqHFZQKy=hrds4EtRSoLh32Af4gSD-wQdNHN-+Vvieg@mail.gmail.com>
	<CAGiJk9fvBvuR8ftcLpYXcucJPX8zaJ=6UOnbDxkq409KZcGOFw@mail.gmail.com>
	<4237778.fYL2t0UXRO@helios>
MIME-Version: 1.0
In-Reply-To: <4237778.fYL2t0UXRO@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Package build failure
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
X-List-Received-Date: Thu, 05 Apr 2012 09:26:10 -0000
X-Groupsio-MsgNum: 38133
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CQDko/0aYvuiEzgn"
Content-Disposition: inline

--CQDko/0aYvuiEzgn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 05, 2012 at 09:52:59AM +0100, Paul Eggleton wrote:
> On Thursday 05 April 2012 10:47:05 Samuel Stirtzel wrote:
> > So if the recipe states:
> > -
> > SRC_URI =3D "git://anongit.kde.org/calligra.git;protocol=3Dgit;branch=
=3Dmaster"
> > SRCREV =3D "92ff51b5c0f388729f466041b34ab165a7d80987"
> > PV =3D "2.3.87+git${SRCPV}"
> > -
> >=20
> > Will it still look up the remote SRCPV instead of using the SRCREV?
> > Is there a "best practice" or something like that?
>=20
> No, if the SRCREV is a full commit hash as above then it will not look it=
 up=20
> remotely.

If you set BB_GIT_CLONE_FOR_SRCREV, then it will behave
like that and use rev-list to count revisions (for LOCALCOUNT):
output =3D runfetchcmd("%s rev-list %s -- 2> /dev/null | wc -l" % (ud.basec=
md, rev), d, quiet=3DTrue)

without BB_GIT_CLONE_FOR_SRCREV it will use
tmp-eglibc/cache/bb_persist_data.sqlite3
to get LOCALCOUNT value

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--CQDko/0aYvuiEzgn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk99YwoACgkQN1Ujt2V2gBwhJACfYSkvKgWr6V4Fu6aw/yd3LL8v
WggAoI/s8jFZNGjAWMgysis24Jlifu4f
=2lrp
-----END PGP SIGNATURE-----

--CQDko/0aYvuiEzgn--
