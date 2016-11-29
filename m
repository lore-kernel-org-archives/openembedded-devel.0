Return-Path: <dev@codyps.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1EA3B719E7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 16:49:16 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id y205so18313359qkb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 08:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codyps.com; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gsfKwqmlppOgIZlfdYOGtj5bbrDEYlojsMm40h2Ty/0=;
	b=C09dbq6exMNDDlTSoXI535U0bITISWk8If2Cnxk9nsjbYy/d8UXBCErhH07xEjwQtR
	0peuih9ntxQhMnyn9U80P6RP79wCcofpzoo0ngEGMk4ZAawGKeDY3EskbBdZrSRrwFpi
	YZstX1nL9NnVxgtaxU7SGsK3OMmoqwAoTJiZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gsfKwqmlppOgIZlfdYOGtj5bbrDEYlojsMm40h2Ty/0=;
	b=VLpTC79ubFQjel+HpqcjellsDPGV4vwM0fg+WgRRVu4SjP+xl0p1K6c7Ixa+w5g2Jk
	AZprY79wVelUVP9oD8xhQnjnmUWelUQyjfBsBQN6bRxaFG6y2+LgMF6iGz8YmhcJPNKv
	QyS1zJrn06XR3l4/Ij4q+jq+EGz/SeEkYZtqLOpxjsXSx2bCsSwdyqY4FKkp8AD2Q3Dm
	ND5ufh5OuPE8rAsNiPJatyRyuUNTianm7hQppKeBNW/n3UDxIdLXC7lotagPPXoILPgH
	eFM5AxR1v06p71cMdEeLU/34WQMcwFn7iFVExgx+ok1XgXoE7YMRaeqi73FRb+eJ1t/S
	FflQ==
X-Gm-Message-State: AKaTC01SxK+ZIxDN9RateG8YGyQI1qNUvSTKvET8i8dCE5e+JXzi1Q3jBWI/S1RhCVCa9zhWRPltMRGh9E4mBQ==
X-Received: by 10.55.180.135 with SMTP id d129mr22946489qkf.96.1480438157318; 
	Tue, 29 Nov 2016 08:49:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.136.184 with HTTP; Tue, 29 Nov 2016 08:49:16 -0800 (PST)
X-Originating-IP: [72.74.84.52]
In-Reply-To: <20161118152513.31194-1-dev@codyps.com>
References: <20161118152513.31194-1-dev@codyps.com>
From: Cody P Schafer <dev@codyps.com>
Date: Tue, 29 Nov 2016 11:49:16 -0500
Message-ID: <CAPoQQ-2NmvjeVd+SFuA7Ydm1fLMhdErLofB2VJKwhwOivfHH1w@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Mario Domenech Goulart <mario@ossystems.com.br>
Subject: Re: [meta-java][PATCH] openjdk-7: ignore the readdir_r deprecation already ignored in openjdk-8
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
X-List-Received-Date: Tue, 29 Nov 2016 16:49:17 -0000
Content-Type: text/plain; charset=UTF-8

ping?

On Fri, Nov 18, 2016 at 10:25 AM, Cody P Schafer <dev@codyps.com> wrote:
> Without this, icedtea7-native (used to bootstrap openjdk) fails to build on my
> host system due to deprecation warnings being treated as errors.
>
> I haven't observed the same issue with openjdk-7 itself, but it seems likely to
> affect it as well, so I've added the -Wno-error flag there too.
>
> Signed-off-by: Cody P Schafer <dev@codyps.com>
> ---
>  recipes-core/icedtea/openjdk-7-release-03b147.inc | 4 ++++
>  recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb     | 4 ++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/recipes-core/icedtea/openjdk-7-release-03b147.inc b/recipes-core/icedtea/openjdk-7-release-03b147.inc
> index 0685729..fe18ee5 100644
> --- a/recipes-core/icedtea/openjdk-7-release-03b147.inc
> +++ b/recipes-core/icedtea/openjdk-7-release-03b147.inc
> @@ -113,3 +113,7 @@ export DISTRIBUTION_PATCHES = " \
>         patches/icedtea-jdk-unzip.patch \
>         ${CLEAN_X11_DISTRIBUTION_PATCH} \
>          "
> +
> +# readdir_r was deprecated in glibc-2.24. Ignore the error for now
> +# NOTE: When updating the recipe, please check if this is still needed
> +CFLAGS_append = " -Wno-error=deprecated-declarations"
> diff --git a/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb b/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
> index 711f572..eba353e 100644
> --- a/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
> +++ b/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
> @@ -64,3 +64,7 @@ DISTRIBUTION_PATCHES = "\
>  "
>
>  export DISTRIBUTION_PATCHES
> +
> +# readdir_r was deprecated in glibc-2.24. Ignore the error for now
> +# NOTE: When updating the recipe, please check if this is still needed
> +CFLAGS_append = " -Wno-error=deprecated-declarations"
> --
> 2.10.2
>

