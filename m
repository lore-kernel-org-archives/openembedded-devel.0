Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id CF9D565EDB
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Aug 2014 09:23:57 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id hi2so2856659wib.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Aug 2014 02:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=H2r6nMgCzMKkk4LrVsQo2VIxtxswcAdpPr/FjuKR2RI=;
	b=FzD17AK6myoCxBa0BgnaY3m3EfjXRjehIwb/0c7S1ENCHC3fCWIu5NxE2fEtEagWHh
	60IjNfQ9Hthx5BNdJKZ9HGWr34QdAebX+3RxQsIKzgqDRkWI/wdZAH5RnKPGDBmpr8rH
	M4O3QToHxArNP2En5lXBQ3Srde9c+BY7kSalERVTB9f2pDjREkKmI4+RnpReKNbT7ie/
	mKY6jsxUvtghYtilGN/0UY0pKYC22SBTBppodWSFTv8+SkIhgAZGKgqG03vAq8bTXFLz
	lTdSGN5pOPodwdJ5X/KB3AmaELn6cpOeZVtZF4Lh8bMaaSZHs0h5cPIFpantRFDtFqge
	mpRA==
X-Received: by 10.180.102.130 with SMTP id fo2mr7368651wib.29.1407662638839;
	Sun, 10 Aug 2014 02:23:58 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	f3sm29038010wiz.0.2014.08.10.02.23.57 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Aug 2014 02:23:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 10 Aug 2014 11:24:31 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140810092431.GP14848@jama>
References: <cover.1407632366.git.chris_larson@mentor.com>
	<df6c707e6db09c6b640084b8a4a69919b147ad07.1407632366.git.chris_larson@mentor.com>
MIME-Version: 1.0
In-Reply-To: <df6c707e6db09c6b640084b8a4a69919b147ad07.1407632366.git.chris_larson@mentor.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [meta-oe][PATCH 3/5] dnsmasq: fix parallel make issue
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
X-List-Received-Date: Sun, 10 Aug 2014 09:24:02 -0000
X-Groupsio-MsgNum: 51558
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WQlakiwWJnBZuvs8"
Content-Disposition: inline

--WQlakiwWJnBZuvs8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 09, 2014 at 06:01:13PM -0700, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>

Is this v2 of this change which was sent earlier?

commit 9550453f7d1c0773b0e5ba7af478222f55021240
Author: Shrikant Bobade <Shrikant_Bobade@mentor.com>
Date:   Mon Aug 4 14:42:57 2014 +0530

    dnsmasq: fix parallel make failure

> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>  .../recipes-support/dnsmasq/dnsmasq_2.68.bb           |  2 ++
>  .../recipes-support/dnsmasq/files/parallel-make.patch | 19 +++++++++++++=
++++++
>  2 files changed, 21 insertions(+)
>  create mode 100644 meta-networking/recipes-support/dnsmasq/files/paralle=
l-make.patch
>=20
> diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.68.bb b/me=
ta-networking/recipes-support/dnsmasq/dnsmasq_2.68.bb
> index b1bef7a..6caa92a 100644
> --- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.68.bb
> +++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.68.bb
> @@ -1,4 +1,6 @@
>  require dnsmasq.inc
> =20
> +SRC_URI +=3D "file://parallel-make.patch"
> +
>  SRC_URI[dnsmasq-2.68.md5sum] =3D "6f8351ca0901f248efdb81532778d2ef"
>  SRC_URI[dnsmasq-2.68.sha256sum] =3D "402019d61f53f1ccc04cc6218719fd3b158=
ea3fca9a83ab55471f981a2097c2f"
> diff --git a/meta-networking/recipes-support/dnsmasq/files/parallel-make.=
patch b/meta-networking/recipes-support/dnsmasq/files/parallel-make.patch
> new file mode 100644
> index 0000000..6d5b722
> --- /dev/null
> +++ b/meta-networking/recipes-support/dnsmasq/files/parallel-make.patch
> @@ -0,0 +1,19 @@
> +The dnsmasq target depends on .configured and $(objs). .configured does =
an rm
> +-f *.o. Yet the only thing telling make to build the .configured target =
before
> +the $(objs) target was the order of the dependencies of the dnsmasq targ=
et. We
> +can't rely on that order when doing a paralllel make build, so add an ex=
plicit
> +rule to enforce that order.
> +
> +Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> +Upstream-status: Pending
> +
> +--- dnsmasq-2.68.orig/Makefile
> ++++ dnsmasq-2.68/Makefile
> +@@ -139,6 +139,8 @@ bloatcheck : $(BUILDDIR)/dnsmasq_baselin
> +	@rm -f *.o
> +	@touch $@
> +
> ++$(objs): .configured
> ++
> + $(objs:.o=3D.c) $(hdrs):
> +	ln -s $(top)/$(SRC)/$@ .
> --=20
> 1.8.3.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WQlakiwWJnBZuvs8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPnOk8ACgkQN1Ujt2V2gBxOxwCfSSwA1CC2wOP1p0rmBKl5q6cj
XJgAn0XR5I7hRVHDDOBxka79sXlo1/kb
=Khy3
-----END PGP SIGNATURE-----

--WQlakiwWJnBZuvs8--
