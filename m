Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id D01D275CF1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 04:56:02 +0000 (UTC)
Received: by igbxm8 with SMTP id xm8so15222734igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 20:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=1JFvXlvUp98B1p6YSXY0vElr6VegzkdkaPGKQ5fLrcg=;
	b=qXmTxrV3AWayKn1vAl7xdzkf7B1NZSg4JsE+XC2MQchvr2cGWiYmn/5ZuQF3m4/lbz
	Wj92qp/Czq99tMci4mriUjbOJuAmSm94BslSXqWUwcU4taRq5RQyu8YoDPWkcCQ4AnGh
	naLK6JavEQUfx0sI6Npzy7s+v5ial8vkSPVmGpQz7FIMJWx3v01AanJo/xU7nE1X01qy
	tV6Vx5h6YiuaROMinhKcvjD9RKGfkrO9o0H8A/n6IE8Z+v+2pl60VKuyPU096074y7tx
	TW6G6k/TONsKqFQg/hED4W04SE4a39h/eY3g31CaipvkG5QAzwF8x4SfJb21SdW/4kDb
	uzYw==
X-Received: by 10.50.155.106 with SMTP id vv10mr31614421igb.77.1447217763025; 
	Tue, 10 Nov 2015 20:56:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.12.205 with HTTP; Tue, 10 Nov 2015 20:55:33 -0800 (PST)
In-Reply-To: <1447217296-7145-2-git-send-email-armccurdy@gmail.com>
References: <1447217296-7145-1-git-send-email-armccurdy@gmail.com>
	<1447217296-7145-2-git-send-email-armccurdy@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Nov 2015 20:55:33 -0800
Message-ID: <CAMKF1srURrNYh+yGLV-EKMu9=48-=P093oHXUOQ0YCyZMEWP1g@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH 2/2] chromium: use PARALLEL_MAKE to control build parallelism
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
X-List-Received-Date: Wed, 11 Nov 2015 04:56:04 -0000
Content-Type: text/plain; charset=UTF-8

this is ok

On Tue, Nov 10, 2015 at 8:48 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  recipes-browser/chromium/chromium_40.0.2214.91.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-browser/chromium/chromium_40.0.2214.91.bb b/recipes-browser/chromium/chromium_40.0.2214.91.bb
> index a9635cd..f20610c 100644
> --- a/recipes-browser/chromium/chromium_40.0.2214.91.bb
> +++ b/recipes-browser/chromium/chromium_40.0.2214.91.bb
> @@ -196,7 +196,7 @@ do_configure_append() {
>
>  do_compile() {
>          # build with ninja
> -        ninja -C ${S}/out/${CHROMIUM_BUILD_TYPE} -j${BB_NUMBER_THREADS} chrome chrome_sandbox
> +        ninja -C ${S}/out/${CHROMIUM_BUILD_TYPE} ${PARALLEL_MAKE} chrome chrome_sandbox
>  }
>
>
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

