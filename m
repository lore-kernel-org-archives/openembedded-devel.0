Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PnRoy-00068d-JT
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Feb 2011 09:24:12 +0100
Received: by fxm17 with SMTP id 17so1140702fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Feb 2011 00:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=7MSJdCjVgy8uMZ5AIZEsXzypFFPbT8fYrQuvMaQJSMc=;
	b=h2e04zey6Lxk+sDpevZoi0ytrrTfLj2sCYLb/06URIIAjpnTxkTZUSnC+pDo1ctt34
	LI8CyQcQUCok/KIkYL3vjYpMH0NC+HfSGpVf8QHJAAC2mN+LSvBsiXFt1vpsVwiNtmub
	D5MsjCe6jSG1pLfRKal03Db2YdCahRQgF6lB4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=eV12T876I3cuffo6FNErFX5eOwUwqVvOk5QMyUOCmUpLXprBvy6fA/hkXJLqUXxkbF
	mmBDJ1CqtFrh4pKT00GfICarcD1OUmIoU6KhlsI+KgOx2rV5HMHnepC5TpdU5C2aVPPj
	ih9KYhSM9KnwQBJW3nXmx6xoPZubZ/wEPLubo=
Received: by 10.223.71.195 with SMTP id i3mr10959376faj.149.1297326188648;
	Thu, 10 Feb 2011 00:23:08 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id b7sm551040faa.42.2011.02.10.00.23.06
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 10 Feb 2011 00:23:07 -0800 (PST)
Date: Thu, 10 Feb 2011 09:23:41 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Tom Rini <tom_rini@mentor.com>
Message-ID: <20110210082340.GA10554@jama>
References: <4D51566B.9060603@mentor.com>
MIME-Version: 1.0
In-Reply-To: <4D51566B.9060603@mentor.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: OpenEmbedded 2011.3 Release: Request for targets!
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
X-List-Received-Date: Thu, 10 Feb 2011 08:24:12 -0000
X-Groupsio-MsgNum: 28992
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline

--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 08, 2011 at 07:42:51AM -0700, Tom Rini wrote:
> Hey all,
>=20
> As March is fast approaching I want to gather the list of DISTRO /=20
> MACHINE / BBPKGS targets that the various distributions would like to=20
> see at least compile tested (volunteers for HW testing welcome!).=20
> Today, I have the following setup to be built:
>=20
> minimal / minimal-uclibc:
> qemux86/ppc/arm/mips/mips64/sh4/mipsel, mpc8315e-rdb, p2020ds, p2020rdb=
=20
> +=20
> nas-server-image/native-sdk-image/console-image/minimal-image/x11-image/m=
eta-toolchain/qt4-x11-demo-image/qt4e-demo-image
>=20
> angstrom-2008.1 / angstrom-2010.x:
> hawkboard, mini2440, mini6410, beagleboard + console-image /=20
> qt4-x11-demo-image / qt4e-demo-image
>=20
> slugos / ucslug:
> nslu2be/le + slugos-image

I'll try to test/build it myself, but if you have some spare cpu power
then please add:

Distro: shr
Machine: om-gta02, nokia900
Image: shr-image

Thanks!

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk1ToIwACgkQN1Ujt2V2gBxx/gCdEtXPWdQag6z7yoGFty2N2/+C
9YoAoJpgN+QxmPifboy2jTo72vboSpsz
=o3yj
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
