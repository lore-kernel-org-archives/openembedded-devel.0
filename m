Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id EB3B365DA0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 12:38:05 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id e49so2791784eek.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 05:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gx4noougp1wLnQHDKIILfUDGJffkqxj8CwVROIb/UJs=;
	b=GV7Y+TH02HmQYNXj6/sI9YEeYuVdkFZTRuEc9wvZ/4u2M3NrGJ0ik5YfRWZXWeClwZ
	kPks1QYyzM9VDznLVQlt45zbSEr6gbOjBeBOofggDMHzJhuN5YWLOrYyvWwW18476LMK
	d+2zvhXCaRlWWeGfhu7X7xoh6D0cNTgFgMuVnwlqiEX/d3Ly+AoYTNX+q6Hs8lEua1DM
	0dAoYzpwiW8MufNnCksGfpVK7JxjKzTsdXzxdGZSuD3Rya041GT9x4kR2x/fIoUf4oMD
	2u4/FBIefawwAvLwQ/5t7QQyzYrhh7ueOROi5vNr7GdIL6PItUm/3fbcbWELESKWLbAx
	zaBQ==
X-Received: by 10.15.43.77 with SMTP id w53mr10568121eev.10.1398429486277;
	Fri, 25 Apr 2014 05:38:06 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	x43sm12870211eeo.26.2014.04.25.05.38.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Apr 2014 05:38:05 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 25 Apr 2014 14:38:15 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140425123815.GV2486@jama>
References: <ljcuv7$kr2$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <ljcuv7$kr2$1@ger.gmane.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5]ERROR: QA Issue: qt...: The compile log indicates that host include and/or library paths were used
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Apr 2014 12:38:08 -0000
X-Groupsio-MsgNum: 49494
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ONTEBGf774apj9iN"
Content-Disposition: inline

--ONTEBGf774apj9iN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2014 at 08:22:30AM +0200, Neuer User wrote:
> With the latest version of the meta-qt5 the above error message is
> generated in the qa process.
>=20
> Environment: Ubuntu 12.04, Yocto "master-next", meta-qt5 branch
> jansa/5.3.0-beta1, platform: imx6
>=20
> See also here:
> https://community.freescale.com/docs/DOC-100419#comment-10891

0005-qt_module-Fix-pkgconfig-replacement.patch needs to be reworked

after it was (possibly partially resolved) changed in
  eaefbe3 snuff -L/-I with system paths when installing meta files
  a33afed de-duplicate setup of libdir replacement in prl files
  aa20e7f reshuffle code for clarity
  ee86ce8 don't attempt to replace include paths in meta files

See:
https://github.com/meta-qt5/meta-qt5/commit/5872d999583268a220cc3f033dba3ee=
c34cd2d69

> Anybody knows, what's the problem?
>=20
> Latest good revision was: 92be18a
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ONTEBGf774apj9iN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNaVzcACgkQN1Ujt2V2gBxCxQCdEDFF+Q4otwaQ6ILpyYVHVusd
DzQAn2oTruhtdaMlifhNN+mJ92yae/cL
=z2+B
-----END PGP SIGNATURE-----

--ONTEBGf774apj9iN--
