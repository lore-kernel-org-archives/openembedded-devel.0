Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 53A987BFB6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2019 05:45:20 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id y57so9373329qtk.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Jun 2019 22:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TnJ53xK/WLiEwJ7Q3TuifIHIAomKKvjMx4ZAwCq+hUE=;
	b=g2YTuGxwqmpzoydnLJHrOdsFmg95Uy81olzQz0FQiRzCbdBiK/B7w4CtBey75LvfUq
	bePtYZLseeXvHhsIkGOlYxV7GEeuZi11y8pkW/3R1VaS01vCVSKPpVZxml4dht3b/hu7
	M0VsQDc5KKy843qbMVXlMKBRll9M+HsUHiJXo6KaxcZRf5BFPFFjuJVzqBuKF9V7K3BE
	eG1EB369EgzObKaJM7b6eguJYeJcnHpHeOPC1AIo5wBuVUxQ7Wa0K4vu4GZKZ7jsgfwr
	+aEECAowpsn7230Eocb1lEPwoasPg/KCj4YRkblWW/qpnctYnS790tzxqNN1hsSBOsXz
	Rv+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TnJ53xK/WLiEwJ7Q3TuifIHIAomKKvjMx4ZAwCq+hUE=;
	b=HofX2XzgplNev+DEdNq8tVD8wuwiHxWi/XdIuGQ5koUZrbdyB6CLF+S/ByOdOObsxs
	RTaV4doirfpFvtkts2VhUrr95ZLqQnKVcZJNyXQX7XAI2VVt2s93SpnHTkOAsSCgw8cY
	ixu20tr760iAnsXmlJkixekLK6I5IQdOS65vzqiBxF5Nqurw7XdglpHv3Z4L9vziOZvu
	Cb0HQSNipjq0c+DRcSTKrR2aHiBeL7MhyPskvcCCjwtU8BDiQY/9NFhRodFWuIlH6p8H
	iZs30Gc43Q6EbymJ4uwKQ8/q+XFFbzRAan/1p7XzD4rsG3iX28rAnmkTvuqVfRLi6HOI
	eQiQ==
X-Gm-Message-State: APjAAAVIxio1qXo6wIQRq1BeCQz7Meur60IJqPK7y7vR5/0+Y9qoR/AB
	P5BuSvx/ctSP+sa6V2OznsjH4gfXYGi3xlJT5j0lzxGg
X-Google-Smtp-Source: APXvYqzKmZo/h8tn9oo5IijsLtc6zp8wdVP38JPcY+Ej0Aytkl7CdwEJt3CpemfBk6o9TKBhiecwCZLIUgB4X7wwpt8=
X-Received: by 2002:a0c:bd1d:: with SMTP id m29mr19712346qvg.181.1560750320816;
	Sun, 16 Jun 2019 22:45:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190531085447.827-1-sbabic@denx.de>
In-Reply-To: <20190531085447.827-1-sbabic@denx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 16 Jun 2019 22:44:54 -0700
Message-ID: <CAMKF1spDK7+JRvnJMkWhA_RqPcZwwZ4_2xoLv=_RcewU+imfag@mail.gmail.com>
To: Stefano Babic <sbabic@denx.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] systat: systemd never enables the service
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
X-List-Received-Date: Mon, 17 Jun 2019 05:45:20 -0000
Content-Type: text/plain; charset="UTF-8"

this is wrong ml for this package, please send this to oe-core ml.

On Fri, May 31, 2019 at 2:04 AM Stefano Babic <sbabic@denx.de> wrote:
>
> Even if SYSTEMD_AUTO_ENABLE is set to "enable", the service is never
> activated by systemd. The cause is the postinst function in the recipe:
>
>  pkg_postinst_${PN} () {
>          if [ -n "$D" ]; then
>                  exit 0
>          fi
>          if [ -e /etc/init.d/populate-volatile.sh ]; then
>                  /etc/init.d/populate-volatile.sh update
>          fi
>  }
>
> This generates with activated systemd the following postinst script:
>
>         set -e
>                 if [ -n "$D" ]; then
>                         exit 0
>                 fi
>                 if [ -e /etc/init.d/populate-volatile.sh ]; then
>                         /etc/init.d/populate-volatile.sh update
>                 fi
>         OPTS=""
>
>         if [ -n "$D" ]; then
>             OPTS="--root=$D"
>         fi
>
>         if type systemctl >/dev/null 2>/dev/null; then
>                 if [ -z "$D" ]; then
>                         systemctl daemon-reload
>                 fi
>
>                 systemctl $OPTS enable sysstat.service
>
>                 if [ -z "$D" -a "enable" = "enable" ]; then
>                         systemctl --no-block restart sysstat.service
>                 fi
>         fi
>
> Due to the exit statement, systemctl is never called and the service is
> never enabled in rootfs.
> Invert the logic for the check to let run the rest of postinst script.
>
> Signed-off-by: Stefano Babic <sbabic@denx.de>
> ---
>  meta/recipes-extended/sysstat/sysstat.inc | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
> index 0bc7e14d36..850a6d1465 100644
> --- a/meta/recipes-extended/sysstat/sysstat.inc
> +++ b/meta/recipes-extended/sysstat/sysstat.inc
> @@ -51,12 +51,11 @@ do_install() {
>  }
>
>  pkg_postinst_${PN} () {
> -        if [ -n "$D" ]; then
> -                exit 0
> -        fi
> -        if [ -e /etc/init.d/populate-volatile.sh ]; then
> -                /etc/init.d/populate-volatile.sh update
> -        fi
> +       if [  ! -n "$D" ]; then
> +               if [ -e /etc/init.d/populate-volatile.sh ]; then
> +                       /etc/init.d/populate-volatile.sh update
> +               fi
> +       fi
>  }
>
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

