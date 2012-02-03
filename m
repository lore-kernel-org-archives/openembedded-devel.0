Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1RtJ6K-00009D-Qz; Fri, 03 Feb 2012 14:22:52 +0100
Received: by eaal10 with SMTP id l10so728293eaa.6
	for <multiple recipients>; Fri, 03 Feb 2012 05:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=b1Rs9/l/Hqde9F1tKq0QEs6KWTnpD4D+6NLdWtQdZ7Y=;
	b=pyE1qOgvp6TpKnOqIqDQIIHf1+tgoMfCZNYiS+RkClvoKxUlGCSvg5yj/EF/MZqOIK
	iJZb2itIz83sbny4lI5aLwjeujUC5GlAAUiOZI2oSL5/iS05kgLT7cNcjYsV6VXu9fcZ
	tp3frZ6WJ8k6G73y5XBLtufgGysnTgymujovA=
Received: by 10.213.33.145 with SMTP id h17mr1223198ebd.89.1328274895223;
	Fri, 03 Feb 2012 05:14:55 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id c16sm21846368eei.1.2012.02.03.05.14.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Feb 2012 05:14:54 -0800 (PST)
Date: Fri, 3 Feb 2012 14:14:51 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120203131451.GJ3893@jama.jama.net>
References: <20120201080441.DA76610333@opal>
MIME-Version: 1.0
In-Reply-To: <20120201080441.DA76610333@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Otavio Salvador : systemd.bbclass: depends on systemd
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
X-List-Received-Date: Fri, 03 Feb 2012 13:22:52 -0000
X-Groupsio-MsgNum: 36865
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OX7PPUk8qMPP4++R"
Content-Disposition: inline

--OX7PPUk8qMPP4++R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 01, 2012 at 08:04:41AM +0000, git@git.openembedded.org wrote:
> Module: meta-openembedded.git
> Branch: master
> Commit: c029d4a268de1ac7076fbeb9e337e96fdb1b226d
> URL:    http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit=
;h=3Dc029d4a268de1ac7076fbeb9e337e96fdb1b226d
>=20
> Author: Otavio Salvador <otavio@ossystems.com.br>
> Date:   Tue Jan 31 17:38:57 2012 +0000
>=20
> systemd.bbclass: depends on systemd
>=20
> Packages that uses the systemd class need to have systemd build
> otherwise they might fail to detect systemd as available or fail to
> generate rootfs.

Can we move this only to packages which are really depending on systemd
compiled?

I have use-case where
small cpio image has busybox
busybox depends on systemd just because of this
systemd depends on kernel (because RRECOMMENDS on modules)
kernel depends on that cpio image which is used as ramdisk

So in order to finish cpio.do_rootfs I have to finish kernel and kernel
fails to build because doesn't have cpio available yet (DEPENDS =3D "cpio"
is not enough because doesn't need do_rootfs to finish AFAIK).

Cheers,

>=20
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>=20
> ---
>=20
>  meta-oe/classes/systemd.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bb=
class
> index 2ca7bfc..094a12c 100644
> --- a/meta-oe/classes/systemd.bbclass
> +++ b/meta-oe/classes/systemd.bbclass
> @@ -1,4 +1,4 @@
> -DEPENDS_append =3D " systemd-systemctl-native"
> +DEPENDS_append =3D " systemd systemd-systemctl-native"
> =20
>  systemd_postinst() {
>  OPTS=3D""
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--OX7PPUk8qMPP4++R
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8r3csACgkQN1Ujt2V2gBwD8wCfWqN3sp/yLcdEo5DEEDE+d/wJ
sJsAn1Fy91xq4OuELgUhXE+wHN6Nbjan
=PTbY
-----END PGP SIGNATURE-----

--OX7PPUk8qMPP4++R--
