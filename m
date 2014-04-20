Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id E8D2B601A9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 12:53:41 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id e49so3023264eek.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 05:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=leb/LgX1jZlhHQv4P+WPvXI5ZL70rHir9ZbGUdoCha8=;
	b=ZS/LknNCalCO5b6CP2PqEE08V/h9HqkDzPsvAUi1QqMRUSTjNMoYWTY0mYH7snX8bW
	/H6aAPp3uKl8kSV8ZsgN+qiP2heCEQ31IWIZwDR0VRC89p0yYus/L53gGmbl0gmEfVwz
	z9SfsrHnlZz7mJxqEabkBDGXDC8cE7mzvxzF3LfLE2NjJtvZh/+EJ/7NyQ+nbclibZTp
	HzkL/T57JH+bXPRhm8T9ND/rhxzv+tKvhnpC4FF0JgKx7iYZKt8B9+nijH8MHuZI0k31
	GTpp4UxuFI6r3DYUEiEH9zGoO6c5lQ9qaFvn7DIcT0JOTu3TJx6yBu0Dhl0SCEnmTkbF
	swAA==
X-Received: by 10.14.115.1 with SMTP id d1mr38594863eeh.30.1397998422611;
	Sun, 20 Apr 2014 05:53:42 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	w12sm94405752eez.36.2014.04.20.05.53.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 05:53:41 -0700 (PDT)
Date: Sun, 20 Apr 2014 14:53:46 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420125346.GK2486@jama>
References: <1396441466-14563-1-git-send-email-Matthieu.Crapet@ingenico.com>
MIME-Version: 1.0
In-Reply-To: <1396441466-14563-1-git-send-email-Matthieu.Crapet@ingenico.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] zsh: upgrade to 5.0.5
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
X-List-Received-Date: Sun, 20 Apr 2014 12:53:45 -0000
X-Groupsio-MsgNum: 49344
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uff7bI5xB/HT0T5d"
Content-Disposition: inline

--uff7bI5xB/HT0T5d
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 02, 2014 at 02:24:26PM +0200, Matthieu Crapet wrote:
> Recipe cleanup:
> - Add missing license in meta-oe/licenses
> - Add DESCRIPTION
> - Use ${BP} and ${SOURCEFORGE_MIRROR}

Merged, thanks!

>=20
> Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
> ---
>  meta-oe/licenses/zsh                      | 37 +++++++++++++++++++++++++=
++++++
>  meta-oe/recipes-extended/zsh/zsh.inc      | 14 +++++++-----
>  meta-oe/recipes-extended/zsh/zsh_5.0.0.bb |  5 -----
>  meta-oe/recipes-extended/zsh/zsh_5.0.5.bb |  5 +++++
>  4 files changed, 50 insertions(+), 11 deletions(-)
>  create mode 100644 meta-oe/licenses/zsh
>  delete mode 100644 meta-oe/recipes-extended/zsh/zsh_5.0.0.bb
>  create mode 100644 meta-oe/recipes-extended/zsh/zsh_5.0.5.bb
>=20
> diff --git a/meta-oe/licenses/zsh b/meta-oe/licenses/zsh
> new file mode 100644
> index 0000000..1fb1fc4
> --- /dev/null
> +++ b/meta-oe/licenses/zsh
> @@ -0,0 +1,37 @@
> +Unless otherwise noted in the header of specific files, files in this
> +distribution have the licence shown below.
> +
> +However, note that certain shell functions are licensed under versions
> +of the GNU General Public Licence.  Anyone distributing the shell as a
> +binary including those files needs to take account of this.  Search
> +shell functions for "Copyright" for specific copyright information.
> +None of the core functions are affected by this, so those files may
> +simply be omitted.
> +
> +--
> +
> +The Z Shell is copyright (c) 1992-2009 Paul Falstad, Richard Coleman,
> +Zolt=E1n Hidv=E9gi, Andrew Main, Peter Stephenson, Sven Wischnowsky, and
> +others.  All rights reserved.  Individual authors, whether or not
> +specifically named, retain copyright in all changes; in what follows, th=
ey
> +are referred to as `the Zsh Development Group'.  This is for convenience
> +only and this body has no legal status.  The Z shell is distributed under
> +the following licence; any provisions made in individual files take
> +precedence.
> +
> +Permission is hereby granted, without written agreement and without
> +licence or royalty fees, to use, copy, modify, and distribute this
> +software and to distribute modified versions of this software for any
> +purpose, provided that the above copyright notice and the following
> +two paragraphs appear in all copies of this software.
> +
> +In no event shall the Zsh Development Group be liable to any party for
> +direct, indirect, special, incidental, or consequential damages arising =
out
> +of the use of this software and its documentation, even if the Zsh
> +Development Group have been advised of the possibility of such damage.
> +
> +The Zsh Development Group specifically disclaim any warranties, includin=
g,
> +but not limited to, the implied warranties of merchantability and fitness
> +for a particular purpose.  The software provided hereunder is on an "as =
is"
> +basis, and the Zsh Development Group have no obligation to provide
> +maintenance, support, updates, enhancements, or modifications.
> diff --git a/meta-oe/recipes-extended/zsh/zsh.inc b/meta-oe/recipes-exten=
ded/zsh/zsh.inc
> index 03201d6..db51f39 100644
> --- a/meta-oe/recipes-extended/zsh/zsh.inc
> +++ b/meta-oe/recipes-extended/zsh/zsh.inc
> @@ -1,14 +1,16 @@
> -DESCRIPTION =3D "UNIX Shell similar to the Korn shell"
> -HOMEPAGE=3D"http://www.zsh.org"
> +SUMMARY =3D "UNIX Shell similar to the Korn shell"
> +DESCRIPTION =3D "Zsh is a shell designed for interactive use, although i=
t is also a \
> +               powerful scripting language. Many of the useful features =
of bash, \
> +               ksh, and tcsh were incorporated into zsh; many original f=
eatures were added."
> +HOMEPAGE =3D "http://www.zsh.org"
>  SECTION =3D "base/shell"
> =20
> -
> -LICENSE =3D "ZSH"
> -LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3Dad234d4b46db63491c4a9789da4fb=
341"
> +LICENSE =3D "zsh"
> +LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3Db7bc853894664be455a922db98052=
88e"
> =20
>  DEPENDS =3D "ncurses bison-native"
> =20
> -SRC_URI =3D "http://downloads.sourceforge.net/project/${BPN}/${BPN}/${PV=
}/${BPN}-${PV}.tar.gz"
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz"
> =20
>  inherit autotools gettext update-alternatives
> =20
> diff --git a/meta-oe/recipes-extended/zsh/zsh_5.0.0.bb b/meta-oe/recipes-=
extended/zsh/zsh_5.0.0.bb
> deleted file mode 100644
> index 3421d95..0000000
> --- a/meta-oe/recipes-extended/zsh/zsh_5.0.0.bb
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -require zsh.inc
> -DEPENDS =3D "ncurses libcap libpcre gdbm groff-native"
> -
> -SRC_URI[md5sum] =3D "01df38e4aa34aa227462fdf2f6d4c5cd"
> -SRC_URI[sha256sum] =3D "835194ea83abd812b5fdb1d2bfa6427c4c4e95e771c4a75e=
9006037af8efd264"
> diff --git a/meta-oe/recipes-extended/zsh/zsh_5.0.5.bb b/meta-oe/recipes-=
extended/zsh/zsh_5.0.5.bb
> new file mode 100644
> index 0000000..a7170dc
> --- /dev/null
> +++ b/meta-oe/recipes-extended/zsh/zsh_5.0.5.bb
> @@ -0,0 +1,5 @@
> +require zsh.inc
> +DEPENDS +=3D "libcap libpcre gdbm groff-native"
> +
> +SRC_URI[md5sum] =3D "6fb0e3e52a0f8de5ca63138391b81ce0"
> +SRC_URI[sha256sum] =3D "b35cf19e4a6ba39fd03c6372b8a8760a491cc2e2e4aba3d1=
5023ff291c2894b4"
> --=20
> 1.8.5.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--uff7bI5xB/HT0T5d
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTw1oACgkQN1Ujt2V2gByYBACeI31w1eQswS2YCA4rsaf9MP63
FOwAoKWlJ8W0pSj1FqWleWAuhs53xrQE
=JMgU
-----END PGP SIGNATURE-----

--uff7bI5xB/HT0T5d--
