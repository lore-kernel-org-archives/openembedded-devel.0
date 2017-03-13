Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 798E7776BD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Mar 2017 07:25:42 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id v186so33345161wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Mar 2017 00:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SlRXebZDw850uWzpYqLwco6OzyedwW2/PekJa4eGXGE=;
	b=LLNgH0xeX9KPmmB/MMC21cMft0wDo4stGg3Es4w1B5y994Z4JWntYD5n/gmglOjm5N
	cLV6JoSXpvULpt5+MQ3f4oOupu5NuBghrsu8B//5Pp/y4MWbWOeeVcr2BYdLhpc0cfr7
	C5OKzfYrG6Ii1fBcUCykBjHITI9ubk+GcuuGvnbfqI0QHwKY4a0mDkwoDpjKSXRt3+C7
	E6zCj4Omk11o+j7aI9sZvp/PZXOkkGvmXVAoqOi0b/Ix7agHpvgWyZctu9BjNH1Vnqys
	vT1pW2U7+l/9PcCTszqg3EFMlBFRRd+Yg4txo5pd4gOhrTH4c1xrOCb6UEEWERV0dCbc
	9lVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SlRXebZDw850uWzpYqLwco6OzyedwW2/PekJa4eGXGE=;
	b=T4fFWkrjYuAIdDCDtTZThEI2Xzji941QL8h39ri1JKN5rSS8y/MKFIJGz6lOYCAiTL
	XAaqp3KBO5yNmGbJ1Z+tP4OGAt8KC8HUoMHlPLbLoZSRkJu2LrOP80ew73BTq/7fltlE
	+xdM6EYneMMHk1YaNCMjBNF5lz0JyqdYPo+uNl9yMERvDEKSghr4ncduzQwB4z/FKPCL
	9FS94ikuhF6zdx14r0355LeJvulXN1JA5zR/vFRvHUeeJJk9QHHIO84WOnjA3lqH+Cbz
	T7pzLtt7HsqQt3UTwstggrN1B1V7aJSUHvv9shATl/1piY/y95r1uS3nAd34HK5bSQae
	mn5w==
X-Gm-Message-State: AFeK/H2SmG1GtT6dhxQGxcq4FYvSv0XSzeA4SoFlhurmCdajLsbtj7f8G722/rirM0tnqmh5dVTjNSEhkIDd/Q==
X-Received: by 10.28.134.70 with SMTP id i67mr8597116wmd.124.1489389942708;
	Mon, 13 Mar 2017 00:25:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Mon, 13 Mar 2017 00:25:42 -0700 (PDT)
In-Reply-To: <20170313032921.8669-1-kai.kang@windriver.com>
References: <20170313032921.8669-1-kai.kang@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 13 Mar 2017 08:25:42 +0100
Message-ID: <CA+chaQc0uNJ=k8OYDPLapV9ekap2Yv9TFA_25_U3em5ZBQF8gg@mail.gmail.com>
To: Kai Kang <kai.kang@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 0/5] Update SRC_URIs
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
X-List-Received-Date: Mon, 13 Mar 2017 07:25:42 -0000
Content-Type: text/plain; charset=UTF-8

Github archives can be regenerated from time to time with different
checksums, please use git fetcher instead.

On Mon, Mar 13, 2017 at 4:29 AM, <kai.kang@windriver.com> wrote:

> From: Kai Kang <kai.kang@windriver.com>
>
> Update SRC_URIs which show qa warnings when do_fetch.
>
> Kai Kang (5):
>   fuse: update HOMEPAGE and SRC_URI
>   curlpp: update HOMEPAGE and SRC_URI
>   libdnet: update SRC_URI
>   cherokee: update SRC_URI
>   lmsensors: update SRC_URI and S
>
>  meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb          | 6 +++---
>  meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb | 8 +++++---
>  meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb       | 8 ++++----
>  meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb        | 6 +++---
>  meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb     | 2 +-
>  5 files changed, 16 insertions(+), 14 deletions(-)
>
> --
> 2.10.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

