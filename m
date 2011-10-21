Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RHE0T-00008n-In
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 14:15:25 +0200
Received: by bkat8 with SMTP id t8so5031558bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2011 05:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rdLFeqcsgJWzmuVb7fAbIPjlWctCEOLhOmT22JCrAXM=;
	b=pL+hQIp0jlP2PhjvJSz4R2sHkwnSM7oMvpj4ZmE7HvoIKXR1uukbECazbMFjHdB1Zr
	qTLp/t5toGAokMkV4+D7irrMFnmn5Y1NujdhFIu3jPWCNK+PWdS/TWvR4uTODY1JfpEu
	ufxJPcmGOA8fR5XGR2b1hRrbXKIHjazjlPnKo=
Received: by 10.204.7.138 with SMTP id d10mr10586043bkd.31.1319198972463;
	Fri, 21 Oct 2011 05:09:32 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k6sm13254334bkv.8.2011.10.21.05.09.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Oct 2011 05:09:31 -0700 (PDT)
Date: Fri, 21 Oct 2011 14:09:25 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111021120925.GR3522@jama.jama.net>
References: <1319198573-7582-1-git-send-email-ulf_samuelsson@telia.com>
MIME-Version: 1.0
In-Reply-To: <1319198573-7582-1-git-send-email-ulf_samuelsson@telia.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Ulf Samuelsson <ulf_samuelsson@telia.com>,
	Ulf Samuelsson <ulf.samuelsson@telia.com>
Subject: Re: [PATCH] binutils-2.20.1: Change source package to binutils-2.20.1a
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
X-List-Received-Date: Fri, 21 Oct 2011 12:15:25 -0000
X-Groupsio-MsgNum: 34950
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="D8QxnvyRlKGQJxl7"
Content-Disposition: inline

--D8QxnvyRlKGQJxl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 21, 2011 at 02:02:53PM +0200, ulf_samuelsson@telia.com wrote:
> From: Ulf Samuelsson <ulf_samuelsson@telia.com>
>=20
> 2.20.1 is now 2.20.1a.
> Patches and diff -r1 backported from openembedded-core
> meta-openembedded/meta-oe/recipes-devtools/binutils
>=20
> When extracting the 2.20.1a sources, the directory name is still 2.20.1
>=20
> $ LANG=3DC diff -rq binutils-2.20.1 binutils-2.20.1a
> Only in binutils-2.20.1a: cgen
> Files binutils-2.20.1/md5.sum and binutils-2.20.1a/md5.sum differ
> Files binutils-2.20.1/opcodes/m32c-desc.c and binutils-2.20.1a/opcodes/m3=
2c-desc.c differ
> Files binutils-2.20.1/opcodes/mep-asm.c and binutils-2.20.1a/opcodes/mep-=
asm.c differ
> Files binutils-2.20.1/opcodes/mep-opc.c and binutils-2.20.1a/opcodes/mep-=
opc.c differ
>=20
> Signed-Off-By: Ulf Samuelsson <ulf.samuelsson@telia.com>
> ---
>  ...20.1-Change-source-package-to-binutils-2..patch |  937 ++++++++++++++=
++++++
>  .../152_arm_branches_to_weak_symbols.patch         |  240 +++++
>  .../binutils-2.20.1/200_elflink_%B_fixes.patch     |   65 ++
>  .../201_elflink_improve_noaddneeded_errors.patch   |   70 ++
>  .../202_elflink_noaddneeded_vs_weak.patch          |   87 ++
>  .../binutils-2.20.1/binutils-mips-pie.patch        |   29 +
>  .../binutils/binutils-2.20.1/binutils-poison.patch |  253 ++++++
>  .../binutils-2.20.1/libiberty_path_fix.patch       |   20 +
>  .../binutils-2.20.1/libtool-rpath-fix.patch        |   36 +
>  recipes/binutils/binutils_2.20.1.bb                |   16 +-
>  10 files changed, 1749 insertions(+), 4 deletions(-)
>  create mode 100644 0001-binutils-2.20.1-Change-source-package-to-binutil=
s-2..patch

This looks wrong

>  create mode 100644 recipes/binutils/binutils-2.20.1/152_arm_branches_to_=
weak_symbols.patch
>  create mode 100644 recipes/binutils/binutils-2.20.1/200_elflink_%B_fixes=
=2Epatch
>  create mode 100644 recipes/binutils/binutils-2.20.1/201_elflink_improve_=
noaddneeded_errors.patch
>  create mode 100644 recipes/binutils/binutils-2.20.1/202_elflink_noaddnee=
ded_vs_weak.patch
>  create mode 100644 recipes/binutils/binutils-2.20.1/binutils-mips-pie.pa=
tch
>  create mode 100644 recipes/binutils/binutils-2.20.1/binutils-poison.patch
>  create mode 100644 recipes/binutils/binutils-2.20.1/libiberty_path_fix.p=
atch
>  create mode 100644 recipes/binutils/binutils-2.20.1/libtool-rpath-fix.pa=
tch

--D8QxnvyRlKGQJxl7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6hYPUACgkQN1Ujt2V2gBw3ZQCgs7u98n0k7cR48us7xO+USWhq
ZUwAn2qxx7uPbqxZraDktLHZtO9j6izX
=0D4S
-----END PGP SIGNATURE-----

--D8QxnvyRlKGQJxl7--
