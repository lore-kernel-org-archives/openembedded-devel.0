Return-Path: <uol@pengutronix.de>
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
	[85.220.165.71])
	by mail.openembedded.org (Postfix) with ESMTP id 9A23E7E7D4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2019 15:50:12 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps
	(TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1hgWf7-0006Wy-1u; Thu, 27 Jun 2019 17:50:13 +0200
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1hgWf0-00078d-BB; Thu, 27 Jun 2019 17:50:06 +0200
References: <20190627133859.6843-1-u.oelmann@pengutronix.de>
User-agent: mu4e 1.1.0; emacs 26.1
From: Ulrich =?utf-8?Q?=C3=96lmann?= <u.oelmann@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
In-reply-to: <20190627133859.6843-1-u.oelmann@pengutronix.de>
Date: Thu, 27 Jun 2019 17:50:06 +0200
Message-ID: <6rtvcbvxht.fsf@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
Cc: Maksim Sisov <msisov@igalia.com>,
	Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>,
	=?utf-8?Q?S=C3=B8ren?= Andersen <san@skov.dk>
Subject: Re: [meta-browser][PATCH] chromium-ozone-wayland: Stop depending on the system's wayland-scanner binary
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Jun 2019 15:50:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi maintainers of meta-browser,

looking back in the mailing-list archives I got the impression that
meta-browser's development does not really take place here anymore these
days, but is pushed on on GitHub. Hence I prepared a pull request of
this thread's patch and would like to ask for review:

  https://github.com/OSSystems/meta-browser/pull/278

Best regards
Ulrich

On Thu, Jun 27 2019 at 15:38 +0200, Ulrich =C3=96lmann <u.oelmann@pengutron=
ix.de> wrote:
> This commit re-applies the changes of the commit given below to the curre=
nt
> chromium-ozone-wayland recipe as they got lost in the meantime.
>
> | commit cd88d7be61bc39726b8ecf7ddc19e6942bcf8cb4
> | Author: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
> | Date:   Thu May 2 12:08:54 2019 +0200
> |
> |     chromium-ozone-wayland: Stop depending on the system's wayland-scan=
ner
> |     binary
> |
> |     So far, we were using Chromium's default GN path for the system
> |     wayland-scanner binary, "/usr/bin/wayland-scanner", which may not b=
e present
> |     at all and which should never be used anyway. Instead, we now point=
 to the
> |     version built by the wayland-native recipe.
> |
> |     Doing so of course requires depending on wayland-native in the firs=
t place,
> |     and that requires adding back REQUIRED_DISTRO_FEATURES and a DEPEND=
S block
> |     that got removed with no explanation when the recipe was updated to
> |     M72 (commit 97876fab, "chromium: Update to 72.0.3626.81").
> |
> |     Fixes #241
> |
> |     Signed-off-by: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.c=
om>
>
> Fixes: 1f363e25cb7d ("chromium: Update to 74.0.3729.131")
> Signed-off-by: Ulrich =C3=96lmann <u.oelmann@pengutronix.de>
> ---
>  .../chromium/chromium-ozone-wayland_75.0.3770.100.bb   | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/recipes-browser/chromium/chromium-ozone-wayland_75.0.3770.10=
0.bb b/recipes-browser/chromium/chromium-ozone-wayland_75.0.3770.100.bb
> index 22afa52aec20..1e4ed2958d2d 100644
> --- a/recipes-browser/chromium/chromium-ozone-wayland_75.0.3770.100.bb
> +++ b/recipes-browser/chromium/chromium-ozone-wayland_75.0.3770.100.bb
> @@ -31,6 +31,15 @@ SRC_URI +=3D " \
>          file://0001-ozone-wayland-Fix-method-prototype-match.patch \
>  "
>
> +REQUIRED_DISTRO_FEATURES =3D "wayland"
> +
> +DEPENDS +=3D "\
> +        libxkbcommon \
> +        virtual/egl \
> +        wayland \
> +        wayland-native \
> +"
> +
>  # Chromium can use v4l2 device for hardware accelerated video decoding. =
Make sure that
>  # /dev/video-dec exists.
>  PACKAGECONFIG[use-linux-v4l2] =3D "use_v4l2_codec=3Dtrue use_v4lplugin=
=3Dtrue use_linux_v4l2_only=3Dtrue"
> @@ -42,6 +51,7 @@ GN_ARGS +=3D "\
>          ozone_platform_headless=3Dtrue \
>          ozone_platform_wayland=3Dtrue \
>          ozone_platform_x11=3Dfalse \
> +        system_wayland_scanner_path=3D"${STAGING_BINDIR_NATIVE}/wayland-=
scanner" \
>          use_xkbcommon=3Dtrue \
>          use_system_libwayland=3Dtrue \
>          use_system_minigbm=3Dtrue \
--=20
Pengutronix e.K.                           | Ulrich =C3=96lmann            =
   |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

