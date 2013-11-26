Return-Path: <joe@deserted.net>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 989E06DD0C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2013 02:54:29 +0000 (UTC)
Received: by mail-ie0-f177.google.com with SMTP id tp5so8234071ieb.36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Nov 2013 18:54:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=cL58BgJIGHlHr2QATOT9wdtr3+p8CdtcPqur+sVjbvU=;
	b=eg7jfyqpEPKG5Jq82KMRyysQY7a30sqs/ynQHqfEjOWv/dYrcsFFSQF9jIDaV4plbO
	uzjjsTbYw1KWMvHpZTddu0faJWaPePfcmSxD3Ju670a0pq68e5huAMracMSD7TZpIul6
	qJVDNaGfBWY7yFRt1KPcXOvTeESyGT8kEH/61hqrN8MMsT2mXhpXwmGJ874XKFcZpwSR
	uTGrDMAT3IEysUFKg+7FbQ22dXsSIkHoc2xVxDvk25LfIKCMWjachSmidW8TXL3lPaef
	1g0les0m7ftRAm0t0dhMZ0FSQPXX48ltBPVmoECwQdwT+6F9a4SDt72XGth41R8hLgpj
	46Bg==
X-Gm-Message-State: ALoCoQkM23NTQOKdXmECtx/xlqkARwSLnby/Zg4SRqlz/zk5w5Mo6FiLL4oh86hB0r2pNsSYpQoj
X-Received: by 10.50.124.133 with SMTP id mi5mr15054095igb.57.1385434469418;
	Mon, 25 Nov 2013 18:54:29 -0800 (PST)
Received: from deserted.net (198-84-238-35.cpe.teksavvy.com. [198.84.238.35])
	by mx.google.com with ESMTPSA id
	x6sm29313764igb.3.2013.11.25.18.54.28 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 25 Nov 2013 18:54:28 -0800 (PST)
Date: Mon, 25 Nov 2013 21:54:26 -0500
From: Joe MacDonald <joe@deserted.net>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20131126025425.GB5596@deserted.net>
References: <1384897838-11066-1-git-send-email-mark.hatle@windriver.com>
	<1384897838-11066-3-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1384897838-11066-3-git-send-email-mark.hatle@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 2/3] proftpd: Convert proftpd group to system scope
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
X-List-Received-Date: Tue, 26 Nov 2013 02:54:29 -0000
X-Groupsio-MsgNum: 47261
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="v9Ux+11Zm5mwPlX6"
Content-Disposition: inline

--v9Ux+11Zm5mwPlX6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged this one, the other two are giving me a bit of grief.  I'll check
back soon if it's not a quick fix.

-J.

[[meta-networking][PATCH 2/3] proftpd: Convert proftpd group to system scop=
e] On 13.11.19 (Tue 15:50) Mark Hatle wrote:

> From: Qiang Chen <qiang.chen@windriver.com>
>=20
> Proftpd is meant to be a system user, not a normal user of the
> system so lets pass the correct parameters to the system.
> Just add --system param when creating ftp group.
>=20
> Signed-off-by: Qiang Chen <qiang.chen@windriver.com>
> Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
> ---
>  meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb b/=
meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
> index 6571b9c..29c3097 100644
> --- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
> +++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
> @@ -60,7 +60,7 @@ INITSCRIPT_NAME =3D "proftpd"
>  INITSCRIPT_PARAM =3D "defaults 85 15"
> =20
>  USERADD_PACKAGES =3D "${PN}"
> -GROUPADD_PARAM_${PN} =3D "${FTPGROUP}"
> +GROUPADD_PARAM_${PN} =3D "--system ${FTPGROUP}"
>  USERADD_PARAM_${PN} =3D "--system -g ${FTPGROUP} ${FTPUSER}"
> =20
>  FILES_${PN} +=3D "/home/${FTPUSER}"
--=20
-Joe MacDonald.
:wq

--v9Ux+11Zm5mwPlX6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlKUDWEACgkQwFvcllog0Xyn5wCfSI/brGU41ZlBNl5Cwpn6NQ5v
oksAoLeqIjvsN2jxKBSb/U8cIe9yk3XF
=l5vE
-----END PGP SIGNATURE-----

--v9Ux+11Zm5mwPlX6--
