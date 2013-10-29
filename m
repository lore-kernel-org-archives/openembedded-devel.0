Return-Path: <joe@deserted.net>
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 08FDF6D041
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2013 14:37:38 +0000 (UTC)
Received: by mail-qc0-f172.google.com with SMTP id c9so4759280qcz.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2013 07:37:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=pMgsaDwqXmFbvjPAhN6CMjoIG7U7rB5ys6svd84+o0Q=;
	b=KBQGyy3QFdZQTV9RU4HOm87gYiFrw64z3WHgr47eal24Helqq3id8hd9Dg0bvJuQHs
	xwmMvz9YOmpLEUAUfj6eRdUclqlzahY1qtPYPbt9LDcMM+11OffIPWOro12sQDULg3CE
	nTlqiQB8cC/H1TD/uCEduifSsAZslxL5EvXfL7Ykr+8oE8Nn+ssUbF5I+93TIPEOPmrW
	HeQ70eutDoTTdc3oum84EKIFk2QpnKNstUYklkypfGE1OTytgyuNCgF9IhI6iwjLqoT3
	KXFfcVuokrQ8q8nSKxmaMHXthk5+4tDyiuQrvxuhKauG7veBajYRkx+5bs11wQNLD8hn
	PCKg==
X-Gm-Message-State: ALoCoQmze37KmWnqYG96ZPcJpoNr7pDCXRQkhriH+jy1qaTYG5+W3Bh9K95WZ0RdaXFUhdOKuXTk
X-Received: by 10.49.4.199 with SMTP id m7mr35947045qem.19.1383057460291;
	Tue, 29 Oct 2013 07:37:40 -0700 (PDT)
Received: from deserted.net (198-84-238-35.cpe.teksavvy.com. [198.84.238.35])
	by mx.google.com with ESMTPSA id
	r5sm65774677qaj.13.2013.10.29.07.37.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 29 Oct 2013 07:37:39 -0700 (PDT)
Date: Tue, 29 Oct 2013 10:37:37 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131029143735.GA9931@deserted.net>
References: <1382926827-13170-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1382926827-13170-1-git-send-email-rongqing.li@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH meta-networking v2] lowpan-tools: configure python files installation path
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
X-List-Received-Date: Tue, 29 Oct 2013 14:37:39 -0000
X-Groupsio-MsgNum: 46922
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Content-Disposition: inline

--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [PATCH meta-networking v2] lowpan-tools: configure python files insta=
llation path] On 13.10.28 (Mon 10:20) rongqing.li@windriver.com wrote:

> From: Roy Li <rongqing.li@windriver.com>
>=20
> configure python files installation path or else it will use the
> default value /usr/lib/python*, which is wrong on 64bit and multilibs
> enabled system
>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb |    4 =
+++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_gi=
t.bb b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
> index cf78b45..152ee49 100644
> --- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
> +++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
> @@ -13,7 +13,9 @@ SRCREV =3D "a1d9615adde6d1a568813c24a128273ed755af04"
> =20
>  S =3D "${WORKDIR}/git"
> =20
> -inherit autotools
> +inherit autotools python-dir
> +
> +CACHED_CONFIGUREVARS +=3D "am_cv_python_pythondir=3D${PYTHON_SITEPACKAGE=
S_DIR}/lowpan-tools"
> =20
>  do_install_append() {
>  	rmdir ${D}${localstatedir}/run
--=20
-Joe MacDonald.
:wq

--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlJvyCUACgkQwFvcllog0XywIACfeDmH/+yb6exI+UKD4uApKoUX
TdsAoIf6ubTHb7DZkdGEnO/rM8nm5bLm
=DfRb
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--
