Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 43709770A6
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Aug 2016 17:16:41 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id f93so18223702lfi.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Aug 2016 10:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+4YL39dU5U9N8FfdkmqIN3v/3brqbs/xd9lSt/KIs0I=;
	b=zGBc0Z1LdhxntODhusa8cN007eL6zQkMTjZEQmHpHOAequwkuw4AhLb7rxHY7bpU93
	u+y6eWg6blQVxPFytx8XgB+brmPbvF2TG6QBkRcRGFy6INj+O3LaNjvvYYTqDN3RK1/M
	y1m1bJ6UYJzuSF46xxLspXzEjCAwzt2QF8hdaaj9qCTV6Q3gE7dYmavLbheqmUHtD6GA
	Lfd3cO9W8xZQrnRA9NqjTaVhZ3Viry7SWvv5QKYUamVQo8UdeElK+KqQzQ2Ly1sIBWiQ
	TpHFuhKa65SYZYCP0hghddPnWHMmeUCiW4UvE3dmrkdn+awRI/9w7qMlFl1xWPRVTrnP
	T2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+4YL39dU5U9N8FfdkmqIN3v/3brqbs/xd9lSt/KIs0I=;
	b=bycE1NtZNuDEYBeeSYxGut7jLXvnFv96zIVnobazZumLCbIqNrsjCrOCx3p8k6xgjp
	+dhzRwNAjK6X1NPSck6ULRBF/VkBUYdxBLWo0ifFhSvtQCZqOkXugCnhfqt63rD+ikTa
	7M/oAFwY96GJBM+bM9qixK54VCfj9jmVBezgy8BZFxeCznYPxPFipwDNirHZ6O3d51w+
	gfxLFzd9TFaqNnhU5NjS9x+xqsU+0kU4AWhYS7ztLEAfrqBL0fjzecaMwe2SkjmJhP8+
	y/5lcEkWc07b4IAWBZpISDYdci9ELa+lDz+mt26UbEhNhF253po/RIdvbizGRsZCuNAL
	vy4Q==
X-Gm-Message-State: AEkoousjdpV7Cp2UnY1t6NsfFSZuL6lGPkF/cexLB2eU0NOczXhRFXIa44DbTt5BNiursv85VJkB6ACTPPOPZw==
X-Received: by 10.25.228.205 with SMTP id x74mr480067lfi.10.1470503801949;
	Sat, 06 Aug 2016 10:16:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.87.12 with HTTP; Sat, 6 Aug 2016 10:16:41 -0700 (PDT)
In-Reply-To: <1470498772-18435-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1470498772-18435-1-git-send-email-alexandre.belloni@free-electrons.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 6 Aug 2016 19:16:41 +0200
Message-ID: <CA+chaQfAeAmNb3Dh2YwVgj5nr1p8FBN8_fWBJF3KLp5=QOaDUQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH] dpkg: Avoid automatic target architecture detection
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
X-List-Received-Date: Sat, 06 Aug 2016 17:16:43 -0000
Content-Type: text/plain; charset=UTF-8

Wrong ML, send it to openembedded-core ML.

On Sat, Aug 6, 2016 at 5:52 PM, Alexandre Belloni <
alexandre.belloni@free-electrons.com> wrote:

> dpkg is using a script (dpkg-architecture.pl) to detect the target
> architecture automatically.
> Unfortunately, it is using the cross compiler prefix to do the detection
> and for ARM, oe-core is using <vendor>-linux-gnueabi for toolchains with
> and without call-convention hard. The script then always detects
> 'armel' and never gets 'armhf' for call-convention hard.
>
> This solves:
> dpkg: error processing archive evtest_1.32+0+b8343ec112-r0_armhf.deb
> (--install):
>  package architecture (armhf) does not match system (armel)
>  Errors were encountered while processing:
>  evtest_1.32+0+b8343ec112-r0_armhf.deb
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---
>  meta/recipes-devtools/dpkg/dpkg.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/dpkg/dpkg.inc
> b/meta/recipes-devtools/dpkg/dpkg.inc
> index 440a500..1f29113 100644
> --- a/meta/recipes-devtools/dpkg/dpkg.inc
> +++ b/meta/recipes-devtools/dpkg/dpkg.inc
> @@ -35,6 +35,7 @@ EXTRA_OECONF = "\
>                 "
>
>  EXTRA_OECONF += "TAR=tar"
> +EXTRA_OECONF += "DEB_HOST_ARCH=${DPKG_ARCH}"
>
>  do_configure () {
>      echo >> ${S}/m4/compiler.m4
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

