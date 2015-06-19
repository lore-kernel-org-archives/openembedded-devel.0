Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5106775A2B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jun 2015 18:24:47 +0000 (UTC)
Received: by obbgp2 with SMTP id gp2so79525548obb.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jun 2015 11:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=ESB+L4vz6JuqfbMGtNTphv9vYcjqCHtxQXj40dE6NZw=;
	b=JcvwzsTxUrF90cCaLKiid4suYGlVS0Z8wADJXM+sf59DWehN1XzYYQLAmOmsg2B89i
	fFrupEZOvDpCWskwTTNppKKZlaRtELeKNJlWz0ttlLLoXJuE6RW70nY5udVct9Eg4VPK
	yDKU0nbx8jO+25FE2WtJn2VEBjrAO1FC7MGFqIfQG++0w7eToelH87a9QEakZtbd567I
	/CSSWXx+oOo7trhE/omXl2N/Acb52yxO08vqeOk5/Z3lI0wzrmUu83xcwy8hkB6FtlFg
	uNJQuNtLYLgyw8EGZ/JjWTFnoc1fm27L72VZIG16/d9eEMAwiMNoxjYFkvqog+rXAqpz
	ehrQ==
MIME-Version: 1.0
X-Received: by 10.60.92.131 with SMTP id cm3mr14499354oeb.23.1434738287978;
	Fri, 19 Jun 2015 11:24:47 -0700 (PDT)
Received: by 10.202.64.130 with HTTP; Fri, 19 Jun 2015 11:24:47 -0700 (PDT)
In-Reply-To: <1433889976-14705-1-git-send-email-armccurdy@gmail.com>
References: <1433889976-14705-1-git-send-email-armccurdy@gmail.com>
Date: Fri, 19 Jun 2015 11:24:47 -0700
Message-ID: <CAJ86T=UWLs_Tv-n-rPMQuLu97JgrJ8MPWxw_RhryxJBQ0M2j5w@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] libjpeg-turbo: update 1.4.0 -> 1.4.1
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
X-List-Received-Date: Fri, 19 Jun 2015 18:24:48 -0000
Content-Type: text/plain; charset=UTF-8

ping

On Tue, Jun 9, 2015 at 3:46 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> Also make minor cleanup of moving DEPENDS nearer to the top of the recipe.
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  .../jpeg/{libjpeg-turbo_8d+1.4.0.bb => libjpeg-turbo_8d+1.4.1.bb}  | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-core/jpeg/{libjpeg-turbo_8d+1.4.0.bb => libjpeg-turbo_8d+1.4.1.bb} (90%)
>
> diff --git a/meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.4.0.bb b/meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.4.1.bb
> similarity index 90%
> rename from meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.4.0.bb
> rename to meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.4.1.bb
> index 8e214c9..e79f800 100644
> --- a/meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.4.0.bb
> +++ b/meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.4.1.bb
> @@ -7,11 +7,13 @@ LIC_FILES_CHKSUM = "file://cdjpeg.h;endline=12;md5=cad955d15145c3fdceec6855e078e
>                      file://djpeg.c;endline=9;md5=e93a8f2061e8a0ac71c7a485c10489e2 \
>  "
>
> +DEPENDS = "nasm-native"
> +
>  BASEPV = "${@d.getVar('PV',True).split('+')[1]}"
>
>  SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${BASEPV}.tar.gz"
> -SRC_URI[md5sum] = "039153dabe61e1ac8d9323b5522b56b0"
> -SRC_URI[sha256sum] = "d93ad8546b510244f863b39b4c0da0fa4c0d53a77b61a8a3880f258c232bbbee"
> +SRC_URI[md5sum] = "b1f6b84859a16b8ebdcda951fa07c3f2"
> +SRC_URI[sha256sum] = "4bf5bad4ce85625bffbbd9912211e06790e00fb982b77724af7211034efafb08"
>
>  S = "${WORKDIR}/${BPN}-${BASEPV}"
>
> @@ -34,6 +36,5 @@ FILES_libturbojpeg = "${libdir}/libturbojpeg.so"
>  INSANE_SKIP_libturbojpeg = "dev-so"
>
>  BBCLASSEXTEND = "native"
> -DEPENDS = "nasm-native"
>
>  LEAD_SONAME = "libjpeg.so.8"
> --
> 1.9.1
>

