Received: from mail-ea0-f171.google.com ([209.85.215.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1URkmz-0003GP-VO
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Apr 2013 16:53:54 +0200
Received: by mail-ea0-f171.google.com with SMTP id b15so2290950eae.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2013 07:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=DBqy4c04HjtQ/EqcTvigAMVDQjwtAp8BkkDeF/mw3rg=;
	b=wJQkQY+5smC4/X7//SaXXEacfTfV66U8/azu4uS4MXZ0oduMxxpdHfsqUqkU6Y5Hwl
	w1lleXLc/jxyA69Ch6bXsN7IgnMd2pjwnheoA7W7if3wxtzWMq+r7qqQnNDaJGSR73Zj
	08WPfgtrWyTw1n+cBNornwW3EgmsKEI4z3aFIvBbalQZgxd382zNTaGn+d9SVv9jNsQK
	eEYTBb3skIjqDAmQMi5y8o9QLhaPD6O6xQHuN3KB9+PmBxX9AsKSpmA+6Yb/QG2demyU
	1m9+xIRlYW4UWX71gP4YovAvVHTlt65A8ZH4QmmJFAJ34plPO1GVLSPqpdxRVYand+kk
	h9bw==
X-Received: by 10.14.201.67 with SMTP id a43mr44974842eeo.33.1366036581192;
	Mon, 15 Apr 2013 07:36:21 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id a41sm27218905eei.4.2013.04.15.07.36.20
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 15 Apr 2013 07:36:20 -0700 (PDT)
Date: Mon, 15 Apr 2013 16:36:26 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20130415143626.GE10628@jama.dyndns-home.com>
References: <1365761087-1229-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1365761087-1229-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCHv3 1/5] python-tornado: update to top of 2.2 branch
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
X-List-Received-Date: Mon, 15 Apr 2013 14:54:05 -0000
X-Groupsio-MsgNum: 44201
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gMR3gsNFwZpnI/Ts"
Content-Disposition: inline

--gMR3gsNFwZpnI/Ts
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2013 at 12:04:43PM +0200, Koen Kooi wrote:
> Drags in a few bugfixes needed for gateone

All 5 merged + fix for nodejs4 install on dash

> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta-oe/recipes-devtools/python/python-tornado_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-oe/recipes-devtools/python/python-tornado_git.bb b/meta=
-oe/recipes-devtools/python/python-tornado_git.bb
> index 00d0bbb..f158923 100644
> --- a/meta-oe/recipes-devtools/python/python-tornado_git.bb
> +++ b/meta-oe/recipes-devtools/python/python-tornado_git.bb
> @@ -2,9 +2,9 @@ DESCRIPTION =3D "Tornado is an open source version of the=
 scalable, non-blocking w
>  LICENSE =3D "Apache"
>  LIC_FILES_CHKSUM =3D "file://README;md5=3De7fb9954003d7cd93322ccf282210d=
1c"
> =20
> -PV =3D "2.2"
> -SRCREV =3D "02bc76155de5bf4dca243e4d0c019c0ac4c8b3be"
> -PR =3D "r1"
> +PV =3D "2.2.1+git${SRCPV}"
> +
> +SRCREV =3D "c501917eba46dec30b1f2ef12497dffc4beec505"
>  SRC_URI =3D "git://github.com/facebook/tornado.git;branch=3Dbranch2.2 \
>             file://0001-disable-AI_ADDRCONFIG-flag.patch \
>            "
> --=20
> 1.8.1.4
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gMR3gsNFwZpnI/Ts
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFsEGoACgkQN1Ujt2V2gByP9gCfY/FQvJ72d6GW1pye3HfiDB6o
KrIAoK/SVZ/15ZTWjdW5gSW/42q5dnIl
=iZSy
-----END PGP SIGNATURE-----

--gMR3gsNFwZpnI/Ts--
