Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f180.google.com (mail-wr0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id 7AEB277C20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Mar 2017 09:38:19 +0000 (UTC)
Received: by mail-wr0-f180.google.com with SMTP id k6so46315076wre.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Mar 2017 02:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SauEZCXuWEiTH9HuA4e+SQqEpwjV9JmDvM5oyhueApg=;
	b=iUmyYSuBNMhlqQS2vIPvORQGUJeW1Whd2QSQ35VtlnAJ2js51RBgW6ELxLfK9gslR3
	Owm1V8F6nG58w6YP54DcQqeamXmc15g6yFjwlXam6teJHFy82ZdlaDgyrRwxsjKmWq7c
	Xg8kYL12gudQ9qql0NnS4eEEK9hDEN3z91iG71A6B3y6iIyeypQldr9C6Cy1WBbIlgZy
	+NaB6nzzZ3+mnPbroe2FGLPUoQqM6tkqimxUyknKZ0U7EqOZv+y+rAfPC+7z8Iz2Z9Av
	mmD9lMxZ46DLSxq2lzBVpP1H2mkejo/sMUhd1tgNg7TR25aU6gGMT9OFyTVnE9c263xJ
	rZ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SauEZCXuWEiTH9HuA4e+SQqEpwjV9JmDvM5oyhueApg=;
	b=ZVh7Fw9MbozSgLQ/PGccI3jPdZFxh1i3Fov0cwnuiwRdl5jysdwPyCeHFE9xo1WfqV
	Fmb9qLHwBGnZ2qfYlQ8C1B544L8CNEc8oDgAHQOthWyqOSvRJL9qiTFkdCDvIkavWT/p
	CVR+wiF/TftjMvnx30ZL8BfV6iU1GpsN/qZ4RV9IXrzKNblyvv2DgD5UoWbuc6KXZAYH
	1G6jD+2JcdzX3rfqA74q0YB6/NJSYqRaJEvF7haEqqn76fr1TZnYs7v1PHZfRCR7+5Fu
	fc5KHMwjzGBYOBaMeNFJSzlsKgScXm6m/bBfwEOPBVJcg8eOKuGfexzSR0N5gatxyToA
	srzw==
X-Gm-Message-State: AFeK/H0yftvsQE1Ghnw05MxgkmUNbBYQ/uNJlpPjVIYkwxN2u2Fdap5RvqROM1OJE47Tqp67HC2sagiztMq6xw==
X-Received: by 10.223.136.125 with SMTP id e58mr4901947wre.14.1490866700950;
	Thu, 30 Mar 2017 02:38:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Thu, 30 Mar 2017 02:38:20 -0700 (PDT)
In-Reply-To: <20170323094626.6310-2-gordan.markus@pelagicore.com>
References: <20170323094626.6310-2-gordan.markus@pelagicore.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 30 Mar 2017 11:38:20 +0200
Message-ID: <CA+chaQcbUmnmKN2_sGPyT4AYhb2F6qyiQQt6xOgrXMUe_szAoA@mail.gmail.com>
To: =?UTF-8?Q?Gordan_Marku=C5=A1?= <gordan.markus@pelagicore.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtbase-native: create empty oe-device-extra.pri
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
X-List-Received-Date: Thu, 30 Mar 2017 09:38:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

it looks like the directory doesn't exist:

http://errors.yoctoproject.org/Errors/Details/138489/

On Thu, Mar 23, 2017 at 10:46 AM, Gordan Marku=C5=A1 <
gordan.markus@pelagicore.com> wrote:

> Suppress multiple occurrences of the same warning while configuring
> and compiling qtbase-native and nativesdk-qtbase.
>
> WARNING: Unable to find file git/mkspecs/linux-oe-g++/../
> oe-device-extra.pri
> Signed-off-by: Gordan Marku=C5=A1 <gordan.markus@pelagicore.com>
> ---
>  recipes-qt/qt5/qtbase-native_git.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-
> native_git.bb
> index c013029..d40a751 100644
> --- a/recipes-qt/qt5/qtbase-native_git.bb
> +++ b/recipes-qt/qt5/qtbase-native_git.bb
> @@ -83,6 +83,9 @@ PACKAGECONFIG_CONFARGS =3D " \
>  export OE_QMAKE_QTCONF_PATH =3D "foodummy"
>
>  do_configure_prepend() {
> +    # Avoid qmake error "Cannot read [...]/usr/lib/qt5/mkspecs/oe-device=
-extra.pri:
> No such file or directory"
> +    touch ${S}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/oe-device-extra.pri
> +
>      MAKEFLAGS=3D"${PARALLEL_MAKE}" ${S}/configure -opensource
> -confirm-license ${PACKAGECONFIG_CONFARGS} || die "Configuring qt failed.
> PACKAGECONFIG_CONFARGS was ${PACKAGECONFIG_CONFARGS}"
>  }
>
> --
> 2.9.3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

