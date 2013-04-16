Received: from mail-pa0-f43.google.com ([209.85.220.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1US47C-0000zJ-Al
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Apr 2013 13:32:02 +0200
Received: by mail-pa0-f43.google.com with SMTP id hz11so290348pad.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Apr 2013 04:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+MUlHxy0LKBAJ6HAiT0OIBOtYXt6ka35w6UzZvPXpn0=;
	b=IzKCUZjcOptClmWIT9Rb1U/11xPPIjCAOO82r25eRa6LQd8OlazB2k8ZoEfMOD6gK/
	lgUGRbvUOZE8X+201P4Y12OTMBFkWMZD57E7EfVGV+cFD81GrCvuIt6wCGMV+lW5Qbsw
	f0HTO06VcsB0Sko0C5TjoiDRZXSCuTwi5IHp50dwyEl8g7h02EQUABE95W6eTZ2N+YQj
	akvBUgzWyA5viz3Xbk5WXP6rTgkeQUzCTXvPV7Hcj/U3d31fa3HixHkm5jKPqImk3wWM
	zUrLf5qGTwSttg0+LIF1MA6YmGsFEKlRoo6GiKI41VM/Op359ZUAOVs98VqpmW2fVmZa
	F72w==
X-Received: by 10.68.13.168 with SMTP id i8mr2597494pbc.86.1366110867333;
	Tue, 16 Apr 2013 04:14:27 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id mm9sm1664680pbc.43.2013.04.16.04.14.24
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 16 Apr 2013 04:14:26 -0700 (PDT)
Date: Tue, 16 Apr 2013 13:14:24 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130416111424.GJ10628@jama.dyndns-home.com>
References: <CANyK_8frhEkQ3-ktHygKdQOWZB3cDVEsqLj_VK7ZeLLL-XEj5A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANyK_8frhEkQ3-ktHygKdQOWZB3cDVEsqLj_VK7ZeLLL-XEj5A@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe] vim 7.3
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
X-List-Received-Date: Tue, 16 Apr 2013 11:32:13 -0000
X-Groupsio-MsgNum: 44236
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="q5r20fdKX+PFtYHw"
Content-Disposition: inline

--q5r20fdKX+PFtYHw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2013 at 10:53:44AM +0100, Paul Barker wrote:
> Hi all,
>=20
> I've had a look at the recipe for vim in meta-oe, it's currently a
> full release behind upstream and applies patches to the 7.2 source to
> get version 7.2.446. We have a recipe which provides mercurial-native
> in meta-oe so we should be capable of pulling the upstream sources
> directly from vim.googlecode.com. We can easily pull a given version,
> I've wrote a recipe to build vim 7.3.875 which I'm going to update to
> the latest version and look at testing over this weekend (it builds
> but I want to do some basic runtime testing).
>=20
> If I get this working and it downloads sources via mercurial is it
> likely to be accepted? A quick grep doesn't show any other packages
> using source URLs beginning "hg://".

The plan looks OK to me, vim isn't in many images by default so building
mercurial-native seems like reasonable price for it.

> I've also found that just installing vim doesn't give me everything I
> expect, I also need vim-syntax, vim-help, vim-tutor, vim-vimrc and
> vim-data. I think for most applications where people want to install
> vim over using plain vi they probably want these extra runtime files.
> Is it worth creating a package group to install all these together
> and/or setting RRECOMMENDS for vim?

RRECOMMENDS seems enough to me

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--q5r20fdKX+PFtYHw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFtMpAACgkQN1Ujt2V2gBz2KgCdHBQvTQlfngfIwlwBt5Qkhcxn
nK4AoJR7kwxLDJvXTFR8uPM3zEawhGQ2
=OulP
-----END PGP SIGNATURE-----

--q5r20fdKX+PFtYHw--
