Received: from mail-da0-f52.google.com ([209.85.210.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tupib-00085o-EE
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Jan 2013 20:29:23 +0100
Received: by mail-da0-f52.google.com with SMTP id f10so1935855dak.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jan 2013 11:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=M/RoNWyFlJvY5NYt+NcrncK+FVdfbPEnvRlQTQyqoVI=;
	b=I+zmGmczJIdGelwZlZpnzjCYrg71w7oF1Ip7LbkkM8rcsQMt7KVWkpYPs6l0oecLvK
	45iSyaGoZ7CYsuJ/y1ainbHtT2F/7ZYNevfc5dduNafWaQV2XQxyDRP48TfGOmGSmVIq
	GAPvcsSMlp9cs4KFq9RL0LUFOVl5a6e/d4p1wJFO98nglwl4woJpp453HdEyjvHnddhP
	/GnlVa13YkeupPzfbtrHEVkZEnLEK2RAasAZ3ioHysD38HiAC12aeJS8DIQ3HSkZqgD+
	PH4bk1MNJPKJDDX7mmMpxQF6Hmn4T84sMd3A87ckW//pqAXtBMs09KC9dhOWL6dS9Dw9
	Tzwg==
X-Received: by 10.69.1.65 with SMTP id be1mr216236728pbd.66.1358190833261;
	Mon, 14 Jan 2013 11:13:53 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id na7sm8657120pbc.48.2013.01.14.11.13.50
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 14 Jan 2013 11:13:52 -0800 (PST)
Date: Mon, 14 Jan 2013 20:13:50 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130114191350.GG2992@jama>
References: <1358188976-14581-1-git-send-email-andrei.gherzan@windriver.com>
	<1358188976-14581-4-git-send-email-andrei.gherzan@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1358188976-14581-4-git-send-email-andrei.gherzan@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: Re: [meta-oe][meta-systemd][PATCH 4/4] xorg-xserver: Add systemd service
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
X-List-Received-Date: Mon, 14 Jan 2013 19:29:27 -0000
X-Groupsio-MsgNum: 42695
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jt0yj30bxbg11sci"
Content-Disposition: inline

--jt0yj30bxbg11sci
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 14, 2013 at 08:42:56PM +0200, Andrei Gherzan wrote:
> Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>

meta-openembedded/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init
isn't enough? why?

Cheers,

> ---
>  .../xorg-xserver/xserver-xorg/X.service            |   10 ++++++++++
>  .../xorg-xserver/xserver-xorg_1.13.1.bbappend      |   10 ++++++++++
>  2 files changed, 20 insertions(+), 0 deletions(-)
>  create mode 100755 meta-systemd/meta-oe/recipes-graphics/xorg-xserver/xs=
erver-xorg/X.service
>  create mode 100644 meta-systemd/meta-oe/recipes-graphics/xorg-xserver/xs=
erver-xorg_1.13.1.bbappend
>=20
> diff --git a/meta-systemd/meta-oe/recipes-graphics/xorg-xserver/xserver-x=
org/X.service b/meta-systemd/meta-oe/recipes-graphics/xorg-xserver/xserver-=
xorg/X.service
> new file mode 100755
> index 0000000..7e900ff
> --- /dev/null
> +++ b/meta-systemd/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg/X.s=
ervice
> @@ -0,0 +1,10 @@
> +[Unit]
> +Description=3DX Server
> +
> +[Service]
> +Type=3Dsimple
> +ExecStartPre=3D-/bin/rm -rf /var/log/Xorg*
> +ExecStart=3D/usr/bin/X
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git a/meta-systemd/meta-oe/recipes-graphics/xorg-xserver/xserver-x=
org_1.13.1.bbappend b/meta-systemd/meta-oe/recipes-graphics/xorg-xserver/xs=
erver-xorg_1.13.1.bbappend
> new file mode 100644
> index 0000000..a3eb98c
> --- /dev/null
> +++ b/meta-systemd/meta-oe/recipes-graphics/xorg-xserver/xserver-xorg_1.1=
3.1.bbappend
> @@ -0,0 +1,10 @@
> +FILESEXTRAPATHS :=3D "${THISDIR}/${PN}"
> +
> +PRINC :=3D "${@int(PRINC) + 1}"
> +
> +inherit systemd
> +
> +SRC_URI_append =3D " file://X.service "
> +
> +SYSTEMD_PACKAGES =3D "${PN}-systemd"
> +SYSTEMD_SERVICE =3D "X.service"
> --=20
> 1.7.5.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jt0yj30bxbg11sci
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlD0WO4ACgkQN1Ujt2V2gBzEewCbBynnOww8GtnA1YJmYlWzjJ+J
VQwAnjryAwv0rbCpJ/9drNsAV0mxerGr
=nUq7
-----END PGP SIGNATURE-----

--jt0yj30bxbg11sci--
