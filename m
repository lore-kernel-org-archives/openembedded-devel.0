Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 79D7065E47
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Apr 2014 03:01:24 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id c13so4338331eek.23
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Apr 2014 20:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2yIvWfHMUkkPdxONOdp0HCYrm8OrZm86WsGsGG2wpWk=;
	b=Sk7edQHJzz+GdIMqqA8xNilDIOBfK4q0Hf68ru5e6ZOk283MzxRWQZ2mkGCUgRu/Y+
	ELrYRaZEI7xQWPgoUUswocLi2fkz05/1c7sAMgZ1InzF91gbK8pbLsqG0I2AHhaTjHoQ
	TZe0g2QkUyWYgwcFOeO4UtU8NR4iMFOLumvdfuF40DuuBlROIrXWaQTMDocgB5lzoaEk
	eWtyGZpDIMMfC90jnjYOGIYToX1mf1Q5+BVh4y8YNG5l3egaxATD2wMrIEyF9QEXkTKg
	sS/4evjeX0hpq/LW3BDb7hksFaDCSJdC1xR5Nun7pI27axp7q0uHSDJJZ6+QI12o6p7R
	8rnA==
X-Received: by 10.15.60.199 with SMTP id g47mr29232021eex.37.1398654084735;
	Sun, 27 Apr 2014 20:01:24 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	q49sm46433296eem.34.2014.04.27.20.01.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 27 Apr 2014 20:01:23 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 28 Apr 2014 05:01:36 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140428030136.GH2486@jama>
References: <1398597711-17825-1-git-send-email-dv@pseudoterminal.org>
MIME-Version: 1.0
In-Reply-To: <1398597711-17825-1-git-send-email-dv@pseudoterminal.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-browser][PATCH 0/4] Introduce EGL/GLES and component build patches for Chromium
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
X-List-Received-Date: Mon, 28 Apr 2014 03:01:30 -0000
X-Groupsio-MsgNum: 49558
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9HwyI31Aj78PLmNd"
Content-Disposition: inline

--9HwyI31Aj78PLmNd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 27, 2014 at 01:21:47PM +0200, Carlos Rafael Giani wrote:
> This set of patches extends the chromium recipe to allow for EGL&GLESv2 b=
ased 2D rendering,
> considerably improving performance. This also adds hardware-accelerated W=
ebGL support.

All 4 commit messages should start with chromium:

> Three new PACKAGECONFIG for chromium are introduced:
>=20
> * "component-build" : If set, Chromium is built in component mode. Each s=
ubsystem of Chromium
>   ends up in a separate shared object. The alternative is the regular mod=
e, which links everything
>   into one big binary. Component builds are useful for development and te=
sting, and consumes
>   significantly less RAM during building. It is essential when building C=
hromium on a 32-bit OS.
>=20
> * "use-egl" : Ordinarily, Chromium will try to use GLX and regular (=3D D=
esktop) OpenGL for 2D
>   acceleration. If that fails, software rendering is used. If use-egl is =
set, it will use EGL
>   instead of GLX and OpenGL ES 2.0 instead of regular OpenGL. This is ver=
y useful if the
>   target platform provides hardware acceleration for this API. Chromium w=
ill then render all 2D
>   components as well as WebGL contents with hardware acceleration, Canvas=
 being an exception
>   (see below).
>=20
> * "ignore-lost-context" : Without this flag, HTML Canvas will not be acce=
lerated, even with the
>   "use-egl" flag set. The reason for this is a conceptual problem: HTML C=
anvas expects the
>   backing store of the canvas to persist until the web page goes away. Bu=
t if the backing store
>   is a GLES texture, then in theory the associated EGL context could get =
lost (for example, during
>   a power management cycle), and the texture along with it. This violates=
 requirements for canvas.
>   So, one has to choose: either remain fully standards compliant, and hav=
e no acceleration, or
>   have acceleration, and risk losing the Canvas content. Note that contex=
t losses do not happen on
>   all platforms (they haven't been observed with Vivante GPUs for example=
, and internals of its
>   galcore module do not show anything that could cause a lost context). B=
ut since these recipes
>   do not depend on a specific platform, this option must be explicitely e=
nabled.
>=20
> Carlos Rafael Giani (4):
>   Add component-build PACKAGECONFIG option
>   Add variable to contain extra command-line arguments
>   Add use-egl PACKAGECONFIG to let chromium use EGL automatically
>   Add ignore-lost-context PACKAGECONFIG to ignore lost EGL contexts
>=20
>  .../chromium/chromium/component-build.gypi         |  5 ++++
>  recipes-browser/chromium/chromium/google-chrome    | 11 +++++---
>  .../remove-linux-accel-canvas-from-blacklist.patch | 32 ++++++++++++++++=
++++++
>  recipes-browser/chromium/chromium_35.0.1883.0.bb   | 27 ++++++++++++++++=
--
>  4 files changed, 69 insertions(+), 6 deletions(-)
>  create mode 100644 recipes-browser/chromium/chromium/component-build.gypi
>  create mode 100644 recipes-browser/chromium/chromium/remove-linux-accel-=
canvas-from-blacklist.patch
>=20
> --=20
> 1.8.3.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9HwyI31Aj78PLmNd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNdxJAACgkQN1Ujt2V2gBzcjACcCinSV9xlYoSUJ534xDVE8uN1
POUAnioMFDUmd7tYAoQZ3+sfBLviNTYo
=X9e4
-----END PGP SIGNATURE-----

--9HwyI31Aj78PLmNd--
