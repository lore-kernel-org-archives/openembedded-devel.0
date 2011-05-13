Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QKx34-0004qv-Rj
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 May 2011 20:25:14 +0200
Received: by fxm19 with SMTP id 19so2168710fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 May 2011 11:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=YyBaHkThhCk98OQ9qM3kKexBRKS8aP+0B0+Q2hAxJAA=;
	b=NEJAG1sLUg7w9isAXnL4jqrcOoX7/1JzNz5VoBMBPsfZGB8D4RWONmiCHKYH7FAsYa
	NgO1sevqk7qelDeMuxORhVyfdH6sIU/ywht7Vp3HiC1dq+nmOfTq+6tjXAs1SOh3XlaP
	e7DQ9Fug0fGZLx4297AEUwSyzl2mF5wwh4zSg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=evsKqLAbhdV7mV7onLD8merSENUKRIO+rT+OSklPnwnSDXqdeWBkzuW/ZF1/ID50Yj
	UJk4RPniSjKYqO5qbskbSQ5aZDG43orCtM7FupWwQdwISLLGjFSdU4B6q2ZJyolDZ3er
	/PVyDQZiM/ohJKDyLBZLWI1KZgrbJJ0txsNGg=
Received: by 10.223.87.215 with SMTP id x23mr10103fal.32.1305310946024;
	Fri, 13 May 2011 11:22:26 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id c22sm924666fat.14.2011.05.13.11.22.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 May 2011 11:22:25 -0700 (PDT)
Date: Fri, 13 May 2011 20:22:17 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
Message-ID: <20110513182217.GH3162@jama.jama.net>
References: <1305290080.2448.3.camel@gnutoo-laptop>
	<1305290702-7166-1-git-send-email-GNUtoo@no-log.org>
MIME-Version: 1.0
In-Reply-To: <1305290702-7166-1-git-send-email-GNUtoo@no-log.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 10/12] preferred-shr-versions.inc: remove xserver-common prefered version
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
X-List-Received-Date: Fri, 13 May 2011 18:25:14 -0000
X-Groupsio-MsgNum: 32009
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jIYo0VRlfdMI9fLa"
Content-Disposition: inline

--jIYo0VRlfdMI9fLa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 13, 2011 at 02:45:01PM +0200, Denis 'GNUtoo' Carikli wrote:
> Without that fix SHR keep choosing xserver-common 1.33 instead of the 1.3=
4 version

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

>=20
> Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
> ---
>  conf/distro/include/preferred-shr-versions.inc |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
>=20
> diff --git a/conf/distro/include/preferred-shr-versions.inc b/conf/distro=
/include/preferred-shr-versions.inc
> index 35a4ecd..7df65c5 100644
> --- a/conf/distro/include/preferred-shr-versions.inc
> +++ b/conf/distro/include/preferred-shr-versions.inc
> @@ -18,7 +18,6 @@ PREFERRED_VERSION_linux-libc-headers-native =3D "${LINU=
X_LIBC_HEADERS_VERSION}"
>  PREFERRED_VERSION_openssh =3D "5.2p1"
> =20
>  # upgrades used in Angstrom
> -PREFERRED_VERSION_xserver-common =3D "1.33"
>  PREFERRED_VERSION_xserver-nodm-init =3D "2.0"
>  PREFERRED_VERSION_hal           =3D "0.5.13"
>  PREFERRED_VERSION_wpa-supplicant =3D "0.6.9"
> --=20
> 1.7.0.4
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jIYo0VRlfdMI9fLa
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk3NdtkACgkQN1Ujt2V2gBwc9wCgmlcbxGJEkFdWwdB1PY6yNO0o
gw8An33SxnrL+Lz532UYjRGrpnG/uvgM
=BTtO
-----END PGP SIGNATURE-----

--jIYo0VRlfdMI9fLa--
