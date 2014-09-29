Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vc0-f172.google.com (mail-vc0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 153C86FC4A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Sep 2014 06:42:09 +0000 (UTC)
Received: by mail-vc0-f172.google.com with SMTP id lf12so1127089vcb.17
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Sep 2014 23:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=4sHLXVXmG37hiQ9AyHkGfOxHSm5RqchnLxIb49lK8JE=;
	b=if6rh5t8CK3FoaooszpaAhPYptlv20Lw6AM0OztslHo9kWSNis2iBaI0yRDc/KYglQ
	tpxuUKm9Wzu/dq/TLFYEm0Tw80KKQZmh+VFkBLmC8PNZachEmcG+ItMeOCXtO1RCTa6j
	J7rcc5xhDyVzUXq68VBXnbG1TV9VtJYb/aTR5HKmIn3ZfAIiXnwQSCEtCfpAcwPtsmG2
	tXgMFeJLIRBl7uyLhg/+/Nw68LCEOW6lC2C82UpIOwLFSHR1w1E9DqLX9S6ILNqKXoEG
	44pqCBXEH3gE7K1k6euU81nVsKFJBS6cB7qcNIRc4gkbdiBBmLUPjUnmtP9uEsoWFI0/
	F0Vg==
MIME-Version: 1.0
X-Received: by 10.220.92.198 with SMTP id s6mr4235182vcm.38.1411972930204;
	Sun, 28 Sep 2014 23:42:10 -0700 (PDT)
Received: by 10.52.171.233 with HTTP; Sun, 28 Sep 2014 23:42:10 -0700 (PDT)
In-Reply-To: <1411845327-16713-2-git-send-email-raj.khem@gmail.com>
References: <1411845327-16713-1-git-send-email-raj.khem@gmail.com>
	<1411845327-16713-2-git-send-email-raj.khem@gmail.com>
Date: Mon, 29 Sep 2014 08:42:10 +0200
Message-ID: <CALbNGRQfoQ7UZv0Scxrboqd9Tzkstvj52xbm-=k3_T5sbKTnxg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-gumstix] omap3-sgx-modules_4.05.00.03: Add missing colon after FILESEXTRAPATHS_prepend
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
X-List-Received-Date: Mon, 29 Sep 2014 06:42:16 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Sep 27, 2014 at 9:15 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bbappend | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bbappend b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bbappend
> index 77abc85..8fde96a 100644
> --- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bbappend
> +++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bbappend
> @@ -1,4 +1,4 @@
> -FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}"
> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>
>  PRINC := "${@int(PRINC) + 5}"
>
> --
> 2.1.1
Thanks for the patches but I have the changes already applied here.
They will be pushed today - did not expect anybody but me working with
meta-gumstix-community :)

Andreas

