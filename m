Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Ru5ZL-0004oA-9r
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Feb 2012 18:08:03 +0100
Received: by lahc1 with SMTP id c1so2546923lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Feb 2012 09:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=YyjThudy7HvCEku/MutOpQk/9b+1H5gvtx7sFTZOGjI=;
	b=PVINgVuXzKtnJ+/ZhvPd8qrdWDamohTQkBTDmT45fIvuHbIPkP80liROcBS5IMiddp
	9q+zEbEVeJ6jW9y9Vq1c0NVKs6nWgM1E6b7xZ59qg0D/wc5SvOHheWUvMfFwPOgnrnsa
	DDq0fgn0FBiX6q6nI6i+ExsuP70SdIc+Kiau0=
MIME-Version: 1.0
Received: by 10.152.131.40 with SMTP id oj8mr7905938lab.24.1328461202247; Sun,
	05 Feb 2012 09:00:02 -0800 (PST)
Received: by 10.112.102.165 with HTTP; Sun, 5 Feb 2012 09:00:02 -0800 (PST)
In-Reply-To: <1328380249-11697-4-git-send-email-tworaz666@gmail.com>
References: <1328380249-11697-1-git-send-email-tworaz666@gmail.com>
	<1328380249-11697-4-git-send-email-tworaz666@gmail.com>
Date: Sun, 5 Feb 2012 18:00:02 +0100
Message-ID: <CALbNGRQ6m2YV5xNiD-CZoBs_OkM7YtiqG_MSkMRaAbcFARaMEw@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-xfce][PATCH 3/3] xfce4-panel: Disable building of static libraries.
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
X-List-Received-Date: Sun, 05 Feb 2012 17:08:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 4, 2012 at 7:30 PM, Peter Tworek <tworaz666@gmail.com> wrote:
> Current recipe triggers several QA warnings about non -staticdev packages
> containing .a files. The offending files are static versions of panel
> plugins. They have no actual use. They're just a byproduct. Xfce4-panel
> contains only one more library libxfce4-panel. Similary to panel plugins
> it's static version is rather useless.
>
> Disabling building of static libs makes -dev package smaller and fixes
> all QA warnings.
>
> Run tested on netbook pro.
>
> Signed-off-by: Peter Tworek <tworaz666@gmail.com>
> ---
> =A0.../recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb =A0| =A0 13 +++++---=
-----
> =A01 files changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb b/me=
ta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb
> index 0cd8eba..937b078 100644
> --- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb
> +++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb
> @@ -4,15 +4,17 @@ LICENSE =3D "GPLv2"
> =A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D26a8bd75d8f8498bdbbe64a2779=
1d4ee"
> =A0DEPENDS =3D "libxfce4util garcon libxfce4ui xfconf exo gtk+ dbus cairo=
 virtual/libx11 libxml2 libwnck"
>
> -PR =3D "r1"
> +PR =3D "r2"
>
> =A0inherit xfce
>
> +EXTRA_OECONF =3D "--disable-static"
I think hereby you disable static for the whole: panel+plugins. I
would feel better if you simply have

FILES_${PN}-staticdev +=3D "${libdir}/xfce4/panel/plugins/*.*a \

below.
> +
> =A0python populate_packages_prepend() {
> =A0 =A0 =A0 =A0plugin_dir =3D bb.data.expand('${libdir}/xfce4/panel/plugi=
ns/', d)
> =A0 =A0 =A0 =A0plugin_name =3D bb.data.expand('${PN}-plugin-%s', d)
> =A0 =A0 =A0 =A0do_split_packages(d, plugin_dir, '^lib(.*).so$', plugin_na=
me,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 '${PN} plugin for %s', =
extra_depends=3D'', prepend=3DTrue,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 '${PN} %s plugin', extr=
a_depends=3D'', prepend=3DTrue,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0aux_files_pattern=3D['=
${datadir}/xfce4/panel/plugins/%s.desktop',
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 '${sysconfdir}/xdg/xfce/panel/%s-*',
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 '${datadir}/icons/hicolor/48x48/apps/*-%s.png',
> @@ -23,12 +25,7 @@ PACKAGES_DYNAMIC =3D "${PN}-plugin-*"
>
> =A0FILES_${PN} +=3D "${libdir}/xfce4/panel/migrate \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${libdir}/xfce4/panel/wrapper"
> -
> -FILES_${PN}-dbg +=3D "${libdir}/xfce4/panel/plugins/.debug \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"
> -
> -FILES_${PN}-dev +=3D "${libdir}/xfce4/panel/plugins/*.*a \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "
> +FILES_${PN}-dbg +=3D "${libdir}/xfce4/panel/plugins/.debug"
>
> =A0SRC_URI[md5sum] =3D "9d7bf0503d5867c4044cef04bb5845b1"
> =A0SRC_URI[sha256sum] =3D "66f1266a1242ee5ecada995a4a584dd9802aa24456759b=
40b0c29227c39bed03"
> --
Regards

Andreas


