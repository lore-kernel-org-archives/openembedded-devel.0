Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id D2A37770C5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 21:02:59 +0000 (UTC)
Received: by iofz202 with SMTP id z202so92582122iof.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 14:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=CrC3y8RWyrSRrK0NkYD5rwzKXqdo7VYICVS1DkctiFI=;
	b=mTwyILrS2BEDWLS0GElPszYTfVoawD/migs+2PI22rNNyDe9R68I6fgKPN66rB9M6+
	PmtRU7ZZhA0NeWTXCpazTT8Mf5zfjfKXRPKbzSjOFOeLeQP1b+a0fv+kZk5jxVfuG76h
	aOakrrTIKJdyssUTD5fR6DU+76G/yU9JPlZKJMRTuhm3BLt7JPEyLgBeaXUhYcQmEYx7
	eQgbWwqKr/a6qyNf+F8TU1XjKfZLGhLGJ8rQON+1WZceMWSJIRDLR1LT7xsCSSYga9Hk
	g5LeDe5yL+Dk3gdZiq2aeQ9Hg9VJNIKgcefAbdaVGVkktFBLndyEe5lB2a5D1uTLyZEb
	P0zg==
X-Received: by 10.107.4.3 with SMTP id 3mr13772069ioe.195.1446238979289; Fri,
	30 Oct 2015 14:02:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.133 with HTTP; Fri, 30 Oct 2015 14:02:29 -0700 (PDT)
In-Reply-To: <1446207225-15386-14-git-send-email-schnitzeltony@googlemail.com>
References: <1446207225-15386-1-git-send-email-schnitzeltony@googlemail.com>
	<1446207225-15386-14-git-send-email-schnitzeltony@googlemail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 30 Oct 2015 14:02:29 -0700
Message-ID: <CAMKF1spmiD9ohoORXi7wnLBFNOFKeG0vgdpJ_n+-5b8-gp_F3A@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 13/13] fontforge: avoid cloning uthash during do_compile
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
X-List-Received-Date: Fri, 30 Oct 2015 21:02:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2015 at 5:13 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb | 11 +++++++++-=
-
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb b/m=
eta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
> index eb40eaa..21f955f 100644
> --- a/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
> +++ b/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D " \
>      file://LICENSE;md5=3D3f922b42ed0033fa0fd4cd3268f6429c \
>  "
>
> -DEPENDS =3D "glib-2.0 pango giflib tiff libxml2 jpeg python libtool"
> +DEPENDS =3D "glib-2.0 pango giflib tiff libxml2 jpeg python libtool utha=
sh"
>  DEPENDS_append_class-target =3D " libxi"
>
>  inherit bootstrap pkgconfig pythonnative distro_features_check
> @@ -20,7 +20,14 @@ S =3D "${WORKDIR}/git"
>
>  EXTRA_OECONF_append_class-native =3D " with_x=3Dno --disable-python-exte=
nsion --disable-python-scripting"
>
> -EXTRA_OEMAKE =3D "CFLAGS=3D'${CFLAGS} -I${B}/uthash/src'"
> +do_configure_prepend() {
> +    # uthash sources are expected in uthash/src
> +    currdir=3D`pwd`
> +    cd ${S}
> +    mkdir -p uthash/src
> +    cp ${STAGING_INCDIR}/ut*.h uthash/src

why not teach the component's build system to refer it from sysroot
and avoid copying this.

> +    cd $currdir
> +}
>
>  PACKAGES =3D+ "${PN}-python-dbg ${PN}-python"
>
> --
> 2.1.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

