Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3A0397F2DF
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 02:16:30 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id m2so7857923qki.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2019 19:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=K9dsD7ppONczXsBEg5QsbPOx+5QkrhjKN8TYt02oU9c=;
	b=UM0UMRV9aSQrii2/KFjYy11CMV3fM6sMv4jFcSr9sM9HsaHawwylPVfH1xoa+x7E0J
	Y+BlPor/rsPqMyVqsTLQLMT5VaH4gz4USvFD0vZQNPDceccfIYhuGfSO+3vUd8ZvqRLo
	l6wOGNyzbJkcNmutwuhrsvn6MSlXBWF9xdPvSjZDPb7Yi+fgyuh5nvxTXdtYFE8xw6Th
	eUNC9HYStnuBC1/UKJqLdbL73LD3Z+iXHYTEY4kS2vTvZWKIExAZmzqkW1a1wqQ0TcUC
	Ar5yNU9PAobL7aOKtalvvHzMsON1rGT5LqMwW8Dd9ri2sAHiHe04y9gu5VwmAtf+nZif
	6WmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=K9dsD7ppONczXsBEg5QsbPOx+5QkrhjKN8TYt02oU9c=;
	b=Imcwg/bEoK7iV9aqhtTyLKZtql2Y1epmtZLW10+ykl9qc+pxalE6jKZocFj2Laqa9Z
	/AqCXI6AHEYDiL/JfkMpSdLl98M9lZLBsbIdosoVv1MHGWhI3N6DXQWVkXccOE0A4d8w
	N8zLxY3394qUSwPssS/ZMpTa3PF3lJweU9J9CNonyMIP4keuDgLQWETUghTAVGZjUF1m
	IgHthcOYNGzp5oIbx983xE8+aaAaeYhbvwX1MqswDnsagClGw+4KTO1nsHySbyWX4C4O
	hAAzV9bJkFjaxmq3mSbRGIq0ETg/3HcAdXEnjAZRkp2NPBbKDFFkOHDaoHmxy/Aigtfc
	ReVw==
X-Gm-Message-State: APjAAAXiHJ62pd+qkGN08iJlvIyNhFRLxHt/cwr9eKs+UpZqz6l8koPr
	iu7QI59kosIfpBbRTcINXk50OG3mbAp25+9QSKpKzPhC
X-Google-Smtp-Source: APXvYqwb6+VBQkxMr+Vbd0Ug44E0V4B+9gyoAdotlzTNSqe2OcvpomTfdN7rMQg7Y77OJb5SEM+UpJ0ladx4sbEopSU=
X-Received: by 2002:a37:c403:: with SMTP id d3mr11561630qki.212.1567217791799; 
	Fri, 30 Aug 2019 19:16:31 -0700 (PDT)
MIME-Version: 1.0
References: <1567217664-14728-1-git-send-email-hongxu.jia@windriver.com>
In-Reply-To: <1567217664-14728-1-git-send-email-hongxu.jia@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 30 Aug 2019 19:16:05 -0700
Message-ID: <CAMKF1spm2M8ZdiFVDFyM2jgrEM_VS2vTsgp7HtfYjDSnxf5dUw@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] layer.conf: add lvm2 as libdevmapper preferred rprovider
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
X-List-Received-Date: Sat, 31 Aug 2019 02:16:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 30, 2019 at 7:14 PM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>
> Since commit [libdevmapper/lvm2: force recipe libdevmapper to populate
> sysroot only] applied, if recipe DEPENDS on libdevmapper, we have to
> add it to packages RDEPENDS to fix [file-rdeps] QA issue
>
> Set PREFERRED_RPROVIDER_libdevmapper = "lvm2" in layer.conf to explicit
> use lvm2 as libdevmapper preferred rprovider
>
> Remove unnecessary insane skip
>

thanks I have staged something similar

> Suggested-by : peter.kjellerstedt@axis.com
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta-oe/conf/layer.conf                               | 2 ++
>  meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb | 2 --
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
> index 896a5d6..e48fabd 100644
> --- a/meta-oe/conf/layer.conf
> +++ b/meta-oe/conf/layer.conf
> @@ -33,6 +33,8 @@ LAYERSERIES_COMPAT_openembedded-layer = "thud warrior"
>
>  LICENSE_PATH += "${LAYERDIR}/licenses"
>
> +PREFERRED_RPROVIDER_libdevmapper = "lvm2"
> +
>  SIGGEN_EXCLUDERECIPES_ABISAFE += " \
>    mplayer-common \
>    fbset-modes \
> diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb
> index 194842e..0773671 100644
> --- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb
> +++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb
> @@ -89,6 +89,4 @@ EXTRA_OECONF += "--disable-libargon2"
>
>  FILES_${PN} += "${@bb.utils.contains('DISTRO_FEATURES','systemd','${exec_prefix}/lib/tmpfiles.d/cryptsetup.conf', '', d)}"
>
> -INSANE_SKIP_${PN} += "build-deps file-rdeps"
> -
>  BBCLASSEXTEND = "native nativesdk"
> --
> 2.7.4
>

