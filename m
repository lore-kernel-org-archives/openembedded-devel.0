Return-Path: <joe@deserted.net>
Received: from mail-qc0-f179.google.com (mail-qc0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id DE8FF6EFA9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Mar 2014 20:27:21 +0000 (UTC)
Received: by mail-qc0-f179.google.com with SMTP id m20so4915450qcx.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Mar 2014 13:27:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=0dRj3o5o+srrPxKxPY1ReahxVW/rbV6/idPqHFlH1SY=;
	b=T3szsbIP8QvISlM71fizXj+Itt7Ac6tk1uPt3JqvdE5pJDhCPxiALKuWtrZiNNlKt/
	/H0QyZRDeJbqReqN+Y95PJ4g68kFDXAr+JRRW+c7aTHLaf9tXkhE9xdWgEeWIL/djVnE
	BwppNqfIAX8Yd1Xk7AtjvB55vlInC36V//SROBVrJHCiWzCot75FWsUAbRKaySv/Z/1w
	Ufi+zESNKQm8z4FKNtp8BDIMLEdkZ1Cd/TmlHCaXeCHQTF1WHVFkcfJQOBIg7DdHoR2d
	bceOoh9KkFut3vK4UJslsIuuWd8iVwUTwFppAm9UPcxb3UU3WodxIk7Gx6vxKIrGnjSZ
	gAiQ==
X-Gm-Message-State: ALoCoQnoMBpWM+NcWgGH/51uKxPyds0orb2DA4d2qe+4srV4KhRq8CFQeAC6Q+SfCHgCP+lk4ZDk
X-Received: by 10.224.5.197 with SMTP id 5mr4804991qaw.72.1395952042127;
	Thu, 27 Mar 2014 13:27:22 -0700 (PDT)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id t9sm5776945qar.15.2014.03.27.13.27.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 27 Mar 2014 13:27:20 -0700 (PDT)
Date: Thu, 27 Mar 2014 16:27:18 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140327202716.GA15666@deserted.net>
References: <1395913975-24059-1-git-send-email-liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1395913975-24059-1-git-send-email-liezhi.yang@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-networking] [PATCH] quagga: work with new readline
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
X-List-Received-Date: Thu, 27 Mar 2014 20:27:24 -0000
X-Groupsio-MsgNum: 48869
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9jxsPFA5p3P2qPhR"
Content-Disposition: inline

--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [meta-networking] [PATCH] quagga: work with new readline] On 14.03.27=
 (Thu 17:52) Robert Yang wrote:

> The Function and CPPFunction had been removed by in readline 6.3, use
> the new functions to replace them.
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../quagga/files/work-with-new-readline.patch      | 34 ++++++++++++++++=
++++++
>  .../recipes-protocols/quagga/quagga_0.99.21.bb     |  1 +
>  2 files changed, 35 insertions(+)
>  create mode 100644 meta-networking/recipes-protocols/quagga/files/work-w=
ith-new-readline.patch
>=20
> diff --git a/meta-networking/recipes-protocols/quagga/files/work-with-new=
-readline.patch b/meta-networking/recipes-protocols/quagga/files/work-with-=
new-readline.patch
> new file mode 100644
> index 0000000..2bd333a
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/quagga/files/work-with-new-readli=
ne.patch
> @@ -0,0 +1,34 @@
> +From 66df315d2a270a254c613a4d2e72c0ea47f15a71 Mon Sep 17 00:00:00 2001
> +From: Robert Yang <liezhi.yang@windriver.com>
> +Date: Thu, 27 Mar 2014 09:35:29 +0000
> +Subject: [PATCH] vtysh/vtysh.c: works with new readline
> +
> +The Function and CPPFunction had been removed by in readline 6.3, use
> +the new functions to replace them.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> +---
> + vtysh/vtysh.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/vtysh/vtysh.c b/vtysh/vtysh.c
> +index 431c08e..fdd82fb 100644
> +--- a/vtysh/vtysh.c
> ++++ b/vtysh/vtysh.c
> +@@ -2212,9 +2212,9 @@ void
> + vtysh_readline_init (void)
> + {
> +   /* readline related settings. */
> +-  rl_bind_key ('?', (Function *) vtysh_rl_describe);
> ++  rl_bind_key ('?', (rl_command_func_t *) vtysh_rl_describe);
> +   rl_completion_entry_function =3D vtysh_completion_entry_function;
> +-  rl_attempted_completion_function =3D (CPPFunction *)new_completion;
> ++  rl_attempted_completion_function =3D (rl_completion_func_t *)new_comp=
letion;
> +   /* do not append space after completion. It will be appended
> +    * in new_completion() function explicitly. */
> +   rl_completion_append_character =3D '\0';
> +--=20
> +1.8.3.4
> +
> diff --git a/meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb b=
/meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb
> index db2a67b..0988b70 100644
> --- a/meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb
> +++ b/meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb
> @@ -6,6 +6,7 @@ SRC_URI +=3D "file://0001-doc-fix-makeinfo-errors-and-one=
-warning.patch \
>              file://lingering-IP-address-after-deletion-BZ-486.patch \
>              file://build-fix-extract.pl-for-cross-compilation.patch \
>              file://babel-close-the-stdout-stderr-as-in-other-daemons.pat=
ch \
> +            file://work-with-new-readline.patch \
>  "
> =20
>  SRC_URI[quagga-0.99.21.md5sum] =3D "99840adbe57047c90dfba6b6ed9aec7f"
> --=20
> 1.8.3.1
>=20
--=20
-Joe MacDonald.
:wq

--9jxsPFA5p3P2qPhR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlM0iZwACgkQwFvcllog0XyUFACgtx9RvoIuvGDFAWTOB7eqUci5
gQcAnR3R46Bs5/XdJSh4g3jAk2D+V0YP
=EpCh
-----END PGP SIGNATURE-----

--9jxsPFA5p3P2qPhR--
