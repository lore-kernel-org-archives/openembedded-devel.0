Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
	[209.85.166.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5D18D7F7C3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2019 20:54:31 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id s17so28462198iol.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Nov 2019 12:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UkSrHMSV8oy+lkdPScPotQ7NIq4Fvzo2kSaAbPPnBlQ=;
	b=OQbomCGytzqUeSPc0aS3j/eEagalsJsQS1uPKh0Z3iLeEYtgAhWiCzj6dmUrnQAIjQ
	HkinSsCqibpFGcxJbPb1vjBwbXO7Vnag/GqJECmIfLqFCGWQNb90PsjvSykGi7OJkXSE
	V19x60zgAiIYmMM78f2DFuwMo2QWy67VA84OCZR9lMPU4WZHHREQC7+7qTud0hpAyhuc
	RM/WMNy5Zj62v1Vi05Qg5xArfHgPQBxS+3VOaqzHTvbnrX/ltBAUsCig5NMoZJwnstMT
	JWLEAN6cAfSbZYBsqsmlWGJODfI6+EH1OR5FT43JiY12OEUUJ3D7fJYB9U9mox6lmKai
	uDJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UkSrHMSV8oy+lkdPScPotQ7NIq4Fvzo2kSaAbPPnBlQ=;
	b=ZYce+bw3vFjD0z75qFN0nV6WFDXA2DJwOl/2cZaZMmXb2mMU5wQ7gHJ6dOsreLgeqG
	9iSBDovalODjA6GUjVY2TqIqh8FjUtHHV+OgnZ8qQV4qR0LS3xCZ9mZcOcQ2iZkCpECu
	LsA72pkKbS4AwC0DHVJwY5Pvl+MT6uodYStb5MANZ3WX1FEqy66AsjYIj3jT+LKm9grV
	+zlAZKT/A5mbQP+rU32je/Dzr8vdz4utcGXhIFnwwD+9izwGtBm1lTCtl5iIFgbAOOTb
	JGfwwm+i3jc5A7zV1l4wK/NAsXLX8BM26u5UaPKEbbcQ3Cx68Y4zAJOCOe6bI72EeJAI
	prew==
X-Gm-Message-State: APjAAAWdv51LeX/iRYwwZuY5ExB17C+T4n+5VS/dVCPjyKrJhsagRTIh
	ozK8U0bouVwenDkG27OTLOr6viArW3pA+TDuIZQ=
X-Google-Smtp-Source: APXvYqyCqYa0ZiUSWHNcOFK5ofpXegvNaqIOWepPQzRwRzssgatmHajmck8CIaZZ4FJieklYso+8S54kLeRjO4YnKQs=
X-Received: by 2002:a02:77d5:: with SMTP id g204mr6082jac.125.1573073672118;
	Wed, 06 Nov 2019 12:54:32 -0800 (PST)
MIME-Version: 1.0
References: <1573051950-45551-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1573051950-45551-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 6 Nov 2019 21:54:20 +0100
Message-ID: <CALbNGRT0WBKd-rm2_BjE2-NJaDT_zf9GQafwZu-T4U2e6_BDgg@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libpeas: upgrade 1.22.0 -> 1.24.0
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
X-List-Received-Date: Wed, 06 Nov 2019 20:54:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 6, 2019 at 12:45 PM Zheng Ruoqin
<zhengrq.fnst@cn.fujitsu.com> wrote:
>
> Change buildtool from autotools to meson with version upgrade.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>

have similar:

+ cleanup dependencies
+ -> V1.24.1
+ remove distro_features_check
+ GIR_EXTRA_LIBS_PATH can go

Was just sent - sorry for chiming in again

Andreas

> ---
>  .../libpeas/{libpeas_1.22.0.bb => libpeas_1.24.0.bb}          | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>  rename meta-oe/recipes-gnome/libpeas/{libpeas_1.22.0.bb => libpeas_1.24.0.bb} (58%)
>
> diff --git a/meta-oe/recipes-gnome/libpeas/libpeas_1.22.0.bb b/meta-oe/recipes-gnome/libpeas/libpeas_1.24.0.bb
> similarity index 58%
> rename from meta-oe/recipes-gnome/libpeas/libpeas_1.22.0.bb
> rename to meta-oe/recipes-gnome/libpeas/libpeas_1.24.0.bb
> index dd1b53e..33c5fbb 100644
> --- a/meta-oe/recipes-gnome/libpeas/libpeas_1.22.0.bb
> +++ b/meta-oe/recipes-gnome/libpeas/libpeas_1.24.0.bb
> @@ -5,16 +5,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4b54a1fd55a448865a0b32d41598759d"
>
>  DEPENDS = "gnome-common gtk+3 intltool-native"
>
> +GNOMEBASEBUILDCLASS = "meson"
>  inherit gnomebase gobject-introspection gtk-doc gtk-icon-cache distro_features_check
>
> -# gobject-introspection is mandatory and cannot be configured
> -REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
> -UNKNOWN_CONFIGURE_WHITELIST_append = " --enable-introspection --disable-introspection"
> +GTKDOC_MESON_OPTION = "gtk_doc"
>
> -SRC_URI[archive.md5sum] = "a20dc55c3f88ad06da9491cfd7de7558"
> -SRC_URI[archive.sha256sum] = "5b2fc0f53962b25bca131a5ec0139e6fef8e254481b6e777975f7a1d2702a962"
> +SRC_URI[archive.md5sum] = "7a136eea60930012deff2f7bfa3673be"
> +SRC_URI[archive.sha256sum] = "0b9a00138c129a663de3eef5569b00ace03ce31d345f7af783768e9f35c8e6f9"
>
> -PACKAGECONFIG[python3] = "--enable-python3,--disable-python3,python3-pygobject"
> +PACKAGECONFIG[python3] = "-Dpython3=true,-Dpython3=false,python3-pygobject"
>
>  export GIR_EXTRA_LIBS_PATH = "${B}/libpeas/.libs"
>
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

