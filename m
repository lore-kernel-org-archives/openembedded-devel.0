Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QBt2o-0004o1-TK
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Apr 2011 20:19:30 +0200
Received: by bwz5 with SMTP id 5so4459688bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2011 11:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=/bydVrcyeka4hAoDHgSUYOSlak+Ih5o93lE85tk55BY=;
	b=X4ORr38WWkopMibwaJppIGyYhr1/RZAwa3oBSwfJ9lK1uvCskfgFE/NV+P7XJfnA81
	CX+Pk80WWMzLb24/ZDae373IYeDIGbhYkxFUiEdJACO+Yn4K+oMo8iUPaJ654l1fFNFJ
	kZLgxERARjoCDxmcJHOA63Nx4rOH/BMgPsRq4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=ZL2tzP4NO2YQBNmv1lDVCzry2j3xnFv4vjEdGD3Fc9tGGy/L+GcDsjkfEWtj3V3aMz
	b9BWs5n1v0e9h6O23zL5JZVrdKJ6tcO+EZp8MVxYu2olLb/UC75wccwflhuy62S8uirC
	+Qa7DoHj/1zUVHpA4Id+NTsjGwXQ2g6ovATJU=
Received: by 10.204.35.18 with SMTP id n18mr111710bkd.91.1303150629985;
	Mon, 18 Apr 2011 11:17:09 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id q18sm3375643bka.3.2011.04.18.11.17.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Apr 2011 11:17:08 -0700 (PDT)
Date: Mon, 18 Apr 2011 20:17:07 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110418181707.GG24192@jama.jama.net>
References: <1302898356-22075-1-git-send-email-GNUtoo@no-log.org>
MIME-Version: 1.0
In-Reply-To: <1302898356-22075-1-git-send-email-GNUtoo@no-log.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] xserver-nodm-init 2.0: remove DEFAULT_PREFERENCE = "-1"
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
X-List-Received-Date: Mon, 18 Apr 2011 18:19:31 -0000
X-Groupsio-MsgNum: 31289
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HeFlAV5LIbMFYYuh"
Content-Disposition: inline

--HeFlAV5LIbMFYYuh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 15, 2011 at 10:12:36PM +0200, Denis 'GNUtoo' Carikli wrote:
> That fix was made in order to prevent distributions like Angstrom2010
>   from picking the 1.0 version:
> Angstrom 2008 picked the 2.0 version while Angstrom 2010 use the 1.0 vers=
ion.
>   That can prevent Xorg session from starting on the target device(like b=
ug20 in my case):
> The 1.0 lacks the following session start:
>     xinit /etc/X11/Xsession -- `which $XSERVER` $ARGS >/var/log/Xsession.=
log 2>&1
> And has that instead:
>     /etc/X11/Xserver &
> Which has the effect of starting Xorg only(and not the session,display ma=
nager etc...)
>=20
> Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> ---
>  recipes/xserver-nodm-init/xserver-nodm-init_2.0.bb |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
>=20
> diff --git a/recipes/xserver-nodm-init/xserver-nodm-init_2.0.bb b/recipes=
/xserver-nodm-init/xserver-nodm-init_2.0.bb
> index 5d6ca39..317d58a 100644
> --- a/recipes/xserver-nodm-init/xserver-nodm-init_2.0.bb
> +++ b/recipes/xserver-nodm-init/xserver-nodm-init_2.0.bb
> @@ -3,7 +3,6 @@ LICENSE =3D "GPL"
>  SECTION =3D "x11"
>  PRIORITY =3D "optional"
>  RDEPENDS_${PN} =3D "xserver-common (>=3D 1.30) xinit"
> -DEFAULT_PREFERENCE =3D "-1"
>  PR =3D "r4"
> =20
>  SRC_URI =3D "file://xserver-nodm"
> --=20
> 1.7.0.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--HeFlAV5LIbMFYYuh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk2sgCMACgkQN1Ujt2V2gBzKfwCcC5H6aJANvW0mwUHnRzQFsMMM
KaMAn3Yhik84K6X0O2CEhcRp8o90hroB
=Cmkg
-----END PGP SIGNATURE-----

--HeFlAV5LIbMFYYuh--
