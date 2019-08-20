Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3B8B17EB92
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Aug 2019 16:31:02 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id r21so5020720qke.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Aug 2019 09:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=sX2ieNXiGdxZwyGWIv/iQFbRr9OYiGlCmG1+dAyfY+8=;
	b=aXRiguGcpSFeIbn6PB7AlV2JUhtFZPb9U/mNmYIFPGpdoKPrUXsvcIS60uMF6dU8ai
	pN7fzee/fPsE4QkXKfXu9G9NjG22EsV9ZveHO/XAxYyD1Ia47qo7exCU2qokPh8uWYbK
	1eY4MS44EFcLNtgM50md/3Yjc4pcNnOCLYYhCOIoUz+KqDa+MDwyCZzhOAqq2FPLjtL6
	11MSx1KxbXT1hs5zNGCw0u1dJk6qNpUBXo9LM8Q8ER23RU+AjK9BaQLSUT5pFTMfgI8E
	PG0oz+rrW6ieofs0gF8Ysnjdwvd2UKYcodjbUXabd/K3KGu8QE5CkBTeMRcmE0TJ3nGU
	OcdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sX2ieNXiGdxZwyGWIv/iQFbRr9OYiGlCmG1+dAyfY+8=;
	b=lOf30R9GC01gI77maMv08fq8/C6mff2Fz88PMOIRbXB+vM65bCAKSHFnrj6fsyHV4X
	bUUvAZ5a9KfgEd7rbcOcFEh2lrWp8YTVAjtmqXhhpnftpyFMCeJSfF8p6h/dftveCmxQ
	Cn3WHYegZttPx6FcqwwbIBClR0wJ96JoTaBgkWQzbUWz7YS8kPisWh1/+Bsh3oF5HL77
	w/2iF3Yx8cwDAwVfyworapOF29ACm1WB7gcO+JSWcwct3AJkXMtmHtwaLEh018u5gcXI
	T98BtaNUvZrgXq2+EsOPE9IBHL6NtWAaAVrpYXTOagnEbmM2+E7FvoF0BwXfgzx8whAB
	pqeA==
X-Gm-Message-State: APjAAAWBPg+xbOFEekDJehU07IMqHFFecn5F3tJu8mRxpWVz3fTEDX1X
	9nB9EJ/siLZBF1IMqVGN/pDtKUKBOrenpEqNx0E=
X-Google-Smtp-Source: APXvYqzUti27TvJHOBRqDsvZ93yMhvioX45s3FJv3mXC/XnVo9BJO0q5N+QkPkJCy7Q/o4vzHraq9QWZQkeC7T2UzIE=
X-Received: by 2002:a37:a24c:: with SMTP id l73mr25202025qke.9.1566318662869; 
	Tue, 20 Aug 2019 09:31:02 -0700 (PDT)
MIME-Version: 1.0
References: <1566293810-37527-1-git-send-email-hongxu.jia@windriver.com>
In-Reply-To: <1566293810-37527-1-git-send-email-hongxu.jia@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 Aug 2019 09:30:36 -0700
Message-ID: <CAMKF1soZbx6HH9d4Rhe+RpqYgiBNxpGkYu84LGaY7m+9=WahYQ@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] poppler: compile with -fpermissive to workaround code diagnostics errors on armv5
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
X-List-Received-Date: Tue, 20 Aug 2019 16:31:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 20, 2019 at 2:37 AM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>
> Build on qemuarmv5 failed:
> ...
> |poppler-0.79.0/splash/SplashFont.h:69:36: error: passing '    const
> SplashCoord' {aka 'const FixedPoint'} as 'this' argument discards
> qualifiers [-fpermissive]
> ...

I wonder why this warning only shows up for armv5 and not for other
arm subarches or
non-arm arches.
>
> Compile with -fpermissive to workaround error with warning
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta-oe/recipes-support/poppler/poppler_0.79.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-support/poppler/poppler_0.79.0.bb b/meta-oe/recipes-support/poppler/poppler_0.79.0.bb
> index b285eec..7a5ec13 100644
> --- a/meta-oe/recipes-support/poppler/poppler_0.79.0.bb
> +++ b/meta-oe/recipes-support/poppler/poppler_0.79.0.bb
> @@ -28,6 +28,8 @@ inherit ${@bb.utils.contains('PACKAGECONFIG', 'qt5', 'cmake_qt5', '', d)}
>
>  SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
>
> +CXXFLAGS_append_armv5 = " -fpermissive"
> +
>  EXTRA_OECMAKE += " \
>      -DENABLE_CMS=lcms2 \
>      -DENABLE_UNSTABLE_API_ABI_HEADERS=ON \
> --
> 2.7.4
>

