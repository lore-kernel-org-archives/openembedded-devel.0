Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0B6E07E97F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2019 15:14:47 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id x18so1986287qkn.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2019 08:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=D4Y9qqzrTy/vEeXeehR5mR/Fn1Ex5zGhJ5LXLs0Ygvo=;
	b=OZg++PhNp6L737T1Pen7518Nd7DbwP4Ki1cELiMECHBHis35ww8QJqLt4xRdrjHqnR
	jqVkkxDbsySyXnsQX+XrLVRXBiz6Kl6z1uC7yOYxaNvLNfqc41HLQ0Li7kwzbjufPJwx
	+3FZ8Oq1U0NkuWj4Z2E19V5w5ZnWYPvQEQ3c64R7O4lGbGWXYIYnebIRl01HxtJsYLBL
	vOstEA1GxDai5QMnU5yC+Lq+9l/zKts1gs/sCL8yCtUetxFnmx6l53A0oudxoXRv0C0D
	FJsLLHFWWAd6o9Bee+9MLzlwDgO4PfEIOnNJRuIEVV8PAD0BOReW1TJ5L6PrFO/804DY
	0Dpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=D4Y9qqzrTy/vEeXeehR5mR/Fn1Ex5zGhJ5LXLs0Ygvo=;
	b=kwY7ZkclH4yK9M6CGoBS7hNxPZJOAptJPAw9wpzKwkqEJ7B3q1uzhK/ASlPV+7UUEB
	l1wgFYEm7am3wORikRV5r4BqcSKaYt50q0uv4+1VgQLC53N4lyTjzfPkZipWCmNXg5+X
	U1ZpMA1jbVc0rj1CGhJVKHHoc2XGOY9G8LgKMgeadQM3jh7MWTpmjmOLY6xDUsVwBhV+
	BTBNdnS+8Fu2C0VL3c5RhV/0jS2FWYuAHKXzH7Ks2aD7x3HW+CmaLmM1i9wXnouxgDbE
	FlBPoW71XtxIoXopBsbzINhbsffifJ3EqhKlRXsQ5W8Spe53wUPwcf/OP7YgU2LjgIsC
	5U8w==
X-Gm-Message-State: APjAAAXnrz9V+Y2U6G2Np+8sJg4tDJOogWKr1WoWFJxxUYSDqguZ1ux+
	GSEZJqsj1nPgdpYYIFvYBbhum81qnGyF44kA6Og=
X-Google-Smtp-Source: APXvYqzQjgz6MIbGE2Dr4iXry5wcy6+eiMmS2SpZ0Kpenjz6e1QGwy6TXdQW36zQVpU3GOZvDiCK8lX2qlmV1O5Um08=
X-Received: by 2002:a05:620a:5b0:: with SMTP id
	q16mr3899735qkq.212.1561648488833; 
	Thu, 27 Jun 2019 08:14:48 -0700 (PDT)
MIME-Version: 1.0
References: <1561602827-2393-1-git-send-email-hongxu.jia@windriver.com>
In-Reply-To: <1561602827-2393-1-git-send-email-hongxu.jia@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Jun 2019 11:14:38 -0400
Message-ID: <CAMKF1sqDaR4w1y9VQ+BCtpUv-1PtQPY7H8u5RKyP8aS9h=aOSQ@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-multimedia][PATCH V2] tvheadend: do not inherit gitpkgv
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
X-List-Received-Date: Thu, 27 Jun 2019 15:14:48 -0000
Content-Type: text/plain; charset="UTF-8"

git0 will sort lower than git1 so may be PE jump will be helpful here

On Wed, Jun 26, 2019 at 10:34 PM Hongxu Jia <hongxu.jia@windriver.com>
wrote:

> Do not inherit gitpkgv in meta-oe, since meta-multimedia
> does not depends on meta-oe.
>
> The pkg version will be minor changed
>
> Before the fix:
> tvheadend-4.3+git10478+bdc2ae9-r0.core2_64.rpm
>
> After the fix:
> tvheadend-4.3+git0+bdc2ae9e19-r0.core2_64.rpm
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
> b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
> index dc6cd46..bbe4ce0 100644
> --- a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
> +++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
> @@ -1,7 +1,7 @@
>  SUMMARY = "Tvheadend: TV streaming server and recorder"
>  HOMEPAGE = "https://tvheadend.org/"
>
> -inherit autotools-brokensep gettext gitpkgv pkgconfig
> +inherit autotools-brokensep gettext pkgconfig
>
>  DEPENDS = "avahi cmake-native dvb-apps libdvbcsa libpcre2 openssl
> uriparser zlib"
>
> @@ -12,7 +12,6 @@ SRC_URI = "git://github.com/tvheadend/tvheadend.git"
>
>  SRCREV = "bdc2ae9e19520a10cdf0bec0fcc0050b32bc75ff"
>  PV = "4.3+git${SRCPV}"
> -PKGV = "4.3+git${GITPKGV}"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.7.4
>
>

