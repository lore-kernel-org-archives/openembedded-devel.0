Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PpTv8-0000Pz-He
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 00:02:58 +0100
Received: by fxm17 with SMTP id 17so721316fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Feb 2011 15:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=GS8+1wxfZ7Ux7LyQwkHaLSPnmtHRF94qDjQgZMPKs5E=;
	b=UvwYbTC1REtgUwJn75H2YORLa3zNPcxDUh4GEw6fK9tzV7L9kUd4FVAEsZs4NJve2A
	0Ru1nhVCuwKYAmvQl9WEQGsyrAneRdXB+RenaR43pBAWY/rbYBWbq6GA4+r9Zb2tR468
	0KjiEQ3+RWYYHHPseOoTdEYJaLROaKFAdi1wE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=C9sefioUNbg3ehBe+5ZLRTQMXbQC0q/H8BwF6FFwv9Jxq6wOBY+Iqjwf5vAELuUhLT
	ZHOa2hoT252SPVQuD2aVTEOTNRDczf5el8VUB8dfqE6Fj8C9LzocQfWN/0gSnqNqbaJY
	5Q3teivoyCRiqMAF0Gf8mWSRbtF3IDDf9Mzc8=
Received: by 10.223.79.14 with SMTP id n14mr1309317fak.19.1297810904817;
	Tue, 15 Feb 2011 15:01:44 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n1sm1972053fam.16.2011.02.15.15.01.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Feb 2011 15:01:43 -0800 (PST)
Date: Wed, 16 Feb 2011 00:01:37 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110215230136.GE3335@localhost.jama.net>
References: <1297726335-25317-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1297726335-25317-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] gcc-4.5: Bring latest from linaro 4.5 and bump svn SRCREV for upstream
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
X-List-Received-Date: Tue, 15 Feb 2011 23:02:58 -0000
X-Groupsio-MsgNum: 29268
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Rgf3q3z9SdmXC6oT"
Content-Disposition: inline

--Rgf3q3z9SdmXC6oT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 14, 2011 at 03:32:15PM -0800, Khem Raj wrote:
> Please test this patch out in your respective combinations and report
> and regressions you see.=20

My tests looks OK on (spitz,om-gta02,nokia900)

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes/gcc/gcc-4.5.inc                            |   13 +-
>  recipes/gcc/gcc-4.5/arm-bswapsi2.patch             |   13 -
>  .../gcc-4.5/gcc-arm-volatile-bitfield-fix.patch    |    6 +-
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99448.patch |  147 -
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99456.patch | 3163 ---------------
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99457.patch | 4236 --------------=
------
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99464.patch |  157 +
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99465.patch |   94 +
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99466.patch |   38 +
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99468.patch |  811 ++++
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99473.patch |  409 ++
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99474.patch | 3346 ++++++++++++++=
++
>  .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99475.patch | 4217 ++++++++++++++=
+++++
>  13 files changed, 9083 insertions(+), 7567 deletions(-)
>  delete mode 100644 recipes/gcc/gcc-4.5/arm-bswapsi2.patch
>  delete mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99448.patch
>  delete mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99456.patch
>  delete mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99457.patch
>  create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99464.patch
>  create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99465.patch
>  create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99466.patch
>  create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99468.patch
>  create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99473.patch
>  create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99474.patch
>  create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99475.patch

--Rgf3q3z9SdmXC6oT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk1bBdAACgkQN1Ujt2V2gBxh2wCeNsEdn4e2s402wwtm2rmIst1N
YRoAnRTSthn+gA9i5sSJqvGHJiqnltnZ
=nya6
-----END PGP SIGNATURE-----

--Rgf3q3z9SdmXC6oT--
