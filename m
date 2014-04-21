Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id C3825609B1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 07:58:27 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id d17so3431487eek.15
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 00:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=QlHXX9Vosik395vFW0WvIYLZjP8n5ILLZNt2x949r9g=;
	b=Sp3QWDtVUIbk1CYyCHMNbpUaMEFpzpygXh63nGv4wIKOu3+C5seXA6kyBc/ldLoHPF
	ZndyiBB7JCt5SNzssAliJebfK2PcvnYhgvblUgAPbFPP/cBgFYnZZZbcqEgOCHH5asJ+
	fqYtuQSAcEwdYs3co6s0ZNnkk0QJzn1k/6zgXgYY1uVlApuTjGyvFzUrs+SYEgRB2K9L
	jtM9jWvTNPCxGX78kVaMA7i5PQdkTxA4d3/+DlVX5RCXAEW5/RDRSLkR+/IssDXArIBH
	lKylRkH9j1j4lSDevbRxNP5JSvQtHda9TJHu4Zx96AW1Bb7s5Ed4EAxdC30HjU4iazYD
	z7Bg==
X-Received: by 10.15.22.201 with SMTP id f49mr45932796eeu.18.1398067107875;
	Mon, 21 Apr 2014 00:58:27 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	t44sm101327944eeo.6.2014.04.21.00.58.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Apr 2014 00:58:26 -0700 (PDT)
Date: Mon, 21 Apr 2014 09:58:32 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140421075832.GV2486@jama>
References: <cover.1398058983.git.wenzong.fan@windriver.com>
	<751e6bee2f8bcfd9c78ad2b03a9f8b007abe028a.1398058983.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
In-Reply-To: <751e6bee2f8bcfd9c78ad2b03a9f8b007abe028a.1398058983.git.wenzong.fan@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH 1/2] vsftpd: fix install warning
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
X-List-Received-Date: Mon, 21 Apr 2014 07:58:35 -0000
X-Groupsio-MsgNum: 49385
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iQGPoUMhvSZ8XQaB"
Content-Disposition: inline

--iQGPoUMhvSZ8XQaB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2014 at 01:53:27AM -0400, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
>=20
> WARNING: QA Issue: vsftpd: Files/directories were installed but not shipp=
ed
>   /run
>   /run/vsftpd
>   /run/vsftpd/empty

I'm glad to see fix for QA, but I don't think that everybody is using
populate-volatile.sh for volatiles (e.g. images with systemd).

> Signed-off-by: Li Wang <li.wang@windriver.com>
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>  .../recipes-daemons/vsftpd/vsftpd_3.0.0.bb         |    9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb b/met=
a-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
> index 0698a63..2cf9ac3 100644
> --- a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
> +++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
> @@ -70,7 +70,6 @@ do_install() {
>          sed -i "s:/lib/security:${base_libdir}/security:" ${D}${sysconfd=
ir}/pam.d/vsftpd
>          sed -i "s:ftpusers:vsftpd.ftpusers:" ${D}${sysconfdir}/pam.d/vsf=
tpd
>      fi
> -    install -d ${D}${localstatedir}/run/vsftpd/empty
>  }
> =20
>  INITSCRIPT_PACKAGES =3D "${PN}"
> @@ -82,3 +81,11 @@ USERADD_PARAM_${PN} =3D "--system --home-dir /var/lib/=
ftp --no-create-home -g ftp
>                         --shell /bin/false ftp "
>  GROUPADD_PARAM_${PN} =3D "-r ftp"
> =20
> +pkg_postinst_${PN}() {
> +	if [ -n "$D" ]; then
> +		exit 0
> +	fi
> +	if [ -e /etc/init.d/populate-volatile.sh ]; then
> +		/etc/init.d/populate-volatile.sh update
> +	fi
> +}
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--iQGPoUMhvSZ8XQaB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNUz6gACgkQN1Ujt2V2gBzOkQCeM09Wsubtqb4WpWZjeqMR6zfA
GZoAn0nC8n2C3qE+c2/UH7VToIJlTaNY
=VMSr
-----END PGP SIGNATURE-----

--iQGPoUMhvSZ8XQaB--
