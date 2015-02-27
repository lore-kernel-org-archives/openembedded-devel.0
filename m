Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 8F835718DD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 07:07:22 +0000 (UTC)
Received: by wggy19 with SMTP id y19so17764434wgg.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Feb 2015 23:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=P+mPPsEBK5q4SnFr4yymvu/AUITgu5JSR5vnYd1Jeis=;
	b=zp+dBeoaTTiSyLcWc1mF9B1POkdyRkQ/Zkpw4depwS9eAAaCYF0zqWC16kuYg5HZO3
	8vTMwwquOtOrbhtudbJhTPWJsqLnlpg2UbSmmP0ZpyqT4344pjHrPROFtnLS9iLGAv0b
	4tDKHn5RuLthGs6KpERMXMP4oYaRDfo+MQMQFWxVVo0DCgKyZ24LvPqh7q/YOVe/jpN4
	TEa1WHJVFtCQ/YC4y5r905gGGDqK/8x3CI7rtnnr3DKz7OCi7XXmINRFSynDIYaEzbe4
	4zCpCu0ECTGI60xhjvW4WuajiinwKvREDA1a1hKA7gYd4CM2vno+P2lICyhnEM9/ntI2
	W2fg==
X-Received: by 10.180.189.35 with SMTP id gf3mr3462217wic.5.1425020842976;
	Thu, 26 Feb 2015 23:07:22 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fo8sm1469501wib.14.2015.02.26.23.07.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Feb 2015 23:07:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 27 Feb 2015 08:07:40 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150227070740.GC2309@jama>
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
X-List-Received-Date: Fri, 27 Feb 2015 07:07:23 -0000
X-Groupsio-MsgNum: 54517
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/Uq4LBwYP4y1W6pO"
Content-Disposition: inline

--/Uq4LBwYP4y1W6pO
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
>=20
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

I'll drop PR when cherry-picking to master-next.

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

--/Uq4LBwYP4y1W6pO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTwF7wACgkQN1Ujt2V2gByVkQCfdYEhzPngzFoledfF9WU6TRmC
RQ4AnjbtfEKxZJHI6Ich4yNO4ZPxfvVx
=dcmH
-----END PGP SIGNATURE-----

--/Uq4LBwYP4y1W6pO--
