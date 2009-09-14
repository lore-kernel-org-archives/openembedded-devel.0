Received: from [72.14.220.156] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1MnJ9V-0008AZ-UN
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Sep 2009 23:32:04 +0200
Received: by fg-out-1718.google.com with SMTP id e21so601606fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Sep 2009 14:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=Cokl5PFHPLNBnQlLhc1MK9LOO7DwPZ1eVX4TfvJMp+0=;
	b=hIk6SyHtHSueBqeF+bj3jUrAcq5IukJ8Po6h2LWi3FbtcRv7SlAXdg019lrg6/1NpY
	7+bwpgB88tjAU0JU29WVHeJbVUwV7OibEskIc7NKsdKy9n0yQz/wkagBA6RPf/ggLeqs
	f3P1+O/RopWnEeC9HRHmu0yQTspUNmf0MBuKs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=C11sKY3rnOP7lizulU/iKhEjOXvz0JCiiZ3PGsOIEygYaYQQ1BgWWfXGrjxE51Hhzs
	54dhE/9w6djCqJTVl75bXkOVhgLybZNgzdqBzyUXwWWXa/0PwLEuJwx0ded/00IG0PYF
	m/wwVGz8aUqPhPopxPhEhqGFOPUAvEDPg2x1o=
Received: by 10.86.249.22 with SMTP id w22mr5430122fgh.1.1252963892689;
	Mon, 14 Sep 2009 14:31:32 -0700 (PDT)
Received: from localhost ([78.24.13.161])
	by mx.google.com with ESMTPS id d4sm708fga.21.2009.09.14.14.31.31
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 14 Sep 2009 14:31:31 -0700 (PDT)
Date: Mon, 14 Sep 2009 23:31:32 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090914213132.GG4970@jama>
References: <1252881838-19764-1-git-send-email-Martin.Jansa@gmail.com>
	<141020e30909131608u56b25755vb7df93dd97296256@mail.gmail.com>
	<be7a9f3d0909140939i5c86c5c7n6432bcc355417e42@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <be7a9f3d0909140939i5c86c5c7n6432bcc355417e42@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 72.14.220.156
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Allow % as wildcard in the end of PREFERRED_VERSION_pkg
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
X-List-Received-Date: Mon, 14 Sep 2009 21:32:05 -0000
X-Groupsio-MsgNum: 13099
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fOHHtNG4YXGJ0yqR"
Content-Disposition: inline

--fOHHtNG4YXGJ0yqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2009 at 01:39:50PM -0300, Otavio Salvador wrote:
> I personally  like the idea but could you make clear your usercase?

I had problem when using _git or _svn versions with AUTOREV.=20

When there is SRCREV or SRCPV in PV of that bb file you would like to use t=
hen
you need to update PREFERRED_VERSION_pkg with every new commit or just
make sure that _git or _svn version has highest DEFAULT_PREFERENCE.

Setting DEFAULT_PREFERENCE to -1 in all non _git bb files is bad,
because then every distro using that package will get pkg_git.bb, in
contrast to setting PREFERRED_VERSION_pkg for just one distro or machine.

With this wildcard I can set ie
PREFERRED_VERSION_xserver-xorg =3D "1.6.999+git%"
and there is only one xserver-xorg with PV=3D"1.6.999+gitr${SRCPV}" in my
tree.

--=20
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr=20
JaMa                        =20

--fOHHtNG4YXGJ0yqR
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.11 (GNU/Linux)

iEYEARECAAYFAkqutjQACgkQN1Ujt2V2gBwaXACbBXuzxHqODdtNLgpW3ol8opIM
aH8AnAsSc/j6MxS7rByweWDo04POOgcH
=fOZf
-----END PGP SIGNATURE-----

--fOHHtNG4YXGJ0yqR--
