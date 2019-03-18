Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
	[209.85.160.182])
	by mail.openembedded.org (Postfix) with ESMTP id C11856C1BE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Mar 2019 17:02:57 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id x12so2645215qts.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Mar 2019 10:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QIygU/zgog+eT0xOvPG1BQYu4cbxEwfH1MgLkcAG4YM=;
	b=gNE82K51DG+4K0iXOxd5tiLGBSq6f/OJMZNPrx6y5hKnTlwDkf+VvlTSo8TIAiE2jm
	8Obgge+7DbB4zJBEYFrQ53KLPobcy3fujxA8dz1b/QvIp63N2gwoh5iKKP4+fdQWwJ6+
	FrbkBP4ornh+I6Wa/oUNN8mRpyhMDpFxzqpTrIxZK13nIwbH+pMDUky0RkiB9I2xY2Ie
	c6MIt2+BIOrD6pFnXr+KveYyA0WtE3vExGYvyfd53leVBsNN8BWz1Wb3EOkNWw5iINlz
	AKYYVoK9JVAVhowkBErkIFEVOoLb3uSub8FBqU0xUX+6aIZqOeb+XE9jyAqAqLjiahAM
	/wYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QIygU/zgog+eT0xOvPG1BQYu4cbxEwfH1MgLkcAG4YM=;
	b=MIsI2ix38vSC4po3JRV+A8ZZoQbtw2M4YROufgNpag9iObYiXb0PrAVUrapX65nAbT
	morLdYpv9R4tf4TwAUUCww+qNhLprxJRmdFnOn9B1735hbuqbaT+BHqDrUJn/09kl5uY
	zt+l0JwzTZDd7/5OoqvmFbsbQaRL76Y89VGYduVuG4PfQCyIlPTIaqHQkl//YwQywHpM
	JWNvloARBfo2fw0d8j8M0a781hhwEBhUaeV/l9QgSzyMXaheq3INCUg2HGNEeNUiRmGO
	3Ba92/1UCOcGy0fEtoNPvuhdB0RY0qZ0n5jseQAhDHPjM8IxT1x9SZJnHurUgGgcl0yN
	muYA==
X-Gm-Message-State: APjAAAWYj2MFMUjj9qYj698ozpIvpNR98fFItCB8fcuw5U0odO1JF3WS
	wHQ0y54shgtE900nw9fg4R4RMp6XBwJ+u6CFLmzKsDng
X-Google-Smtp-Source: APXvYqwaqOS+BzGHOCbJ2GSv4GHgpDJpaTJ5I1K6wBpXlcXk3PbiIadkTUJb40XHVNrfw+Z70KwA56xP1ano3w0e36Q=
X-Received: by 2002:ac8:2562:: with SMTP id 31mr10665241qtn.253.1552928578453; 
	Mon, 18 Mar 2019 10:02:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190316171006.16245-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190316171006.16245-1-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Mar 2019 10:02:32 -0700
Message-ID: <CAMKF1squDfYi+EMoVF4Y=BDGWn32D4N_gAt37=RB_GFvoH7nmA@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] blueman: update to 2.0.8
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
X-List-Received-Date: Mon, 18 Mar 2019 17:02:57 -0000
Content-Type: text/plain; charset="UTF-8"

Fails

https://errors.yoctoproject.org/Errors/Details/233473/

On Sat, Mar 16, 2019 at 10:10 AM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../blueman/{blueman_git.bb => blueman_2.0.8.bb}           | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>  rename meta-networking/recipes-connectivity/blueman/{blueman_git.bb => blueman_2.0.8.bb} (80%)
>
> diff --git a/meta-networking/recipes-connectivity/blueman/blueman_git.bb b/meta-networking/recipes-connectivity/blueman/blueman_2.0.8.bb
> similarity index 80%
> rename from meta-networking/recipes-connectivity/blueman/blueman_git.bb
> rename to meta-networking/recipes-connectivity/blueman/blueman_2.0.8.bb
> index 947db7836..8993aaa3c 100644
> --- a/meta-networking/recipes-connectivity/blueman/blueman_git.bb
> +++ b/meta-networking/recipes-connectivity/blueman/blueman_2.0.8.bb
> @@ -7,12 +7,11 @@ DEPENDS = "bluez5 python3-pygobject python3-cython-native python3-setuptools-nat
>  inherit autotools systemd gsettings python3native gtk-icon-cache
>
>  SRC_URI = " \
> -    git://github.com/blueman-project/blueman.git \
> +    https://github.com/blueman-project/blueman/releases/download/${PV}/blueman-${PV}.tar.xz \
>      file://0001-Search-for-cython3.patch \
>  "
> -SRCREV = "c4a03417e81e21543d4568e8e7f7de307582eb50"
> -PV = "2.0.5+git${SRCPV}"
> -S = "${WORKDIR}/git"
> +SRC_URI[md5sum] = "51dc07d48125ee9600e7f6168d6e67f6"
> +SRC_URI[sha256sum] = "04afd07b4c900a401f39e711dedbf8b9cf12000ddeda0d8ef3c3327caf34704e"
>
>  EXTRA_OECONF = " \
>      --disable-runtime-deps-check \
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

