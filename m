Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
	[209.85.217.48])
	by mail.openembedded.org (Postfix) with ESMTP id C08BA7FD54
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2020 15:44:48 +0000 (UTC)
Received: by mail-vs1-f48.google.com with SMTP id g15so1506481vsf.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2020 07:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=y5SXRK9VPadXHh8U8US2/fml4hXt8c0agJ53at29xfw=;
	b=shubItP7/4kUyFJgs9DAxUxJrFLhPG4Dn07bc+/Q0A0NNsR8WAHn1KOEmgRNdQSmdC
	E5F3denq841IkOSNLtkqUVUuKblwC07OfOjpsGJM8Wl30ICxNZcCWSx0vSFnaQmx9CKL
	OM6xB7NV3pbY7xlVANK9PJA0KhoD2pMT+yh5CSBA61Eag+xkt0y74Zc+AxBwCVXm3TpL
	+yU48R85K/TxaT7iZi/HvCcsI7sWx/PMjGKjO46QOMjPPnHkuOVnNH5oZB8xX5Tut88H
	fbWgsjl2Q0uxEgTIpTF2k8uKXu18GOnUlj114+4yOIoJ+QuyJUBN10KEZInwqQNVny93
	O5PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=y5SXRK9VPadXHh8U8US2/fml4hXt8c0agJ53at29xfw=;
	b=pqOZ79i+8mxnX0Q1+ra8bDJeNYkJfQF2YOUFf/ZOB2dmrFlfbVsxzMqLswAGuGrJ3U
	QEIoJ+YZz9msCA0DaPlaXrukyreJE8Yqglk1Ka0i7WiZcxhhPfY9EFVMRQeh+nASMQV6
	rmimc+O7KGTN7nWnLvvfyYbZlXG3K0mhF56HJ+2kBed8XXr3raTlGVwTwGr2ss3IW++i
	Jjq0fC0LjYUk+OuDaNruGcjjKba2JOplQpsl7QRXCpuIiskIxS2vzSMll7Pq1V0a5lm1
	LFPbM3+J67rURd7ZZkQI7BOR2w5+mwHVAPDOybrL8TnxjteAA9TZODIe/UJZ+Lfld27w
	Vr1g==
X-Gm-Message-State: APjAAAXZo2WKEJD/sn5aXLh/rGbDFxoiJHv/vWlJD9QNDpIUsK5/g+ob
	J6tzSLp6E8pWPrzAKmClgc26GjJtHVWpVJcOWeo=
X-Google-Smtp-Source: APXvYqyh1jjqvFuPYFaj0MDq761zNUbe3wG6kPkPTW+vPA8L+1/+gKh+v1tfRH7zhYsRNBvRXBdV1cIp91xktgzyy3E=
X-Received: by 2002:a05:6102:405:: with SMTP id
	d5mr2482059vsq.94.1579880689608; 
	Fri, 24 Jan 2020 07:44:49 -0800 (PST)
MIME-Version: 1.0
References: <CACc3Zv5_T8p6bwi3Cbf8ZZiQvJC7=HSgcAnkp_xCc9div=Ng9g@mail.gmail.com>
In-Reply-To: <CACc3Zv5_T8p6bwi3Cbf8ZZiQvJC7=HSgcAnkp_xCc9div=Ng9g@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 24 Jan 2020 16:44:38 +0100
Message-ID: <CANNYZj_VUDBsgCkWLdv-ObShzRp6Wt72ivQx28D4PSMbuctBbg@mail.gmail.com>
To: Kraag Gorim <kraaggorim@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/2] icedtea7-native: inherit python native
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
X-List-Received-Date: Fri, 24 Jan 2020 15:44:48 -0000
Content-Type: text/plain; charset="UTF-8"

Python 2.x just went out of support. Can we somehow make it use Python 3.x
please?

Alex

On Fri, 24 Jan 2020 at 16:43, Kraag Gorim <kraaggorim@gmail.com> wrote:

> icedtea7-native relys on python to enable building it. Therefor it
> should inherit python instead of assuming python being part of
> HOSTTOOLS.
>
> Signed-off-by: Kraag Gorim <kraaggorim@gmail.com>
> ---
>  recipes-core/icedtea/icedtea7-native.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/recipes-core/icedtea/icedtea7-native.inc
> b/recipes-core/icedtea/icedtea7-native.inc
> index b578cb2..145ca26 100644
> --- a/recipes-core/icedtea/icedtea7-native.inc
> +++ b/recipes-core/icedtea/icedtea7-native.inc
> @@ -30,6 +30,7 @@ CFLAGS_append = " -Wno-error=stringop-overflow
> -Wno-error=return-type"
>
>  inherit native java autotools pkgconfig
>  inherit openjdk-build-helper
> +inherit pythonnative
>
>  JAVA_HOME[unexport] = "1"
>
> --
> 2.24.0
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

