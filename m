Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 4D13277087
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Nov 2015 17:05:29 +0000 (UTC)
Received: by wmll128 with SMTP id l128so46218123wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Nov 2015 09:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=XQ7ZDsYT0z2nKfP9RzFUHo7vk8c+rFKHNn9T3nsBN3s=;
	b=VYZCfcJKRd66MX4JDY9PyvbeLwtqoT+OAUNa0OGsmV+sYNB/B06DDJem1UOXgsVdTw
	VWvf9bQALimmexvusOpIBHzkG34/2lxzCmypNE3j2crlPELpWuwJCFbrbZi4PhVPpV1W
	4E9xg7ovTGR6GAR0ohlj6qcXFI26JsD5VPBYuSu302ELATPneBV7HscIRuwZnhUi1VAQ
	Nt72rS+WxeuJDe4qq9j6/GFT8d6k7spoqtR2rvT1Rn9lJr/IKz6Db625zchYeMeHknBk
	tam7ChRh5hxXtQ5RbQsq2TCFOHHxUiyjMRmWfd1hWrvOTYLuWPXQ8fZqNKdT6z9jbasE
	XhUA==
X-Received: by 10.28.55.76 with SMTP id e73mr12114566wma.89.1446829529566;
	Fri, 06 Nov 2015 09:05:29 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id 20sm3932962wmh.8.2015.11.06.09.05.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Nov 2015 09:05:28 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 6 Nov 2015 18:05:46 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151106170546.GE2550@jama>
References: <1446464931-351-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1446464931-351-1-git-send-email-jackie.huang@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH] samba: fix the incorrect tmpfiles installed directory
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
X-List-Received-Date: Fri, 06 Nov 2015 17:05:30 -0000
X-Groupsio-MsgNum: 58386
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4Epv4kl9IRBfg3rk"
Content-Disposition: inline

--4Epv4kl9IRBfg3rk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 02, 2015 at 07:48:51PM +0800, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> - The tmpfiles are always installed in /usr/lib
>   even for multilib.
> - It makes no sense to have two tmpfiles in both
>   /usr/lib/tmpfiles.d and /etc/tmpfiles.d, install
>   it as one in /etc/tmpfiles.d.

Please rebase on latest master and resend.

>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta-oe/recipes-connectivity/samba/samba_4.1.12.bb | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>=20
> diff --git a/meta-oe/recipes-connectivity/samba/samba_4.1.12.bb b/meta-oe=
/recipes-connectivity/samba/samba_4.1.12.bb
> index 22c2bb4..45fdaa7 100644
> --- a/meta-oe/recipes-connectivity/samba/samba_4.1.12.bb
> +++ b/meta-oe/recipes-connectivity/samba/samba_4.1.12.bb
> @@ -94,18 +94,16 @@ do_install_append() {
>              -e 's,@SBINDIR@,${sbindir},g' \
>              -i ${D}${systemd_unitdir}/system/*.service
> =20
> -	install -d ${D}${sysconfdir}/tmpfiles.d
> -	echo "d ${localstatedir}/log/samba 0755 root root -" \
> -            > ${D}${sysconfdir}/tmpfiles.d/99-${BPN}.conf
> +        install -d ${D}${sysconfdir}/tmpfiles.d
> +        install -m644 packaging/systemd/samba.conf.tmp ${D}${sysconfdir}=
/tmpfiles.d/samba.conf
> +        echo "d ${localstatedir}/log/samba 0755 root root -" \
> +            >> ${D}${sysconfdir}/tmpfiles.d/samba.conf
>      fi
> =20
>      install -d ${D}${sysconfdir}/samba
>      echo "127.0.0.1 localhost" > ${D}${sysconfdir}/samba/lmhosts
>      install -m644 packaging/LSB/smb.conf ${D}${sysconfdir}/samba/smb.conf
> =20
> -    install -d ${D}${libdir}/tmpfiles.d
> -    install -m644 packaging/systemd/samba.conf.tmp ${D}${libdir}/tmpfile=
s.d/samba.conf
> -
>      install -d ${D}${sysconfdir}/sysconfig/
>      install -m644 packaging/systemd/samba.sysconfig ${D}${sysconfdir}/sy=
sconfig/samba
>  }
> @@ -114,7 +112,6 @@ PACKAGES +=3D "${PN}-python ${PN}-python-dbg ${PN}-pi=
dl libwinbind libwinbind-dbg
> =20
>  FILES_${PN} +=3D "/run \
>                  ${libdir}/security/pam_smbpass.so \
> -                ${libdir}/tmpfiles.d/* \
>                 "
> =20
>  SMB_SERVICE=3D"${systemd_unitdir}/system/nmb.service ${systemd_unitdir}/=
system/smb.service"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4Epv4kl9IRBfg3rk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlY83ekACgkQN1Ujt2V2gBxADACbBNvNw8R+n/CynGWcBFWQt+hW
hiQAoLRQrernMlW4XZY2v61u3r4s0leR
=eEiX
-----END PGP SIGNATURE-----

--4Epv4kl9IRBfg3rk--
