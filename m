Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8386A65D25
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Apr 2014 07:01:45 +0000 (UTC)
Received: by mail-ie0-f172.google.com with SMTP id as1so2320621iec.31
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Apr 2014 00:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=IZ+krEy+63AXUco5ST5Zi4YV6f/Ftfya9nrWwMa8klA=;
	b=NMeyP95INkSj7jDt/a65wKTavNATezt312p654f3ncl9UqMYYAzAxeYh42+M+/kAz4
	lpU6TOXlTZsNUPRmKZY7uA1MO3epFgJXe2G4zYpuItRO56/mtGovYy4rs3Tud8lf75kb
	xHUlxU9BJwCH/xyW0KSEtVCMFnMDiLd//AsXHVy4eMPZFK2Thm0FQzX4FDDFNCgkqfK0
	srH4yyoMZr32ckgWg9JaqNe4O1xHIREnwZRgbL8qUzx+/ApxhaxZFrg61a/jvtNndnnC
	ym0P4VJ9sC4VjLg8YOLA7a1Vkay18ZaihUVMLExjx+J3QKV0/55/WOBz7LoomtLP8BgX
	3WpQ==
MIME-Version: 1.0
X-Received: by 10.50.78.201 with SMTP id d9mr8700980igx.17.1397890906191; Sat,
	19 Apr 2014 00:01:46 -0700 (PDT)
Received: by 10.50.229.14 with HTTP; Sat, 19 Apr 2014 00:01:46 -0700 (PDT)
In-Reply-To: <1397882916-8348-1-git-send-email-otavio@ossystems.com.br>
References: <1397882916-8348-1-git-send-email-otavio@ossystems.com.br>
Date: Sat, 19 Apr 2014 00:01:46 -0700
Message-ID: <CAMKF1sryx2Y4sW9XuOhymZOcnTJYwkijwOQ0XdVnB=1UrweuFw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH 4/7] glcompbench: Create 2012.08 version
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 19 Apr 2014 07:01:46 -0000
Content-Type: text/plain; charset=UTF-8

On Friday, April 18, 2014, Otavio Salvador <otavio@ossystems.com.br> wrote:

> From: Lauren Post <lauren.post@freescale.com <javascript:;>>
>
> glcompbench is a benchmark tool for GL(ES)2 based
> compositing operations
>
> Signed-off-by: Lauren Post <lauren.post@freescale.com <javascript:;>>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br <javascript:;>>
> ---
> Changes for v2 (all done by Otavio Salvador):
> - Use summary only as description was short
> - Fixed dependencies
>
>  .../glcompbench/glbench-compile-fix.patch          | 35
> ++++++++++++++++++++++
>  .../glcompbench/glcompbench_2012.08.bb             | 14 +++++++++
>  2 files changed, 49 insertions(+)
>  create mode 100644
> meta-oe/recipes-graphics/glcompbench/glcompbench/glbench-compile-fix.patch
>  create mode 100644 meta-oe/recipes-graphics/glcompbench/
> glcompbench_2012.08.bb
>
> diff --git
> a/meta-oe/recipes-graphics/glcompbench/glcompbench/glbench-compile-fix.patch
> b/meta-oe/recipes-graphics/glcompbench/glcompbench/glbench-compile-fix.patch
> new file mode 100644
> index 0000000..374a6cf
> --- /dev/null
> +++
> b/meta-oe/recipes-graphics/glcompbench/glcompbench/glbench-compile-fix.patch
> @@ -0,0 +1,35 @@
> +From c4bc44c3abf69f26e4c2b7684f4da4670a51f993 Mon Sep 17 00:00:00 2001
> +From: Prabhu Sundararaj <prabhu.sundararaj@freescale.com <javascript:;>>
> +Date: Tue, 5 Nov 2013 11:03:04 -0600
> +Subject: [PATCH] to make compilable
> +
> +Upstream Status: Inappropriate [workaround]
> +
> +Signed-off-by: Prabhu Sundararaj <prabhu.sundararaj@freescale.com<javascript:;>
> >
> +---
> + src/composite-test-simple-blur.cc | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/src/composite-test-simple-blur.cc
> b/src/composite-test-simple-blur.cc
> +index 170ad64..d7f77cf 100644
> +--- a/src/composite-test-simple-blur.cc
> ++++ b/src/composite-test-simple-blur.cc
> +@@ -347,6 +347,7 @@ CompositeTestSimpleBlur::CompositeTestSimpleBlur() :
> +
> + CompositeTestSimpleBlur::~CompositeTestSimpleBlur()
> + {
> ++#if 0
> +     for (BlurWindowMapType::iterator winIt = priv_->windowMap.begin();
> +          winIt != priv_->windowMap.end();
> +          winIt++)
> +@@ -354,6 +355,7 @@ CompositeTestSimpleBlur::~CompositeTestSimpleBlur()
> +         RenderWindowBlur* ro = winIt->second;
> +         delete ro;
> +     }
> ++#endif
> +     delete priv_;
> + }
> +
> +--
> +1.8.1.2
> +
> diff --git a/meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bbb/meta-oe/recipes-graphics/glcompbench/
> glcompbench_2012.08.bb
> new file mode 100644
> index 0000000..7b91272
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb
> @@ -0,0 +1,14 @@
> +SUMMARY = "A benchmark for GL(ES)2 based compositing operations"
> +LICENSE = "GPLv3"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
> +
> +DEPENDS = "virtual/egl virtual/libgl virtual/egl virtual/libgles1
> virtual/libgles2 \

A small nit
Virtual/egl is mentioned twice


> +           virtual/libx11 libxcomposite pixman libxrender libpng12"
> +

+SRC_URI = "
> https://launchpad.net/glcompbench/trunk/${PV}/+download/${BPN}-${PV}.tar.gz\
> +           file://glbench-compile-fix.patch"
> +
> +SRC_URI[md5sum] = "c939d9156fe940960098f38707fea827"
> +SRC_URI[sha256sum] =
> "b04b738cec06c6786ceafa86e4735fd8b971c078265754854ef356b0379542ee"
> +
> +inherit pkgconfig waf
> --
> 1.9.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org <javascript:;>
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

