Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T9C3N-0001bc-3T
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 11:37:45 +0200
Received: by bkcik5 with SMTP id ik5so152138bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Sep 2012 02:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=twPK58oYRWVnYwA2r/Qzn/Xl2FuQuxR7/eieSaVrNRA=;
	b=lX8/18BWa36HtctqqTXMTfHx5iu785fjeSjUi0t/Kbh59li6iZgt4lTCs5x8iM+muq
	fXlXrl+iDZJSAlV2tMmrlVwGh1TnQWtTWx7qWWofaTXmRXqBYA0jGOuP++d3FZ0NPp4N
	rWX62joztV66ubeUTVWY6rWdHLtdblZypJAa8+fvPYB9Hmm5u2oQ5neSh5JS+2mI/fil
	z2P8cCWKJPgQpwqmjLDtF/8NP6Mks9Yp8SbOTw1+EaynhLtRgjR7nPhYlc2ZE6kse/qx
	20K70ruFuyQ2qiSPJnx/0rxrTPXdMe4BqngGL3f+Sq4SYIHVoH7qJ+t3XZPxUvEF6o8N
	ON8g==
Received: by 10.204.130.10 with SMTP id q10mr8910447bks.90.1346837122220;
	Wed, 05 Sep 2012 02:25:22 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id he8sm491507bkc.3.2012.09.05.02.25.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Sep 2012 02:25:20 -0700 (PDT)
Date: Wed, 5 Sep 2012 11:25:49 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120905092549.GO3372@jama.jama.net>
References: <1346836952-1804-1-git-send-email-mertsas@cisco.com>
MIME-Version: 1.0
In-Reply-To: <1346836952-1804-1-git-send-email-mertsas@cisco.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] task-x11*: Rename to packagegroup to match oe-core.
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
X-List-Received-Date: Wed, 05 Sep 2012 09:37:45 -0000
X-Groupsio-MsgNum: 40463
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p2pkNiL1PnZBJ6Nr"
Content-Disposition: inline

--p2pkNiL1PnZBJ6Nr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 05, 2012 at 11:22:32AM +0200, Martin Ertsaas wrote:
> ---
>  .../packagegroups/packagegroup-x11-server_1.0.bb   |   23 +++++++++++++++
>  .../packagegroups/packagegroup-x11_1.0.bb          |   30 ++++++++++++++=
++++++
>  meta-oe/recipes-core/tasks/task-x11-server_1.0.bb  |   23 ---------------
>  meta-oe/recipes-core/tasks/task-x11_1.0.bb         |   30 --------------=
------
>  4 files changed, 53 insertions(+), 53 deletions(-)
>  create mode 100644 meta-oe/recipes-core/packagegroups/packagegroup-x11-s=
erver_1.0.bb
>  create mode 100644 meta-oe/recipes-core/packagegroups/packagegroup-x11_1=
=2E0.bb
>  delete mode 100644 meta-oe/recipes-core/tasks/task-x11-server_1.0.bb
>  delete mode 100644 meta-oe/recipes-core/tasks/task-x11_1.0.bb

NACK

see my previous patches (and cover of last pull request).

http://git.openembedded.org/meta-openembedded-contrib/log/?h=3Djansa/packag=
egroup

after
http://patchwork.openembedded.org/patch/35839/
http://patchwork.openembedded.org/patch/35841/
are applied in oe-core

Cheers,

>=20
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-x11-server_1=
=2E0.bb b/meta-oe/recipes-core/packagegroups/packagegroup-x11-server_1.0.bb
> new file mode 100644
> index 0000000..7e43d55
> --- /dev/null
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-x11-server_1.0.bb
> @@ -0,0 +1,23 @@
> +DESCRIPTION =3D "Task for an image with Xserver"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D3f40d799439710928=
5ec7b81fdeb3b58"
> +PR =3D "r9"
> +
> +inherit task
> +
> +# for backwards compatibility
> +RPROVIDES_${PN} +=3D "task-xserver"
> +
> +XSERVER ?=3D "xserver-xorg \
> +           xf86-input-evdev \
> +           xf86-input-mouse \
> +           xf86-video-fbdev \
> +           xf86-input-keyboard \
> +"
> +
> +
> +RDEPENDS_${PN} =3D " \
> +  ${XSERVER} \
> +"
> +
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-x11_1.0.bb b=
/meta-oe/recipes-core/packagegroups/packagegroup-x11_1.0.bb
> new file mode 100644
> index 0000000..326e09f
> --- /dev/null
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-x11_1.0.bb
> @@ -0,0 +1,30 @@
> +DESCRIPTION =3D "The X Window System -- install this task to get a clien=
t/server based display multiplexer."
> +SECTION =3D "x11/server"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbc=
b788c80a0384361b4de20420"
> +PR =3D "r11"
> +
> +inherit task allarch
> +
> +PACKAGES +=3D "${PN}-utils"
> +
> +RRECOMMENDS_${PN} =3D "\
> +  ${PN}-server \
> +  ${PN}-utils \
> +"
> +
> +# xserver-common, x11-common
> +VIRTUAL-RUNTIME_xserver_common ?=3D "xserver-common"
> +
> +# elsa or xserver-nodm-init(-systemd)
> +VIRTUAL-RUNTIME_graphical_init_manager ?=3D "xserver-nodm-init"
> +
> +RDEPENDS_${PN}-utils =3D "\
> +  ${VIRTUAL-RUNTIME_xserver_common} \
> +  ${VIRTUAL-RUNTIME_graphical_init_manager} \
> +  xauth \
> +  xhost \
> +  xset \
> +  xrandr \
> +"
> +
> diff --git a/meta-oe/recipes-core/tasks/task-x11-server_1.0.bb b/meta-oe/=
recipes-core/tasks/task-x11-server_1.0.bb
> deleted file mode 100644
> index 7e43d55..0000000
> --- a/meta-oe/recipes-core/tasks/task-x11-server_1.0.bb
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -DESCRIPTION =3D "Task for an image with Xserver"
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D3f40d799439710928=
5ec7b81fdeb3b58"
> -PR =3D "r9"
> -
> -inherit task
> -
> -# for backwards compatibility
> -RPROVIDES_${PN} +=3D "task-xserver"
> -
> -XSERVER ?=3D "xserver-xorg \
> -           xf86-input-evdev \
> -           xf86-input-mouse \
> -           xf86-video-fbdev \
> -           xf86-input-keyboard \
> -"
> -
> -
> -RDEPENDS_${PN} =3D " \
> -  ${XSERVER} \
> -"
> -
> -PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> diff --git a/meta-oe/recipes-core/tasks/task-x11_1.0.bb b/meta-oe/recipes=
-core/tasks/task-x11_1.0.bb
> deleted file mode 100644
> index 326e09f..0000000
> --- a/meta-oe/recipes-core/tasks/task-x11_1.0.bb
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -DESCRIPTION =3D "The X Window System -- install this task to get a clien=
t/server based display multiplexer."
> -SECTION =3D "x11/server"
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbc=
b788c80a0384361b4de20420"
> -PR =3D "r11"
> -
> -inherit task allarch
> -
> -PACKAGES +=3D "${PN}-utils"
> -
> -RRECOMMENDS_${PN} =3D "\
> -  ${PN}-server \
> -  ${PN}-utils \
> -"
> -
> -# xserver-common, x11-common
> -VIRTUAL-RUNTIME_xserver_common ?=3D "xserver-common"
> -
> -# elsa or xserver-nodm-init(-systemd)
> -VIRTUAL-RUNTIME_graphical_init_manager ?=3D "xserver-nodm-init"
> -
> -RDEPENDS_${PN}-utils =3D "\
> -  ${VIRTUAL-RUNTIME_xserver_common} \
> -  ${VIRTUAL-RUNTIME_graphical_init_manager} \
> -  xauth \
> -  xhost \
> -  xset \
> -  xrandr \
> -"
> -
> --=20
> 1.7.8.6
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--p2pkNiL1PnZBJ6Nr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBHGp0ACgkQN1Ujt2V2gBy0FgCgrfnyWy770fxsjINP9AZOkq1n
CQwAoJ47MxsQ/WaXn/cqPFDo/k4lUYdb
=wC+h
-----END PGP SIGNATURE-----

--p2pkNiL1PnZBJ6Nr--
