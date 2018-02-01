Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id D3BEA60616
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Feb 2018 21:38:43 +0000 (UTC)
Received: by mail-wr0-f177.google.com with SMTP id f6so18932760wra.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Feb 2018 13:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yf7ABFTWfQ1OkAewPm3PInz5BL1nloBRr+UtZKjo/S4=;
	b=sWnqOBpNbH/XeNIU/thS5wHJPxJQl2KVTQBSWRhWMei8xb8/1FjpFTmfNj1aWbCYJE
	quh7rhGufI4UghalToE94p/KnrSpJeplNgD24NdTPaIZIVtRTdKao16l6Ug2c0HO0L/v
	iaEwj2q4/e0YFZhJFnCtpkaVj3kuBrs3cAmEIkStVXVLAbnfM3lZJt3lk6wiNjI/pfog
	7sJTIBMDq7cg4pt4ZoiyunqWprCrsJWwyJB9GuBAOCspjXcivHV0hLeOyu1GspDnSXWD
	gjQVIaCFd3jfBLdpvngzjt4Cy+/xCxoY5CYMxcEycIcxLWId6twR+f8VT8ZvNSyOzQbZ
	eJqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yf7ABFTWfQ1OkAewPm3PInz5BL1nloBRr+UtZKjo/S4=;
	b=WlbKfV4GsQHruJmEU5PStBuHPpDs90gEiwWl/gg+u9CBCQu++iRkFpsnYLdirKTS4a
	NiRxZptIRYm2LnCq+J5NzAtDFPAh0/FFk7jl8YhIqiTGOSklPpS6W/6pkKDNSU7FAN98
	CwK3HwUkzaUORr4gES1W8BuTymsVwYlJb4qbhC0vb+frirdWx7GUbyCSBdcyA6e+T8iZ
	PTFu2fBCozP05p+FoSRh/L36Yq+rllY/+8TL/9S88crmS7KKbOS4a1kxW4KJFSr++MuR
	MFOKxqsp1woirSLZ0Vt383oR8RPkN3ac4qInlA5t0MOdugahmf/F/OEB1sBbbJHVAy4j
	doXQ==
X-Gm-Message-State: AKwxytdM9FVX6eI/vT7mOqkpOOJnRk79FlPgBZdxZAx/kc8hWi+GPxZV
	Y0o0qf8uSgHUKS7RebBvdYRIskF6k5XUn5seli6WbQ==
X-Google-Smtp-Source: AH8x2279IfKMOLa12rpvkQv1sVi4OxVC488EsxofP48k3kaqXw/5Etgpvc1KL48YXSUh7OF/FwkkQaM473EU5ACMlr0=
X-Received: by 10.223.189.136 with SMTP id l8mr14362105wrh.58.1517521124461;
	Thu, 01 Feb 2018 13:38:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Thu, 1 Feb 2018 13:38:43 -0800 (PST)
In-Reply-To: <20180201212617.94472-1-joe.slater@windriver.com>
References: <20180201212617.94472-1-joe.slater@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 1 Feb 2018 22:38:43 +0100
Message-ID: <CA+chaQeEC_eFyqTzF+qfxKmZNVFLmZbhrGqCwDNNP1SPZrT6ug@mail.gmail.com>
To: Joe Slater <joe.slater@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 1/1] postfix: move running newaliases back to pkg_postinst
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
X-List-Received-Date: Thu, 01 Feb 2018 21:38:44 -0000
Content-Type: text/plain; charset="UTF-8"

How is this one related to:
https://patchwork.openembedded.org/patch/147161/
?

On Thu, Feb 1, 2018 at 10:26 PM, Joe Slater <joe.slater@windriver.com>
wrote:

> newaliases, when run on the host, will fail if /var/spool/postfix
> does not exist.  Run it during pkg_postinst() so that we can defer
> it to first boot.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  meta-networking/recipes-daemons/postfix/postfix.inc | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc
> b/meta-networking/recipes-daemons/postfix/postfix.inc
> index e48fc39..d5d0789 100644
> --- a/meta-networking/recipes-daemons/postfix/postfix.inc
> +++ b/meta-networking/recipes-daemons/postfix/postfix.inc
> @@ -217,12 +217,6 @@ do_install_append_class-native() {
>  do_install_append_class-target() {
>      # Remove references to buildmachine paths in target makedefs.out
>      sed -i 's:-fdebug-prefix-map[^ ]*::g; s:--sysroot=${STAGING_DIR_TARGET}::g'
> ${D}/etc/postfix/makedefs.out
> -    # Since we are building recipe postfix, newaliases and postmap come
> from our sysroot_native.
> -    touch ${D}/etc/aliases
> -    newaliases -C ${D}/etc/postfix/main.cf -oA${D}/etc/aliases
> -    touch ${D}/etc/postfix/virtual_alias
> -    postmap -c ${D}/etc/postfix ${D}/etc/postfix/virtual_alias
> -
>  }
>
>  ALTERNATIVE_${PN} = "sendmail"
> @@ -235,6 +229,7 @@ ALTERNATIVE_LINK_NAME[mailq.1] =
> "${mandir}/man1/mailq.1"
>  ALTERNATIVE_LINK_NAME[newaliases.1] = "${mandir}/man1/newaliases.1"
>  ALTERNATIVE_LINK_NAME[sendmail.1] = "${mandir}/man1/sendmail.1"
>
> +PACKAGE_WRITE_DEPS += "postfix-native"
>  pkg_postinst_${PN} () {
>      if [ "x$D" = "x" ]; then
>          touch /etc/aliases
> @@ -248,6 +243,12 @@ pkg_postinst_${PN} () {
>              # /usr/lib/sendmail is required by LSB core test
>              [ ! -L $D/usr/lib/sendmail ] && ln -sf ${sbindir}/sendmail
> $D/usr/lib/
>          fi
> +
> +        touch $D/etc/aliases
> +        # fails if /var/spool/postfix is not on host
> +        newaliases -C $D/etc/postfix/main.cf -oA$D/etc/aliases  ||  exit
> 1
> +        touch $D/etc/postfix/virtual_alias
> +        postmap -c $D/etc/postfix $D/etc/postfix/virtual_alias
>      fi
>  }
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

