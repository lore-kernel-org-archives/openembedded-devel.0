Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 62FF46093A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Oct 2016 17:33:09 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id z126so994434vkd.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Oct 2016 10:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=jQR5/kyCr3VGAlHY2HguUqOpSOsQbMeHLNQ04X44H9w=;
	b=c1eof3GcH3u/HtQ2MYyR4XOeqX/ebawsDYl02mFPnZE3N9N+XMJj4bxiyDXGa07pQ0
	KjpxM/ra2Pxybrkvc7PFOmq8S7lCsH8hKnUXBnwvoJ6iujVSooFh2XnWdloHwzxpz4ko
	7Ofqfiv9x4abyLRbhZsk/uwzEEyDHx1/IyOR/ndadrIvgtxUvbH0Ep3B4UtC/QZhEdqX
	6VsTp4CPxj+hsvGGz/TdZYZ5z/p2k0dRTRjn5h56Jho6j0HiX9Ma5N3yRhGWabo407k7
	ifKKSX/SXjLW+masAsY0ria00hR9swVu0+Id/aJnVZ/fK6viD9cu0+hUoV2o5+LCS9Px
	dP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=jQR5/kyCr3VGAlHY2HguUqOpSOsQbMeHLNQ04X44H9w=;
	b=JL2C+kH9DMy8l1/HmoqZfFFUkj1HMHq65Y1HyNc0MWlaJQ76gois7OlnLPzuZ2njBW
	HmTBrBnIRIh1AZN+cBBf+J29E8xK7u9mpj9poBwFC817pKyyIbIAmnmONiI/pFfNkYH9
	8b81FYPdtpoUTr2KwrzodJOLQqfunADoBpr40pguYcQEg+KmPy1DP4uaRsh/bUCJf1+Q
	k4dVqUx7LrOVnwOm15gN2vt5jlPRvyx314Z1jLyheE/CvMkHVpO7Ahr/F4vSJCcp6wm5
	RkUvGF3qAbWlwDeM270JTmZimzYqMBHUzRNQmzfOgBcxRQkZ/rB3dZ4tXfxE5CaSbQx8
	kwNA==
X-Gm-Message-State: AA6/9RnXjsiL4RuN/l5R2798I1lsgBjV4+LyADX5vi5iLFkSVpwQ22uW1T3dnsphCXYJko/SZ9Wg89AlQ9xtmw==
X-Received: by 10.31.0.67 with SMTP id 64mr350883vka.173.1475775191079; Thu,
	06 Oct 2016 10:33:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.86.206 with HTTP; Thu, 6 Oct 2016 10:32:40 -0700 (PDT)
In-Reply-To: <20161006164543.10141-2-igor.socec@pelagicore.com>
References: <20161006164543.10141-2-igor.socec@pelagicore.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Oct 2016 10:32:40 -0700
Message-ID: <CAMKF1soNE54yHLS5tm25yZa68d=vitr7ETHjEWbqK10_-etxFw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] jansson: update to 2.9
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
X-List-Received-Date: Thu, 06 Oct 2016 17:33:11 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 6, 2016 at 9:45 AM, Igor Socec <igor.socec@pelagicore.com> wrote:
> Signed-off-by: Igor Socec <igor.socec@pelagicore.com>
> ---
>  meta-oe/recipes-extended/jansson/{jansson_2.4.bb => jansson_2.9.bb} | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-extended/jansson/{jansson_2.4.bb => jansson_2.9.bb} (53%)
>
> diff --git a/meta-oe/recipes-extended/jansson/jansson_2.4.bb b/meta-oe/recipes-extended/jansson/jansson_2.9.bb
> similarity index 53%
> rename from meta-oe/recipes-extended/jansson/jansson_2.4.bb
> rename to meta-oe/recipes-extended/jansson/jansson_2.9.bb
> index c235729..455b374 100644
> --- a/meta-oe/recipes-extended/jansson/jansson_2.4.bb
> +++ b/meta-oe/recipes-extended/jansson/jansson_2.9.bb
> @@ -1,12 +1,12 @@
>  SUMMARY = "Jansson is a C library for encoding, decoding and manipulating JSON data"
>  HOMEPAGE = "http://www.digip.org/jansson/"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=6946b728e700de875e60ebb453cc3a20"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=8b70213ec164c7bd876ec2120ba52f61"
>

please mention what changed and put it in commit msg

>  SRC_URI = "http://www.digip.org/jansson/releases/${BPN}-${PV}.tar.gz"
>
> -SRC_URI[md5sum] = "c4629b89bf0432f3158c461e88fe0113"
> -SRC_URI[sha256sum] = "1fcbd1ac3d8b610644acf86a5731d760bb228c9acbace20a2ad0f23baec79b41"
> +SRC_URI[md5sum] = "84abaefee9502b2f2ff394d758f160c7"
> +SRC_URI[sha256sum] = "0ad0d074ca049a36637e7abef755d40849ad73e926b93914ce294927b97bd2a5"
>
>  inherit autotools pkgconfig
>
> --
> 2.9.3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

