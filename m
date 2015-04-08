Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 9D36673D30;
	Wed,  8 Apr 2015 12:51:26 +0000 (UTC)
Received: by wgin8 with SMTP id n8so87055058wgi.0;
	Wed, 08 Apr 2015 05:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bnIXLIqX8UsvL1Blx4KZ3jb0HVf1l6QjjPYSnaQ7em8=;
	b=HwJHy99Lzc9tlqdiV0RF5bJR0+V5Wku4if0jRjpmO/mfxkKIaQSrtsoHuzzQD8IUAR
	vWeksFUHbHs1FONc10eLqr2JfpcJnKZn87YwzhQgRE47iebLO6YTKrnpNKGBki0Q5j9A
	4WUU8Q3XVH8IZ4A6JxZlApPqdn64bC1x8jbbiujB5uMIYjWjxc0l/PbF3p3GtMZ+IDuj
	/7h6fOgpgtxbLDFIhFiA6Cim8rNqrL7fTUszq2q7TbyXg+ELOdcXzYnH5VgC18s5t0SF
	grkx957qnbi0o1SXdtCqN26O71u0Jy8eWDGfKmYez4sYvUgzfgHRhZ9gkigiNTWYxrYI
	U7FA==
X-Received: by 10.194.94.164 with SMTP id dd4mr50649999wjb.56.1428497484828;
	Wed, 08 Apr 2015 05:51:24 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	xy2sm15507596wjc.14.2015.04.08.05.51.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Apr 2015 05:51:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 8 Apr 2015 14:51:27 +0200
To: openembedded-devel@lists.openembedded.org,
	Joe MacDonald <joe_macdonald@mentor.com>,
	Bian Naimeng <biannm@cn.fujitsu.com>
Message-ID: <20150408125127.GG2337@jama>
References: <20150223190317.823C42014@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20150223190317.823C42014@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Bian Naimeng : ipsec-tools: add systemd supported
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
X-List-Received-Date: Wed, 08 Apr 2015 12:51:29 -0000
X-Groupsio-MsgNum: 55011
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pMCBjikF2xGw87uL"
Content-Disposition: inline

--pMCBjikF2xGw87uL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2015 at 07:03:17PM +0000, git@git.openembedded.org wrote:
> Module: meta-openembedded.git
> Branch: master
> Commit: 1eb5a644459f16219410ee53f47b7d2d082e17a1
> URL:    http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit=
;h=3D1eb5a644459f16219410ee53f47b7d2d082e17a1
>=20
> Author: Bian Naimeng <biannm@cn.fujitsu.com>
> Date:   Mon Feb 16 11:14:35 2015 +0800
>=20
> ipsec-tools: add systemd supported
>=20
> Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
>=20
> ---
>=20
>  .../recipes-support/ipsec-tools/ipsec-tools/racoon.conf   |  8 ++++++++
>  .../ipsec-tools/ipsec-tools/racoon.service                | 11 +++++++++=
++
>  .../recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb      | 15 +++++++++=
+++++-
>  3 files changed, 33 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools/raco=
on.conf b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/racoon.co=
nf
> new file mode 100644
> index 0000000..6b50750
> --- /dev/null
> +++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/racoon.conf
> @@ -0,0 +1,8 @@
> +# Defaults for racoon service
> +# sourced by racoon.service
> +# installed at /etc/default/racoon by the maintainer scripts
> +#
> +# This is a POSIX shell fragment
> +#
> +# Arguments to pass to racoon
> +RACOON_ARGS=3D""
> diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools/raco=
on.service b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/racoon=
=2Eservice
> new file mode 100644
> index 0000000..a10e770
> --- /dev/null
> +++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/racoon.serv=
ice
> @@ -0,0 +1,11 @@
> +[Unit]
> +Description=3DRacoon IKEv1 key management daemon for IPSEC
> +After=3Dsyslog.target network.target
> +
> +[Service]
> +Type=3Dforking
> +EnvironmentFile=3D-@SYSCONFDIR@/default/racoon
> +ExecStart=3D@SBINDIR@/racoon $RACOON_ARGS
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.=
2.bb b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
> index 7519d83..9704b13 100644
> --- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
> +++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
> @@ -16,11 +16,13 @@ SRC_URI =3D "ftp://ftp.netbsd.org/pub/NetBSD/misc/ips=
ec-tools/0.8/ipsec-tools-${PV
>             file://glibc-2.20.patch \
>             file://racoon-Resend-UPDATE-message-when-received-EINTR-messa=
ge.patch \
>             file://racoon.conf.sample \
> +           file://racoon.conf \
> +           file://racoon.service \
>            "
>  SRC_URI[md5sum] =3D "d53ec14a0a3ece64e09e5e34b3350b41"
>  SRC_URI[sha256sum] =3D "8eb6b38716e2f3a8a72f1f549c9444c2bc28d52c95367926=
90564c74fe722f2d"
> =20
> -inherit autotools
> +inherit autotools systemd

SYSTEMD_SERVICE variable isn't set, so this racoon isn't enabled and
packaged, how was this change tested?

Also causes QA warning:
ipsec-tools-0.8.2: ipsec-tools: Files/directories were installed but not
shipped
  /lib
  /lib/systemd
  /lib/systemd/system
  /lib/systemd/system/racoon.service [installed-vs-shipped]

>  # Options:
>  #  --enable-adminport      enable admin port
> @@ -68,4 +70,15 @@ PACKAGECONFIG[selinux] =3D "--enable-security-context,=
--disable-security-context,l
>  do_install_append() {
>      install -d ${D}${sysconfdir}/racoon
>      install -m 0644 ${WORKDIR}/racoon.conf.sample ${D}${sysconfdir}/raco=
on/racoon.conf
> +
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false=
', d)}; then
> +        install -d ${D}${systemd_unitdir}/system
> +        install -m 0644 ${WORKDIR}/racoon.service ${D}${systemd_unitdir}=
/system
> +
> +        sed -i -e 's#@SYSCONFDIR@#${sysconfdir}#g' ${D}${systemd_unitdir=
}/system/racoon.service
> +        sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/syst=
em/racoon.service
> +
> +        install -d ${D}${sysconfdir}/default/
> +        install -m 0644 ${WORKDIR}/racoon.conf ${D}${sysconfdir}/default=
/racoon
> +    fi
>  }
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pMCBjikF2xGw87uL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUlJE8ACgkQN1Ujt2V2gBwB1gCgvAExELUWDraaDRoGShaW/ic9
GioAoIi8+6IiuEtkg/cuYNoPUV8n78nz
=ybI/
-----END PGP SIGNATURE-----

--pMCBjikF2xGw87uL--
