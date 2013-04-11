Received: from mail-da0-f52.google.com ([209.85.210.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UQIY9-0002EG-Nh
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Apr 2013 16:32:31 +0200
Received: by mail-da0-f52.google.com with SMTP id f10so704739dak.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Apr 2013 07:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=n5b9/Wt79lJN7q0hEGCnLEvnm2oDfN3nmq1vKB1KbNk=;
	b=QlS6TSvm2ZuynSztwDBg/7/Vr6ojia8pCfB1IsngX5cZV5fKZiROvN/8NdmACYgHW4
	v7Zlj9xlDwLcHhKcJrUa7KPxNugL0fehZ/PdJ2IGfF5lnS+uZqGNtyhmrgpLFuEdqtPw
	bhJ1kI6G5ckqufiFE9F0tu2H8LXCqo7z3HBFj5VV1KO8l9a8KJqtb/Y6Ff7L61KAP291
	VlRkiE7OPSUMwaVGQ9iWu5Fxe+Hr7EyhLFcxH2o0WhugCd6gPXqtbmucOnQsrVd5wE/l
	ciyjk0NLa/7YvCBa6GN0xlpd5f5GC/6p7ItP5wE7G5Oz7UA9EJxAEmg/lSgR7VVG6CmJ
	tZow==
X-Received: by 10.68.197.67 with SMTP id is3mr9177672pbc.104.1365689705973;
	Thu, 11 Apr 2013 07:15:05 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ew5sm4415913pbc.9.2013.04.11.07.15.03
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 11 Apr 2013 07:15:04 -0700 (PDT)
Date: Thu, 11 Apr 2013 16:14:58 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130411141458.GH2477@jama>
References: <1365670626-18585-1-git-send-email-ndec@linaro.org>
	<1365670626-18585-3-git-send-email-ndec@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1365670626-18585-3-git-send-email-ndec@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-multimedia][PATCH v2 2/2] gupnp: remove dependency on gnome-icon-theme
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
X-List-Received-Date: Thu, 11 Apr 2013 14:32:39 -0000
X-Groupsio-MsgNum: 44075
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VkqCAaSJIySsbD6j"
Content-Disposition: inline

--VkqCAaSJIySsbD6j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2013 at 10:57:06AM +0200, Nicolas Dechesne wrote:
> As discussed in [1], let's remove the dependency on gnome-icon-theme,
> since it's not required, and it brings additional unwanted dependency,
> such as the whole gtk+...

Hi, I've already applied first version of this yesterday, I don't think
we need to introduce more INC_PRs now, so for now I'll keep it as is
unless someone has good reasons for INC_PRs.

> [1] http://article.gmane.org/gmane.comp.handhelds.openembedded/57483
>=20
> It is build-tested with
>  - core-image-minimal
>  - IMAGE_INSTALL +=3D 'gupnp'
>  - directfb in DISTRO_FEATURES
>=20
> The build was failing before (GTK failed to build with directfb, which
> is expected).
>=20
> Signed-off-by: Nicolas Dechesne <ndec@linaro.org>
> ---
>  meta-multimedia/recipes-connectivity/gupnp/gupnp.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc b/meta-=
multimedia/recipes-connectivity/gupnp/gupnp.inc
> index 31dd407..99bffc0 100644
> --- a/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc
> +++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc
> @@ -2,9 +2,9 @@ SUMMARY =3D "UPnP framework"
>  DESCRIPTION =3D "GUPnP is an elegant, object-oriented open source framew=
ork for creating UPnP  devices and control points, written in C using GObje=
ct and libsoup. The GUPnP API is intended to be easy to use, efficient and =
flexible. It provides the same set of features as libupnp, but shields the =
developer from most of UPnP's internals."
>  LICENSE =3D "LGPLv2+"
> =20
> -INC_PR =3D "r0"
> +INC_PR =3D "r1"
> =20
> -DEPENDS =3D "e2fsprogs gssdp libsoup-2.4 libxml2 gnome-icon-theme gobjec=
t-introspection-stub"
> +DEPENDS =3D "e2fsprogs gssdp libsoup-2.4 libxml2 gobject-introspection-s=
tub"
> =20
>  require no-vala.inc
> =20
> --=20
> 1.8.1.2
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VkqCAaSJIySsbD6j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFmxWIACgkQN1Ujt2V2gBwQiACgrXjJ0tb+h8NR2r/LQ6KFvMHF
nqgAnApTFPqIQ/8vzXZ7ay3bEj8b46nD
=tQlF
-----END PGP SIGNATURE-----

--VkqCAaSJIySsbD6j--
