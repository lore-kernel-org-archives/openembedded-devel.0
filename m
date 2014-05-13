Return-Path: <schnitzeltony@googlemail.com>
X-Greylist: delayed 412 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 13 May 2014 00:23:58 UTC
Received: from mail-ve0-f179.google.com (unknown [209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id 211B860173
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 00:23:58 +0000 (UTC)
Received: by mail-ve0-f179.google.com with SMTP id oy12so9911683veb.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 May 2014 17:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=jS+8Vh3HBcQZ8oZdO9a8RBQAVYWsAUObt2Updpcftl8=;
	b=sMjKfEouMPwVqEeFJuuYUm4to/p3KFaBbL7ns72p1XH2UWdZggU7vo08PXczbYVuBt
	IAoHEvTkdz+JnPBv4TG8Y769Vah7J1bhY4LuI9MFExfkFxN5mEhlHIXBOb8xLDS//tSr
	0kAH/GI53t+4vNMCQ0+6RB2nNIkaIPhHpQFMrwtNSwM6KqYJocfXiKcKTUuCVN2nIJmO
	RaoxU633FhOWzVc6vLUSgj8v0Esl9qG+QCRZH1NQT2989AMbcvYmyDnDQFQqlhq7TzDk
	EwNtDohue9lc5VX6WGmu842nHSXFo7La3D7uI88UNLNCr+wnorGKo+CSHnk2lf0+bBqU
	F+2Q==
MIME-Version: 1.0
X-Received: by 10.52.227.138 with SMTP id sa10mr21720382vdc.25.1399940227115; 
	Mon, 12 May 2014 17:17:07 -0700 (PDT)
Received: by 10.52.80.226 with HTTP; Mon, 12 May 2014 17:17:07 -0700 (PDT)
In-Reply-To: <1399887698-19336-4-git-send-email-schnitzeltony@googlemail.com>
References: <1399887698-19336-1-git-send-email-schnitzeltony@googlemail.com>
	<1399887698-19336-4-git-send-email-schnitzeltony@googlemail.com>
Date: Tue, 13 May 2014 02:17:07 +0200
Message-ID: <CALbNGRTX4xmQL_-xgQutMkZJsw2Npq9gWaQoFNVSBDy0RFYaOg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [RFC][meta-qt5 3/3] qtwayland: install created private headers
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
X-List-Received-Date: Tue, 13 May 2014 00:24:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2014 at 11:41 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> buildhistory diff:
> --- a/packages/armv7at2hf-vfp-neon-angstrom_wl-linux-gnueabi/qtwayland/qt=
wayland-dev/latest
> +++ b/packages/armv7at2hf-vfp-neon-angstrom_wl-linux-gnueabi/qtwayland/qt=
wayland-dev/latest
> @@ -4,6 +4,6 @@ PKGV =3D 5.2.1+git0+f9ebbd6c61
>  RPROVIDES =3D
>  RDEPENDS =3D qtwayland
>  RRECOMMENDS =3D eglibc-dev libgcc-dev libstdc++-dev libxkbcommon-dev qtb=
ase-dev qtdeclarative-dev wayland-dev xproto-dev zlib-dev
> -PKGSIZE =3D 295533
> +PKGSIZE =3D 537651
>  FILES =3D /usr/include /lib/lib*.so /usr/lib/lib*.so /usr/lib/*.la /usr/=
lib/*.o /usr/lib/pkgconfig /usr/share/pkgconfig /usr/share/aclocal /lib/*.o=
 /usr/lib/qtwayland/*.la /lib/*.la
> -FILELIST =3D /usr/include/qt5/QtCompositor/5.3.0/QtCompositor/private/qw=
lclientbufferintegration_p.h /usr/include/qt5/QtCompositor/5.3.0/QtComposit=
or/private/qwlclientbufferintegrat
> +FILELIST =3D /usr/include/qt5/QtCompositor/5.3.0/QtCompositor/private/qw=
ayland-server-hardware-integration.h /usr/include/qt5/QtCompositor/5.3.0/Qt=
Compositor/private/qwayland-server
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  recipes-qt/qt5/qtwayland_git.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_g=
it.bb
> index ebdda82..8da8249 100644
> --- a/recipes-qt/qt5/qtwayland_git.bb
> +++ b/recipes-qt/qt5/qtwayland_git.bb
> @@ -9,3 +9,8 @@ SRCREV =3D "f9ebbd6c618488f9b671f5504528ced3350754fb"
>  SRC_URI +=3D " \
>      file://0001-examples.pro-include-server-buffer-only-when-buildin.pat=
ch \
>  "
> +
> +do_install_append() {
> +       # do install files created by qtwaylandscanner
> +       install ${B}/include/QtCompositor/5.2.1/QtCompositor/private/{qwa=
yland-server-*,*protocol*}.h ${D}${includedir}/${QT_DIR_NAME}/QtCompositor/=
5.2.1/QtCompositor/private
Aargh: Wrong directory did test with /usr/include and expected
includedir =3D /usr/include -> V2 will follow

Andreas

