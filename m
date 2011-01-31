Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PjtWT-0007Cs-DB
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Jan 2011 14:10:25 +0100
Received: by bwz10 with SMTP id 10so5199403bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Jan 2011 05:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=njjMERbCw7aE6VfujuzKTLFn1YA9SIXipCTulV1g1uA=;
	b=Fxp6GRKzdGlLGsw5mLYuNk6exT76r/ug387ZmbLneYtl5D8gsB69Djm0F2j+aC/NtV
	REl5WEi0fjJyKgHLlK/G7eGX8FOviR952Jup3AQ3h+WNKBadvjOoNB3IDuQKr37eLKgf
	Rq2h7djCGDVdI6YTf9lC8hKXFSklkDQtSY7ro=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=ElqkdWfI2HZH73gPjtTvHEgDUCqT1UugmcK8STWSTk47+H0q28pvYscg814tGWGmZu
	EoApzutBWVQjJUDnqvVDJuNz5j7Lw3/et07vxhIjwWXFVqNxpuqOplJNpUFZ1qsms/Xj
	pEv66rFrhzac3vTZ2G8bEWWPJpXuiW7+eg2A4=
Received: by 10.204.77.199 with SMTP id h7mr4153193bkk.79.1296479372205;
	Mon, 31 Jan 2011 05:09:32 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id j11sm10235715bka.0.2011.01.31.05.09.30
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 31 Jan 2011 05:09:31 -0800 (PST)
Date: Mon, 31 Jan 2011 14:09:37 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110131130937.GE3265@jama>
References: <4D347C60.6000805@gumstix.com> <20110117185830.GL21179@jama>
	<4D45E172.4030105@gumstix.com>
MIME-Version: 1.0
In-Reply-To: <4D45E172.4030105@gumstix.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: EFL_SRCREV bump breaks GPE/enlightenment
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
X-List-Received-Date: Mon, 31 Jan 2011 13:10:25 -0000
X-Groupsio-MsgNum: 28650
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Ns7jmDPpOpCD+GE/"
Content-Disposition: inline

--Ns7jmDPpOpCD+GE/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 30, 2011 at 02:08:50PM -0800, Neil MacMunn wrote:
> >
> > does it segfault or something? I haven't seen it with illume2 profiles,
> > but I'm not using gpe-dm..
>=20
> I don't see any messages about what's happening but I seem to remember=20
> something about a missing function in a .so. There was another EFL_SRCRV=
=20
> change recently so I undid my revisions and accepted all of the upstream=
=20
> changes. Unfortunately still no luck.

Have you tried to remove ~/.e first?

Someone reported similar segfault and removing ~/.e helped him.
Otherwise "something about a missing function in a .so." doesn't help me
much to reproduce it.. :/.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Ns7jmDPpOpCD+GE/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk1GtJEACgkQN1Ujt2V2gBwLDgCggXGJiCu9xwUZgmmMWa442Qdj
yHYAnixjnSNDFna8i4dAarljjV+5Edyn
=LYME
-----END PGP SIGNATURE-----

--Ns7jmDPpOpCD+GE/--
