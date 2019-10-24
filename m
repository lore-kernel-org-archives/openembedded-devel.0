Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 846437CECE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 08:10:59 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id m4so5694319qke.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 01:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=BhhpDsEsa+O60TqooHz+rVzhtoBa3ONUjF6aZ+7CG/I=;
	b=dxAWkkKg4sYlO8GANoGjO3I45fnhH882nDH+DMdO+XMVJDjtus5/pdoBC+xHTStVbq
	FsxFOaWVLQzw4+lE0ilDS0JcLUwA8ra2KEl6fQM+9ifXI1erub1TrYf/WjidN+WQdbGA
	a+j3zz+gUHBp3Wimfe+NmwRbBSBOseCef0H1x9umMXSEffhaWW1ItkgMYm0HPYlDMNrV
	+m3Yi9KDoQnPNcP1bZZRhZ57pIvaI7B1dUfKjzz4MyLBxsVqY2oIZGv61N4yDqy6I4xt
	ukcN/PDKnbqohviCLLfBDSC9KJi2ZTYC+4Cck1gVC2TYJPAAmGZNw7MxmPHj7iSLGs6Q
	nVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BhhpDsEsa+O60TqooHz+rVzhtoBa3ONUjF6aZ+7CG/I=;
	b=pv+nfUUqVN95+R/7ICli0YI89qjiFDFNn1kmztuRBzx+LC/6cR7ik9V8V9WHplP0zi
	EXoXJBQiOqAIAXDJ7DQH/z99ihwejyHaRHvwL2BDt/KRTGoLZouvH75f7UOrd+CahqcY
	roxGUFmUisU7noTRxpX2+oXK4ZpA/nYHmr8m5BbOuIhQEFsIGYr+dY7tplkUQL0/46Kd
	42zSUFs+Rm3rRwhq+48XHF/7ue7Ph+xyHE686ghDhYoezAf6cA17Pe+3QMopnSl9d/1c
	mvMIXsy5BfYtnzZV8v4MLh2Gr00GIbFl2NTz2+6UZ6TYaFNU2hCofBgMhrX1rG22eeVA
	XiZQ==
X-Gm-Message-State: APjAAAXQHbAjdK9eb9FHrUl4wT6bX+1wPAcvfgv/u/3bL6K5Lg8PGkR+
	518i+vsoOfLtb80G56p5QyuuQPAEI/bxtbtCQOVsnYXmwVg=
X-Google-Smtp-Source: APXvYqz1R8SdjFgsJtUOX1drRyxqHiAIRCsPfLZJ32Spa2PBYkTiKK/qRC8/D0K3QJ/bKeFdmgedoK5kDzlPPSN8L80=
X-Received: by 2002:a05:620a:20d2:: with SMTP id
	f18mr12830810qka.474.1571904660169; 
	Thu, 24 Oct 2019 01:11:00 -0700 (PDT)
MIME-Version: 1.0
References: <20191023201407.14068-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20191023201407.14068-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Oct 2019 09:10:34 +0100
Message-ID: <CAMKF1sqpmTaLH+CzS1dQ7CRpP8qT+XdHBm_NAZDtVh-c2E+maQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] libiio: Disable python support for determism
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
X-List-Received-Date: Thu, 24 Oct 2019 08:10:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 23, 2019 at 9:14 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Recent cmake changes in OE-Core mean python is now detected from
> PATH. For determism, disable the python bindings to match
> previous behaviour.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta-oe/recipes-support/libiio/libiio_git.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recipes-support/libiio/libiio_git.bb
> index 4e57d5b77..63248b4e3 100644
> --- a/meta-oe/recipes-support/libiio/libiio_git.bb
> +++ b/meta-oe/recipes-support/libiio/libiio_git.bb
> @@ -22,6 +22,7 @@ DEPENDS = " \
>  EXTRA_OECMAKE = " \
>      -DCMAKE_BUILD_TYPE=RelWithDebInfo \
>      -DUDEV_RULES_INSTALL_DIR=${nonarch_base_libdir}/udev/rules.d \
> +    -DPYTHON_BINDINGS=OFF \

instead of disabling the bindings if we specify location to python
library and headers then it works
this is in effect after the cmake change

>      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-DWITH_SYSTEMD=ON -DSYSTEMD_UNIT_INSTALL_DIR=${systemd_system_unitdir}', '', d)} \
>  "
>
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

