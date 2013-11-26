Return-Path: <joe@deserted.net>
Received: from mail-qa0-f50.google.com (mail-qa0-f50.google.com
	[209.85.216.50])
	by mail.openembedded.org (Postfix) with ESMTP id D92756BCA5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2013 16:24:15 +0000 (UTC)
Received: by mail-qa0-f50.google.com with SMTP id i13so8248493qae.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2013 08:24:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=T4t/cZP6GOmUDXViVw0VtRV1LPcpz5+dmAtNhubZxIM=;
	b=bnAI2ufgXFLpfvsh9dxJFDNQfNKBoUCsydNMyIX+6Cjc8wBznOxH03fFUcNA50LIC3
	webO8GIBN4CTAWKtQaSBCMVqkcm/NFx6VkxeytVgYo+emJ16Upx/1GTF7jB5oJKMdRQ6
	MUZ4OCZkAZkVZ93RfxEVaz16TwXZ9fhqHpj8J3/FCLKpYVWvqo6Wl69NCYyBUeAgfr9B
	NTwIZczakaa7Z1JGHMpEku/Q4YsHqhT9VnevZNkw6cEV5OvKUXUcKU9XTHPIEVioC9uk
	GjEsTlKcVF23v4vVcmigqm1uPeiEN00+uNF6v8set9Wqk4RcUavEBSaCw0/z/SBxcfeV
	4L8g==
X-Gm-Message-State: ALoCoQlC52RSOSAjWKRrZ59svhUfKmyOB0ioptAH96joYr44WQ7XEvicFQv8XAGpSL2bvyBiyKc/
X-Received: by 10.49.131.69 with SMTP id ok5mr34069106qeb.77.1385483055499;
	Tue, 26 Nov 2013 08:24:15 -0800 (PST)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id b4sm21729369qai.7.2013.11.26.08.24.13
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 26 Nov 2013 08:24:14 -0800 (PST)
Date: Tue, 26 Nov 2013 11:24:12 -0500
From: Joe MacDonald <joe@deserted.net>
To: Xufeng Zhang <xufeng.zhang@windriver.com>
Message-ID: <20131126162410.GD3939@deserted.net>
References: <1384844550-18276-1-git-send-email-xufeng.zhang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1384844550-18276-1-git-send-email-xufeng.zhang@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH meta-networking] quagga: Avoid duplicate connected address adding to the list
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
X-List-Received-Date: Tue, 26 Nov 2013 16:24:16 -0000
X-Groupsio-MsgNum: 47270
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="q9KOos5vDmpwPx9o"
Content-Disposition: inline

--q9KOos5vDmpwPx9o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [OE][PATCH meta-networking] quagga: Avoid duplicate connected address=
 adding to the list] On 13.11.19 (Tue 15:02) Xufeng Zhang wrote:

> commit 27ba970b9("quagga/ripd: Fix two bugs after received SIGHUP signal")
> introduces an regression: ifp->connected list is cleaned up when ripd is
> restarting, however, for interface addresses which are not specified in
> ripd configuration file, they are never to be added into ifp->connected
> again, this will lead to some abnormal behavior for route advertising.
>=20
> Instead of cleaning up the ifp->connected list to avoid duplicated
> connected address being added into this list, we can check this
> condition during interface address adding process and return early
> when an identical address has already been added.
>=20
> Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
> ---
>  .../quagga-Avoid-duplicate-connected-address.patch |   53 ++++++++++++++=
++++++
>  .../recipes-protocols/quagga/quagga.inc            |    3 +-
>  2 files changed, 55 insertions(+), 1 deletions(-)
>  create mode 100644 meta-networking/recipes-protocols/quagga/files/quagga=
-Avoid-duplicate-connected-address.patch
>=20
> diff --git a/meta-networking/recipes-protocols/quagga/files/quagga-Avoid-=
duplicate-connected-address.patch b/meta-networking/recipes-protocols/quagg=
a/files/quagga-Avoid-duplicate-connected-address.patch
> new file mode 100644
> index 0000000..585dc29
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/quagga/files/quagga-Avoid-duplica=
te-connected-address.patch
> @@ -0,0 +1,53 @@
> +quagga: Avoid duplicate connected address adding to the list
> +
> +commit 27ba970b9("quagga/ripd: Fix two bugs after received SIGHUP signal=
")
> +introduces an regression: ifp->connected list is cleaned up when ripd is
> +restarting, however, for interface addresses which are not specified in
> +ripd configuration file, they are never to be added into ifp->connected
> +again, this will lead to some abnormal behavior for route advertising.
> +
> +Instead of cleaning up the ifp->connected list to avoid duplicated
> +connected address being added into this list, we can check this
> +condition during interface address adding process and return early
> +when an identical address has already been added.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Hu Yadi <Yadi.hu@windriver.com>
> +Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
> +---
> +--- a/lib/if.c
> ++++ b/lib/if.c
> +@@ -738,6 +738,16 @@
> +                          struct prefix *destination)
> + {
> +   struct connected *ifc;
> ++  struct listnode *cnode;
> ++  struct connected *c;
> ++  int ret =3D 0;
> ++
> ++  for (ALL_LIST_ELEMENTS_RO (ifp->connected, cnode, c))
> ++    {
> ++      ret =3D connected_same_prefix (p, (c->address));
> ++      if(ret =3D=3D 1)
> ++        return NULL;
> ++    }
> +=20
> +   /* Allocate new connected address. */
> +   ifc =3D connected_new ();
> +--- a/ripd/rip_interface.c
> ++++ b/ripd/rip_interface.c
> +@@ -516,13 +516,6 @@
> + 	  thread_cancel (ri->t_wakeup);
> + 	  ri->t_wakeup =3D NULL;
> + 	}
> +-     =20
> +-      for (conn_node =3D listhead (ifp->connected); conn_node; conn_nod=
e =3D next)
> +-	{
> +-	  ifc =3D listgetdata (conn_node);
> +-	  next =3D conn_node->next;
> +-	  listnode_delete (ifp->connected, ifc);
> +-	}
> +     }
> + }
> +=20
> diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-n=
etworking/recipes-protocols/quagga/quagga.inc
> index 2106c9b..21c2028 100644
> --- a/meta-networking/recipes-protocols/quagga/quagga.inc
> +++ b/meta-networking/recipes-protocols/quagga/quagga.inc
> @@ -32,7 +32,8 @@ SRC_URI =3D "http://download.savannah.gnu.org/releases/=
quagga${QUAGGASUBDIR}/quagg
>             file://watchquagga.init \
>             file://watchquagga.default \
>             file://volatiles.03_quagga \
> -           file://ripd-fix-two-bugs-after-received-SIGHUP.patch"
> +           file://ripd-fix-two-bugs-after-received-SIGHUP.patch \
> +           file://quagga-Avoid-duplicate-connected-address.patch"
> =20
>  PACKAGECONFIG ??=3D ""
>  PACKAGECONFIG[cap] =3D "--enable-capabilities,--disable-capabilities,lib=
cap"
--=20
-Joe MacDonald.
:wq

--q9KOos5vDmpwPx9o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlKUyyoACgkQwFvcllog0XwywACfa9IlmL5plFQac7fk5OlhIdis
EKoAn3MXJrTQ+ik+snp7syDQUp0Hijwn
=62H+
-----END PGP SIGNATURE-----

--q9KOos5vDmpwPx9o--
