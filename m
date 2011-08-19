Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QuWxs-0001dB-Ul
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Aug 2011 23:50:56 +0200
Received: by fxg11 with SMTP id 11so2450105fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2011 14:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=N/WRJwoTmChW+O+YlMr4n50caM2KCrmYFvz5w/txg/I=;
	b=VajnuftBzGEhA3lIBiG3DwpkreAOHDG1CYmGyxooTMDt3KMGYkV3+F0KGpnCu793RG
	QiZNywI4ABVgN7TH/myl3WDKni9oKzOwykNZf+/CROx7P8OMyZxQ7MW6tkx+70/1PcRq
	V71ryvDdqMF8ImGA52IT/Vb90OeeEz4yX4iBI=
Received: by 10.223.28.10 with SMTP id k10mr252949fac.128.1313790375318;
	Fri, 19 Aug 2011 14:46:15 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r11sm2168745faa.0.2011.08.19.14.46.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 19 Aug 2011 14:46:13 -0700 (PDT)
Date: Fri, 19 Aug 2011 23:46:07 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110819214607.GC22251@jama.jama.net>
References: <1313774135-24525-1-git-send-email-sylvain.pare@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1313774135-24525-1-git-send-email-sylvain.pare@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] shr : initscripts-shr, changed mountdevsubfs.sh init level from 04 to 05 S to fix issue for machines using udev
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
X-List-Received-Date: Fri, 19 Aug 2011 21:50:57 -0000
X-Groupsio-MsgNum: 33733
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hOcCNbCCxyk/YU74"
Content-Disposition: inline

--hOcCNbCCxyk/YU74
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 19, 2011 at 07:15:35PM +0200, Sylvain 'GarthPS' Par=E9 wrote:
>  * since this commit http://git.openembedded.org/cgit.cgi/openembedded/co=
mmit/?id=3D974dfb87778a26b80983b44c94922d0acb257e33 machines using udev and=
 mountdevsubfs.sh had issue of pts not mounted
>  because both were at init level S04 despite mountdevsubfs.sh was dependi=
ng on udev..

Thanks, applied and PR bumped after that (normally I can do it in the
same patch but beer level makes me slower to bump PR then type git push)

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hOcCNbCCxyk/YU74
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk5O2Z8ACgkQN1Ujt2V2gBxhDQCeNlBU4tzzYL2/oT20WfBZ3Qlr
M1YAn2+tc7jCEjyPGTXDgG358jFIJr46
=qBN5
-----END PGP SIGNATURE-----

--hOcCNbCCxyk/YU74--
