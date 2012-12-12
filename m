Received: from mail-wi0-f179.google.com ([209.85.212.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1Tij0V-0001pK-6a; Wed, 12 Dec 2012 10:53:39 +0100
Received: by mail-wi0-f179.google.com with SMTP id o1so311854wic.6
	for <multiple recipients>; Wed, 12 Dec 2012 01:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=9478UiY7IQF0nN4QHhgWsfXP0tfxR/mq0LZYIPTkAQE=;
	b=Tr5FzYdd6/fTw2XKydOhdMPxzUb8D6h7T4uHM0SYk9z7v92YZij9RpInFeZRSeDAZU
	sx5QSCotpZqDuj4KkHDO7AICS/A439+VyCaQSwbAR8+SqbFeN5uPzWQR+VgfPzOhSGJu
	A9z2wGOEKFHsFsWxHZAGWiOhemneJIav05aEztWMdO3SY6eDiDToh4Psga5BlUXDr3Rz
	wxfzNC0XdZJZUyMXRPJKxG6ChZ2BkILGQv0cwp7SVIuTsqgCDPCw77AlqdeqOTNRjcXZ
	/lZtZvJz2QBngd5Po5HtlzlnzdzTn7eEefoP/c+zJDICM7Xgyy1I03KlbG36gslEaLJV
	e97g==
MIME-Version: 1.0
Received: by 10.194.158.201 with SMTP id ww9mr698271wjb.12.1355305146040; Wed,
	12 Dec 2012 01:39:06 -0800 (PST)
Received: by 10.194.84.103 with HTTP; Wed, 12 Dec 2012 01:39:06 -0800 (PST)
In-Reply-To: <20121211160121.2346510330@opal>
References: <20121211160121.2346510330@opal>
Date: Wed, 12 Dec 2012 10:39:06 +0100
Message-ID: <CA+chaQfLt+ojRLbMswZ6PPoDo74u9ObaNarFxi_Mc7dL+hKvZg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: ross.burton@intel.com
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Ross Burton : mesa: upgrade to 8.0.5
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
X-List-Received-Date: Wed, 12 Dec 2012 09:53:39 -0000
Content-Type: text/plain; charset=UTF-8

One of those patches caused new warning

WARNING: QA Issue: mesa-dri: Files/directories were installed but not shipped
  /usr/lib/pkgconfig/osmesa.pc

Cheers,

On Tue, Dec 11, 2012 at 5:01 PM,  <git@git.openembedded.org> wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: b85388ad0b6c3e7176295949d88c504abf0ba5cc
> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=b85388ad0b6c3e7176295949d88c504abf0ba5cc
>
> Author: Ross Burton <ross.burton@intel.com>
> Date:   Thu Dec  6 12:23:32 2012 +0000
>
> mesa: upgrade to 8.0.5
>
> Licence checksum change, use an upstream source file instead of a generated
> file: we were previously checksumming the Bison license.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>
> ---
>
>  .../mesa/{mesa-8.0.4.inc => mesa-8.0.5.inc}        |    6 +++---
>  ...tive_8.0.4.bb => mesa-dri-glsl-native_8.0.5.bb} |    6 +++---
>  .../mesa/{mesa-dri_8.0.4.bb => mesa-dri_8.0.5.bb}  |    2 +-
>  3 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/meta/recipes-graphics/mesa/mesa-8.0.4.inc b/meta/recipes-graphics/mesa/mesa-8.0.5.inc
> similarity index 80%
> rename from meta/recipes-graphics/mesa/mesa-8.0.4.inc
> rename to meta/recipes-graphics/mesa/mesa-8.0.5.inc
> index c6307dc..b39b011 100644
> --- a/meta/recipes-graphics/mesa/mesa-8.0.4.inc
> +++ b/meta/recipes-graphics/mesa/mesa-8.0.5.inc
> @@ -1,6 +1,6 @@
>  DEPENDS += "mesa-dri-glsl-native"
>
> -SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
> +SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
>             file://0001-Compile-with-uclibc.patch \
>             file://0002-cross-compile.patch \
>             file://0003-fix-for-x32.patch \
> @@ -9,8 +9,8 @@ SRC_URI += "${@base_contains('DISTRO_FEATURES', 'x11', '', 'file://0004-gross-ha
>
>  S = "${WORKDIR}/Mesa-${PV}"
>
> -SRC_URI[md5sum] = "d546f988adfdf986cff45b1efa2d8a46"
> -SRC_URI[sha256sum] = "02ed19f4f5f6535dda03a9932a81438aa78ea723ebba1f39a3d49a70a4e1d07e"
> +SRC_URI[md5sum] = "01305591073a76b65267f69f27d635a3"
> +SRC_URI[sha256sum] = "511b8da34f8e69ed24caf422964fb7ae747f3b1d8093f6b8aa2602164a475a5e"
>
>  do_configure_prepend() {
>    # We need builtin_compiler built for buildhost arch instead of target (is provided by mesa-dri-glsl-native)"
> diff --git a/meta/recipes-graphics/mesa/mesa-dri-glsl-native_8.0.4.bb b/meta/recipes-graphics/mesa/mesa-dri-glsl-native_8.0.5.bb
> similarity index 66%
> rename from meta/recipes-graphics/mesa/mesa-dri-glsl-native_8.0.4.bb
> rename to meta/recipes-graphics/mesa/mesa-dri-glsl-native_8.0.5.bb
> index d551598..842d492 100644
> --- a/meta/recipes-graphics/mesa/mesa-dri-glsl-native_8.0.4.bb
> +++ b/meta/recipes-graphics/mesa/mesa-dri-glsl-native_8.0.5.bb
> @@ -1,10 +1,10 @@
>  require mesa-dri-glsl-native.inc
>
> -LIC_FILES_CHKSUM = "file://glsl_parser.cpp;beginline=3;endline=33;md5=d078f1cddc2fc355719c090482254bd9"
> +LIC_FILES_CHKSUM = "file://glsl_parser.yy;beginline=2;endline=23;md5=a12a9c0208ee64a07ce314dfed4c81eb"
>
>  SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2"
> -SRC_URI[md5sum] = "d546f988adfdf986cff45b1efa2d8a46"
> -SRC_URI[sha256sum] = "02ed19f4f5f6535dda03a9932a81438aa78ea723ebba1f39a3d49a70a4e1d07e"
> +SRC_URI[md5sum] = "01305591073a76b65267f69f27d635a3"
> +SRC_URI[sha256sum] = "511b8da34f8e69ed24caf422964fb7ae747f3b1d8093f6b8aa2602164a475a5e"
>
>  S = "${WORKDIR}/Mesa-${PV}/src/glsl/"
>
> diff --git a/meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb b/meta/recipes-graphics/mesa/mesa-dri_8.0.5.bb
> similarity index 78%
> rename from meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb
> rename to meta/recipes-graphics/mesa/mesa-dri_8.0.5.bb
> index a5a592d..26b56e4 100644
> --- a/meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb
> +++ b/meta/recipes-graphics/mesa/mesa-dri_8.0.5.bb
> @@ -1,4 +1,4 @@
>  require mesa-common.inc
>  require mesa-${PV}.inc
>  require mesa-dri.inc
> -PR = "${INC_PR}.4"
> +PR = "${INC_PR}.0"
>
>
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits


