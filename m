Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0B0C376E4A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 04:54:54 +0000 (UTC)
Received: by igvg19 with SMTP id g19so64132522igv.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 20:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=SUEowDq7Rb8NoQoyDXBWgyuPMbCykaOxpKIk4D2rBKU=;
	b=Ia2N6qGe/lRoXeu6bBo2LyAR15zeSh41i9BLu+a8Awea6OHl7NV3Njafe6xUrO9aKV
	PuGV4QmHoZ1C1UXiisl4RG0gGB1A+i9NxM3DKyfyssdZIbc4eJZ5EAStVAs0T9u9ZF+a
	QeMrQpt7g6RXJ8JVgkN2nZL5HlV+XgTNohyFnNRbEclqIAWG+i6J1QT9KZKhI4LHGpV4
	M8g3ZVyRw2NOrdPu+yOcBkW5snkAf5gFk8DbufR9bNHwv1ZIHgMXp7C5gmOmpSYJ5H+5
	H3nQPJ6U6tXNYDqqky9z9NgrUoSiU8uVbedz/7xRilAp/odiGfYyhjdiMDtN8F8kGvAq
	humg==
X-Received: by 10.50.142.8 with SMTP id rs8mr8203568igb.77.1447217695034; Tue,
	10 Nov 2015 20:54:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.12.205 with HTTP; Tue, 10 Nov 2015 20:54:24 -0800 (PST)
In-Reply-To: <1447217296-7145-1-git-send-email-armccurdy@gmail.com>
References: <1447217296-7145-1-git-send-email-armccurdy@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Nov 2015 20:54:24 -0800
Message-ID: <CAMKF1soBa58iFxm9K30crBvQqT=o6ugRT-MSPaY1vzJL6KfMsA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH 1/2] cef3: use PARALLEL_MAKE to control build parallelism
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
X-List-Received-Date: Wed, 11 Nov 2015 04:54:58 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 10, 2015 at 8:48 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  recipes-browser/chromium/cef3_280796.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-browser/chromium/cef3_280796.bb b/recipes-browser/chromium/cef3_280796.bb
> index d827b8e..6872e5b 100644
> --- a/recipes-browser/chromium/cef3_280796.bb
> +++ b/recipes-browser/chromium/cef3_280796.bb
> @@ -60,5 +60,5 @@ do_qa_configure() {
>  }
>
>  do_compile() {
> -    ninja -C out/${CHROMIUM_BUILD_TYPE} -j${BB_NUMBER_THREADS} cefsimple
> +    ninja -C out/${CHROMIUM_BUILD_TYPE} ${PARALLEL_MAKE} cefsimple
>  }

this is ok

> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

