Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
	[209.85.219.41])
	by mail.openembedded.org (Postfix) with ESMTP id E10F57DF23
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Dec 2019 18:18:23 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id u1so10257665qvk.13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Dec 2019 10:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FLKwxv2zl+NL+wNwv8B7QCLnLOEg/pwgJKhLqC8L3ec=;
	b=g08Y0JJOH/+7M6rok1mn75Ih4zAlGw04eSs6VGcfJ0S/ypQxOck03I7kXVbZzOShL1
	1ywPOJz6Hy+ScdTU+4sVRb9pNbJQG1rgHDS1dLrqF7t/MPwN2kXOd67gAl65xMB8OjDT
	/S4MKetdqKwNhx5BdUe6HvdieYET52qOKZIcglpz4+iaENGKaa9RWulrvvTStUSJ9/Fz
	hm4bL29xTDPjeQnHiKGBy0klL14rEbXxMkslhsIVnz74efJIYN3DYce69hCCf61uco+O
	+/WwPykf5DK41F93KmIeNpGZET29QrV7pKvypevC3YUie7KPfKApuPy4WYjg8dFyd/3I
	E5YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FLKwxv2zl+NL+wNwv8B7QCLnLOEg/pwgJKhLqC8L3ec=;
	b=gDgal99m/Q3A6iL0V3Jz7qXjkBmlKxRK5ikcH1QjkF84LYXg9kLgbTMEAXWq8kVkp/
	9urm8UeaxOBP2299R5ZeNJrKXLxL/lc4AkdNTArr4rJE5J9dXOWP3m61Re2GIbXk8U5/
	4XjDeElQAU9oMDRz0DRTL6XMgFuDcf30Ctq1TiEJ62PN1CCMw8hAG8fCmzPBmgXs7qkU
	DXkBpct+UN/Irg0S32wR+h1dFnkqOzbKp4b5+4fUCeR771MwUeUy7KbJm59Kca2hREXt
	PPM++1WmYodLHMnQMiqlK+kX0i8OQ0GWMoKTMG4L3/GbU72Wz3a84jljvgaSxTW2DgpX
	hurg==
X-Gm-Message-State: APjAAAWGIkF8Poq563qXoivBbU7kTkgyy7t8sDJPecu3f34PUsPz8jnf
	wCAVO/VVbXWLU+9BCCBUYOGTeNtD6EiUeBZO93Y=
X-Google-Smtp-Source: APXvYqxGRkjM1XZyRujF4/M2j5bxlGQUrBi8uMs/lDU8nMQ4/OrQU0JGMFTwXK5F22yD1tgVDt8TKL7zUKsOfe6PVvM=
X-Received: by 2002:ad4:478b:: with SMTP id z11mr44973497qvy.185.1577557104555;
	Sat, 28 Dec 2019 10:18:24 -0800 (PST)
MIME-Version: 1.0
References: <20191227171145.10366-1-peter.kolbus@garmin.com>
In-Reply-To: <20191227171145.10366-1-peter.kolbus@garmin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 28 Dec 2019 10:17:58 -0800
Message-ID: <CAMKF1spUFzHw12C3stJvGYyFM5isFM-jnobBWOR4tRaTKzm-EA@mail.gmail.com>
To: Peter Kolbus <peter.kolbus@garmin.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python3-html2text: add recipe
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
X-List-Received-Date: Sat, 28 Dec 2019 18:18:24 -0000
Content-Type: text/plain; charset="UTF-8"

http://errors.yoctoproject.org/Errors/Details/300492/

On Fri, Dec 27, 2019 at 9:12 AM Peter Kolbus <peter.kolbus@garmin.com> wrote:
>
> python3-html2text converts HTML to Markdown-formatted text.
>
> Signed-off-by: Peter Kolbus <peter.kolbus@garmin.com>
> ---
>  .../recipes-devtools/python/python-html2text.inc     | 12 ++++++++++++
>  .../python/python3-html2text_2019.8.11.bb            |  2 ++
>  2 files changed, 14 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python-html2text.inc
>  create mode 100644 meta-python/recipes-devtools/python/python3-html2text_2019.8.11.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-html2text.inc b/meta-python/recipes-devtools/python/python-html2text.inc
> new file mode 100644
> index 000000000..f5e208729
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-html2text.inc
> @@ -0,0 +1,12 @@
> +SUMMARY = "Convert HTML to Markdown-formatted text"
> +HOMEPAGE = "https://github.com/Alir3z4/html2text"
> +
> +LICENSE = "GPL-3.0"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=7f538584cc3407bf76042def7168548a"
> +
> +SRC_URI[md5sum] = "21aad7ec95b70606024b783c8253899c"
> +SRC_URI[sha256sum] = "f516b9c10284174e2a974d86f91cab02b3cf983a17752075da751af0e895ef5e"
> +
> +inherit pypi
> +
> +BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-html2text_2019.8.11.bb b/meta-python/recipes-devtools/python/python3-html2text_2019.8.11.bb
> new file mode 100644
> index 000000000..9cb5b01eb
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-html2text_2019.8.11.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-html2text.inc
> --
> 2.24.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

