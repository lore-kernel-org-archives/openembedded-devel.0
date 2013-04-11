Received: from mail-da0-f54.google.com ([209.85.210.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UQGxh-0000ko-HM
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Apr 2013 14:50:51 +0200
Received: by mail-da0-f54.google.com with SMTP id p1so668548dad.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Apr 2013 05:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=CLHREI9tSg2As3WUNBxLQpgNkNZDXrOiAJ3rn2NgvZs=;
	b=UJUBGQxWkpVw2ggoH39eanRjmjliZSMgbmGLOHfEkt6Y8gI4+kQhoideWq0BZr45WU
	FmhUMNlP1B6uLdlvARrF5+3q950jLKqcQk8bdNP40f3N55KBzsk+2As0dFICXU6g+bxd
	N3KmdEoYc2bQgAdBUVqXqGVgd0T6ObOqgCu9P6j+swv/Fys1SWOH2wYBAdZWVbmpNWKa
	ppl4nWg7icxuAdrmKygvb70ACw0eAlLVPWdHfbqADUPKiMyiaWSKyO5uNSxMPWedF5fZ
	iJVmQbLIE5drr+UXcBDOsUa6SxZrkF//20GgKKmvlsTXCivuCsqHvpyEJ+vP59Dspc61
	lKDw==
X-Received: by 10.66.216.198 with SMTP id os6mr9252553pac.145.1365683601604;
	Thu, 11 Apr 2013 05:33:21 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id dr6sm4829896pac.11.2013.04.11.05.33.18
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 11 Apr 2013 05:33:20 -0700 (PDT)
Date: Thu, 11 Apr 2013 14:33:13 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130411123313.GD2477@jama>
References: <5166A626.2060107@nedap.com>
MIME-Version: 1.0
In-Reply-To: <5166A626.2060107@nedap.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: error when bitbaking console-base-image (danny)
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
X-List-Received-Date: Thu, 11 Apr 2013 12:50:53 -0000
X-Groupsio-MsgNum: 44071
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="g7w8+K/95kPelPD2"
Content-Disposition: inline

--g7w8+K/95kPelPD2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2013 at 02:01:42PM +0200, Jaap de Jong wrote:
> Hi All,
> I've been experimenting with images, and every time I get this error=20
> even with a completely fresh build directory:
>=20
>     log_check: There were error messages in the logfile
>     log_check: Matched keyword: [Collected errors]
>=20
>     Configuring connman.
>     Configuring connman-systemd.
>     Configuring tinylogin.
>     Configuring angstrom-version.
>     Configuring angstrom-packagegroup-boot.
>     Collected errors:
>       * extract_archive: Cannot create symlink from ./var/log to
>     'volatile/log': File exists.
>       * extract_archive: Cannot create symlink from ./var/run to
>     'volatile/run': File exists.

Looks like you have inconsistency between fs-perms.txt
(e.g. default openembedded-core/meta/files/fs-perms.txt)
and what .ipk files are packaging as /var/log and /var/run (probably
=66rom base-files, but /var/run is also included in dbus and other
packages).

>     + '[' '!' -z '' ']'
>     + package_tryout_install_multilib_ipk
>     + multilib_tryout_dirs=3D
>=20
>=20
> Could really use some help here...
> Thanks!
> Jaap
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--g7w8+K/95kPelPD2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFmrYkACgkQN1Ujt2V2gBwizQCfZUop0nWMNjy7Y6FY7kcaVPFc
MewAnjZzBksKOej+IXgXHgdiXNwtoXn0
=uLg+
-----END PGP SIGNATURE-----

--g7w8+K/95kPelPD2--
