Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PpHoz-0003wV-0a
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 11:07:49 +0100
Received: by bwz10 with SMTP id 10so254743bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Feb 2011 02:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=OIIRzWb24pB5MZozKhp+jD/TFyuNeOBszbGbpR2qhWA=;
	b=uSIiRcg7FhljcUYy8iprMsDG4qedhO+Ft5087LS27Kt39ucYCk6m+oZxCLZkqz4jwc
	KRPhIq5yU4IxkWpdBph+q3eIAB/YtYFRngROm/kkNCUDCu08h/O8YchqMtG+3c7e4mPm
	NCK1mj2DNg6or7Kx/zl9kEBPuBsYIvbhMDm4g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=pu29MbiLdP01/xmDVJdBbETco01gxw00h9a8y/XyibOV55onmAoKNJaplysjiMoUas
	Qh9EG3CzoyJGpYavxDSvN8DuOcl9aJbc3oxHQmSbnnQEOsfliiaOnIB4fRTjA/bya8Us
	/1s0xPRmIRz1n9KqoXy8bHpb/ARDsDRkCWbhg=
Received: by 10.204.53.148 with SMTP id m20mr6721788bkg.150.1297764398706;
	Tue, 15 Feb 2011 02:06:38 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id v25sm2457058bkt.18.2011.02.15.02.06.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Feb 2011 02:06:37 -0800 (PST)
Date: Tue, 15 Feb 2011 11:06:30 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110215100630.GE8619@localhost.jama.net>
References: <20110214102232.GB8619@localhost.jama.net>
	<1297697243.2178.97.camel@phil-desktop>
	<20110215091517.GD8619@localhost.jama.net>
MIME-Version: 1.0
In-Reply-To: <20110215091517.GD8619@localhost.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: debian.bbclass issues when some package is substring of another
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
X-List-Received-Date: Tue, 15 Feb 2011 10:07:49 -0000
X-Groupsio-MsgNum: 29224
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WK3l2KTTmXPVedZ6"
Content-Disposition: inline

--WK3l2KTTmXPVedZ6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2011 at 10:15:17AM +0100, Martin Jansa wrote:
> I'll try (b), but imho you have same problem there (if you have
> -dev/-dbg for such package names and they are in wrong order, even worse =
ie:
> PKG_ncurses-libncurses-dev, libncurses-dev    <=3D ok
> PKG_ncurses-libncursesw-dev, libncursesw-dev  <=3D works only because
>   ncurses-libncursesw is mapped to libncursesw which is the same like
>   s/ncurses-libncurses/libncurses

for now I've tried just reverse sorted order of calling auto_libname,
see sent patch.

sofar it looks ok and works right for ncurses, only in even stranger
situation t will fail (old unsorted behavior too) ie when
resulting SONAME is substring of some package.

mapping like this:
ncurses-libncursesw > libwidecurses
ncurses-libncursesw-dev > libwidecurses-dev
libwidecurses > libwcurses
libwidecurses-dev > libwcurses-dev

which will probably replace _again_ not only its own package
libwidecurses but also new libwidecurses (originaly ncurses-libncursesw)

but this situation looks really improbable and can be ignored

Maybe we can be more strict and call replace only from begining?
-newpkg =3D pkg.replace(orig_pkg, devname, 1)
+newpkg =3D re.sub('^'+orig_pkg, devname, pkg)

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WK3l2KTTmXPVedZ6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk1aUCYACgkQN1Ujt2V2gBzLMgCfThtMSvDSmAr4Bzn1EJR3uBM5
dyoAnA5OekbLy1zqrwISQtZt7JVmQ/T8
=CvtN
-----END PGP SIGNATURE-----

--WK3l2KTTmXPVedZ6--
