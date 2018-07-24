Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id AAB9E74C97
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2018 16:47:17 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id c14-v6so3204768wmb.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2018 09:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZRcTFFuS0iqlLFbDgF0TPJ03WE2DSZ4fxer2DRkuiCw=;
	b=LYnDzA4PHGhmC3m6t4bLlYRm5708vYvZD88EkoNklGffiLqAiC8+opZpnhOV2kmqmf
	lfKLnKm1mL4ph9znOmXiH04/bu4jO7sxAIowvRgxXiEvhCfTt0NEts7bMHqvQg1vx3jF
	7JaQj2Lz/vZI9xOWvt5OCpQ+Vas2rnHTmiwqAelccOqTGmlFavncMimaswn4N+Nh/uMM
	ac8+RYtPY0wV8nAdjT4o9m6g87ZCcKmEorygBAfMVS+K3whWoHNrgSeF/uGTmk/dVbJ3
	0ezQeiytE0cPBBMSfEi21EF5lztrmFkFd6a7K1+K2DqITRxQCkVq9eEYov9eK71ZRi9F
	tLCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZRcTFFuS0iqlLFbDgF0TPJ03WE2DSZ4fxer2DRkuiCw=;
	b=ncRAiB2UmIru8a9rJXWUuJFHS0TaCnPN8tJcNxhz/2hjfRMauSrv1TMvu/AaF2jzhx
	IioYO4dsOABFo9gckJsQcaZpyEbh3VbcCXug30F+MUCQHy6AJHss8zI4xGE1Ca/u6wZs
	tZLUTsQS32DHlzjIa//h19+mbHnGtvOBfXVD2F/XjolppRv5yJsMaG9YY7gC+KmeuWon
	e5t6uUdV4Uk0YjUiH6MY/M4KniV32jiIAVYemWMI82AhqSSDKAV+SsUJsjlCCrqdIhDp
	nXm1wsO+XsQSt5JY7nWpODPCck6yzZvVyffx3JpdinCxoO8qtXMw5mfam3puT/zoeR7R
	jzvw==
X-Gm-Message-State: AOUpUlGAvzpiHuUEbY9xFpMqkclR8Gotw/pRPpt7dFAovM70WRvRgZ3E
	yBtMmaCm0COI0/BUHXCpxYfReyn8VN86+sm+fstdCA==
X-Google-Smtp-Source: AAOMgpfbve17vOe7FPZOwNDi1MQPQxEfhqcQCQ52DvM88uWqh7Neisai42qQnJvBTlXN6EqHUEhBBfUQzTs/x44tbBE=
X-Received: by 2002:a1c:8f0e:: with SMTP id
	r14-v6mr2584986wmd.79.1532450838150; 
	Tue, 24 Jul 2018 09:47:18 -0700 (PDT)
MIME-Version: 1.0
References: <1531899089-395618-1-git-send-email-changqing.li@windriver.com>
	<1531899089-395618-6-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1531899089-395618-6-git-send-email-changqing.li@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 24 Jul 2018 18:47:07 +0200
Message-ID: <CA+chaQdAwHn0fAj2A6oX5HrbK5zADMmYX0DACO2KEVt55+0ZBQ@mail.gmail.com>
To: changqing.li@windriver.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe] pps-tools: 0.0.0+gitX -> 1.0.2
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
X-List-Received-Date: Tue, 24 Jul 2018 16:47:17 -0000
Content-Type: text/plain; charset="UTF-8"

Why not use RDEPENDS_${PN} instead of RDEPENDS_pps-tools? It's now broken
with multilib.

Also meta-oe is using 4 spaces for indentation, would be nice to fix the
do_install.

On Wed, Jul 18, 2018 at 9:32 AM <changqing.li@windriver.com> wrote:

> From: Changqing Li <changqing.li@windriver.com>
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../pps-tools/{pps-tools_git.bb => pps-tools_1.0.2.bb}               | 5
> +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-support/pps-tools/{pps-tools_git.bb =>
> pps-tools_1.0.2.bb} (82%)
>
> diff --git a/meta-oe/recipes-support/pps-tools/pps-tools_git.bb
> b/meta-oe/recipes-support/pps-tools/pps-tools_1.0.2.bb
> similarity index 82%
> rename from meta-oe/recipes-support/pps-tools/pps-tools_git.bb
> rename to meta-oe/recipes-support/pps-tools/pps-tools_1.0.2.bb
> index 8bf9036..106be35 100644
> --- a/meta-oe/recipes-support/pps-tools/pps-tools_git.bb
> +++ b/meta-oe/recipes-support/pps-tools/pps-tools_1.0.2.bb
> @@ -4,12 +4,13 @@ HOMEPAGE = "http://linuxpps.org"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>
> -PV = "0.0.0+git${SRCPV}"
> -SRCREV = "0deb9c7e135e9380a6d09e9d2e938a146bb698c8"
> +SRCREV = "cb48b7ecf7079ceba7081c78d4e61e507b0e8d2d"
>  SRC_URI = "git://github.com/ago/pps-tools.git"
>
>  S = "${WORKDIR}/git"
>
> +RDEPENDS_pps-tools = "bash"
> +
>  do_install() {
>          install -d ${D}${bindir} ${D}${includedir} \
>                     ${D}${includedir}/sys
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

