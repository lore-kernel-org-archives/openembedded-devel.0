Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5DC8E771CB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Aug 2016 19:59:20 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id i5so127198970wmg.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Aug 2016 12:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=/OTiJflgt/HJzRGSeehoH4uWb6ZWI9Nt8ZeSS1FuzqI=;
	b=GUPf9z+jwJp5c6bDrXumMqd5ziSKzxxzpDSn3II82u4a8cOZk2mLJiFO0li/iJIM2M
	L/rpKcDksszXb9y5NRvVfImvYB7pv7+WLeM9A66onvAHATaQZi//z9tkd1KWQl492klz
	opKj2HKDOqUsdkaMWcZhUNoWmgAfrXFbYopwDTuGH354qIQPVWsRmqThWDIuj4NNWLuV
	5TfqFsc8LSXlssFRu1H1hiqzO5NBHmmWSx3YOA8Jjk2TnbEygkDdwZq9TALkQUh/mJr9
	lQ0ggJJ0E7Hpj88ggbAVsPE8TZfU/TwBb3TuHGy4Oma5lCU+tHqDJK+lXyeeOpO4VvMG
	4dmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=/OTiJflgt/HJzRGSeehoH4uWb6ZWI9Nt8ZeSS1FuzqI=;
	b=PDfZUUAz+h7F4WnwbR3KcPyDy1nX9wGjj8gBHiiBDU4yRtR0xfKXu3ILXncHrJyeiZ
	ci9Ub/8bMvTnSXV1HLDcK7BOvDndkrFhc0SW4OXviikMfrihAUNPTlEklbelr6AoE8kS
	HdHnvEWkS3VXJNvsUYVAvD+sDMRdSajR9VugzgvuLpq+5+C9Mnx2DpVKjc7B2RHfw27e
	zN5HGfpnPZHy9YAA+P1J67pfojJWuMVQkpgOJvPfSP8cJ/5+h0SuMemZcSAvNp+RxYYJ
	B68cLRUeGjIHJOyBt9neukNsCFHIys7snRaD5FlXf7ET0o/EvZCFDsE8XQXL05O3yitV
	RG3g==
X-Gm-Message-State: AEkoouuab22P7N5jE5/kTPwyhpZoNIYRJmDm02ijbg2PcnyP7JYco1ihNHCki8DEAKL1nprl2NwvhCDMhub8CA==
X-Received: by 10.25.21.16 with SMTP id l16mr937830lfi.229.1470859160919; Wed,
	10 Aug 2016 12:59:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.87.12 with HTTP; Wed, 10 Aug 2016 12:59:20 -0700 (PDT)
In-Reply-To: <1470827677-19644-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1470827677-19644-1-git-send-email-ricardo.ribalda@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 10 Aug 2016 21:59:20 +0200
Message-ID: <CA+chaQdBBR9fys5njeqfsPSz9KoykhBDJT21sm0thtdoMKDZTg@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] glog: Add missing dependency
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
X-List-Received-Date: Wed, 10 Aug 2016 19:59:23 -0000
Content-Type: text/plain; charset=UTF-8

Which layer provides gflags?

You'll probably need to add PACKAGECONFIG for it and let it disabled by
default, because there isn't gflags in meta-oe.

On Wed, Aug 10, 2016 at 1:14 PM, Ricardo Ribalda Delgado <
ricardo.ribalda@gmail.com> wrote:

> Fixes:
>
> WARNING: glog-0.3.3-r0 do_package_qa: QA Issue:
> /usr/lib/libglog.so.0.0.0 contained in package glog requires
> libgflags.so.2()(64bit), but no providers found in RDEPENDS_glog?
> [file-rdeps]
>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  meta-oe/recipes-support/glog/glog.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/glog/glog.inc
> b/meta-oe/recipes-support/glog/glog.inc
> index 8a1fb4250bbb..503904164312 100644
> --- a/meta-oe/recipes-support/glog/glog.inc
> +++ b/meta-oe/recipes-support/glog/glog.inc
> @@ -6,6 +6,6 @@ HOMEPAGE = "https://code.google.com/p/google-glog/"
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=dc9db360e0bbd4e46672f3fd91dd6c4b"
>
> -DEPENDS = "libunwind"
> +DEPENDS = "libunwind gflags"
>
>  inherit autotools pkgconfig
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

