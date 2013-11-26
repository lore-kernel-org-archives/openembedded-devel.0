Return-Path: <joe@deserted.net>
Received: from mail-qe0-f44.google.com (mail-qe0-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 110F76BCA5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2013 16:23:28 +0000 (UTC)
Received: by mail-qe0-f44.google.com with SMTP id nd7so5390339qeb.31
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2013 08:23:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=a8GhEH199IPq4NBum5RSwewyqrnDLMw6u4vMGAzceT0=;
	b=Whc19wnVnZqn8xLI9TOxNUyKWZZPtZVBxYGUTxgVMfaMfYaR/8H63MDqP3G6Cm0rNt
	rXOedT8rPluhrhQmchK+mFOIruXphQTa/oR7RS1+v8iqB5J4AAEv13GeUDlk6n6o5edV
	6GrPx+Kx5JWrYV79oMrCwaeqMKlf1UONeooVGabDRtFik5Dij30QDPvph9NJ9pICTQfS
	LRN0mJua38eu3ag59r1PW9ofN8ZNTQuC3oZr/eq6sZXUJV82ITNz2FToNY8f71sxp5uY
	ygvGtLOJGLdRHQN1WcXhyXUYLDec0iEGEFPMwzEn7IcyRiR+O1LlzjfbDADXsTqaUH7+
	Hynw==
X-Gm-Message-State: ALoCoQnXlZlk4V0rxJCBgwoU8WoMBZANni0npBQJ0ek8PZydfy9R0wC9Rz3QX35tfVlz3UhPDYQ7
X-Received: by 10.229.194.1 with SMTP id dw1mr16507836qcb.20.1385483007938;
	Tue, 26 Nov 2013 08:23:27 -0800 (PST)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id j4sm12838668qan.4.2013.11.26.08.23.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 26 Nov 2013 08:23:26 -0800 (PST)
Date: Tue, 26 Nov 2013 11:23:23 -0500
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131126162321.GB3939@deserted.net>
References: <cover.1383884700.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <cover.1383884700.git.hongxu.jia@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 0/1] quagga: add pam support for vtysh
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
X-List-Received-Date: Tue, 26 Nov 2013 16:23:30 -0000
X-Groupsio-MsgNum: 47268
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TakKZr9L6Hm6aLOc"
Content-Disposition: inline

--TakKZr9L6Hm6aLOc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The latest (and slightly tweaked to resolve a trivial conflict) version
merged.  Thanks.
-J.

[[oe] [PATCH 0/1] quagga: add pam support for vtysh] On 13.11.08 (Fri 12:32=
) Hongxu Jia wrote:

> Test Case:
> 1. Add DISTRO_FEATURES +=3D 'pam' to local.conf and build image with
>    quagga.
>=20
> 2. On target:
> 1) cat /etc/pam.d/guagga
> #
> # The PAM configuration file for the quagga `vtysh' service
> #
>=20
> # This allows root to change user infomation without being
> # prompted for a password
> auth		sufficient	pam_rootok.so
>=20
> # The standard Unix authentication modules, used with
> # NIS (man nsswitch) as well as normal /etc/passwd and
> # /etc/shadow entries.
> auth       include      common-auth
>=20
> 2) add option debug to pam_rootok.so
>  auth	    sufficient	pam_rootok.so debug
>=20
> 3) pam_rootok.so
> run command vtysh as root, enter qemu0#:
> root@qemu0:~# vtysh=20
>=20
> Hello, this is Quagga (version 0.99.21).
> Copyright 1996-2005 Kunihiro Ishiguro, et al.
>=20
> qemu0#=20
> log info in /var/log/message(or /var/log/auth.log) shows pam_rootok.so re=
turn success:
> 2013-11-08T03:33:44.898360+00:00 qemu0 vtysh: pam_rootok(quagga:auth): ro=
ot check succeeded
>=20
> 4) pam_unix.so
> the content of common-auth are shown at section "Common configure files"
> comment the configure file quagga pam_rootok.so line, because it will mak=
e pam return success:
>  #auth		sufficient	pam_rootok.so
> and modify the pam_unix.so line in common-auth to remove nullok_secure:
>  auth	[success=3D1 default=3Dignore]	pam_unix.so debug
>=20
> 5) run commands with invalid password:
> root@qemu0:~# vtysh=20
> Password:=20
> root@qemu0:~#=20
> log in /var/log/message(or /var/log/auth.log):
> 2013-11-08T04:20:49.418763+00:00 qemu0 vtysh: pam_unix(quagga:auth): auth=
entication failure; logname=3Droot uid=3D0 euid=3D0 tty=3D ruser=3D rhost=
=3D  user=3Droot
>=20
> //Hongxu
>=20
>=20
> The following changes since commit ffb5434823195cbdc41c76a110eaa6ae04e2b0=
10:
>=20
>   dnsmasq: uprev to 2.6.3 (2013-11-06 15:12:45 -0500)
>=20
> are available in the git repository at:
>=20
>   git://git.pokylinux.org/poky-contrib hongxu/fix-quagga-pam
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dhongxu/fix-quag=
ga-pam
>=20
> Hongxu Jia (1):
>   quagga: add pam support for vtysh
>=20
>  meta-networking/recipes-protocols/quagga/files/quagga.pam | 13 +++++++++=
++++
>  meta-networking/recipes-protocols/quagga/quagga.inc       | 13 +++++++++=
+++-
>  2 files changed, 25 insertions(+), 1 deletion(-)
>  create mode 100644 meta-networking/recipes-protocols/quagga/files/quagga=
=2Epam
>=20
--=20
-Joe MacDonald.
:wq

--TakKZr9L6Hm6aLOc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlKUyvkACgkQwFvcllog0XxjzQCfUUCB/HW8H5qGBFc44lHYg4Xv
6gkAn2wGKcBdlQxXclYD0QUn89NzE8Rh
=h75o
-----END PGP SIGNATURE-----

--TakKZr9L6Hm6aLOc--
