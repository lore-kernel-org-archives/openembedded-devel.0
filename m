Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id EEA0B73174
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jan 2016 17:47:57 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id r129so6767574wmr.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jan 2016 09:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=GFbVrQR5jqAYM8kpYh0kqiJqFFCEkVOyDLB34Wq3a+4=;
	b=NupjWvnYm4oVMYO+Sc5lFijwCUAWifSowtLHpzFdh9n2aMF+4aZZ1mN9tSX6ZDUgiM
	wKmeSWYmbkIHOrcWL59X+e8/Ke4iZaNYTzA59OMEAYqw9VIkSadIiRM+j4FVrq2FKq5w
	PZELPe7H4Yugow1iwqlf6uDGAXMO40oWp/jdKgLOWzfB5Bw7MmuiHP4xeWQ9S2gZ+6st
	Ety/ZiTYvQxirXqYIkFjVq3khzZ68ZmhWE4Dq0Db56K+t9uFwvc5SaVg0cV8JGI8PB1v
	hC1OxtWuH48fIPRoBvspPB59xyMzieJCehtug5YZhNAvSDTUCOJTU8cfatuhIgypvXfV
	/DWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=GFbVrQR5jqAYM8kpYh0kqiJqFFCEkVOyDLB34Wq3a+4=;
	b=c7YXiRX+Kbs2VjuwUKowWkIwZ1uQpTTyHkvWwID62tikloSN3OopACl6KxRBNwz5B/
	+2tbJ5Vyix+ErkjhzpRmpkrDyOKZG9rL+088/0ehZ3gk+63S/rtXESvBwMS5IoXKnIX0
	DbM9Ub9UUe590JhXLE7QN1LAIp/CFZjf9Z97g2tAPOukUV/XcKuGstGyu52gM++kjerH
	vjXFi3sW3qMPog+cUlC6TqBAMB69BUGzmc42pyDbNgkkuhGvjjuVoTO4ymGJoVBxCUF6
	vT97h/JOG5F8cNPU6lHulSb5B50oalxh800k9rhyXoqRXLg+vrmBCZqwphwyeJswayN4
	7lXA==
X-Gm-Message-State: AG10YORZdOGzEJhXXJqV8KGGALIrB3XD3MsnznB3RODb19MnXPZNaiEKL6SpydCTKbA41uqnXuV3xareCkgKSA==
MIME-Version: 1.0
X-Received: by 10.28.97.11 with SMTP id v11mr5031767wmb.42.1452966477263; Sat,
	16 Jan 2016 09:47:57 -0800 (PST)
Received: by 10.194.2.15 with HTTP; Sat, 16 Jan 2016 09:47:57 -0800 (PST)
In-Reply-To: <1452955272.835129245@apps.rackspace.com>
References: <1452955272.835129245@apps.rackspace.com>
Date: Sat, 16 Jan 2016 18:47:57 +0100
Message-ID: <CA+chaQfnzojovC0NkpMLrqnHcvM4VfOYTXQsD9x2awhJ4Se8Gg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH] [coreutils]: Add xattr PACKAGECONFIG
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
X-List-Received-Date: Sat, 16 Jan 2016 17:47:58 -0000
Content-Type: text/plain; charset=UTF-8

This belongs to openembedded-core ML. Please resend.

On Sat, Jan 16, 2016 at 3:41 PM, Scott Ellis <scott@jumpnowtek.com> wrote:

> From Yocto poky where it also stops this warning
>
> WARNING: QA Issue: coreutils rdepends on libattr, but it isn't a build
> dependency? [build-deps]
>
> Signed-off-by: Scott Ellis <scott@jumpnowtek.com>
> ---
>  meta/recipes-core/coreutils/coreutils_8.24.bb | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/coreutils/coreutils_8.24.bb
> b/meta/recipes-core/coreutils/coreutils_8.24.bb
> index f042346..6a09c59 100644
> --- a/meta/recipes-core/coreutils/coreutils_8.24.bb
> +++ b/meta/recipes-core/coreutils/coreutils_8.24.bb
> @@ -28,14 +28,19 @@ SRC_URI[manpages.sha256sum] =
> "cf0333b5f134a331e0b46e2ddf90666f8bdc3281c1ca2c7cc
>  EXTRA_OECONF_class-native = "--without-gmp"
>  EXTRA_OECONF_class-target = "--enable-install-program=arch
> --libexecdir=${libdir}"
>
> -# acl is not a default feature
> +# acl and xattr are not default features
>  #
> -PACKAGECONFIG_class-target ??= "${@bb.utils.contains('DISTRO_FEATURES',
> 'acl', 'acl', '', d)}"
> +PACKAGECONFIG_class-target ??= "\
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'xattr', '', d)} \
> +"
> +
>  PACKAGECONFIG_class-native ??= ""
>
>  # with, without, depends, rdepends
>  #
>  PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
> +PACKAGECONFIG[xattr] = "--enable-xattr,--disable-xattr,attr,"
>
>  # [ df mktemp base64 gets a special treatment and is not included in this
>  bindir_progs = "arch basename chcon cksum comm csplit cut dir dircolors
> dirname du \
> --
> 2.5.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

