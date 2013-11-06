Return-Path: <joe@deserted.net>
Received: from mail-qa0-f48.google.com (mail-qa0-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id 4F7016D5A4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2013 20:33:59 +0000 (UTC)
Received: by mail-qa0-f48.google.com with SMTP id w8so190791qac.14
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Nov 2013 12:34:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=DbjGQeO91u87JXYTFQK+rYVWfFVv3f+MCms1r7/6zrM=;
	b=UHbKB4rRwWGvSQyXGhpwV9WybnIA6ylZhiV3ljAV4zZb43ko8SkbjLGdCTBTgRyjdS
	XIfs3aLhYXwws9ixhGXm3HM/qgB5ZfIEMqHrPCe/NcWGdjcAAgTfFW6ZKOm3wG1wpXFV
	it3BV1YJ105XTwq//cGJTXTJ9OEA2phnI4FzApOk3uPKOUOyl0HK2z2K2gWsa1kuhPwh
	qVGGQKP+C3W6WEEdjK9nvTbX3xHACQh42NyyfOmZCo3GGroNXqpH9kt7WwRNeFnde78F
	gQsZv1gnSBnko/eEGzstwnLjyNHBpVI/Mr52wlJBGKzu38bHLIT8rEiWr3C3t159GO5k
	Q1EA==
X-Gm-Message-State: ALoCoQlBCVMWJ35aQtXdtIMd+Ovivdbtnc0voicaNIiXH+872sh4eNQyueeL8vZ6HYVfhZka8ZVr
X-Received: by 10.49.35.144 with SMTP id h16mr7220685qej.35.1383770040974;
	Wed, 06 Nov 2013 12:34:00 -0800 (PST)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id h2sm1416777qaf.10.2013.11.06.12.33.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 06 Nov 2013 12:34:00 -0800 (PST)
Date: Wed, 6 Nov 2013 15:33:57 -0500
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131106203355.GD3791@deserted.net>
References: <1383535910-1944-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1383535910-1944-1-git-send-email-rongqing.li@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH meta-networking] quagga: backport a patch from 0.99.22 to fix "no ip address" command
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
X-List-Received-Date: Wed, 06 Nov 2013 20:33:59 -0000
X-Groupsio-MsgNum: 47027
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZmUaFz6apKcXQszQ"
Content-Disposition: inline

--ZmUaFz6apKcXQszQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [PATCH meta-networking] quagga: backport a patch from 0.99.22 to fix =
"no ip address" command] On 13.11.04 (Mon 11:31) rongqing.li@windriver.com =
wrote:

> From: Roy Li <rongqing.li@windriver.com>
>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  ...ingering-IP-address-after-deletion-BZ-486.patch |   64 ++++++++++++++=
++++++
>  .../recipes-protocols/quagga/quagga_0.99.21.bb     |    3 +-
>  2 files changed, 66 insertions(+), 1 deletion(-)
>  create mode 100644 meta-networking/recipes-protocols/quagga/files/linger=
ing-IP-address-after-deletion-BZ-486.patch
>=20
> diff --git a/meta-networking/recipes-protocols/quagga/files/lingering-IP-=
address-after-deletion-BZ-486.patch b/meta-networking/recipes-protocols/qua=
gga/files/lingering-IP-address-after-deletion-BZ-486.patch
> new file mode 100644
> index 0000000..42bdc20
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/quagga/files/lingering-IP-address=
-after-deletion-BZ-486.patch
> @@ -0,0 +1,64 @@
> +From 7f062c217b262e362a3362c677dea6c5e820adf1 Mon Sep 17 00:00:00 2001
> +From: David Lamparter <equinox@diac24.net>
> +Date: Mon, 1 Feb 2010 16:41:26 +0100
> +Subject: [PATCH] zebra: lingering IP address after deletion (BZ#486)
> +
> +Upstream-status: Backport
> +
> +zebra address bookkeeping is a mess. this is just a workaround to have
> +IPv4 address deletion somewhat working on Linux.
> +
> +the if_unset_prefix call is synchronous, when it returns success the
> +address deletion completed successfully. this is either signaled by a
> +netlink ACK or by an OK return value from ioctl().
> +
> +This version is wrapped by #ifdef HAVE_NETLINK so we don't touch the
> +BSDs for now.
> +
> +* zebra/interface.c: On Linux, update zebra internal state after
> +  deleting an address.
> +
> +Signed-off-by: David Lamparter <equinox@opensourcerouting.org>
> +---
> + zebra/interface.c |   21 ++++++++++++++++++---
> + 1 file changed, 18 insertions(+), 3 deletions(-)
> +
> +diff --git a/zebra/interface.c b/zebra/interface.c
> +index 2242259..3578b79 100644
> +--- a/zebra/interface.c
> ++++ b/zebra/interface.c
> +@@ -1297,13 +1297,28 @@ ip_address_uninstall (struct vty *vty, struct in=
terface *ifp,
> + 	       safe_strerror(errno), VTY_NEWLINE);
> +       return CMD_WARNING;
> +     }
> ++  /* success! call returned that the address deletion went through.
> ++   * this is a synchronous operation, so we know it succeeded and can
> ++   * now update all internal state. */
> ++
> ++  /* the HAVE_NETLINK check is only here because, on BSD, although the
> ++   * call above is still synchronous, we get a second confirmation later
> ++   * through the route socket, and we don't want to touch that behaviour
> ++   * for now.  It should work without the #ifdef, but why take the risk=
=2E..
> ++   * -- equinox 2012-07-13 */
> ++#ifdef HAVE_NETLINK
> ++
> ++  /* Remove connected route. */
> ++  connected_down_ipv4 (ifp, ifc);
> +=20
> +-#if 0
> +   /* Redistribute this information. */
> +   zebra_interface_address_delete_update (ifp, ifc);
> +=20
> +-  /* Remove connected route. */
> +-  connected_down_ipv4 (ifp, ifc);
> ++  /* IP address propery set. */
> ++  UNSET_FLAG (ifc->conf, ZEBRA_IFC_REAL);
> ++
> ++  /* remove from interface, remark secondaries */
> ++  if_subnet_delete (ifp, ifc);
> +=20
> +   /* Free address information. */
> +   listnode_delete (ifp->connected, ifc);
> +--=20
> +1.7.10.4
> +
> diff --git a/meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb b=
/meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb
> index 2b46930..10740bc 100644
> --- a/meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb
> +++ b/meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb
> @@ -2,7 +2,8 @@ require quagga.inc
> =20
>  PR =3D "${INC_PR}.0"
> =20
> -SRC_URI +=3D "file://0001-doc-fix-makeinfo-errors-and-one-warning.patch"
> +SRC_URI +=3D "file://0001-doc-fix-makeinfo-errors-and-one-warning.patch \
> +            file://lingering-IP-address-after-deletion-BZ-486.patch"
> =20
>  SRC_URI[quagga-0.99.21.md5sum] =3D "99840adbe57047c90dfba6b6ed9aec7f"
>  SRC_URI[quagga-0.99.21.sha256sum] =3D "9b8aea9026b4771a28e254a66cbd85472=
3bcd0d71eebd0201d11838d4eb392ee"
--=20
-Joe MacDonald.
:wq

--ZmUaFz6apKcXQszQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlJ6p7MACgkQwFvcllog0Xy0agCgjLyG4D0GuY3qmjaBydq0a7xD
Fw8AnjyWmMrwSQwJPjltZ5NX3wNGBwJd
=iKCe
-----END PGP SIGNATURE-----

--ZmUaFz6apKcXQszQ--
