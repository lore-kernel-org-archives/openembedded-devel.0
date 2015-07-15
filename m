Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 3FD79734B8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jul 2015 14:36:49 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1ZFNnl-0006hf-8Q from Joe_MacDonald@mentor.com ;
	Wed, 15 Jul 2015 07:36:49 -0700
Received: from burninator (147.34.91.1) by SVR-ORW-FEM-06.mgc.mentorg.com
	(147.34.97.120) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 15 Jul 2015 07:36:48 -0700
Received: by burninator (Postfix, from userid 1000)	id 54BA6582D36; Wed, 15
	Jul 2015 10:36:27 -0400 (EDT)
Date: Wed, 15 Jul 2015 10:36:27 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <rongqing.li@windriver.com>
Message-ID: <20150715143626.GB29923@mentor.com>
References: <1436172967-1489-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1436172967-1489-1-git-send-email-rongqing.li@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][meta-networking] inetutils: fix tcpd path of rlogin rsh and rexec
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
X-List-Received-Date: Wed, 15 Jul 2015 14:36:51 -0000
X-Groupsio-MsgNum: 56249
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="W/nzBZO5zC0uMSeA"
Content-Disposition: inline

--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [PATCH][meta-networking] inetutils: fix tcpd path of rlogin rsh and r=
exec] On 15.07.06 (Mon 16:56) rongqing.li@windriver.com wrote:

> From: Jian Liu <jian.liu@windriver.com>
>=20
> rlogin, rsh and rexec xinet.d script, a wrong path is
> being referenced under the server section.

This seems like a sensible update, but rather than just shifting this
around, can you update this patch to do something a bit more robust?
I'm thinking along the lines of what the other servers do (and what's
being done everywhere for systemd now):

 73 do_install () {
 [...]
 95     sed -e 's,@BASE_SBINDIR@,${base_sbindir},g' \
 96         -e 's,@SYSCONFDIR@,${sysconfdir},g' \
 97         -e 's,@SBINDIR@,${sbindir},g' \
 98         -i ${D}${systemd_unitdir}/system/*.service

(source: meta-networking/recipes-daemons/proftpd/proftpd_1.3.5a.bb, etc.)

So sed in the proper values of $(sbindir) (since that's where tcpd is
installed by the tcp-wrappers recipe) after installing a template xinetd
file.

-J.

>=20
> server =3D /usr/bin/tcpd
> instead of
> server =3D /usr/sbin/tcpd
>=20
> tcpd is provided by tcp-wrappers
>=20
> Written-by: Herve.Patriarche <herve.patriarche@windriver.com>
> Signed-off-by: Jian Liu <jian.liu@windriver.com>
> ---
>  .../inetutils/inetutils-1.9.2/rexec.xinetd.inetutils                    =
| 2 +-
>  .../inetutils/inetutils-1.9.2/rlogin.xinetd.inetutils                   =
| 2 +-
>  .../recipes-connectivity/inetutils/inetutils-1.9.2/rsh.xinetd.inetutils =
| 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9=
=2E2/rexec.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutil=
s/inetutils-1.9.2/rexec.xinetd.inetutils
> index 80aed36..7354360 100644
> --- a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rexe=
c.xinetd.inetutils
> +++ b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rexe=
c.xinetd.inetutils
> @@ -14,7 +14,7 @@ service exec
>  	group		=3D root
>  	log_on_success	+=3D USERID
>  	log_on_failure	+=3D USERID
> -	server		=3D /usr/bin/tcpd
> +	server		=3D /usr/sbin/tcpd
>  	server_args	=3D /usr/sbin/in.rexecd
>  	disable		=3D yes
>  }
> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9=
=2E2/rlogin.xinetd.inetutils b/meta-networking/recipes-connectivity/inetuti=
ls/inetutils-1.9.2/rlogin.xinetd.inetutils
> index 00dbf93..70493e6 100644
> --- a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rlog=
in.xinetd.inetutils
> +++ b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rlog=
in.xinetd.inetutils
> @@ -14,7 +14,7 @@ service login
>  	group		=3D root
>  	log_on_success	+=3D USERID
>  	log_on_failure	+=3D USERID
> -	server		=3D /usr/bin/tcpd
> +	server		=3D /usr/sbin/tcpd
>  	server_args	=3D /usr/sbin/in.rlogind -a
>  	disable		=3D yes
>  }
> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9=
=2E2/rsh.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutils/=
inetutils-1.9.2/rsh.xinetd.inetutils
> index ad59b62..a842eb9 100644
> --- a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rsh.=
xinetd.inetutils
> +++ b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rsh.=
xinetd.inetutils
> @@ -15,7 +15,7 @@ service shell
>  	group		=3D root
>  	log_on_success	+=3D USERID
>  	log_on_failure	+=3D USERID
> -	server		=3D /usr/bin/tcpd
> +	server		=3D /usr/sbin/tcpd
>  	server_args	=3D /usr/sbin/in.rshd -aL
>  	disable		=3D yes
>  }
--=20
-Joe MacDonald.
:wq

--W/nzBZO5zC0uMSeA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJVpm/nAAoJEEn8ffcsOfaWPGAH/22CmXDlAsABSNh6T9xUgpDk
YxW880wfR+X6pWfIz7myOWpcHMveba0ZxRsSbIDjNuBZyzZjySkoPpaSVTd64xaw
kHcjb2vLggXV2xlqlpArKqIQJUWDxG4Ll8LHuCJ3uqBRbIOmsOIn6YpuTsPrCJ2Y
6VldbI8zTS+QvmXy6CgR6qR0MlThvICgSKqIArxAQxhhqL5UQBs0G4N/JBxOebK9
JjGQ7ff+60Y3t4qa0dKVup3V7mQQvp4C3mDiqMsVtKX9nYgck4f+TQ/amEcpLvmi
XtEpGB2C12s4nDPEGXT6CRRjZqgT9ikkPeaRHpHZWk5gSEf23P/YVEiYz1nZHLE=
=tf7u
-----END PGP SIGNATURE-----

--W/nzBZO5zC0uMSeA--
