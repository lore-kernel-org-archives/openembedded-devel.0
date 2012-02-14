Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rx6Vk-0008Ol-Ua
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Feb 2012 01:44:49 +0100
Received: by lahc1 with SMTP id c1so4676492lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2012 16:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=4D5pAAIYzUyScDopiSBFZO94HB7v+5IOFrKW1xpyaKM=;
	b=oaodRHzA6Vs2+eYJHvAzLCZuGkjhu6aetkJnGCmlfVRsIO/3FPoyKbqv6sl+9/tZfq
	l0vOmx/C7FfGESjO2p7aAF8GWnL1eBHqgk/Krp4YEvy7UhLE4zb+h2GXLHIDtilBDPXs
	CoNtTw5fFntgkgaLfQSmdKjlNB8CsdwFm9ooA=
MIME-Version: 1.0
Received: by 10.112.100.34 with SMTP id ev2mr6571707lbb.13.1329179798047; Mon,
	13 Feb 2012 16:36:38 -0800 (PST)
Received: by 10.112.108.164 with HTTP; Mon, 13 Feb 2012 16:36:38 -0800 (PST)
In-Reply-To: <1329164986-17671-1-git-send-email-tworaz666@gmail.com>
References: <CAK18fxFyXnwuFj-=caU3e-Dy+tGZVwgTpP7NmsZ4opWB_gJCWA@mail.gmail.com>
	<1329164986-17671-1-git-send-email-tworaz666@gmail.com>
Date: Tue, 14 Feb 2012 01:36:38 +0100
Message-ID: <CALbNGRQwHSuVpLnE+B5PZiPq5nBUd27p-bwxCs8CPcJJ4jv5WA@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/3 v2] xfce4-settings: Update to latest stable version 4.8.3.
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
X-List-Received-Date: Tue, 14 Feb 2012 00:44:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 13, 2012 at 9:29 PM, Peter Tworek <tworaz666@gmail.com> wrote:
> http://git.xfce.org/xfce/xfce4-settings/tag/?id=3Dxfce4-settings-4.8.3
>
> Run tested on netbook pro.
>
> Signed-off-by: Peter Tworek <tworaz666@gmail.com>
> ---
> =A0.../xfce4-settings/xfce4-settings_4.8.2.bb =A0 =A0 =A0 =A0 | =A0 16 --=
--------------
> =A0.../xfce4-settings/xfce4-settings_4.8.3.bb =A0 =A0 =A0 =A0 | =A0 16 ++=
++++++++++++++
> =A02 files changed, 16 insertions(+), 16 deletions(-)
> =A0delete mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-setting=
s_4.8.2.bb
> =A0create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-setting=
s_4.8.3.bb
>
> diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.8.2.b=
b b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.8.2.bb
> deleted file mode 100644
> index 258c238..0000000
> --- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.8.2.bb
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -DESCRIPTION =3D "Xfce4 settings"
> -SECTION =3D "x11/wm"
> -LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> -DEPENDS =3D "exo gtk+ libxfce4util libxfce4ui xfconf dbus-glib libxi vir=
tual/libx11 xrandr libnotify libxcursor libxklavier"
> -
> -PR =3D "r1"
> -
> -inherit xfce
> -
> -SRC_URI +=3D "file://0001-xfsettingsd-use-gnome-as-default-icon-theme.pa=
tch"
> -
> -SRC_URI[md5sum] =3D "a45420fea20f29265ab6785cb1d07377"
> -SRC_URI[sha256sum] =3D "3f79865a6a3817f3c868f2412cbf105e73e54810438f6203=
5699ae5fd72c29d0"
> -
> -RRECOMMENDS_${PN} +=3D "gnome-icon-theme"
> diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.8.3.b=
b b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.8.3.bb
> new file mode 100644
> index 0000000..2dbdd81
> --- /dev/null
> +++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.8.3.bb
> @@ -0,0 +1,16 @@
> +DESCRIPTION =3D "Xfce4 settings"
> +SECTION =3D "x11/wm"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> +DEPENDS =3D "exo gtk+ libxfce4util libxfce4ui xfconf dbus-glib libxi vir=
tual/libx11 xrandr libnotify libxcursor libxklavier"
> +
> +PR =3D "r1"
> +
> +inherit xfce
> +
> +SRC_URI +=3D "file://0001-xfsettingsd-use-gnome-as-default-icon-theme.pa=
tch"
> +
> +SRC_URI[md5sum] =3D "4669298cc8a4abf0e5a410016b575030"
> +SRC_URI[sha256sum] =3D "d878cc474e1e677e9607279b9a1007cb90ed35ff078de180=
259a8b2b8d06bc2e"
> +
> +RRECOMMENDS_${PN} +=3D "gnome-icon-theme"
> --
> 1.7.3.4
>
>
Peter & Koen: I am so sorry causing total confusion - my fault - need
more sleep: New recipes do not get a PR entry. Previous version was
perfect. Koen please take in 20695.

Andreas


