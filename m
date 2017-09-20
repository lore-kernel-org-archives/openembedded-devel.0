Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5FAE777D17
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Sep 2017 15:32:30 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id u18so1838387pgo.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Sep 2017 08:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DR+FrgVc5uHHOZ3kN/iFv2Ci4C52CUSruFg2LSk5v2U=;
	b=SdZ1U/Qe1UOEPL9T6qcm+hC+vIyXr6oi9g5o5X6VldDzVqtq5T9eyKjbnqvta/wvC9
	Qb4mweEhG/+rZYW9YgNfGC/AuSJBpYueTVJ47nb2soRP9OV6Usf6bb8DgLtewAPToCP6
	qsxpbQiknjv5JxIy59jiS/VpDBpirKH5ddKA7pOTYt8J1zMnBDHSUNjWuvLs3WEOw0WJ
	W3vcSSD40nWndbzrt4e2rOwQIl+MNrDQ6rvJxdg41wGQCvwZ8XHvQ3jtdctYSuHsxoUq
	fwDJn+yzVJhsg7tLLQiLr3cEXa3pNJA5SLnpJGr16TZR44aLDQyWwyeCm4eI9IPYdlkJ
	agpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DR+FrgVc5uHHOZ3kN/iFv2Ci4C52CUSruFg2LSk5v2U=;
	b=ewta4LCGo1L9zo4xfbkMsOYWqWliKHhdngqZn0Zmjzoqc9G6E7/q8PECw2wz3gckWa
	1HMFmxkswVO/CY7rbeuujiMMjERnLbDXLNOT+Dmkdf2CHSL1+Xi4hyREmPqx9ZTQj42i
	4wtKZe5QkSKYDtOjI7RM0f4IIdNrNaNUDuN8HgD568KFWzzRyWy4PgbT/b10FyNjFKhc
	cVcPqRpPXQkIsTRnV3OshY74qX1iM+si6KyiN82ftfSiaQ/PCQgo+CG/+Quhj9Bgoj3N
	x/GEgFIg8ASkdCvpNd4rk1Y01cuWOnFTHWjUahpEYcx5scXhX+YLT1w36K1rpNbOVhZ/
	GZIg==
X-Gm-Message-State: AHPjjUgylmqkV1OaAfIWDXpkyLfnsqnbIo2txZtFQfWaCEuKEXGB+VDo
	XQ46aznOB+JYOZf5dwl7j74RmsV5hHK6o7dt6Xo=
X-Google-Smtp-Source: AOwi7QAsZtwkPhvo8QSXyc0O6Ym4DEd25d64YgSGfjdh5eUW9CsqG7i5lXprzG1scriUNhcV9/BozktvmS+ba7x9a+Y=
X-Received: by 10.99.51.15 with SMTP id z15mr2534852pgz.287.1505921552279;
	Wed, 20 Sep 2017 08:32:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.149.73 with HTTP; Wed, 20 Sep 2017 08:32:01 -0700 (PDT)
In-Reply-To: <1505920293-28115-3-git-send-email-derek@asterius.io>
References: <1505920293-28115-1-git-send-email-derek@asterius.io>
	<1505920293-28115-3-git-send-email-derek@asterius.io>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Sep 2017 08:32:01 -0700
Message-ID: <CAMKF1som+O+3KydLvPXQbE2ojDE_UUF9snru6Za3XWDydvcpSA@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 3/3] php: add libgcc to the runtime depends
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
X-List-Received-Date: Wed, 20 Sep 2017 15:32:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 20, 2017 at 8:11 AM, Derek Straka <derek@asterius.io> wrote:
> Avoids issues with 'libgcc_s.so.1 must be installed for pthread_cancel to work'
>
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  meta-oe/recipes-devtools/php/php.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
> index 0e55020..283d630 100644
> --- a/meta-oe/recipes-devtools/php/php.inc
> +++ b/meta-oe/recipes-devtools/php/php.inc
> @@ -203,6 +203,7 @@ MODPHP_PACKAGE = "${@bb.utils.contains('PACKAGECONFIG', 'apache2', '${PN}-modphp
>
>  PACKAGES = "${PN}-dbg ${PN}-cli ${PN}-cgi ${PN}-fpm ${PN}-fpm-apache2 ${PN}-pear ${PN}-phar ${MODPHP_PACKAGE} ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}"
>
> +RDEPENDS_${PN} += "libgcc"

this reminds that we need to make libgcc provide something like
compiler/runtime which then can be depended upon by packages
since clang also has a compiler runtime and we might have to make
way to choose it at distro level rather

>  RDEPENDS_${PN}-pear = "${PN}"
>  RDEPENDS_${PN}-phar = "${PN}-cli"
>  RDEPENDS_${PN}-cli = "${PN}"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

