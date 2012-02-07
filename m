Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Run89-0005AY-M7
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 16:38:53 +0100
Received: by eekd41 with SMTP id d41so2186005eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 07:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=mAFw0G1i1cb4LnPfSiMi1xNUv23YOYxp0M/d8SRaQrg=;
	b=TVJlsEqABk7LomIOF//qAGqE+P8W4Of8cpezK0LiGFunVxsg2EfbLT2yrinfjJ/rMi
	mng6ZkY/LzWJQtTFIiVHRabrRanzu9F9BamDF+99CNsxgGaraX4AG/9YsjZIyMoQ3sxO
	J05t4N2otH5C16faZS45l5kVa0gN+RBnTpIZE=
Received: by 10.14.50.206 with SMTP id z54mr7069544eeb.127.1328628651591;
	Tue, 07 Feb 2012 07:30:51 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id v51sm11117423eef.2.2012.02.07.07.30.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 07:30:50 -0800 (PST)
Date: Tue, 7 Feb 2012 16:30:48 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120207153048.GB3893@jama.jama.net>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
	<1328627573-5217-28-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1328627573-5217-28-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][RFC 27/27] task-x11: replace systemd specific packets by common ones
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
X-List-Received-Date: Tue, 07 Feb 2012 15:38:53 -0000
X-Groupsio-MsgNum: 36969
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uQr8t48UFsdbeI+V"
Content-Disposition: inline

--uQr8t48UFsdbeI+V
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 07, 2012 at 04:12:53PM +0100, Andreas M=FCller wrote:
>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  meta-oe/recipes-core/tasks/task-x11_1.0.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-core/tasks/task-x11_1.0.bb b/meta-oe/recipes=
-core/tasks/task-x11_1.0.bb
> index 681e4f3..9cc747f 100644
> --- a/meta-oe/recipes-core/tasks/task-x11_1.0.bb
> +++ b/meta-oe/recipes-core/tasks/task-x11_1.0.bb
> @@ -16,8 +16,8 @@ RRECOMMENDS_${PN} =3D "\
>  # xserver-common, x11-common
>  VIRTUAL-RUNTIME_xserver_common ?=3D "xserver-common"
> =20
> -# elsa, xserver-nodm-init or xserver-nodm-init-systemd
> -VIRTUAL-RUNTIME_graphical_init_manager ?=3D "xserver-nodm-init-systemd"
> +# elsa, xserver-nodm-init
> +VIRTUAL-RUNTIME_graphical_init_manager ?=3D "xserver-nodm-init"

Shouldn't this be
${@base_conditional('INIT_MANAGER', 'systemd', 'xserver-nodm-init-systemd',=
 'xserver-nodm-init')}
?

Or did I overlook where xserver-nodm-init-systemd is pulled to image?


Cheers,

>  RDEPENDS_${PN}-utils =3D "\
>    ${VIRTUAL-RUNTIME_xserver_common} \
> --=20
> 1.7.6.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--uQr8t48UFsdbeI+V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8xQ6gACgkQN1Ujt2V2gByGWwCfYdGkIUf7b9/ptbNV40LUs05c
J5cAoK2uIZxO11LcFWzpAKLiOV6JtVam
=AGCn
-----END PGP SIGNATURE-----

--uQr8t48UFsdbeI+V--
