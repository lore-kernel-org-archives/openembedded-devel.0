Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B392ED1951C
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 20:51:19 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31648.1769460672117529928
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jan 2026 12:51:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout10.t-online.de (Postfix) with SMTP id B161038B3C;
	Mon, 26 Jan 2026 21:51:09 +0100 (CET)
Received: from [192.168.178.36] ([79.219.236.230]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vkTY3-0BzYFE0; Mon, 26 Jan 2026 21:50:59 +0100
Date: Mon, 26 Jan 2026 21:50:53 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-python][PATCH] rygel: remove x11 from
 REQUIRED_DISTRO_FEATURES
To: t.f.g.geelen@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <TKOH9T.PWS6VF8I6ASD3@t-online.de>
In-Reply-To: <20260126204144.2576530-1-t.f.g.geelen@gmail.com>
References: <20260126204144.2576530-1-t.f.g.geelen@gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-Zfr75XhmJC3F2qt7zcXX"
X-TOI-EXPURGATEID: 150726::1769460659-E17D3C6F-E6C93DF6/0/0 CLEAN NORMAL
X-TOI-MSGID: 0b866d77-4be0-45d4-91ba-93d05c9bf6b1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 20:51:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123891

--=-Zfr75XhmJC3F2qt7zcXX
Content-Type: text/plain; charset=us-ascii; format=flowed

Are you sure about this? Without having x11 in DISTRO_FEATURES I see:
| Run-time dependency x11 found: NO (tried pkgconfig)
|
| ../sources/rygel-45.0/src/rygel/meson.build:9:80: ERROR: Dependency 
"x11" not found, tried pkgconfig
|
| A full log can be found at 
/home/flk/bitbake-builds/poky/build/tmp/work/corei7-64-poky-linux/rygel/45.0/build/meson-logs/meson-log.txt
|
| Last 10 lines of meson-log.txt:
| Package x11 was not found in the pkg-config search path.
| Perhaps you should add the directory containing `x11.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'x11' found
| -----------
| CMake binary for host machine is cached as not found
| Dependency lookup for x11 with method 'cmake' failed: CMake binary 
for machine host machine not found. Giving up.
| Run-time dependency x11 found: NO (tried pkgconfig)
|
| ../sources/rygel-45.0/src/rygel/meson.build:9:80: ERROR: Dependency 
"x11" not found, tried pkgconfig
|
| ERROR: meson setup failed


<https://gitlab.gnome.org/GNOME/rygel/-/blob/master/src/rygel/meson.build?ref_type=heads#L9>

On Mon, Jan 26 2026 at 21:41:44 +01:00:00, Tom Geelen via 
lists.openembedded.org <t.f.g.geelen=gmail.com@lists.openembedded.org> 
wrote:
> Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com 
> <mailto:t.f.g.geelen@gmail.com>>
> ---
>  meta-multimedia/recipes-connectivity/rygel/rygel_45.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_45.0.bb 
> b/meta-multimedia/recipes-connectivity/rygel/rygel_45.0.bb
> index 60a79f5fb3..97948d896f 100644
> --- a/meta-multimedia/recipes-connectivity/rygel/rygel_45.0.bb
> +++ b/meta-multimedia/recipes-connectivity/rygel/rygel_45.0.bb
> @@ -18,7 +18,7 @@ RRECOMMENDS:${PN} = "rygel-plugin-media-export"
>  inherit gnomebase features_check vala gobject-introspection gettext 
> systemd
> 
>  # gobject-introspection is mandatory for libmediaart-2.0 and cannot 
> be configured
> -REQUIRED_DISTRO_FEATURES = "gobject-introspection-data x11"
> +REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
> 
>  SRC_URI[archive.sha256sum] = 
> "82667b902fc0672e64cf91eb727a70137a8fdfe7a3d9a4c158b0f4b1fc700882"
> 
> --
> 2.43.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123890): 
> <https://lists.openembedded.org/g/openembedded-devel/message/123890>
> Mute This Topic: <https://lists.openembedded.org/mt/117476818/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-Zfr75XhmJC3F2qt7zcXX
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>Are you sure about this? Without h=
aving x11 in DISTRO_FEATURES I see:</div><div><div>| Run-time dependency x1=
1 found: NO (tried pkgconfig)</div><div>|</div><div>| ../sources/rygel-45.0=
/src/rygel/meson.build:9:80: ERROR: Dependency "x11" not found, tried pkgco=
nfig</div><div>|</div><div>| A full log can be found at /home/flk/bitbake-b=
uilds/poky/build/tmp/work/corei7-64-poky-linux/rygel/45.0/build/meson-logs/=
meson-log.txt</div><div>|</div><div>| Last 10 lines of meson-log.txt:</div>=
<div>| Package x11 was not found in the pkg-config search path.</div><div>|=
 Perhaps you should add the directory containing `x11.pc'</div><div>| to th=
e PKG_CONFIG_PATH environment variable</div><div>| No package 'x11' found</=
div><div>| -----------</div><div>| CMake binary for host machine is cached =
as not found</div><div>| Dependency lookup for x11 with method 'cmake' fail=
ed: CMake binary for machine host machine not found. Giving up.</div><div>|=
 Run-time dependency x11 found: NO (tried pkgconfig)</div><div>|</div><div>=
| ../sources/rygel-45.0/src/rygel/meson.build:9:80: ERROR: Dependency "x11"=
 not found, tried pkgconfig</div><div>|</div><div>| ERROR: meson setup fail=
ed</div></div><div><br></div><div><br></div><div><a href=3D"https://gitlab.=
gnome.org/GNOME/rygel/-/blob/master/src/rygel/meson.build?ref_type=3Dheads#=
L9">https://gitlab.gnome.org/GNOME/rygel/-/blob/master/src/rygel/meson.buil=
d?ref_type=3Dheads#L9</a></div></div><div id=3D"geary-quote" dir=3D"auto"><=
br>On Mon, Jan 26 2026 at 21:41:44 +01:00:00, Tom Geelen via lists.openembe=
dded.org &lt;t.f.g.geelen=3Dgmail.com@lists.openembedded.org&gt; wrote:<br>=
<blockquote type=3D"cite"><div class=3D"plaintext" style=3D"white-space: br=
eak-spaces;">Signed-off-by: Tom Geelen &lt;<a href=3D"mailto:t.f.g.geelen@g=
mail.com">t.f.g.geelen@gmail.com</a>&gt;
---
 meta-multimedia/recipes-connectivity/rygel/rygel_45.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_45.0.bb b/met=
a-multimedia/recipes-connectivity/rygel/rygel_45.0.bb
index 60a79f5fb3..97948d896f 100644
--- a/meta-multimedia/recipes-connectivity/rygel/rygel_45.0.bb
+++ b/meta-multimedia/recipes-connectivity/rygel/rygel_45.0.bb
@@ -18,7 +18,7 @@ RRECOMMENDS:${PN} =3D "rygel-plugin-media-export"
 inherit gnomebase features_check vala gobject-introspection gettext system=
d
=20
 # gobject-introspection is mandatory for libmediaart-2.0 and cannot be con=
figured
-REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data x11"
+REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
=20
 SRC_URI[archive.sha256sum] =3D "82667b902fc0672e64cf91eb727a70137a8fdfe7a3=
d9a4c158b0f4b1fc700882"
=20
<div>--=20
</div>2.43.0

</div><div class=3D"plaintext" style=3D"white-space: break-spaces;">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#123890): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/123890">https://lists.openembedded.org/g/openembed=
ded-devel/message/123890</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117476818/361=
8223">https://lists.openembedded.org/mt/117476818/3618223</a>
Group Owner: <a href=3D"mailto:openembedded-devel+owner@lists.openembedded.=
org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a h=
ref=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div>
--=-Zfr75XhmJC3F2qt7zcXX--


