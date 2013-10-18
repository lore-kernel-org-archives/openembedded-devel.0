Return-Path: <joe@deserted.net>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2D19D6BA14
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 16:30:35 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id w62so4007947wes.35
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 09:30:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=MxmDSyby9HxZd18+12led91ROtZK2HKknurEc0UaLvE=;
	b=OW2c2r8W5rd6xrM7Y+asvvElvsoTdlWk9ci851pwlTlLbDZtxvM6HqPlIAR36r9p4t
	6uQ/4yzvHOl3TYIj4XGuJXguJV2FO5dbwKg0WN5BVx18x4Lwvpsho6EfhGMOhn4kiqYk
	zNY3pYGT3jSoQFkpGgG5IJ2WEDsb4unobhmaD87qQeSr8bVCums+Y1vOGQ+VszmM0gXk
	DzNAkPT/rZz24XroLw6REv3dRGpEu5qpVTLtIJunFYoGQFannUQl77Dxnno7Qz2uLT5P
	jZW5Ngn4XxTkFqooTjTalDGKnNbtmJ/ykd9LpARB4c0CksbjDyrtPLKai1WfLXtWnMBr
	Qskg==
X-Gm-Message-State: ALoCoQmnOjJF4DZ7RIleBXYB2/n+BYwqlpTznOIbO0SQdTznGWNlMG+75179Xm5ocQfZY2Q1ngId
X-Received: by 10.180.221.38 with SMTP id qb6mr193641wic.8.1382113836505;
	Fri, 18 Oct 2013 09:30:36 -0700 (PDT)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id ey4sm4956638wic.11.2013.10.18.09.30.34
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 18 Oct 2013 09:30:35 -0700 (PDT)
Date: Fri, 18 Oct 2013 12:30:31 -0400
From: Joe MacDonald <joe@deserted.net>
To: rongqing.li@windriver.com
Message-ID: <20131018163029.GB2456@deserted.net>
References: <1381394085-7681-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1381394085-7681-1-git-send-email-rongqing.li@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2 meta-networking] vsftpd: use quotes to wrap variable
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
X-List-Received-Date: Fri, 18 Oct 2013 16:30:35 -0000
X-Groupsio-MsgNum: 46809
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XOIedfhf+7KOe/yw"
Content-Disposition: inline

--XOIedfhf+7KOe/yw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [PATCH 1/2 meta-networking] vsftpd: use quotes to wrap variable] On 1=
3.10.10 (Thu 16:34) rongqing.li@windriver.com wrote:

> From: Roy Li <rongqing.li@windriver.com>
>=20
> "test -z ${PAMLIB}" in do_install() may report error if ${PAMLIB}
> has space chars. This commit added double quotes to wrap it in
> case of errors.
>=20
> Signed-off-by: Qiang Chen <qiang.chen@windriver.com>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb b/met=
a-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
> index 2c3e009..7677477 100644
> --- a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
> +++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
> @@ -60,7 +60,7 @@ do_install() {
> =20
>      install -m 600 ${WORKDIR}/vsftpd.ftpusers ${D}${sysconfdir}/
>      install -m 600 ${WORKDIR}/vsftpd.user_list ${D}${sysconfdir}/
> -    if ! test -z ${PAMLIB} ; then
> +    if ! test -z "${PAMLIB}" ; then
>          install -d ${D}${sysconfdir}/pam.d/
>          cp ${S}/RedHat/vsftpd.pam ${D}${sysconfdir}/pam.d/vsftpd
>          sed -i "s:/lib/security:${base_libdir}/security:" ${D}${sysconfd=
ir}/pam.d/vsftpd
--=20
-Joe MacDonald.
:wq

--XOIedfhf+7KOe/yw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlJhYiUACgkQwFvcllog0XzoUACffyFi6QUA8eCViURsgrJ4+YFk
s2wAoKP4QXzoKvmXfdz4eabKyJQhg7GF
=nEzR
-----END PGP SIGNATURE-----

--XOIedfhf+7KOe/yw--
