Return-Path: <joe@deserted.net>
Received: from mail-qe0-f43.google.com (mail-qe0-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id D686C6D2DD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2013 17:44:08 +0000 (UTC)
Received: by mail-qe0-f43.google.com with SMTP id nc12so1640401qeb.16
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2013 10:44:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=HTAKDLOwqKCPgC1A5SoGnqyqEyek65KJFgD3oZ4dHzI=;
	b=DyTpWeIm+EXIiExmacxZmsptHJyKvC41w54PHVng2Yq5iC6m/x6jXXmzg9pwnaMm9S
	qA/OxvrQFZt1pdsjvKU6t2cHOniKTO8VeaFQw8NHE9xdPuduAU+1KoBVaHpcV4i15niT
	QO1YQNYRXxwAYKJADcmFdvYYo9EBH5ObLmr9npmSP8kpgHjbuaAqigpNA1DXOh9Pvat/
	4xLcygxNHQ9+QT7cvS7M7pXtyOYlcgM44HvJwe1H1Wwil9u/ID0XqjsryTLRNVhzokIm
	QqAvIAhU1kDy78kBnZvSb00FadQjVfyXzdJVUurI5muoaRu8txSVWtShkheZPPHZvGGi
	YPlw==
X-Gm-Message-State: ALoCoQn9kelZP7hp3zJ1bGojpPvcFbawyWXYYomp+GOnfzFyBAHLK64DRM0WQAK3JLGboZBfGv8+
X-Received: by 10.224.151.202 with SMTP id d10mr3828470qaw.115.1382636649972; 
	Thu, 24 Oct 2013 10:44:09 -0700 (PDT)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id n7sm9885637qai.1.2013.10.24.10.44.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 24 Oct 2013 10:44:09 -0700 (PDT)
Date: Thu, 24 Oct 2013 13:44:06 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131024174404.GA3984@deserted.net>
References: <1382608121-6622-1-git-send-email-xufeng.zhang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1382608121-6622-1-git-send-email-xufeng.zhang@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH meta-networking] quagga/ripd: Fix two bugs after received SIGHUP signal
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
X-List-Received-Date: Thu, 24 Oct 2013 17:44:09 -0000
X-Groupsio-MsgNum: 46869
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Content-Disposition: inline

--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [OE] [PATCH meta-networking] quagga/ripd: Fix two bugs after received=
 SIGHUP signal] On 13.10.24 (Thu 17:48) Xufeng Zhang wrote:

> There are two problems for ripd implementation after received
> SIGHUP signal:
> 1). ripd didn't clean up ifp->connected list before reload
>     configuration file which makes the same advertise packet
>     being sent multiple times(depends on how many SIGHUP was recieved).
> 2). ripd reset ri->split_horizon flag to RIP_NO_SPLIT_HORIZON
>     during restart which is different from the flag when ripd is
>     firstly started up, leading to unnecessary route to be advertised.
>=20
> [YOCTO #5266]

Hey Xufeng,

Normally I wouldn't go this deep into the detail but since you
referenced the Yocto bug and the Quagga discussion in the commit log and
the bug itself, I thought I'd try to understand what's going on here.
The last thing I saw from the Quagga maintainer is this:

   The ifp->connected list contains connected prefixes of a given
   interface. These exist regardless of particular routing protocols and
   emptying the list during ripd reconfiguration would be plain wrong. I
   allow for a chance there is a bug that is related to ifp->connected
   and SIGHUP handling at once, but not in this specific way.

and it looks like the patch here is the same as the one that the
maintainer indicated is "plain wrong".  Can you help me get some
confidence that this isn't going to have negative side-effects if we
integrate it?

-J.

>=20
> Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
> ---
>  .../ripd-fix-two-bugs-after-received-SIGHUP.patch  |   49 ++++++++++++++=
++++++
>  .../recipes-protocols/quagga/quagga.inc            |    3 +-
>  2 files changed, 51 insertions(+), 1 deletions(-)
>  create mode 100644 meta-networking/recipes-protocols/quagga/files/ripd-f=
ix-two-bugs-after-received-SIGHUP.patch
>=20
> diff --git a/meta-networking/recipes-protocols/quagga/files/ripd-fix-two-=
bugs-after-received-SIGHUP.patch b/meta-networking/recipes-protocols/quagga=
/files/ripd-fix-two-bugs-after-received-SIGHUP.patch
> new file mode 100644
> index 0000000..c081143
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/quagga/files/ripd-fix-two-bugs-af=
ter-received-SIGHUP.patch
> @@ -0,0 +1,49 @@
> +ripd: Fix two bugs after received SIGHUP signal
> +
> +There are two problems for ripd implementation after received
> +SIGHUP signal:
> +1). ripd didn't clean up ifp->connected list before reload
> +    configuration file.
> +2). ripd reset ri->split_horizon flag to RIP_NO_SPLIT_HORIZON
> +    which lead to the unnecessary route to be advertised.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
> +---
> +--- a/ripd/rip_interface.c
> ++++ b/ripd/rip_interface.c
> +@@ -500,6 +500,8 @@
> +   struct listnode *node;
> +   struct interface *ifp;
> +   struct rip_interface *ri;
> ++  struct connected *ifc;
> ++  struct listnode *conn_node, *next;
> +=20
> +   for (ALL_LIST_ELEMENTS_RO (iflist, node, ifp))
> +     {
> +@@ -514,6 +516,13 @@
> + 	  thread_cancel (ri->t_wakeup);
> + 	  ri->t_wakeup =3D NULL;
> + 	}
> ++
> ++      for (conn_node =3D listhead (ifp->connected); conn_node; conn_nod=
e =3D next)
> ++        {
> ++          ifc =3D listgetdata (conn_node);
> ++          next =3D conn_node->next;
> ++          listnode_delete (ifp->connected, ifc);
> ++        }         =20
> +     }
> + }
> +=20
> +@@ -548,8 +557,8 @@
> + 	  ri->key_chain =3D NULL;
> + 	}
> +=20
> +-      ri->split_horizon =3D RIP_NO_SPLIT_HORIZON;
> +-      ri->split_horizon_default =3D RIP_NO_SPLIT_HORIZON;
> ++      ri->split_horizon =3D RIP_SPLIT_HORIZON;
> ++      ri->split_horizon_default =3D RIP_SPLIT_HORIZON;
> +=20
> +       ri->list[RIP_FILTER_IN] =3D NULL;
> +       ri->list[RIP_FILTER_OUT] =3D NULL;
> diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-n=
etworking/recipes-protocols/quagga/quagga.inc
> index 89b9f7a..bf37067 100644
> --- a/meta-networking/recipes-protocols/quagga/quagga.inc
> +++ b/meta-networking/recipes-protocols/quagga/quagga.inc
> @@ -31,7 +31,8 @@ SRC_URI =3D "http://download.savannah.gnu.org/releases/=
quagga${QUAGGASUBDIR}/quagg
>             file://quagga.default \
>             file://watchquagga.init \
>             file://watchquagga.default \
> -           file://volatiles.03_quagga"
> +           file://volatiles.03_quagga \
> +           file://ripd-fix-two-bugs-after-received-SIGHUP.patch"
> =20
>  PACKAGECONFIG ??=3D ""
>  PACKAGECONFIG[cap] =3D "--enable-capabilities,--disable-capabilities,lib=
cap"
--=20
-Joe MacDonald.
:wq

--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlJpXFUACgkQwFvcllog0XxUjQCdH7KrhmmORsFVm5ASJv5DI4oT
z4sAoKN6p0Wh+b+3c/IOMc4UJsrM6wz6
=gG+/
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--
