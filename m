Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 76D1865C7B
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Mar 2015 06:19:05 +0000 (UTC)
Received: by wevm14 with SMTP id m14so27476526wev.8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Feb 2015 22:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=MIrBbwczDMbXMAfR8jDFqlgKRVAwM8O1tnS13L5pXSA=;
	b=QFzCB8M+CPwLu+b4lrIUmsd/2a88tjXIqFcrK8kWVYojBK+vULB7ctKcdmManNCc0T
	wc8O7j21y1aZRXxn2PQ9FZd6gWpAGkvk4fdz6HDg0OCHe1BvtiNp8SepeisHi6aoQx/T
	ko3sjWyV6c+FgeXGOOtwXp9hxegzrrLEOsGRhfjVvaGRMuWEGSbdsYn57stSlTWJ7rFb
	K8oNfGkeWfWlRsP9c/PxvkEuGVwNm1Xf58qI+LtvSot2nX/cv/Vki75cz6ueugMv93cl
	1TSmDFMpzoxVkX5G+B5R4KNnHqktok8MZ5vsdiIr7WBdob9BuLM7UK8uCSNcXden9oQO
	We5w==
X-Received: by 10.194.193.9 with SMTP id hk9mr46453513wjc.42.1425190746472;
	Sat, 28 Feb 2015 22:19:06 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	b4sm10087677wic.2.2015.02.28.22.19.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 28 Feb 2015 22:19:05 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 1 Mar 2015 07:19:27 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150301061927.GR2309@jama>
References: <1424512336-47007-1-git-send-email-sven.ebenfeld@gmail.com>
	<1424512336-47007-4-git-send-email-sven.ebenfeld@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1424512336-47007-4-git-send-email-sven.ebenfeld@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH 3/7] libgee: Update to Version 0.16.1
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
X-List-Received-Date: Sun, 01 Mar 2015 06:19:09 -0000
X-Groupsio-MsgNum: 54560
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="brdEIFGMNIjz5YJG"
Content-Disposition: inline

--brdEIFGMNIjz5YJG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 21, 2015 at 10:52:11AM +0100, Sven Ebenfeld wrote:
> ---
>  meta-oe/recipes-devtools/libgee/libgee_0.16.1.bb | 10 ++++++++++
>  meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb  | 10 ----------
>  2 files changed, 10 insertions(+), 10 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/libgee/libgee_0.16.1.bb
>  delete mode 100644 meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb

be aware that this change breaks some components, because libgee's
pkgconfig file was renamed from gee-1.0 to gee-0.8 in
https://github.com/GNOME/libgee/commit/e6fc195b449f1462bd6eea962799b814ad2c=
519b

> diff --git a/meta-oe/recipes-devtools/libgee/libgee_0.16.1.bb b/meta-oe/r=
ecipes-devtools/libgee/libgee_0.16.1.bb
> new file mode 100644
> index 0000000..b761b26
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/libgee/libgee_0.16.1.bb
> @@ -0,0 +1,10 @@
> +require libgee.inc
> +PE =3D "1"
> +PR =3D "${INC_PR}.2"
> +DEPENDS +=3D "gobject-introspection-stub"
> +DEPENDS_virtclass-native +=3D "gobject-introspection-stub-native"
> +
> +SHRT_VER =3D "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).spl=
it('.')[1]}"
> +SRC_URI =3D "http://ftp.gnome.org/pub/GNOME/sources/libgee/${SHRT_VER}/$=
{BP}.tar.xz"
> +SRC_URI[md5sum] =3D "d30cf203784431b0fdc3216b1acd999c"
> +SRC_URI[sha256sum] =3D "d95f8ea8e78f843c71b1958fa2fb445e4a325e4821ec23d0=
d5108d8170e564a5"
> diff --git a/meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb b/meta-oe/re=
cipes-devtools/libgee/libgee_0.6.4.bb
> deleted file mode 100644
> index fbd1466..0000000
> --- a/meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -require libgee.inc
> -PE =3D "1"
> -PR =3D "${INC_PR}.2"
> -DEPENDS +=3D "gobject-introspection-stub"
> -DEPENDS_virtclass-native +=3D "gobject-introspection-stub-native"
> -
> -SHRT_VER =3D "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).spl=
it('.')[1]}"
> -SRC_URI =3D "http://ftp.gnome.org/pub/GNOME/sources/libgee/${SHRT_VER}/$=
{BP}.tar.xz"
> -SRC_URI[md5sum] =3D "a32bf498cf33d5e3417823a7b252ad22"
> -SRC_URI[sha256sum] =3D "55f39f3b28e676f6cbd9377d83edd031084436a4da41280a=
9503c94faffb1665"
> --=20
> 1.9.3
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--brdEIFGMNIjz5YJG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTyr28ACgkQN1Ujt2V2gBwJJQCfQBKNP2meJjgBAoAO9p0KVghu
k4kAnR/koqPJDoRnXxSddKnfjW9eVc8u
=jMHS
-----END PGP SIGNATURE-----

--brdEIFGMNIjz5YJG--
