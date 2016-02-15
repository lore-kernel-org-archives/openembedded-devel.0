Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 41FF6731A9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Feb 2016 23:56:26 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id b67so121856750qgb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Feb 2016 15:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=vZwb8B7dCj5dIba3TT+qvuATViUgcv7cOt5x+WfgZrI=;
	b=hft4aMg48FmwZJgSUsallKQLq1TuFOgIerdudY86CEj9E3dFDCFnHWvgA4TgwjCbQA
	oJ1jSoiED5jVlS+LUf/81PxndDqVpytzvpTEoEQvfHDDacwrJ8JYlVogI+fVxfpj2QiJ
	lSH8bMJqZdiCr6YVQ/Vwb9nxukkTltr35UstZglPKOyoymXHuwFDON7VBt45Zp3qYVEY
	o28qZUkwH0JZ5GKrbE5iUjN43hXvv4CujQw64EvYVJG0qanjn89vm0F1WbRsv8fJ+VIz
	QpBrOZHc0UTz0YnQ2/tEsVrasE+1mG2Wg88KebPmT1wJrSPmuKUmX8VCHuQSM7Rx0EXe
	oFpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=vZwb8B7dCj5dIba3TT+qvuATViUgcv7cOt5x+WfgZrI=;
	b=mpb61J0q2T1H6Twz/wwXBRREYRzBgZ7yr499hXPnol4XgSlPa/uEwa3quX+xoyyFan
	9hG9PZ2BK+v5C3Uj65RJHwajw0NCRXDC9tu2zEE7bzk15+iK6HlXluxFKsxwn64ok7fC
	qJHFYQhG2k1m0VVoS4vYvqbHWT/JBjpnbiv79/ZxR3CMawS40VpvC0FYIMM1HXZXW9Zc
	BA+0bxN+6GhSf6UdrIQeIf6L3f5zJuNvbbZ79R7fVv7EqpHrVBDBvA0O7APeluYnz/BR
	EHqS2QVGFM7GtpFDDqqII5X6OjnzbLMpPGWVPUpiAcBcUmJ1k8IIn8yWtOhn6qWhDbhY
	jpfw==
X-Gm-Message-State: AG10YOQbfHTD+fpDQrZ/tfk5Vvt3UdYwJ88jTOw5B2tVZB4+Vro+b1OEXt/JEPfFFOpZGOxVNg7jgXz05/6IQQ==
X-Received: by 10.140.254.9 with SMTP id z9mr25034054qhc.5.1455580586877; Mon,
	15 Feb 2016 15:56:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Mon, 15 Feb 2016 15:55:57 -0800 (PST)
In-Reply-To: <1455571071-10666-3-git-send-email-schnitzeltony@googlemail.com>
References: <1455571071-10666-1-git-send-email-schnitzeltony@googlemail.com>
	<1455571071-10666-3-git-send-email-schnitzeltony@googlemail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 Feb 2016 15:55:57 -0800
Message-ID: <CAMKF1sqE819tcXWRrQ8mkWMFVKe2fK+dN6F42xQbGrNW7oyMCQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 3/4] libsdl2-ttf: update to 2.0.14
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
X-List-Received-Date: Mon, 15 Feb 2016 23:56:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 15, 2016 at 1:17 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> Licence checksum was changed by change of copyright year.
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  .../{libsdl2-ttf_2.0.12.bb =3D> libsdl2-ttf_2.0.14.bb}           | 10 ++=
+-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>  rename meta-oe/recipes-support/libsdl-ttf/{libsdl2-ttf_2.0.12.bb =3D> li=
bsdl2-ttf_2.0.14.bb} (66%)
>
> diff --git a/meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf_2.0.12.bb b/m=
eta-oe/recipes-support/libsdl-ttf/libsdl2-ttf_2.0.14.bb
> similarity index 66%
> rename from meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf_2.0.12.bb
> rename to meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf_2.0.14.bb
> index 47ce115..af5a55c 100644
> --- a/meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf_2.0.12.bb
> +++ b/meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf_2.0.14.bb
> @@ -2,20 +2,19 @@ SUMMARY =3D "Simple DirectMedia Layer truetype font lib=
rary"
>  SECTION =3D "libs"
>  DEPENDS =3D "virtual/libsdl2 freetype"
>  LICENSE =3D "Zlib"
> -LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3Dcdd16c6436d6b8fcbdd22a54d=
68c6dd3"
> +LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3Dcb33e7c4df9fbde389f149ad6=
bc93ce5"
>
>  SRC_URI =3D " \
>      http://www.libsdl.org/projects/SDL_ttf/release/SDL2_ttf-${PV}.tar.gz=
 \
>      file://use.pkg-config.for.freetype2.patch \
>  "
> +SRC_URI[md5sum] =3D "e53c05e1e7f1382c316afd6c763388b1"
> +SRC_URI[sha256sum] =3D "34db5e20bcf64e7071fe9ae25acaa7d72bdc4f11ab3ce59a=
cc768ab62fe39276"
>
>  S =3D "${WORKDIR}/SDL2_ttf-${PV}"
> -#EXTRA_OECONF +=3D "SDL_CONFIG=3D${STAGING_BINDIR_CROSS}/sdl-config "
>
>  inherit autotools
>
> -TARGET_CC_ARCH +=3D "${LDFLAGS}"
> -

why is this removed ?

>  do_configure_prepend() {
>      touch ${S}/NEWS ${S}/README ${S}/AUTHORS ${S}/ChangeLog
>
> @@ -26,6 +25,3 @@ do_configure_prepend() {
>          rm -f ${S}/acinclude/$i
>      done
>  }
> -
> -SRC_URI[md5sum] =3D "79787216b56cb4707f39d538f2225e00"
> -SRC_URI[sha256sum] =3D "8728605443ea1cca5cad501dc34dc0cb15135d1e575551da=
6d151d213d356f6e"
> --
> 2.5.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

