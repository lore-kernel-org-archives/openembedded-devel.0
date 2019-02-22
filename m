Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
	[209.85.222.170])
	by mail.openembedded.org (Postfix) with ESMTP id 431877CBA6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2019 18:14:45 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id x6so1689954qki.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2019 10:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ALYTQC18zjB3lJb4HimvgJ5wLIm/aAQhtTKQn5afdFg=;
	b=bXUNFL+hxT7rbOR0/kEQHtW4cJrZ3ydnF0Ujv+qEUpnsQWuAp4wTcSUrqzYgmn8IaC
	McW0Ckxj0TKhq8K5t6UZFUdTYxeRsgGEmk7Mk96j36bI6Q3anCA+dW63jUTc54mEDs4C
	2aQEF9R285ReFkL4N1pJmRB/9V1YXacvOEA5J6pX5r7XVeeIdpeyrLTLIwVqKjzhYNJX
	3qxi9du8GkbT9TJVp4ElWWa39UgdGXz3ieTFpFYQCRWwuY3PjQIyM6WQvruBWvs7fCgG
	soz9498CTx1oQBGnRyzbm1LOXkO8ukMcHSIgTYmWiZOvS59eY2KIsl8shMUZ9OzAppRY
	d7YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ALYTQC18zjB3lJb4HimvgJ5wLIm/aAQhtTKQn5afdFg=;
	b=OMOXatw1H2maAn6g/Mv1m5ER+oQXLwEncFY2Q8pqMY7oXVTUphAQIFtEdOMQI8QI+y
	Rfg/YfZK8mpXS9klD3+VEGrQ0KyCoYMbVELw7Bq+DA9YEwrxLjtVW5Urqo7dtXxZ4OcM
	d3yI8S+GnJ39okg/MRErGoPRpW1M4vHwUgJc0p0+FsQl7Lc0PN1RQR3IaU1DFWMLSrfb
	FbtZ6N/m+FJrWsbhLpH1xrKFX1jB9VwbmGHOiP4V7++D0iRd/u5J4dvV3BVWa5yNTo+p
	vZyyRzCI3IymRD7UdIeqL1veD8Kh/xPVm1aQMDZEAvdy9jKO8qCHpjQ6p8GGbOs1T15J
	cI6w==
X-Gm-Message-State: AHQUAuZiYKO3dJbatuKr8Ow7kH637OO8QpK1BuSmOGtvGp1r88WjakwQ
	rICNUbtmSgC62N88sFas7fUM8h51C8T9e3nh+aI=
X-Google-Smtp-Source: AHgI3IbBlgcHwY5qC7k6HNLOWfwc3f9HB9eMcVvWeec23F7P1cgixOkOcty32hMCJ+5J+jqLCclaO+CJVI1RPsfMHu4=
X-Received: by 2002:a37:3d6:: with SMTP id 205mr3869304qkd.223.1550859285910; 
	Fri, 22 Feb 2019 10:14:45 -0800 (PST)
MIME-Version: 1.0
References: <20190222172949.3661-1-nicolas.dechesne@linaro.org>
In-Reply-To: <20190222172949.3661-1-nicolas.dechesne@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Feb 2019 10:14:20 -0800
Message-ID: <CAMKF1soDj0s94rB5AtbhxYnO+G3zgB=gsK8-Up18Lea-jQGvpA@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 0/4] A few fixes when trying to run yocto-check-layer
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
X-List-Received-Date: Fri, 22 Feb 2019 18:14:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 22, 2019 at 9:30 AM Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
>
> I was trying to run yocto-check-layer script and it has caught some issues.
>
> Note that I was able to get a PASS status for meta-oe, using two additional patches
> from Mingli Yu <Mingli.Yu@windriver.com>, i found on the list:
>
> upower: add REQUIRED_DISTRO_FEATURES for polkit
> udisks2: add REQUIRED_DISTRO_FEATURES for polkit
>

they are in master-next

> Nicolas Dechesne (4):
>   meta-oe: fixup LAYERDEPENDS to include meta-python
>   polkit: add REQUIRED_DISTRO_FEATURES for polkit
>   packagegroup-meta-oe: fixup package that now require polkit
>   udisks: add REQUIRED_DISTRO_FEATURES for polkit
>
>  meta-oe/conf/layer.conf                                    | 1 +
>  meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 3 ++-
>  meta-oe/recipes-extended/polkit/polkit-group-rule.inc      | 3 +++
>  meta-oe/recipes-support/udisks/udisks_1.0.5.bb             | 5 ++++-
>  4 files changed, 10 insertions(+), 2 deletions(-)
>
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

