Return-Path: <joe@deserted.net>
Received: from mail-qe0-f52.google.com (mail-qe0-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6A1286DD55
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2013 14:51:06 +0000 (UTC)
Received: by mail-qe0-f52.google.com with SMTP id ne12so5792459qeb.39
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2013 06:51:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=81ehxq9Hl1zuaEKfOuZ5VaWu6kihHQMTQ3F04YsQf9c=;
	b=C4RclSy4typ6rWYRSQw/u1mbuPHSGNfV9MopU5HyYZjTYtdqDHdYsqvJ8cqCRD6I/i
	hY931muX9gTSmwPAsyHudiYtiqKYRrvDFLmIAMKoob+ANFunmVuJ7AOydJ71wAQKhnv8
	UTqEWk8WlGcv6wy6gyYrGP6s88eL7pCsXeW92CA4kMN99PoTdim7q9UeBicCV3Xld/Gz
	cHbUN8NCJZ+2Yi2UW9JiHrsthICB7Ss9SgWgFzDyZSJ+1Pz6HEANZOITlF8brv1Bum3u
	7j0LLgxDr6rYShO5Y/Zzv+8pzC4h7rROJF2ZR7P4GJTnxAp67MY+xXBU3mBD8AVuLmW+
	ByXQ==
X-Gm-Message-State: ALoCoQnTwg0Y6Z2Mhp7G9mOxbEUlptwl6BSfDpnI8V/bVzPaKlLe6OAzcD92OTo50eiYswb/Hu+g
X-Received: by 10.224.69.132 with SMTP id z4mr55996997qai.78.1385477465502;
	Tue, 26 Nov 2013 06:51:05 -0800 (PST)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id x10sm47945809qas.5.2013.11.26.06.51.03
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 26 Nov 2013 06:51:04 -0800 (PST)
Date: Tue, 26 Nov 2013 09:51:01 -0500
From: Joe MacDonald <joe@deserted.net>
To: Xufeng Zhang <xufeng.zhang@windriver.com>
Message-ID: <20131126145058.GA3939@deserted.net>
References: <1384844550-18276-1-git-send-email-xufeng.zhang@windriver.com>
	<528B0D8A.2090101@windriver.com>
MIME-Version: 1.0
In-Reply-To: <528B0D8A.2090101@windriver.com>
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
X-List-Received-Date: Tue, 26 Nov 2013 14:51:06 -0000
X-Groupsio-MsgNum: 47267
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="d6Gm4EdcadzBjdND"
Content-Disposition: inline

--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [OE][PATCH meta-networking] quagga: Avoid duplicate connected add=
ress adding to the list] On 13.11.19 (Tue 15:04) Xufeng Zhang wrote:

> Hi Joe,
>=20
> After this fix, we can do nothing to other daemons.

Nice.  Thanks for following up on this, Xufeng.  Do you think it is
reasonable to remove ripd-fix-two-bugs-after-received-SIGHUP.patch, or
is it still required for ripd?

-J.

>=20
>=20
> Thanks,
> Xufeng
>=20
> On 11/19/2013 03:02 PM, Xufeng Zhang wrote:
> >commit 27ba970b9("quagga/ripd: Fix two bugs after received SIGHUP signal=
")
> >introduces an regression: ifp->connected list is cleaned up when ripd is
> >restarting, however, for interface addresses which are not specified in
> >ripd configuration file, they are never to be added into ifp->connected
> >again, this will lead to some abnormal behavior for route advertising.
> >
> >Instead of cleaning up the ifp->connected list to avoid duplicated
> >connected address being added into this list, we can check this
> >condition during interface address adding process and return early
> >when an identical address has already been added.
> >
> >Signed-off-by: Xufeng Zhang<xufeng.zhang@windriver.com>
> >---
> >  .../quagga-Avoid-duplicate-connected-address.patch |   53 ++++++++++++=
++++++++
> >  .../recipes-protocols/quagga/quagga.inc            |    3 +-
> >  2 files changed, 55 insertions(+), 1 deletions(-)
> >  create mode 100644 meta-networking/recipes-protocols/quagga/files/quag=
ga-Avoid-duplicate-connected-address.patch
> >
> >diff --git a/meta-networking/recipes-protocols/quagga/files/quagga-Avoid=
-duplicate-connected-address.patch b/meta-networking/recipes-protocols/quag=
ga/files/quagga-Avoid-duplicate-connected-address.patch
> >new file mode 100644
> >index 0000000..585dc29
> >--- /dev/null
> >+++ b/meta-networking/recipes-protocols/quagga/files/quagga-Avoid-duplic=
ate-connected-address.patch
> >@@ -0,0 +1,53 @@
> >+quagga: Avoid duplicate connected address adding to the list
> >+
> >+commit 27ba970b9("quagga/ripd: Fix two bugs after received SIGHUP signa=
l")
> >+introduces an regression: ifp->connected list is cleaned up when ripd is
> >+restarting, however, for interface addresses which are not specified in
> >+ripd configuration file, they are never to be added into ifp->connected
> >+again, this will lead to some abnormal behavior for route advertising.
> >+
> >+Instead of cleaning up the ifp->connected list to avoid duplicated
> >+connected address being added into this list, we can check this
> >+condition during interface address adding process and return early
> >+when an identical address has already been added.
> >+
> >+Upstream-Status: Pending
> >+
> >+Signed-off-by: Hu Yadi<Yadi.hu@windriver.com>
> >+Signed-off-by: Xufeng Zhang<xufeng.zhang@windriver.com>
> >+---
> >+--- a/lib/if.c
> >++++ b/lib/if.c
> >+@@ -738,6 +738,16 @@
> >+                          struct prefix *destination)
> >+ {
> >+   struct connected *ifc;
> >++  struct listnode *cnode;
> >++  struct connected *c;
> >++  int ret =3D 0;
> >++
> >++  for (ALL_LIST_ELEMENTS_RO (ifp->connected, cnode, c))
> >++    {
> >++      ret =3D connected_same_prefix (p, (c->address));
> >++      if(ret =3D=3D 1)
> >++        return NULL;
> >++    }
> >+
> >+   /* Allocate new connected address. */
> >+   ifc =3D connected_new ();
> >+--- a/ripd/rip_interface.c
> >++++ b/ripd/rip_interface.c
> >+@@ -516,13 +516,6 @@
> >+ 	  thread_cancel (ri->t_wakeup);
> >+ 	  ri->t_wakeup =3D NULL;
> >+ 	}
> >+-
> >+-      for (conn_node =3D listhead (ifp->connected); conn_node; conn_no=
de =3D next)
> >+-	{
> >+-	  ifc =3D listgetdata (conn_node);
> >+-	  next =3D conn_node->next;
> >+-	  listnode_delete (ifp->connected, ifc);
> >+-	}
> >+     }
> >+ }
> >+
> >diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-=
networking/recipes-protocols/quagga/quagga.inc
> >index 2106c9b..21c2028 100644
> >--- a/meta-networking/recipes-protocols/quagga/quagga.inc
> >+++ b/meta-networking/recipes-protocols/quagga/quagga.inc
> >@@ -32,7 +32,8 @@ SRC_URI =3D "http://download.savannah.gnu.org/releases=
/quagga${QUAGGASUBDIR}/quagg
> >             file://watchquagga.init \
> >             file://watchquagga.default \
> >             file://volatiles.03_quagga \
> >-           file://ripd-fix-two-bugs-after-received-SIGHUP.patch"
> >+           file://ripd-fix-two-bugs-after-received-SIGHUP.patch \
> >+           file://quagga-Avoid-duplicate-connected-address.patch"
> >
> >  PACKAGECONFIG ??=3D ""
> >  PACKAGECONFIG[cap] =3D "--enable-capabilities,--disable-capabilities,l=
ibcap"
>=20

--=20
-Joe MacDonald.
:wq

--d6Gm4EdcadzBjdND
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlKUtUgACgkQwFvcllog0Xw6RgCeLT6KlmoFlXGYFdk8g8wc0DDE
/w4AniU0r84Yck+6T6n0OV0rr6+uNiN+
=mERX
-----END PGP SIGNATURE-----

--d6Gm4EdcadzBjdND--
