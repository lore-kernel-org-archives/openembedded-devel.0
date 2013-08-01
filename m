Return-Path: <Joe.MacDonald@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D4FAF61883
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Aug 2013 12:51:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r71Cpva2011910
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 1 Aug 2013 05:51:57 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Thu, 1 Aug 2013 05:51:56 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id CBF817FE4	for
	<openembedded-devel@lists.openembedded.org>;
	Thu,  1 Aug 2013 08:51:37 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id C020A4051E; Thu,
	1 Aug 2013 08:51:54 -0400 (EDT)
Date: Thu, 1 Aug 2013 08:51:54 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130801125154.GC3673@windriver.com>
References: <1375340966-597-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1375340966-597-1-git-send-email-Martin.Jansa@gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH] ntp: allow to run pkg_postinst_ntpdate in do_rootfs
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
X-List-Received-Date: Thu, 01 Aug 2013 12:51:56 -0000
X-Groupsio-MsgNum: 45545
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0vzXIDBeUiKkjNJl"
Content-Disposition: inline

--0vzXIDBeUiKkjNJl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Herged.  Thanks.
-J.

[[oe] [meta-networking][PATCH] ntp: allow to run pkg_postinst_ntpdate in do=
_rootfs] On 13.08.01 (Thu 09:09) Martin Jansa wrote:

> * read-only rootfs cannot run postinsts on first boot and in this case
>   it doesn't really have to as we can create cron task in do_rootfs
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-networking/recipes-support/ntp/ntp.inc | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>=20
> diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networkin=
g/recipes-support/ntp/ntp.inc
> index 9367d41..6e8b452 100644
> --- a/meta-networking/recipes-support/ntp/ntp.inc
> +++ b/meta-networking/recipes-support/ntp/ntp.inc
> @@ -114,14 +114,10 @@ INITSCRIPT_NAME =3D "ntpd"
>  INITSCRIPT_PARAMS =3D "defaults"
> =20
>  pkg_postinst_ntpdate() {
> -if test "x$D" !=3D "x"; then
> -    exit 1
> -else
> -    if ! grep -q -s ntpdate /var/spool/cron/root; then
> +    if ! grep -q -s ntpdate $D/var/spool/cron/root; then
>          echo "adding crontab"
> -        test -d /var/spool/cron || mkdir -p /var/spool/cron
> -        echo "30 * * * *    ${bindir}/ntpdate-sync silent" >> /var/spool=
/cron/root
> +        test -d $D/var/spool/cron || mkdir -p $D/var/spool/cron
> +        echo "30 * * * *    ${bindir}/ntpdate-sync silent" >> $D/var/spo=
ol/cron/root
>      fi
> -fi
>  }
> =20
--=20
-Joe MacDonald.
:wq

--0vzXIDBeUiKkjNJl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlH6WeoACgkQPN8S4W6ZZndvwACfUfET8txSozRcdjxJWgCmIbCB
frkAnR2zDz8AXiqM+TeeEoV14bwzqfVh
=INnX
-----END PGP SIGNATURE-----

--0vzXIDBeUiKkjNJl--
