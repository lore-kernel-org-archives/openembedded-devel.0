Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id 82C63786A4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 16:06:48 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id g47so192498uad.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 09:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Mo4twNt557SB66JJKJXQUkfneoxjDUUmCoq8uTdk63g=;
	b=e72sqSgKfL5RsV61g/MCaN/UxoGAyqY7yAmwTdfFprrxMsEghjA8FJeAhL7wsUiQDj
	EaFk5XwlMIbd8WtBO1G1PvhUvV/Qjbj5i4xMJgRFFxnmR7/civJyr90aWlI0dqN2nJZ/
	DpLKt4dQrHz72jUoKq1BvMLQ2hpyWlvWxlr128nc8IGBXEOm4/SMdNxyIUsyUlcRNpDs
	ef2p+EjlRjDBfBILDyNM0N4RWOXdvOlKPtVXV6elEviiY5Pl+xqL1/bqIMR0nUEre2/L
	yONbaWCVgxdsLdk/1e342XgoTnI3E/w8f6k63IWCX89fqMWsCIwQOTilgAr4mPha2ATC
	Mb4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Mo4twNt557SB66JJKJXQUkfneoxjDUUmCoq8uTdk63g=;
	b=Xwt7rsgXM0c5zsLSjc8giLJlxaKETtWPjYzqeEYVcDdNb2JiqyUC++LDZM4C/u/c/R
	Sh+/5ZoKQDbqg2qFQbg3q9W7iIAizErQkV/n0N0TppdnNIizNgjmowOYtWItTpvSVmKX
	Uthv2G3BTX7c0yCupC1iIV6iG9CWBOfn20jRSKAYFLiniowU2lBXStK0aK/mFcNm9Pxn
	1ti20+FNXCbe9vFO7Z9FBxklZMkA+kviiOFbWb0apyOibnHsv9jcYoeLMhItUclY55qX
	D4qUuIzyJgsTFjQx8QrbIxNRNdTBVv6aI85+uLfZTQpCNw6cukztvl0k2wYYE6t+9QPP
	1QBA==
X-Gm-Message-State: AHPjjUh0zyw7EKeTHbaekTPTzeSOD7j5RU/680K2rphdpl3frlQ0xh3e
	LrQjDdMzKsjcbW2jXoO2FlYeJUSCeAwJu5t3TxI=
X-Google-Smtp-Source: ADKCNb71JW11xKoW9b9PEBJ2QoPYvFLKRs4X30oF1VExrZwQrZErLRA2Vc+Jx8xY1LehGgYwaBK44AGF/ua2ddVDcKw=
X-Received: by 10.176.21.109 with SMTP id p42mr6903182uae.127.1505318809165;
	Wed, 13 Sep 2017 09:06:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.67.130 with HTTP; Wed, 13 Sep 2017 09:06:48 -0700 (PDT)
In-Reply-To: <5a992e251999009a2057a47afae953e1fab2e7cf.1505317801.git.fabien.lahoudere@collabora.co.uk>
References: <cover.1505317801.git.fabien.lahoudere@collabora.co.uk>
	<5a992e251999009a2057a47afae953e1fab2e7cf.1505317801.git.fabien.lahoudere@collabora.co.uk>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 13 Sep 2017 18:06:48 +0200
Message-ID: <CA+chaQe7pcP0yyC+B-OesSKKutB655vcaBAQ-d31qSN2i5+Zhg@mail.gmail.com>
To: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH v3 2/2] gerbera: clean recipe
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
X-List-Received-Date: Wed, 13 Sep 2017 16:06:48 -0000
Content-Type: text/plain; charset="UTF-8"

There as also comment from Khem asking if all these runtime dependencies
are really needed. They should be added automatically by package.bbclass.

And you have libupnp in RDEPENDS. So drop whole RDEPENDS and after build
you can check buildhistory that the runtime dependencies are still there
for whatever is gerbera linked with.

On Wed, Sep 13, 2017 at 5:58 PM, Fabien Lahoudere <
fabien.lahoudere@collabora.co.uk> wrote:

> Clean the recipe and change the name of libupnp to libupnp1.8.
>
> Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
> ---
>  meta-multimedia/recipes-multimedia/gerbera/gerbera_git.bb | 12
> ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera_git.bb
> b/meta-multimedia/recipes-multimedia/gerbera/gerbera_git.bb
> index 2bbedc0d1..151127768 100644
> --- a/meta-multimedia/recipes-multimedia/gerbera/gerbera_git.bb
> +++ b/meta-multimedia/recipes-multimedia/gerbera/gerbera_git.bb
> @@ -6,22 +6,22 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=
> 25cdec9afe3f1f26212ead6bd2f7fac8"
>  SRC_URI = "git://github.com/v00d00/gerbera.git;protocol=https \
>            file://gerbera.service "
>
> -
> -# Modify these as desired
>  PV = "1.0+git${SRCPV}"
>  SRCREV = "4435b165d121195aefd67d0287f7f9349e181d45"
>
>  S = "${WORKDIR}/git"
>
> -DEPENDS = "expat zlib curl libupnp e2fsprogs sqlite3 taglib "
> -RDEPENDS_${PN} = "expat zlib curl libupnp e2fsprogs taglib "
> +DEPENDS = "expat zlib curl libupnp1.8 e2fsprogs sqlite3 "
> +RDEPENDS_${PN} = "expat zlib curl libupnp e2fsprogs "
>
>  SYSTEMD_SERVICE_${PN} = "gerbera.service"
> -SYSTEMD_AUTO_ENABLE = "enable"
>
>  inherit cmake systemd
>
> -EXTRA_OECMAKE = "-DWITH_JS=FALSE -DWITH_TAGLIB=FALSE -DWITH_MAGIC=FALSE
> -DWITH_EXIF=FALSE -DLIBUUID_INCLUDE_DIRS=${WORKDIR}/recipe-sysroot/usr/include
> -DLIBUUID_LIBRARIES=-luuid"
> +PACKAGECONFIG = ""
> +PACKAGECONFIG[taglib] = "-DWITH_TAGLIB=TRUE,-DWITH_TAGLIB=FALSE,taglib"
> +
> +EXTRA_OECMAKE = "-DWITH_JS=FALSE -DWITH_MAGIC=FALSE -DWITH_EXIF=FALSE
> -DLIBUUID_INCLUDE_DIRS=${STAGING_INCDIR} -DLIBUUID_LIBRARIES=-luuid"
>
>  do_install_append() {
>         install -d ${D}/root/.config/
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

