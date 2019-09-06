Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
	[209.85.208.46])
	by mail.openembedded.org (Postfix) with ESMTP id C6C3E7F3AA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Sep 2019 11:08:26 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id g24so5948961edu.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Sep 2019 04:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5cPkzk1oClQswepZlZTNUHELgyI3r5IirmQnzHggR9w=;
	b=fSGaBAi6/fBicDSc0L2j3XoP8cqYyfrcRIH+ox2z91Udw8TdRgFzN2KnBWvood6fGz
	W1xUHSyYvSg28SuuEEU0Nw/rRBsjJEQbBwGavEXvk7zDPs56aEcKH8UzFfbB2c6Flgmb
	VybNP9/5U3hMgKOHsrhTrTJNC25qcLkiUIE+xK1/8FoFMKXaq1IUSHZGY7TmBlu4fKm6
	lJZv2NLTWeaMAWM/9YRmDZ+DXiXHvqRNLA283JkSpJcJghEIPk/Dr7BwBt5GYL9dokLF
	IMKAB8+5S1JghB/4Co6EZNBgM7yeuPxizbi72Wa53mwTjZcsb3e/AgEGXr2qpNNJ/3+W
	f8dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5cPkzk1oClQswepZlZTNUHELgyI3r5IirmQnzHggR9w=;
	b=SyEaFhlDLsgj5H2uy1eg47T48o9YOGKInJGj64igVgvX2RkM9rY6gIeMBKYaf8u7TX
	DDDiaa5Qe/gf6Fjy1PP2XtIyyi9RfEzADEvCoa/9t4nmHbKyHvSrS0+kf93BXvy3498H
	fPKpeKHnpj3qzHXrHEGkF2czcX19GeBWZMfQ2tN4mtaXKIYsVgrN2beuZ40y0yBZQUIT
	K9kBEnBuYt+txdwjsbhM/u+F+jMegVSpU7EXsrrQhEtTv0/t2mYcKerz/EUtR2MkEdBL
	mOtyW09PlLQcTwDaQQK5QYpsNTrEIyJjYim9Mr6Yjn8IKuY7n1zaAgt2eyFHV0YnfdpM
	lRSQ==
X-Gm-Message-State: APjAAAW3mVpZB4LGAUzFllmD5+KBUoYEu2w/NVnPHSFkee83uLjKlUVx
	6czKuhJrHDojQLD4uswgjdCC1/M8sj82EQ8QLgE=
X-Google-Smtp-Source: APXvYqyOitUOIVokuz/CSO7M5XL2yA8nTyYEBPAxLB3cWUKPoLUkNwnkvjObg38YvxWvKeQU3iCWu63JaDaFb5EooA8=
X-Received: by 2002:a17:906:4ac1:: with SMTP id
	u1mr6675139ejt.293.1567768107215; 
	Fri, 06 Sep 2019 04:08:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190906104151.12922-1-costamagnagianfranco@yahoo.it>
In-Reply-To: <20190906104151.12922-1-costamagnagianfranco@yahoo.it>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 6 Sep 2019 13:08:20 +0200
Message-ID: <CA+chaQcR-0YqeSxCswH4CUMZ9mNxnq2HC0wy1O5Ppsp1YW6hvA@mail.gmail.com>
To: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] grpc: don't use unexisting gettid function on glibc 2.29, it has been implemented only in 2.30 https://sourceware.org/git/?p=glibc.git; a=commit; h=1d0fc213824eaa2a8f8c4385daaa698ee8fb7c92 Signed-off-by: Francesco Mocci <francesco.mocci@abinsula.com> Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
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
X-List-Received-Date: Fri, 06 Sep 2019 11:08:27 -0000
Content-Type: text/plain; charset="UTF-8"

Please add a blank line after summary, so that whole commit message doesn't
end in the summary.

On Fri, Sep 6, 2019 at 12:42 PM Gianfranco Costamagna <
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

