Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 7803077319
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Feb 2016 01:48:48 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1aZU01-0000pA-2o from Joe_MacDonald@mentor.com ;
	Fri, 26 Feb 2016 17:48:49 -0800
Received: from burninator (147.34.91.1) by SVR-ORW-FEM-06.mgc.mentorg.com
	(147.34.97.120) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 26 Feb 2016 17:48:48 -0800
Received: by burninator (Postfix, from userid 1000)	id CA4FB580D05; Fri, 26
	Feb 2016 20:48:47 -0500 (EST)
Date: Fri, 26 Feb 2016 20:48:47 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Zhenbo Gao <zhenbo.gao@windriver.com>
Message-ID: <20160227014847.GC6310@mentor.com>
References: <1453712086-16685-1-git-send-email-zhenbo.gao@windriver.com>
	<1453712086-16685-2-git-send-email-zhenbo.gao@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1453712086-16685-2-git-send-email-zhenbo.gao@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] postfix: permission of /var/spool/mail seems incorrect
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 27 Feb 2016 01:48:48 -0000
X-Groupsio-MsgNum: 60235
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/Uq4LBwYP4y1W6pO"
Content-Disposition: inline

--/Uq4LBwYP4y1W6pO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [PATCH] postfix: permission of /var/spool/mail seems incorrect] On 16=
=2E01.25 (Mon 16:54) Zhenbo Gao wrote:

> See the following output:
> root@qemu0:~# rpm -qlv postfix | grep /var/spool/mail
> drwxr-sr-x 2 postfix nogroup 0 Sep 8 08:46 /var/spool/mail
> The permission of /var/spool/mail "r-s" seems strange as it
> belongs to nogroup, modify it to 0755 as to the normal case.
>=20
> Signed-off-by: Zhenbo Gao <zhenbo.gao@windriver.com>
> ---
>  meta-networking/recipes-daemons/postfix/postfix.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-n=
etworking/recipes-daemons/postfix/postfix.inc
> index dc652d7..378310a 100644
> --- a/meta-networking/recipes-daemons/postfix/postfix.inc
> +++ b/meta-networking/recipes-daemons/postfix/postfix.inc
> @@ -162,7 +162,7 @@ do_install () {
>      install -m 770 -d ${D}${localstatedir}/spool/postfix
>      chown postfix:postfix ${D}${localstatedir}/spool/postfix
> =20
> -    install -m 2755 -d ${D}${localstatedir}/spool/mail
> +    install -m 0755 -d ${D}${localstatedir}/spool/mail

While this may stop errors from happening (and I'm not sure it will)
this doesn't seem like the right thing to do.  Consider, for example:

   http://wiki2.dovecot.org/MailLocation/mbox

You almost certainly want the sgid bit set on /var/*/mail.  If there's
an error here, my guess it that the mode should be 2775 not 2755.  If
you'd like to confirm that, cool, otherwise I'll have a look when I get
a chance.

Thanks,
-J.

>      chown postfix:nogroup ${D}${localstatedir}/spool/mail
>      install -m 0755 -d ${D}${localstatedir}/lib/postfix
>      chown postfix:nogroup ${D}${localstatedir}/lib/postfix
> --=20
> 1.9.1
>=20
--=20
-Joe MacDonald.
:wq

--/Uq4LBwYP4y1W6pO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJW0QB/AAoJEEn8ffcsOfaW0yYIALz0mqwT4/pb2xAwZH5IxiuJ
YkuXyiWmJaWd6EF+75q5A3zU1Dtsv3+7TAzG0NNyBrg64Lgkii7vGdkNiQEdYzHT
ddFd1P1o7jkC9nnmSQaJ5Qyg5wkXTOxZEGSjZTcexPKccl3jhJqfMEMJPXVR0Xzi
2lSRk59yN1I3Kw7AIF9OZl4BK1fPopedrerdnSQYjScLqD/St5nXCAcb8vEIj0Kq
EO9/RXiTw+lj8GkIjGyOFUsFectW1aw19ID0pow3K+LtX4jXAdbxXEjFhrLPYtSW
nWV6OMVebLsdTGmJUxuNk98U+FAlvwycXw+SajZSqPf2GcXM8KtgqusdWYFr4Qs=
=X+3k
-----END PGP SIGNATURE-----

--/Uq4LBwYP4y1W6pO--
