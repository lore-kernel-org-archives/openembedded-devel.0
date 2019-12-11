Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 981B47F8C2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Dec 2019 18:49:10 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id w47so7205058qtk.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Dec 2019 10:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hcdFpJnkyImVXKFLNVdtBumVbOAxS5QK2gt8b11oBg0=;
	b=XOfkyPSegYHqy9aerximO1VlIozqjf+5gxSOqA7Y4qR0QmYb53/FXEqls4c72R+E4Z
	4IkrkAm4rqMo/5ddzjsyQNtYuTXeergqLlJuIon9Aj73ZyWGTlG8a79v+7qz2tH2ejL8
	ppC2xjHE95y7RcScCWxl5+FE23Cni/pl0HTmgxDJsOexl7t4sUM+Y5cr1UcaHOw6AwLV
	xe28ETh61XrDTGatLpAvXkghKe4E/umIeDjnzkaSfFvMPZIm+Z7jvJj9ZHW2P7wtNTZc
	7RJeZeP4uyrGxE64p964iTQtKpiYRpccgaiVpNUq1MgxxPXgjvWtRG7XH3pTixrsvokM
	xnzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hcdFpJnkyImVXKFLNVdtBumVbOAxS5QK2gt8b11oBg0=;
	b=AzK5u4xvPG2AjSUwuMNPXi5V+HNEyUN+dXI8hybfJxgnP/sG8/eF/LIBEJiChhHGIZ
	xoeZcoVo2K2FMtSs0/KVlPyiS/oSv9TnIrQTYDyJ2Wx/iTvha/COVNau7WUa1OJPRlEq
	TB0rbjr/Zox5Ne+HOx2JbnjFkRcHkCfTZiKBQISyZlV9mWkpX4nxVJxZhwUFJNgVtrB3
	SPsvD5aiM9SdOXgVHpKjmk24cC8AuW6ZBjE+xXkPLwdBjR9tpokxx5mg2K0CXK/GLeF6
	GxBTNy37ywqwj/ALfUeASs51Tb5Nr1ZWaL8LORrmCojq49SSuer0MfXgc53lOx7jRips
	B3vQ==
X-Gm-Message-State: APjAAAV69ENXU5a/7rSNInVbPmpGvipMLRwPiNzXizhPFphUlphrYgO9
	aIrzSj6AR0YbH3xUt5Ew63aCCsT5lRxyYgOdLFg=
X-Google-Smtp-Source: APXvYqyg4VzNQmwmSMFe+O7iKqaJjKsVT3xi0LmdtO6UhtTw12MxdUiiG9NoUoyQigpZQccNAI1wImB1ya01mzA4Ark=
X-Received: by 2002:ac8:41c3:: with SMTP id o3mr4133678qtm.88.1576090151105;
	Wed, 11 Dec 2019 10:49:11 -0800 (PST)
MIME-Version: 1.0
References: <20191211184339.48747-1-joe.slater@windriver.com>
In-Reply-To: <20191211184339.48747-1-joe.slater@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Dec 2019 10:48:44 -0800
Message-ID: <CAMKF1soOwxA48FFNMM5kEXE1cYzqaWyNL=ym9ab60+0VME83dg@mail.gmail.com>
To: Joe Slater <joe.slater@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-webserver][PATCH 1/1] phpmyadmin: move to version 4.9.2
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
X-List-Received-Date: Wed, 11 Dec 2019 18:49:10 -0000
Content-Type: text/plain; charset="UTF-8"

https://patchwork.openembedded.org/patch/167913/ is already submitted for this.

On Wed, Dec 11, 2019 at 10:43 AM Joe Slater <joe.slater@windriver.com> wrote:
>
> Fixes CVE-2019-18622.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  .../phpmyadmin/{phpmyadmin_4.9.1.bb => phpmyadmin_4.9.2.bb}          | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>  rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_4.9.1.bb => phpmyadmin_4.9.2.bb} (91%)
>
> diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.9.1.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.9.2.bb
> similarity index 91%
> rename from meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.9.1.bb
> rename to meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.9.2.bb
> index 3da2d9b..9cd43a8 100644
> --- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.9.1.bb
> +++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.9.2.bb
> @@ -11,8 +11,9 @@ SRC_URI = "https://files.phpmyadmin.net/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-la
>             file://apache.conf \
>  "
>
> -SRC_URI[md5sum] = "a165109629731f5311ec3171cce50972"
> -SRC_URI[sha256sum] = "8f89dd62e3fdddabca187b092eeb5af4a4fb956189564c56038970519d0496c5"
> +SRC_URI[md5sum] = "5b5d1d84a05624430ac659e36af00f4e"
> +SRC_URI[sha256sum] = "3bc3e37fefbdfcaf12fd59d6d7fdbf11ffcffe3e211155bf5b822b54a3c2043e"
> +
>
>  UPSTREAM_CHECK_URI = "https://www.phpmyadmin.net/downloads/"
>  UPSTREAM_CHECK_REGEX = "phpMyAdmin-(?P<pver>\d+(\.\d+)+)-all-languages.tar.xz"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

