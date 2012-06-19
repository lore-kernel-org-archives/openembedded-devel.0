Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SgrAl-0000n5-CI
	for openembedded-devel@openembedded.org; Tue, 19 Jun 2012 07:40:15 +0200
Received: by wibhm11 with SMTP id hm11so169348wib.12
	for <openembedded-devel@openembedded.org>;
	Mon, 18 Jun 2012 22:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=CIwaGldmvAg+P9sbwY2K4z0Zj1/1IlztQSZQDXZmbx0=;
	b=WdqxFuar0BtTKEwjLGfLCxyghg57n0h1X9vCFtyf89I0Lc5VX5IdwUm4/YrCsVMTOP
	TFh9kxXSl25beHUys+RPODJa5gdVDupHn4G/2yRlV/C7gYkBAGstq6h0Emr3yC2qv8ZP
	NZkKEUJk7N5hBZWTDueNLUP+C5XJlMVNFCj4kWFOuy87TNeRochozHYnjfC+SsRP1Mhi
	JwO8RrqZvd/hrU0RNp3OI72adPfqMNscG9VHfc24wxZVTArHDRhKHZRXpaULbmgoGakn
	R57TRXlUd44JziWymkrbl6IXRsKk3qHOtclSbZ9BTG3ZUrHX3npuclsSIxMpVyYzXTV/
	Walw==
Received: by 10.180.104.168 with SMTP id gf8mr164722wib.12.1340083772102;
	Mon, 18 Jun 2012 22:29:32 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id hv7sm54553769wib.0.2012.06.18.22.29.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Jun 2012 22:29:30 -0700 (PDT)
Date: Tue, 19 Jun 2012 07:29:32 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Apelete Seketeli <apelete@seketeli.net>
Message-ID: <20120619052932.GN3178@jama.jama.net>
References: <1340062930-19293-1-git-send-email-apelete@seketeli.net>
	<1340062930-19293-2-git-send-email-apelete@seketeli.net>
MIME-Version: 1.0
In-Reply-To: <1340062930-19293-2-git-send-email-apelete@seketeli.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@openembedded.org,
	Kristoffer Ericson <kristoffer.ericson@gmail.com>
Subject: Re: [PATCH 1/1] gtk+: Regenerate no-demos.patch and update recipe
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
X-List-Received-Date: Tue, 19 Jun 2012 05:40:15 -0000
X-Groupsio-MsgNum: 39287
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4Y142/9l9nQlBiaj"
Content-Disposition: inline

--4Y142/9l9nQlBiaj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 19, 2012 at 01:42:10AM +0200, Apelete Seketeli wrote:
> This fix regenerates the gtk+-2.20.1/no-demos.patch file because the
> targeted Makefile.am file changed since gtk+-2.10.1.
> The gtk+_2.20.1.bb recipe is also updated to fix an issue where
> no-demos.patch was not taken into account during the do_patch() stage.
>=20
> Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
> ---
>  recipes/gtk+/gtk+-2.20.1/no-demos.patch |    7 ++++---
>  recipes/gtk+/gtk+_2.20.1.bb             |    3 +--
>  2 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/recipes/gtk+/gtk+-2.20.1/no-demos.patch b/recipes/gtk+/gtk+-=
2.20.1/no-demos.patch
> index 0fc4c48..ac0730d 100644
> --- a/recipes/gtk+/gtk+-2.20.1/no-demos.patch
> +++ b/recipes/gtk+/gtk+-2.20.1/no-demos.patch
> @@ -1,7 +1,8 @@
> ---- gtk+-2.10.1/Makefile.am.orig	2006-08-08 12:37:30.000000000 +0100
> -+++ gtk+-2.10.1/Makefile.am	2006-08-08 12:37:48.000000000 +0100
> -@@ -1,6 +1,6 @@
> +--- gtk+-2.20.1/Makefile.am.orig	2012-06-18 22:40:19.348040648 +0200
> ++++ gtk+-2.20.1/Makefile.am	2012-06-18 22:40:41.272149318 +0200
> +@@ -1,7 +1,7 @@
>   ## Makefile.am for GTK+
> + include $(top_srcdir)/Makefile.decl
>  =20
>  -SRC_SUBDIRS =3D gdk-pixbuf gdk gtk modules demos tests perf contrib
>  +SRC_SUBDIRS =3D gdk-pixbuf gdk gtk modules tests perf contrib
> diff --git a/recipes/gtk+/gtk+_2.20.1.bb b/recipes/gtk+/gtk+_2.20.1.bb
> index 9cffee1..6e3c291 100644
> --- a/recipes/gtk+/gtk+_2.20.1.bb
> +++ b/recipes/gtk+/gtk+_2.20.1.bb
> @@ -1,10 +1,9 @@
>  require gtk+.inc
> =20
> -SRC_URI_append_virtclass-native =3D " file://no-demos.patch \
> -"
>  SRC_URI_append =3D "file://gtk-dnd-grab-deadlock-fix.patch \
>  		  file://cross-nm.patch \
>  		  file://xkb-ifdef.patch \
> +		  file://no-demos.patch \

I guess this was because demos were working for target case and were
intentionally disabled only for native..

>  		 "
> =20
>  SRC_URI[gtk.md5sum] =3D "53e6f3a93bd22934878fc4a4a34c68aa"
> --=20
> 1.7.10
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4Y142/9l9nQlBiaj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/gDjwACgkQN1Ujt2V2gBzQRwCfTlJYiHRQ/7+yfFd95x+aW38x
pLkAn0ocm9nH1GjZ4oGO5weLOXESg4gY
=nlHf
-----END PGP SIGNATURE-----

--4Y142/9l9nQlBiaj--
