Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TgGqm-0006wU-Bb
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Dec 2012 16:25:28 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so2932745eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Dec 2012 07:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=t9QNmlwGG5BL5i/wLKvQ17F0ocRV58CV/DGz9gHkvBo=;
	b=qa9tlYQFnemZMoEQNimHkI7loIt39PoD6GiYBGR4FNgkTbS6awjKHbNN7YvJc9f5AY
	G9bE4PhvwEgAJSDiqSOT/pKJ8pKBZS1it8z67l4OcbhwjlnG84ox+0otZbBArZloor6Y
	qLjXVGpUnJmOitevV+vyxGWQUfi47ZSiEds+3ngAkxzzDpCZTycatCAxo33KEu0BsO/i
	0L+4pj4GJo26mgvXdaBxcOPuXCeCk3JQcaeWVlux43LXCS5A33qomBxda0uz82lr7N0A
	y4+tsZggLnjY/tDwwKlyExWkFjea61O6QOQAlmUhJYjwnjexnJ1RKPOgGV2vHPKmSNFK
	SSpg==
Received: by 10.14.174.198 with SMTP id x46mr55005611eel.23.1354720264578;
	Wed, 05 Dec 2012 07:11:04 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 46sm9717897eeg.4.2012.12.05.07.11.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 07:11:03 -0800 (PST)
Date: Wed, 5 Dec 2012 16:11:01 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121205151101.GB3396@jama.jama.net>
References: <1354354717-1024-1-git-send-email-cazfi74@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1354354717-1024-1-git-send-email-cazfi74@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] fakeroot: update to upstream version 1.18.4
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
X-List-Received-Date: Wed, 05 Dec 2012 15:25:28 -0000
X-Groupsio-MsgNum: 41999
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="24zk1gE8NUlDmwG9"
Content-Disposition: inline

--24zk1gE8NUlDmwG9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 01, 2012 at 11:38:37AM +0200, Marko Lindqvist wrote:
> License is now GPLv3
>=20
> Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> ---
>  ...-native_1.12.4.bb =3D> fakeroot-native_1.18.4.bb} |    4 ---
>  .../fakeroot/fakeroot/configure-libtool.patch      |   20 --------------
>  .../fakeroot/fakeroot/fix-prefix.patch             |   15 -----------
>  meta-oe/recipes-core/fakeroot/fakeroot_1.12.4.bb   |   27 --------------=
-----
>  meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb   |   28 ++++++++++++++=
++++++
>  5 files changed, 28 insertions(+), 66 deletions(-)
>  rename meta-oe/recipes-core/fakeroot/{fakeroot-native_1.12.4.bb =3D> fak=
eroot-native_1.18.4.bb} (67%)
>  delete mode 100644 meta-oe/recipes-core/fakeroot/fakeroot/configure-libt=
ool.patch
>  delete mode 100644 meta-oe/recipes-core/fakeroot/fakeroot/fix-prefix.pat=
ch
>  delete mode 100644 meta-oe/recipes-core/fakeroot/fakeroot_1.12.4.bb
>  create mode 100644 meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb

Does this patch resolve following QA?
fakeroot-1.12.4: fakeroot: Files/directories were installed but not
shipped
  /usr/lib/libfakeroot
  /usr/lib/libfakeroot/libfakeroot.a
  /usr/lib/libfakeroot/libfakeroot.la
  /usr/lib/libfakeroot/libfakeroot-0.so
  /usr/lib/libfakeroot/libfakeroot.so
  /usr/lib/libfakeroot/.debug
  /usr/lib/libfakeroot/.debug/libfakeroot-0.so
  /usr/lib/libfakeroot/.debug/libfakeroot.so

If not, can you fix it while upgrading?

Cheers,

--24zk1gE8NUlDmwG9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlC/ZAUACgkQN1Ujt2V2gBwxpACeJnDrRSHdDLz+3S3iSFBQe+nw
Q/MAn2n66cFe1OubKpbLInuT0sF8YFqN
=PfWN
-----END PGP SIGNATURE-----

--24zk1gE8NUlDmwG9--
