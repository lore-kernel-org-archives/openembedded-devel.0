Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id D471E782C8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Aug 2017 14:36:45 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id r133so240463pgr.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Aug 2017 07:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oqTsQvqj8v+7UxJxqzrTjwvcl+oD+acsY7SUjACs40U=;
	b=W63751EpgUa2WcoxePZ3hPS/FF5YByg/X63yd6Zcd2wr17dSawmqz8uNcnDHcccvM0
	v7u/CyZRo5H6REQL7SkqCmvuLy2ouqr8omVaDKQkXRD4yrQQreDg9G/rfnT3j62NAAKx
	KMjDg/F6MMo/TpDvMhVEYKkjzdqFuv9TWeGYjeC+t3LzjBW9dJaczYx8qhLtec1u2uYo
	+tTUd19izvAgRly1Vq0ppFld22WQIWNYwcd5EAJKfFh0AU4N2oIgNV6IODvLz8fRV6Hc
	SZ3HBwFnOX6iOnvKhgcFc1UxGP4eF2hUnHGO/KTXsB/+1YGj+WFvNmP4vOlFAVbReQJU
	ouKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oqTsQvqj8v+7UxJxqzrTjwvcl+oD+acsY7SUjACs40U=;
	b=Om70ERS7lq54NC8HGt3Vjh0eiNdFwUYc0JWDPY6femcklcxtRMHwGKX5VrVh40huTz
	Zh/ourHI7+0Yp6oNMJAvOdXE/DORPVaXEzv5b1NszWdT3yvGZldCV1BFXQn5+r7NORr/
	nKUUTZpKGryDGQtAtNrCIgsgQHCurZarJGj1RIh4fLkjiiE4QTfggHCKvUD3H9f/pA9Z
	ws9FLY/RRdejKr0jMb16r7Ih/3uaFkdNLyrcWWbhjd1jPPYQu67qpFKRSpRcCQTUJVqo
	xDZmiQAVrPCSkyq8o6bYuIvMmKWStpAmc7OprmNCcStjsQf9pkT5qSydQofUzRfpmZ/h
	iZkg==
X-Gm-Message-State: AHYfb5hh73kBqEU+6UTDDxU94xM/KhPnrvb8k8HMXi+vLQuKwJa0E+YJ
	amEGun1DyQy7JTn4q7EcQd+touVy8g==
X-Received: by 10.84.239.8 with SMTP id w8mr3147360plk.73.1503499006704; Wed,
	23 Aug 2017 07:36:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Wed, 23 Aug 2017 07:36:16 -0700 (PDT)
In-Reply-To: <1503467852-161518-1-git-send-email-hongxu.jia@windriver.com>
References: <CAMKF1spON1L-HeobLHk+GaQqcqSbXtzvPQPnaVnjfy8jyqYEQQ@mail.gmail.com>
	<1503467852-161518-1-git-send-email-hongxu.jia@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Aug 2017 07:36:16 -0700
Message-ID: <CAMKF1srzoJzqCW_iYXQDd+hGB0dt2TZcDVK-Wy2GgtYOXkqx5w@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH V2] netcf: upgrade to latest 0.2.8
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
X-List-Received-Date: Wed, 23 Aug 2017 14:36:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 22, 2017 at 10:57 PM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> Fix compile failure while gnulib upgraded to 2017-08-20.18
> ...
> | In file included from ../../../git/gnulib/lib/printf-args.h:41:0,
> |                  from ../../../git/gnulib/lib/printf-parse.h:29,
> |                  from ../../../git/gnulib/lib/printf-parse.c:36:
> | ./wchar.h:571:6: error: #if with no expression
> |  # if
> ...
>
> Update HOMEPAGE, SRC_URI since the formers are obsolete.
>
> Update SRCREV, although version not change, but the former
> was two years ago.
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  .../recipes-support/netcf/{netcf_git.bb => netcf_0.2.8.bb}     | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>  rename meta-networking/recipes-support/netcf/{netcf_git.bb => netcf_0.2.8.bb} (88%)
>
> diff --git a/meta-networking/recipes-support/netcf/netcf_git.bb b/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
> similarity index 88%
> rename from meta-networking/recipes-support/netcf/netcf_git.bb
> rename to meta-networking/recipes-support/netcf/netcf_0.2.8.bb
> index a7a5000..0b53add 100644
> --- a/meta-networking/recipes-support/netcf/netcf_git.bb
> +++ b/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
> @@ -1,15 +1,15 @@
>  SUMMARY = "netcf"
>  DESCRIPTION = "netcf is a cross-platform network configuration library."
> -HOMEPAGE = "https://fedorahosted.org/netcf/"
> +HOMEPAGE = "https://pagure.io/netcf"
>  SECTION = "libs"
>  LICENSE = "LGPLv2.1"
>
> -LIC_FILES_CHKSUM = "file://COPYING;md5=bbb461211a33b134d42ed5ee802b37ff"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=fb919cc88dbe06ec0b0bd50e001ccf1f"
>
> -SRCREV = "9158278ad35b46ce9a49b2e887483c6d8c287994"
> +SRCREV = "2c5d4255857531bc09d91dcd02e86545f29004d4"
>  PV = "0.2.8+git${SRCPV}"

you can change it to

PV .= "+git${SRCPV}"
>
> -SRC_URI = "git://git.fedorahosted.org/netcf.git;protocol=git \
> +SRC_URI = "git://pagure.io/netcf.git;protocol=https \
>  "
>
>  DEPENDS += "augeas libnl libxslt libxml2 gnulib"
> @@ -23,6 +23,8 @@ EXTRA_OECONF_append_class-target = " --with-driver=redhat"
>  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
>  PACKAGECONFIG[systemd] = "--with-sysinit=systemd,--with-sysinit=initscripts,"
>
> +EXTRA_AUTORECONF += "-I ${S}/gnulib/m4"
> +
>  do_configure_prepend() {
>      currdir=`pwd`
>      cd ${S}
> --
> 2.8.1
>

