Return-Path: <herve.jourdain@neuf.fr>
Received: from smtp26.services.sfr.fr (smtp26.services.sfr.fr [93.17.128.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6A9FA71B0B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Feb 2017 12:47:04 +0000 (UTC)
Received: from nbhjo (1-160-246-189.dynamic.hinet.net [1.160.246.189])
	by msfrf2630.sfr.fr (SMTP Server) with ESMTP id E37B71C000435;
	Thu,  2 Feb 2017 13:46:58 +0100 (CET)
Received: from nbhjo (1-160-246-189.dynamic.hinet.net [1.160.246.189])	(using
	TLSv1.2
	with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))	(No client
	certificate requested)	(Authenticated sender: herve.jourdain@neuf.fr)
	by msfrf2630.sfr.fr (SMTP Server) with ESMTPSA;
	Thu,  2 Feb 2017 13:46:55 +0100 (CET)
Authentication-Results: sfr.fr; auth=pass (LOGIN)
	smtp.auth=herve.jourdain@neuf.fr
From: Herve Jourdain <herve.jourdain@neuf.fr>
To: 'Jacobo Aragunde =?iso-8859-1?q?P=E9rez=27?= <jaragunde@igalia.com>,
	openembedded-devel@lists.openembedded.org
References: <1486037824-303-1-git-send-email-jaragunde@igalia.com>
	<417f4579-bbbf-2996-ed75-9a9b3fc71a35@igalia.com>
In-Reply-To: <417f4579-bbbf-2996-ed75-9a9b3fc71a35@igalia.com>
Date: Thu, 2 Feb 2017 13:46:52 +0100
Message-ID: <021701d27d52$70efce00$52cf6a00$@neuf.fr>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQJcID7w8mOVe5K6ogRpHEKgUvp1JwI3Cis7oDCrmZA=
X-sfr-mailing: LEGIT
Cc: otavio@ossystems.com.br
Subject: Re: [meta-browser][PATCH] chromium-wayland: fix compilation problem on non-X11 builds
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
X-List-Received-Date: Thu, 02 Feb 2017 12:47:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: fr

Hi Jacobo,

I'm using "master", and I do have patches for enabling armv7ve. But =
since they're needed only for raspberrypi, I planned to submit them only =
for meta-raspberrypi.
If you think it could be useful in meta-browser, though, I can submit =
them there.

Cheers,
Herve

-----Original Message-----
From: Jacobo Aragunde P=C3=A9rez [mailto:jaragunde@igalia.com]=20
Sent: jeudi 2 f=C3=A9vrier 2017 13:30
To: openembedded-devel@lists.openembedded.org
Cc: otavio@ossystems.com.br; Herve Jourdain <herve.jourdain@neuf.fr>
Subject: Re: [meta-browser][PATCH] chromium-wayland: fix compilation =
problem on non-X11 builds

Thank you all for your reviews. This should be the last patch, it =
addresses Herve's problem when building on a Raspberry Pi.

Unfortunately, I haven't been able to reproduce his problem myself, but =
this patch is actually a backport of an upstream patch, so it makes no =
harm in my opinion.

Another question, are you using krogoth in you rpi build? I found =
problems with the declared architecture in releases newer than jethro, =
it is called "armv7ve" and chromium doesn't build because it expects =
"armv7a". We could use a patch if you have worked around this problem :)

Thanks again,
--
Jacobo Aragunde
Software Engineer at Igalia


On 02/02/17 13:17, Jacobo Aragunde P=C3=A9rez wrote:
> Certain build configurations enable a code path that includes
> keyboard_code_conversion_xkb.cc, but it eventually fails in non-X11
> environments because of a missing patch that is present upstream.
>=20
> This commit adds the missing patch from
> https://codereview.chromium.org/2239833003
>=20
> There are two versions of the patch in the code review URL above.
> The first version fixes the problem both under the gyp and GN build
> systems. That patch was rejected because gyp is considered deprecated
> upstream. The second version fixes the problem only on GN and it was
> merged upstream. We are picking the first version because our recipes
> still use gyp to build.
>=20
> Signed-off-by: Jacobo Aragunde P=C3=A9rez <jaragunde@igalia.com>
> ---
>  .../chromium/chromium-wayland_53.0.2785.143.bb     |  1 +
>  .../fix-non-x11-build-when-use_xkbcommon-1.patch   | 51 =
++++++++++++++++++++++
>  2 files changed, 52 insertions(+)
>  create mode 100644 =
recipes-browser/chromium/chromium/chromium-wayland/fix-non-x11-build-when=
-use_xkbcommon-1.patch
>=20
> diff --git =
a/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb =
b/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
> index a75918b..ef913a7 100644
> --- a/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
> +++ b/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
> @@ -13,6 +13,7 @@ SRC_URI +=3D "\
>          =
file://chromium-wayland/0011-Replace-readdir_r-with-readdir.patch \
>          file://chromium-wayland/remove-Werror.patch \
>          =
file://chromium-wayland/guard-x11_desktop_handler-inclusion.patch \
> +        =
file://chromium-wayland/fix-non-x11-build-when-use_xkbcommon-1.patch \
>          ${@bb.utils.contains('PACKAGECONFIG', 'component-build', =
'file://component-build.gypi', '', d)} \
>          ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', =
'file://0001-Remove-accelerated-Canvas-support-from-blacklist.patch', =
'', d)} \
>  "
> diff --git =
a/recipes-browser/chromium/chromium/chromium-wayland/fix-non-x11-build-wh=
en-use_xkbcommon-1.patch =
b/recipes-browser/chromium/chromium/chromium-wayland/fix-non-x11-build-wh=
en-use_xkbcommon-1.patch
> new file mode 100644
> index 0000000..976ece9
> --- /dev/null
> +++ =
b/recipes-browser/chromium/chromium/chromium-wayland/fix-non-x11-build-wh=
en-use_xkbcommon-1.patch
> @@ -0,0 +1,51 @@
> +From: jbriance <jbriance@cisco.com>
> +Subject: keycodes: Fix non-X11 build when use_xkbcommon=3D1
> +
> +Since M51, ui/events/keycodes/xkb_keysym.h follows X11 path, even if
> +use_xkbcommon=3D1 is set because USE_XKBCOMMON is not defined, =
leading
> +to the following compilation error in this case:
> +
> +  In file included from =
../../ui/events/keycodes/keyboard_code_conversion_xkb.h:12:0,
> +                   from =
../../ui/events/keycodes/keyboard_code_conversion_xkb.cc:5:
> +  ../../ui/events/keycodes/xkb_keysym.h:19:19: fatal error: X11/X.h: =
No such file or directory
> +
> +BUG=3Dnone
> +
> +Review-Url: https://codereview.chromium.org/2239833003
> +--
> +
> +Index: ui/events/keycodes/BUILD.gn
> +diff --git a/ui/events/keycodes/BUILD.gn =
b/ui/events/keycodes/BUILD.gn
> +index =
4f2d47c2497d321332c79d0dd4e9007b50c319c7..716c7ed17cc8049ea65b95a5062e7c6=
e0adc6e48 100644
> +--- a/ui/events/keycodes/BUILD.gn
> ++++ b/ui/events/keycodes/BUILD.gn
> +@@ -17,6 +17,10 @@ source_set("xkb") {
> +     "//base",
> +     "//ui/events:dom_keycode_converter",
> +   ]
> ++
> ++  if (use_xkbcommon) {
> ++    defines =3D [ "USE_XKBCOMMON" ]
> ++  }
> + }
> +=20
> + if (use_x11 || ozone_platform_x11) {
> +Index: ui/events/keycodes/events_keycodes.gyp
> +diff --git a/ui/events/keycodes/events_keycodes.gyp =
b/ui/events/keycodes/events_keycodes.gyp
> +index =
b0796b4e2ead8bffe88fb01ed136814be505d967..248e961bad2ad3996ca99624b6c489c=
7835f6241 100644
> +--- a/ui/events/keycodes/events_keycodes.gyp
> ++++ b/ui/events/keycodes/events_keycodes.gyp
> +@@ -21,6 +21,13 @@
> +         'scoped_xkb.h',
> +         'xkb_keysym.h',
> +       ],
> ++      'conditions': [
> ++        ['use_xkbcommon=3D=3D1', {
> ++          'defines': [
> ++            'USE_XKBCOMMON',
> ++          ],
> ++        }],
> ++      ],
> +     },
> +   ],
> +   'conditions': [
>=20


