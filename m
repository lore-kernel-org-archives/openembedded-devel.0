Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f171.google.com (mail-wr0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id F29D971D97
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2017 11:27:21 +0000 (UTC)
Received: by mail-wr0-f171.google.com with SMTP id 89so75560459wrr.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2017 03:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=a3l4/w3YlvO6AC2xayKu+OZkHL9l0+uhYs6gY5XANUw=;
	b=Crg+6lYsuMN/s80JGQbyHHTGHgPOHxvgqzPRezA/bJQV9pAXEe/U3wz1c+Ljjk2O1g
	9NWaYdhuIP9AOITWw6MYzh18RieU10fzXjI+lUbYvTbhxr1jYvBONY3b1QKejHvBtOeg
	/9zeMxNAKczz1ie9z+YiNn7rOmin+dw2ANvrol0cV5iAGEqXQj5W2qHsPsqe7q5sHA6e
	eT5I/jGosFwJYxlVLQoSVMKhyqsDMnqE9qlvA9sUTGS9adAmNXx8bpoZM1x6e12r/ZaX
	syxFBsvN3BRdwEsiQ5s16+SDdPbyS7RpHOwyqWz90l/7ikH0UI5MPIAv9JdthwOw+9is
	IOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=a3l4/w3YlvO6AC2xayKu+OZkHL9l0+uhYs6gY5XANUw=;
	b=I0qA0GmqhNRg1SJb0HrAT4/2jurF4xpW2Wm60nhwf45KKe8f4kWzNuUvaA4Hlk1PA8
	6Qqir+fdYuUBkENYgS5aOKvY0OLNGulv+KJeo2QAJG8Hwoir1SI4vwNZzidp0xAMXr4w
	vS+sVaqA3KS0tLm9HDHYZh4t4zCG1PQbSOfBdSaFn/mnZ+Jcdrh/6p/AZ9keFsHCyuEQ
	qtXhge6btp2Oy39lZhU0cqNRlVoKAaethvucuygJGbMeUIjxp99k1ekXbOTLmpDeUdjF
	ga8Fsox0YWuYadAWkOP9f6Mt4Wyjp65v6rSgcKxjb7477wnprYhJ14PiFGuWuKD6LDre
	zGIQ==
X-Gm-Message-State: AMke39mzOZ38cLpuak8eAlmHU8aNAlRyyI9S+cDZIWC9CPVWvLOBUDJrs28U4i4WlRaooMWiAUNhz0U5Oyn30A==
X-Received: by 10.223.153.55 with SMTP id x52mr17135278wrb.196.1487676442570; 
	Tue, 21 Feb 2017 03:27:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.212.30 with HTTP; Tue, 21 Feb 2017 03:27:21 -0800 (PST)
In-Reply-To: <1487674889-17516-1-git-send-email-gary@mlbassoc.com>
References: <1487674889-17516-1-git-send-email-gary@mlbassoc.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 21 Feb 2017 12:27:21 +0100
Message-ID: <CA+chaQcvZVLn1VBvE4rVdtdCo3e48x4rmR--k5HoSfBydb5QnA@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] fbgrab: Update to latest version
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
X-List-Received-Date: Tue, 21 Feb 2017 11:27:24 -0000
Content-Type: text/plain; charset=UTF-8

This S value is the default:
meta/conf/bitbake.conf:S = "${WORKDIR}/${BP}"
you should just drop it.

On Tue, Feb 21, 2017 at 12:01 PM, Gary Thomas <gary@mlbassoc.com> wrote:

> Update to version 1.3 (2015-06-16), fix recipe for different directory name
>
> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
> ---
>  meta-oe/recipes-graphics/fbgrab/{fbgrab_1.2.bb => fbgrab_1.3.bb} | 6
> +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-graphics/fbgrab/{fbgrab_1.2.bb => fbgrab_1.3.bb}
> (71%)
>
> diff --git a/meta-oe/recipes-graphics/fbgrab/fbgrab_1.2.bb
> b/meta-oe/recipes-graphics/fbgrab/fbgrab_1.3.bb
> similarity index 71%
> rename from meta-oe/recipes-graphics/fbgrab/fbgrab_1.2.bb
> rename to meta-oe/recipes-graphics/fbgrab/fbgrab_1.3.bb
> index 1d87b86..905c1e5 100644
> --- a/meta-oe/recipes-graphics/fbgrab/fbgrab_1.2.bb
> +++ b/meta-oe/recipes-graphics/fbgrab/fbgrab_1.3.bb
> @@ -8,10 +8,10 @@ SRC_URI = "http://fbgrab.monells.se/${BP}.tar.gz"
>
>  inherit autotools-brokensep
>
> -S = "${WORKDIR}/${BPN}"
> +S = "${WORKDIR}/${BP}"
>
> -SRC_URI[md5sum] = "15b432735d6efd0373722bb96577b945"
> -SRC_URI[sha256sum] = "61e0772ad6ea744ee597ae478398dd
> d0ba6fceee2cf343859bebde2c15bafb91"
> +SRC_URI[md5sum] = "7d8c24081c681dfbba21f2934c1ac656"
> +SRC_URI[sha256sum] = "5fab478cbf8731fbacefaa76236a8f
> 8b38ccff920c53b3a8253bc35509fba8ed"
>
>  do_configure_prepend() {
>      sed -i 's|$(DESTDIR)/usr/man/|$(DESTDIR)${mandir}/|g' ${S}/Makefile
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

