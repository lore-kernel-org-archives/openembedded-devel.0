Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f44.google.com (mail-yh0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2450F721E2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Feb 2015 15:13:10 +0000 (UTC)
Received: by yhai57 with SMTP id i57so10744532yha.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Feb 2015 07:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=/CkpCuHUjzloCZIexsmyTChh7dJRMkDGaKv0nWPFLrw=;
	b=fGFQAWgKspLXoGgrZsBhaXbn8y74awYzeFnBROP7RcrpiuFogtDSs3AaM/lK3sxOir
	uXeD6+lA4zOPSKPLzGCUQKsO/yUFAoDEZCmRIgqVNGjsev42358v9NkrC8X9bRq/QFnA
	56Lswd+kO/M2u8gAAh8eMFJhrKwnMOtbwHbrzgTCknuPx9TL5D3LPX6H1tabEWZvLPKA
	kSN1EVAyVJE/S8c9C4s+jWX1rNXKtAGWur+js+2kGK7RHWq5rjSnBLhSx8eBsyMOvpw7
	HL3jLZtLqCf4nwQ2N4VU8DGWiDbSgXLqSG8Awj3g1ES6dsV28XKAInbWiBDICRVBdokx
	GGBQ==
MIME-Version: 1.0
X-Received: by 10.170.195.144 with SMTP id m138mr18977496yke.50.1425136391083; 
	Sat, 28 Feb 2015 07:13:11 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.133 with HTTP; Sat, 28 Feb 2015 07:13:11 -0800 (PST)
In-Reply-To: <1425135382-2851-1-git-send-email-raphael.philipe@ossystems.com.br>
References: <1425135382-2851-1-git-send-email-raphael.philipe@ossystems.com.br>
Date: Sat, 28 Feb 2015 12:13:11 -0300
X-Google-Sender-Auth: 20OpDcA6kURCKopqmPR03bOvr3U
Message-ID: <CAP9ODKq_4-g-7STsg_pdFMsfJstwdm=hZVfxWL1ZzVXzu3JhVw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Raphael Silva <raphael.philipe@ossystems.com.br>
Subject: Re: [meta-oe][PATCH] fio: fix do_compile error
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
X-List-Received-Date: Sat, 28 Feb 2015 15:13:13 -0000
Content-Type: text/plain; charset=UTF-8

Martin,

On Sat, Feb 28, 2015 at 11:56 AM, Raphael Silva <rapphil@gmail.com> wrote:
>   * Update to v2.2.5
>   * Add patch for missing pre-defined __ARM_ARCH_5E__ compiler macro
>
> Signed-off-by: Raphael Silva <raphael.philipe@ossystems.com.br>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

> ---
>  ...sing-pre-defined-ARM-arch-compiler-macro.patch} | 34 ++++++++++------------
>  .../fio/{fio_2.0.5.bb => fio_2.2.5.bb}             | 10 +++----
>  2 files changed, 21 insertions(+), 23 deletions(-)
>  rename meta-oe/recipes-benchmark/fio/fio/{0001-ARM-Use-generic-assembly-nop-and-barrier-code-for-ar.patch => 0001-Add-missing-pre-defined-ARM-arch-compiler-macro.patch} (33%)
>  rename meta-oe/recipes-benchmark/fio/{fio_2.0.5.bb => fio_2.2.5.bb} (75%)
>
> diff --git a/meta-oe/recipes-benchmark/fio/fio/0001-ARM-Use-generic-assembly-nop-and-barrier-code-for-ar.patch b/meta-oe/recipes-benchmark/fio/fio/0001-Add-missing-pre-defined-ARM-arch-compiler-macro.patch
> similarity index 33%
> rename from meta-oe/recipes-benchmark/fio/fio/0001-ARM-Use-generic-assembly-nop-and-barrier-code-for-ar.patch
> rename to meta-oe/recipes-benchmark/fio/fio/0001-Add-missing-pre-defined-ARM-arch-compiler-macro.patch
> index db97244..fffc9b8 100644
> --- a/meta-oe/recipes-benchmark/fio/fio/0001-ARM-Use-generic-assembly-nop-and-barrier-code-for-ar.patch
> +++ b/meta-oe/recipes-benchmark/fio/fio/0001-Add-missing-pre-defined-ARM-arch-compiler-macro.patch
> @@ -1,30 +1,28 @@
> -From 152b969cd4ff5b4b7e1c65eca1f9ab243b8a30c8 Mon Sep 17 00:00:00 2001
> -From: Otavio Salvador <otavio@ossystems.com.br>
> -Date: Sun, 14 Apr 2013 13:53:35 -0300
> -Subject: [PATCH] ARM: Use generic assembly nop and barrier code for armv6
> +From e5d058e203766690b301a8bdae74e908c04c659e Mon Sep 17 00:00:00 2001
> +From: Raphael Silva <raphael.philipe@ossystems.com.br>
> +Date: Wed, 25 Feb 2015 09:56:43 -0300
> +Subject: [PATCH] Add missing pre-defined ARM arch compiler macro
>
> -Upstream-Status: Submitted
> -
> -Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> +Signed-off-by: Raphael Silva <raphael.philipe@ossystems.com.br>
> +Upstream status: accepted

While I were reviewing the patch before Raphael sent it, I missed
this. The right would be:

Upstream-Status: Backport [2.2.6].

I noticed that the 2.2.6 was released yesterday and already includes
this fix. Raphael, can you do the update to this version?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

