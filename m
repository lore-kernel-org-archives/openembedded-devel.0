Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 457C17F98F
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Jan 2020 02:29:28 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id e6so38238761qtq.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Jan 2020 18:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=aCR8ZKm8HSnFSxAo//ANkI4s8dKdAxJ/fIjCpI8lqJM=;
	b=sJMuSEstTWBoOamggOk5BFd6O3JxO4DXdHp9/33A3vi/rYWpPvBe7pSl+4DcAeZUQz
	v2Rknp1Gw6Ub7I3H0MWrYygIpK/+0OtRg28BgiZqHQ8bWkDDnl2mlA0HWUj+i5rE9z/4
	tDwQfxmyh1hm1zbdcfPaFrKEPXji708yISw9RRawhRXnsKnZXEAcH8fPgp46kKGI4ykL
	JKKq4Q5FCj2ipq9C+Z29JDPIOy2VB9o2op6HwSSUQCcV0TQF46uOI36yoRjI/Yy4Z25b
	kyZ3RUDbRrBARU45BDhOdHT2viXLXXAZvR3LW8NpvbUaFRhTjAHyLqUZVQlZo8DUKk+R
	1EyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=aCR8ZKm8HSnFSxAo//ANkI4s8dKdAxJ/fIjCpI8lqJM=;
	b=ZoC56w9DIZsLPEl3WqJsfEAPZ+HCY+KpCB5+m5bm1TtJIirOK8OeH6gW9+je9OHvr4
	Q/n+/DQx2PlAIOXIZ+F+TcZOax1prqOxvnOCHRtWmJfSdrQ+oTs0BlGYH/Tvvy/Cyupm
	B54vaIEP+ojpxYaESZK/Ri0iMiCKpimXCzUh+IW8vRQTcEhk2nakr5DI508a0B+Y9DG8
	pv1fvbYlgqw8VDbF0gOevCK8yNQOL50ES6Ti7MnMdkslvFO5hRAY0UqCwdC2XtPzjqme
	RwQAKIMWya+hdQBPKNrXQgEM3T5EZIC3VEVZiZfp8Sp2X6e2vtfM/Ugnn1ct6eIWNQOi
	9D0Q==
X-Gm-Message-State: APjAAAXe3Vl5YndbR2fjSUdxJWVkSuUgSvmPZf0LQsCUktlhS9w5rW3s
	4CuMm8HPCc7bFeh3K7HEkS6hLOk+vVA1X1JnppQ=
X-Google-Smtp-Source: APXvYqypLyltka9E8UdwLd40KiIYZrEOySzSmq1F/GK20JPa9kRWgFgJx9V0I5u4wikPW9IFirXLfXqj2ZViBhaG6w0=
X-Received: by 2002:aed:2c03:: with SMTP id f3mr50657524qtd.80.1578104968967; 
	Fri, 03 Jan 2020 18:29:28 -0800 (PST)
MIME-Version: 1.0
References: <e41daa42-7588-c966-9121-1478afd8b869@skidata.com>
In-Reply-To: <e41daa42-7588-c966-9121-1478afd8b869@skidata.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 3 Jan 2020 18:29:01 -0800
Message-ID: <CAMKF1sr4dadjU+=qMnc-XT_UQVGutN=ffZP=uMtcfs=J4D3vdA@mail.gmail.com>
To: Richard Leitner <richard.leitner@skidata.com>
Cc: Darcy Watkins <dwatkins@sierrawireless.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][warrior][PATCH] Revert "openjdk-8: disable, stringop-overflow compiler errors"
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
X-List-Received-Date: Sat, 04 Jan 2020 02:29:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 3, 2020 at 2:24 PM Richard Leitner
<richard.leitner@skidata.com> wrote:
>
> This reverts commit d5a8ec9e269d1f04a6cf78867ebf74a297f33258 as it broke
> the build with older GCC versions.
>
> See also https://lists.yoctoproject.org/g/yocto/message/47850
>
> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> Cc: Darcy Watkins <dwatkins@sierrawireless.com>
> ---
>  recipes-core/openjdk/openjdk-8-release-172b11-common.inc | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/recipes-core/openjdk/openjdk-8-release-172b11-common.inc
> b/recipes-core/openjdk/openjdk-8-release-172b11-common.inc
> index f3bbf0a..ad20585 100644
> --- a/recipes-core/openjdk/openjdk-8-release-172b11-common.inc
> +++ b/recipes-core/openjdk/openjdk-8-release-172b11-common.inc
> @@ -94,11 +94,6 @@ ARM_INSTRUCTION_SET_armv4t = "ARM"
>  BUILD_CFLAGS_append = " -Wno-error=deprecated-declarations"
>  TARGET_CFLAGS_append = " -Wno-error=deprecated-declarations"
>
> -# WORKAROUND: disable the "specified bound depends on the length of the
> source argument"
> -# compiler error until we update openjdk8 to a fixed version
> -BUILD_CFLAGS_append = " -Wno-error=stringop-overflow"
> -TARGET_CFLAGS_append = " -Wno-error=stringop-overflow"
> -

perhaps as distro integrator, its better for us to disable all
warning-as-error settings
which should work across all gcc versions and warnings will still be
there if someone
is interested in fixing them.

something like below might work.

BUILD_CFLAGS_append = " -Wno-error"
TARGET_CFLAGS_append = " -Wno-error"

other options is to add -Wno-unknown-warning which will not break
build when a warning is not known


>  # Enable zero mode for arm based builds, as normal hotspot fails to build
>  PACKAGECONFIG_append_armv4 = " zero"
>  PACKAGECONFIG_append_armv5 = " zero"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

