Return-Path: <raj.khem@gmail.com>
Received: from mail-yw1-f66.google.com (mail-yw1-f66.google.com
	[209.85.161.66])
	by mail.openembedded.org (Postfix) with ESMTP id 65D8E7EF73
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jul 2019 07:33:47 +0000 (UTC)
Received: by mail-yw1-f66.google.com with SMTP id u141so2160474ywe.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jul 2019 00:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8jht1GBiQM5xvy6I/ARvbE3yu+ZUb/TgRqcjMSQkxJw=;
	b=fEW0hx86vuRv5xVq+TSHQUNs7oBlIL97B8ln0R57EcdtkqWSqQHhyXsAJAbQGQu0qB
	4nc75fSBE/BGWIcnlSTB1+2EQn5+k/NTmDrsNo4iCaY2Hnljn6katNJRmhxheI+HX4uI
	A3y5Sfd69Ly3JaroB5G8W85nAUVWpRZujJYPOUjkT86WH97vvlpBMP5kjVUEo5sOoHc1
	s89mdSfZrT5A75eqiWvsDtP1cwoPSFZURbCDipgQhPabA8StzeAYG/z+9Ze/L7lpRrky
	WE+T2+atmPMiUHTG/ApWuUtD4RhcXhgb2vpKh7YTYOLCxjwLg0N8MoXiDfOe9PZIsJKx
	KDuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8jht1GBiQM5xvy6I/ARvbE3yu+ZUb/TgRqcjMSQkxJw=;
	b=K3JuoT88zBdn+xC1n787oRO8nx0JvDvhtoE4FagmCVf9BlCgq2Dk+lgfzF0mHoMAF8
	JZZlbHamvbHi7viVzSPClNB0QYauW5JB7OLlRNf4YnAI4JTewcWgdcARbIwXWZASZwFH
	k4C81RPUvvnR2uVpuSW0YpVMn/poJxcl9Qtd9DMQL8cSULr45ChotqLP2GCe3Q8/v3FM
	BPyUFcgr1D61sJF1jIqlVcRvlZrcfrqM9WeHHSzF3VMQlcdweit2pZM6LiAdDnmX6wtx
	CopEu/zntprfp314074VKjy1bCjKoFz/HfaObu6sS4hrq8kS6nGVED9l2WmNkd0Sdgl+
	8PrQ==
X-Gm-Message-State: APjAAAXGbzy+fo62vedCoEqENp9xlLBA+Qz96t7+pNPUFEDynX6BNBa1
	BINsIIavscYNJpgomFd039LOBTprX6XKAjNGzRvM7/p1
X-Google-Smtp-Source: APXvYqwV3kOwNgD/duLk2SozohXH6YKHshMbywue7OjvxwOJjqXWYMeEKVr6Yubet0nTgC6aNhnuGKEwgtdpQ4PilQM=
X-Received: by 2002:aed:3644:: with SMTP id e62mr1480978qtb.80.1562830427957; 
	Thu, 11 Jul 2019 00:33:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190710235657.97551-1-joe.slater@windriver.com>
In-Reply-To: <20190710235657.97551-1-joe.slater@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 Jul 2019 00:33:22 -0700
Message-ID: <CAMKF1sqf=s9QFozJc0tsUZOt=aAAG_R7jiiaVyuyb22YiXgWjg@mail.gmail.com>
To: Joe Slater <joe.slater@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 1/1] drbd-utils: enable reproducible_build awareness
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
X-List-Received-Date: Thu, 11 Jul 2019 07:33:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 10, 2019 at 4:57 PM Joe Slater <joe.slater@windriver.com> wrote:
>
> Enable use of SOURCE_DATE_EPOCH from the reproducible_build bbclass.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  meta-networking/recipes-support/drbd/drbd-utils_9.10.0.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-networking/recipes-support/drbd/drbd-utils_9.10.0.bb b/meta-networking/recipes-support/drbd/drbd-utils_9.10.0.bb
> index 70e04b9..7fd3090 100644
> --- a/meta-networking/recipes-support/drbd/drbd-utils_9.10.0.bb
> +++ b/meta-networking/recipes-support/drbd/drbd-utils_9.10.0.bb
> @@ -35,6 +35,9 @@ EXTRA_OECONF = " \
>                  --without-manual \
>                 "
>
> +# If we have inherited reproducible_build, we want to use it.
> +export WANT_DRBD_REPRODUCIBLE_BUILD = "yes"

should this be set after checking for inherit ?
> +
>  do_configure_prepend() {
>      # move the the file under folder /lib/drbd/ to /usr/lib/drbd when usrmerge enabled
>      if ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'true', 'false', d)}; then
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

