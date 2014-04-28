Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0633565D7D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Apr 2014 04:05:06 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id d17so4387770eek.15
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Apr 2014 21:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1eSE0cKSoZ0PdiDC3DQiOy6ikRv7OVvl8hBc6xzn0gs=;
	b=hBwXLA8N7/i/BZQal4l95ZBD9wxL2BqSWW2hSt/jHfenJPaMkfxUuZBySd5dTz5ZYy
	JoaIj/A77fTORaPH5PmSJPTw/RUfg1e45clxoDP7cWBgj3rFYpHkc8lVzssV0wL7bQRN
	BWf7TeU9E0XEE3DtrgsdmfnZao6/uolhU9n5L998x/IegSWPrgqr4NpL5o43TNHb5Ipc
	eY5xEio6jEpffwF7wNAedxvF8OS7K6HQziof4YQpiy9A406lP6GUGi3PEgcVqLPkHFQw
	id/YR4o/IrVQh2aW61Bv5PO4PzmMoA+JsLFHIgRJle7zLNrcQf/add2yWU3ltvamknsV
	E1lQ==
X-Received: by 10.14.4.201 with SMTP id 49mr29771227eej.13.1398657906999;
	Sun, 27 Apr 2014 21:05:06 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	t4sm46765923eeb.29.2014.04.27.21.05.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 27 Apr 2014 21:05:05 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 28 Apr 2014 06:05:18 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140428040518.GI2486@jama>
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
X-List-Received-Date: Mon, 28 Apr 2014 04:05:09 -0000
X-Groupsio-MsgNum: 49559
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JTJq4mKM0qXghaEa"
Content-Disposition: inline

--JTJq4mKM0qXghaEa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 27, 2014 at 01:21:47PM +0200, Carlos Rafael Giani wrote:
> This set of patches extends the chromium recipe to allow for EGL&GLESv2 b=
ased 2D rendering,
> considerably improving performance. This also adds hardware-accelerated W=
ebGL support.
>=20
> Three new PACKAGECONFIG for chromium are introduced:

Also fails when PACKAGECONFIG is empty:

+ tee -a log.world.20140428_030644.log/bitbake.world.log
NOTE: Started PRServer with DBfile: /home/jenkins/oe/shr-core-branches/shr-=
core/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 52990, PID: 32499
Parsing recipes...ERROR: Error executing a python function in <code>:

The stack trace of python calls that resulted in this exception/failure was:
File: '<code>', lineno: 9, function: <module>
     0005:__anon_247__home_jenkins_oe_shr_core_branches_shr_core_openembedd=
ed_core_meta_classes_package_ipk_bbclass(d)
     0006:__anon_20__home_jenkins_oe_shr_core_branches_shr_core_openembedde=
d_core_meta_classes_debian_bbclass(d)
     0007:__anon_33__home_jenkins_oe_shr_core_branches_shr_core_openembedde=
d_core_meta_classes_devshell_bbclass(d)
     0008:__anon_80__home_jenkins_oe_shr_core_branches_shr_core_openembedde=
d_core_meta_classes_sstate_bbclass(d)
 *** 0009:__anon_46__home_jenkins_oe_shr_core_branches_shr_core_meta_browse=
r_recipes_browser_chromium_chromium_35_0_1883_0_bb(d)
File: '__anon_46__home_jenkins_oe_shr_core_branches_shr_core_meta_browser_r=
ecipes_browser_chromium_chromium_35_0_1883_0_bb', lineno: 3, function: __an=
on_46__home_jenkins_oe_shr_core_branches_shr_core_meta_browser_recipes_brow=
ser_chromium_chromium_35_0_1883_0_bb
     0001:def __anon_46__home_jenkins_oe_shr_core_branches_shr_core_meta_br=
owser_recipes_browser_chromium_chromium_35_0_1883_0_bb(d):
     0002:    pkgconfig =3D d.getVar('PACKAGECONFIG', True)
 *** 0003:    if 'use-egl' in pkgconfig.split():
     0004:        d.appendVar("DEPENDS", " virtual/egl virtual/libgles2")
     0005:
Exception: AttributeError: 'NoneType' object has no attribute 'split'

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

--JTJq4mKM0qXghaEa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNd034ACgkQN1Ujt2V2gBxy8QCgplR1Tl3aEXgrm2yQ/amijtla
OPsAn1f9Bgf4KLZ+rcgti3kmiOZvwcfB
=1hfX
-----END PGP SIGNATURE-----

--JTJq4mKM0qXghaEa--
