Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id E097A7680E
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Oct 2015 21:09:18 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so73613009wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Oct 2015 14:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=L8WoSk1mwOWv+AYGhaKHddhj0+cX2OUGz63MGE2N5FI=;
	b=1A3vJB1l7bzDyGFmoFEN/fbnAogP4WypN3G6aCFB0grcNqQWV7FRfe2yXLfD5sewGD
	9wuhFmCbPxi2ervvbACjUGcWkJKaoECHd43ja5/lQqBU9S035GB6OiWCL+tY2SWS/Vdh
	x0f0APo+mZWcz4FMqFhSB7yiErGXZhc5e7IiW1hueskTxl/RGoXBL3QYTboSXzaUyu1T
	pzbrqb9LLLOqHbPLEhLMIQEGimSAZWj9/ppaY26Hvr0RCkrfk2Ek0LpKJv7ULTW7I0GX
	C82+1CWnU6F6vSDIbAkoawAcazo6A0bl33RvuXH7eZyiV8jp/G1eet5SHvYAuUPwMgSY
	rEXg==
MIME-Version: 1.0
X-Received: by 10.180.104.40 with SMTP id gb8mr4011137wib.17.1443906558240;
	Sat, 03 Oct 2015 14:09:18 -0700 (PDT)
Received: by 10.194.159.102 with HTTP; Sat, 3 Oct 2015 14:09:18 -0700 (PDT)
In-Reply-To: <1443906560-22202-1-git-send-email-manuel.bachmann@iot.bzh>
References: <1443906560-22202-1-git-send-email-manuel.bachmann@iot.bzh>
Date: Sat, 3 Oct 2015 23:09:18 +0200
Message-ID: <CA+chaQfH5ffCL2X8CpQt-0404PwnSjqE_mxmMX4NkS0gnCkzow@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH v2][meta-multimedia] mkvtoolnix: fix Boost 1.58 build, update to 7.9.0
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
X-List-Received-Date: Sat, 03 Oct 2015 21:09:19 -0000
Content-Type: text/plain; charset=UTF-8

Please use revision specified in git submodule instead of AUTOREV, it's a
bit more maintenance work when upgrading main SRCREV, but with AUTOREV it's
not saving the network access when building mkvtoolnix.

On Sat, Oct 3, 2015 at 11:09 PM, Manuel Bachmann <manuel.bachmann@iot.bzh>
wrote:

> mkvtoolnix does not compile with newest Boost 1.58, mostly
> due to the following bugs :
> https://github.com/mbunkus/mkvtoolnix/issues/1172
> https://github.com/mbunkus/mkvtoolnix/issues/1176
>
> Update to the version immediately subsequent to their
> fixes, and adapt configure steps accordingly.
>
> Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
> ---
>  meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb | 15
> +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
> b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
> index dd613b3..da10153 100644
> --- a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
> +++ b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
> @@ -6,9 +6,16 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>
>  DEPENDS = "curl boost expat zlib libebml libmatroska libogg libvorbis
> bzip2 lzo file ruby-native"
>
> -PV = "7.1.0+git${SRCPV}"
> -SRCREV = "0c89ff941bfdd9f3378312f293a84f13cf3e2a96"
> -SRC_URI = "git://github.com/mbunkus/mkvtoolnix.git"
> +PV = "7.9.0+git${SRCPV}"
> +SRCREV_mkvtoolnix = "1a8b23b1e82ed180a5aaeb43537f2426be252985"
> +SRCREV_libebml = "${AUTOREV}"
> +SRCREV_libmatroska = "${AUTOREV}"
> +SRCREV_FORMAT = "mkvtoolnix"
> +SRC_URI = " \
> +           git://github.com/mbunkus/mkvtoolnix.git;name=mkvtoolnix \
> +           git://
> github.com/Matroska-Org/libebml.git;name=libebml;destsuffix=git/lib/libebml
> \
> +           git://
> github.com/Matroska-Org/libmatroska.git;name=libmatroska;destsuffix=git/lib/libmatroska
> \
> +          "
>
>  S = "${WORKDIR}/git"
>
> @@ -28,7 +35,7 @@ EXTRA_OECONF = " --with-boost-libdir=${STAGING_LIBDIR} \
>
>  # remove some hardcoded searchpaths
>  do_configure_prepend() {
> -    sed -i -e s:/usr/local/lib:${STAGING_LIBDIR}:g -e
> s:/usr/local/include:${STAGING_INCDIR}:g ${S}/ac/ebml.m4
> +    sed -i -e s:/usr/local/lib:${STAGING_LIBDIR}:g -e
> s:/usr/local/include:${STAGING_INCDIR}:g ${S}/ac/qt5.m4
>  }
>
>  # Yeah, no makefile
> --
> 1.8.3.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

