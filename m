Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f172.google.com (mail-ea0-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8A89C6BDB7
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 17:53:04 +0000 (UTC)
Received: by mail-ea0-f172.google.com with SMTP id r16so3198230ead.31
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Sep 2013 10:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=vJ6kRwfR2Dw5ByyYOJqyL8Wb1T9IRQ93+rz9rgLIiAc=;
	b=F3puk2qowxgwTtQqN8xTVpgFPqoA3IOao1VuAzeVZG/+Dv0gXjJqRAbnAwxZlKT9g/
	7G59+Jd+AO1MwldZ3Z+TSJ1qUS+URLv8/5A4ZyhzPPHElcfsnJAZYPhDkt3E0FYi/yfQ
	P9cnAFCDtWIqZXFdVyI+1UuerhVnM5gcfj9SKH1YFs6ACggH9fPPDCQljqZPnv69kBIX
	tUnH/k4euUkiE4D2ChkfNrVlbSE9jn4073VA3hO9teXYNfjWq/F6PaTY2fPBdl1Gws3Z
	KqVV48pTwAl0gMdGj+8DGfY3J0/GchKsYiH1OYSdDbZpDEE9gMGBVFGf9EvY6cxM50yI
	WF1Q==
X-Received: by 10.14.0.201 with SMTP id 49mr231722eeb.85.1378230784407;
	Tue, 03 Sep 2013 10:53:04 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a43sm33373194eep.9.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 03 Sep 2013 10:53:03 -0700 (PDT)
Date: Tue, 3 Sep 2013 19:54:22 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130903175422.GA3553@jama>
References: <cover.1377686481.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1377686481.git.paul.eggleton@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe, meta-gnome][PATCH 0/6] Removals of recipes/classes now in OE-Core
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
X-List-Received-Date: Tue, 03 Sep 2013 17:53:06 -0000
X-Groupsio-MsgNum: 46044
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Content-Disposition: inline

--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2013 at 11:43:22AM +0100, Paul Eggleton wrote:
> The following changes since commit 72e23c12296fbc77193898c38426add58d0c2d=
71:
>=20
>   mysql5: replace with mariadb 5.1.67 and tweak (2013-08-27 16:39:31 +010=
0)

All applied, thanks!

>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/meta-openembedded-contrib paule/oecore-moves2
>   http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=
=3Dpaule/oecore-moves2
>=20
> Paul Eggleton (6):
>   midori: remove
>   vala: remove
>   classes/vala: remove
>   python-docutils: remove
>   libnotify: remove
>   ca-certificates: remove
>=20
>  .../recipes-connectivity/midori/midori_0.5.2.bb    | 42 ----------------
>  .../recipes-gnome/libnotify/libnotify_0.6.0.bb     | 17 -------
>  meta-oe/classes/vala.bbclass                       | 18 -------
>  .../recipes-devtools/python/python-docutils_0.5.bb | 19 --------
>  ...-gen-don-t-append-dirty-if-we-re-not-in-g.patch | 53 ----------------=
----
>  meta-oe/recipes-devtools/vala/vala.inc             | 20 --------
>  meta-oe/recipes-devtools/vala/vala_0.16.0.bb       |  8 ----
>  .../ca-certificates/ca-certificates-20130119.inc   | 15 ------
>  .../ca-certificates-cross_20130119.bb              | 12 -----
>  ...01-update-ca-certificates-remove-c-rehash.patch | 45 -----------------
>  .../0002-update-ca-certificates-use-SYSROOT.patch  | 56 ----------------=
------
>  .../ca-certificates/ca-certificates_20130119.bb    | 30 ------------
>  12 files changed, 335 deletions(-)
>  delete mode 100644 meta-gnome/recipes-connectivity/midori/midori_0.5.2.bb
>  delete mode 100644 meta-gnome/recipes-gnome/libnotify/libnotify_0.6.0.bb
>  delete mode 100644 meta-oe/classes/vala.bbclass
>  delete mode 100644 meta-oe/recipes-devtools/python/python-docutils_0.5.bb
>  delete mode 100644 meta-oe/recipes-devtools/vala/vala-0.16.0/0001-git-ve=
rsion-gen-don-t-append-dirty-if-we-re-not-in-g.patch
>  delete mode 100644 meta-oe/recipes-devtools/vala/vala.inc
>  delete mode 100644 meta-oe/recipes-devtools/vala/vala_0.16.0.bb
>  delete mode 100644 meta-oe/recipes-support/ca-certificates/ca-certificat=
es-20130119.inc
>  delete mode 100644 meta-oe/recipes-support/ca-certificates/ca-certificat=
es-cross_20130119.bb
>  delete mode 100644 meta-oe/recipes-support/ca-certificates/ca-certificat=
es/0001-update-ca-certificates-remove-c-rehash.patch
>  delete mode 100644 meta-oe/recipes-support/ca-certificates/ca-certificat=
es/0002-update-ca-certificates-use-SYSROOT.patch
>  delete mode 100644 meta-oe/recipes-support/ca-certificates/ca-certificat=
es_20130119.bb
>=20
> --=20
> 1.8.1.2
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlImIk4ACgkQN1Ujt2V2gBzrKgCfd9pXFTEsfT8/Jjwke7xkoM5i
qsIAni6c/hR4ZCEDLuBPyErk41HInO/J
=uAgl
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--
