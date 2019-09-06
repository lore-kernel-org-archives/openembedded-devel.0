Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id CC9F97F3B8
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Sep 2019 14:20:50 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id u40so7178346qth.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Sep 2019 07:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KU2+XnYoIgJQn0Y+dnTq4ybPPbBIC73XRA6MMBkMzTc=;
	b=BwUtNWlV4QGiuk31dbakLJgWQFKrcB12CJwRHViGI0GeOy2D8utfQBTvvpTTCgxDTe
	Un5EQfSTU4JBOCW31ni/0rU2oKV6J4g0DV1v7Peh0U/tsVjipLPyAmC5xdF/b2duANOf
	RXMATpACZ3SmnO1DTo33vsVq5XGeh1O9xSD9eBQuXjFf6XBcj9E0jHuRC0p2GiFG+SXb
	eHKThILP5pGm5+NwFUzUJz9zPIS6xZyQachDGbS308hmNZMmH5jx03dtAwrM89srSeMw
	byidtN84orzivweeVMD2ley695nn3298h6Aol1BsESgZuLMesa+EUJD/J0gw51Wg+B1E
	jRpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KU2+XnYoIgJQn0Y+dnTq4ybPPbBIC73XRA6MMBkMzTc=;
	b=AnB422x5/1GVn/H8iU+6QWX0pd5+YTaE+MYKARc2IEU6z3u48RvD7mVmnhntQXSGtb
	ErGlQRAcRtmcLiVI5TlVGFFBl+GRjN5wU2lyGM77KOJWg7I45pbyMxrLFEQycrRqaMh8
	bQPJbdVteU7mm/on4ydySaIJdGhVvd1y8WYOeVJHTJATLJSAPW9kkZqCmF91fGH1m5pz
	628CXgqk2Z9kY0rkLMVwtZMApBYniWfg3uM2+hVR4LcF6JX3sp0aPw0/kFB9oZHBp4oA
	I+lvyZR+yfeCwryrGxKWQ+vKzG4qc/UzNGwRWYbGFPAnc90xdjzu6uZQXCoV7G3zDnlN
	HT4g==
X-Gm-Message-State: APjAAAXtvebWPswm9XRiSdKYDTDGOPVVxrd4pSzl3jlNjRbQSPh7FIyG
	kkT4gtV3KzqKP8X/YrCe0OMtw681Y38zl5jyXZw=
X-Google-Smtp-Source: APXvYqzQTPPzwGU26CSX4Vo+pDBmi+2yhC2SKrZLMER6ywUSo+07vej3TIJU1TMFFk+sRnRnB3wUfJTXSwjEFg89kfk=
X-Received: by 2002:a0c:c548:: with SMTP id y8mr5574835qvi.68.1567779651348;
	Fri, 06 Sep 2019 07:20:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190906111903.16142-1-costamagnagianfranco@yahoo.it>
In-Reply-To: <20190906111903.16142-1-costamagnagianfranco@yahoo.it>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Sep 2019 07:20:40 -0700
Message-ID: <CAMKF1sqq1nHoVQF65pP1X_hMU6ift7P8KOcqcsuEj1Omx7pqgg@mail.gmail.com>
To: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/2] grpc: don't use unexisting gettid function on glibc 2.29, it has been implemented only in 2.30 https://sourceware.org/git/?p=glibc.git; a=commit; h=1d0fc213824eaa2a8f8c4385daaa698ee8fb7c92 Signed-off-by: Francesco Mocci <francesco.mocci@abinsula.com> Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
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
X-List-Received-Date: Fri, 06 Sep 2019 14:20:51 -0000
Content-Type: text/plain; charset="UTF-8"

Please adjust the commit message so that there is a
Small summary line followed by empty line and finally the detailed
description

On Fri, Sep 6, 2019 at 4:19 AM Gianfranco Costamagna <
costamagna.gianfranco@gmail.com> wrote:

> ---
>  .../grpc/grpc/0001-Define-gettid-only-for-glibc-2.30.patch    | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git
> a/meta-networking/recipes-devtools/grpc/grpc/0001-Define-gettid-only-for-glibc-2.30.patch
> b/meta-networking/recipes-devtools/grpc/grpc/0001-Define-gettid-only-for-glibc-2.30.patch
> index c6afff2d2..4f9b115ec 100644
> ---
> a/meta-networking/recipes-devtools/grpc/grpc/0001-Define-gettid-only-for-glibc-2.30.patch
> +++
> b/meta-networking/recipes-devtools/grpc/grpc/0001-Define-gettid-only-for-glibc-2.30.patch
> @@ -20,7 +20,7 @@ index 561276f0c2..25a74864a1 100644
>   #include <time.h>
>   #include <unistd.h>
>
> -+#if defined(__GLIBC__) && (__GLIBC_MINOR__ >= 29)
> ++#if defined(__GLIBC__) && (__GLIBC_MINOR__ >= 30)
>  +#include <unistd.h>
>  +#else
>   static long gettid(void) { return syscall(__NR_gettid); }
> @@ -38,7 +38,7 @@ index 08116b3ab5..d3d3025111 100644
>
>  -#ifndef NDEBUG
>  +#if !defined(DEBUG)
> -+#if defined(__GLIBC__) && (__GLIBC_MINOR__ >= 29)
> ++#if defined(__GLIBC__) && (__GLIBC_MINOR__ >= 30)
>  +#include <unistd.h>
>  +#else
>   static long gettid(void) { return syscall(__NR_gettid); }
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

