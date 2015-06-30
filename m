Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id 87F1960017
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jun 2015 19:46:25 +0000 (UTC)
Received: by oift81 with SMTP id t81so15754499oif.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jun 2015 12:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=4RBj37wzzXj6zi8nuJ7KrQYXXkp/qXxqJQ8de07EFaA=;
	b=N+ZmyWJzaPIgBkLCIvxZEiRva758NEc1Lmf/am7RgEaIFr9+muYauL4je5o9F9IEbp
	skTfPaiCjwkPNCE2PYK4yCetRlCcDlCUBljXdtsjgNQ53mfmeht3tky7LnFoChJW6hJY
	yi8LuFfPEgddngDC0lVZJ2rEqu30/uDg9dYGJAVtXc2diAxt3YgtQocSXRKbx5KPRZvE
	XzACyEt5oDM6Nh9VTkYJMm9yXkjqEqSXKSf3yFnvO0s257URf36lDYl7Hi1rzsOpzBJc
	IFgYO/p/AKX3OSNPeEBA/Z58M17fT9+ZcCfFNPBl0OsYqJpiOan/4hUq/upKYaZBvvA2
	kEmg==
MIME-Version: 1.0
X-Received: by 10.202.202.200 with SMTP id a191mr20597801oig.118.1435693586534;
	Tue, 30 Jun 2015 12:46:26 -0700 (PDT)
Received: by 10.202.64.130 with HTTP; Tue, 30 Jun 2015 12:46:26 -0700 (PDT)
In-Reply-To: <1435692596-11250-1-git-send-email-gary@mlbassoc.com>
References: <1435692596-11250-1-git-send-email-gary@mlbassoc.com>
Date: Tue, 30 Jun 2015 12:46:26 -0700
Message-ID: <CAJ86T=W5ZxgDn-M8tC6OncwpDqia+VuYiCpvXS-A94FGDnWj-w@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: Re: [meta-browser][PATCH] chromium: List all PACKAGECONFIG settings to avoid warning
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
X-List-Received-Date: Tue, 30 Jun 2015 19:46:29 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 30, 2015 at 12:29 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> OE-core now warns if PACKAGECONFIG is used to set an option that
> does not have a corresponding PACKAGECONFIG[option]="xxx" line.
> This recipe makes use of many such options & this patch suppresses
> those warnings by listing the options.
>
> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
> ---
>  recipes-browser/chromium/chromium.inc | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/recipes-browser/chromium/chromium.inc b/recipes-browser/chromium/chromium.inc
> index 8e83f6a..611929e 100644
> --- a/recipes-browser/chromium/chromium.inc
> +++ b/recipes-browser/chromium/chromium.inc
> @@ -17,6 +17,14 @@ PACKAGECONFIG ??= "use-egl"
>  # automatically and silently fall back to GLX
>  PACKAGECONFIG[use-egl] = ",,virtual/egl virtual/libgles2"
>
> +# Additional PACKAGECONFIG options - listed here to avoid warnings
> +PACKAGECONFIG[use-gl] = ""
> +PACKAGECONFIG[component-build] = ""
> +PACKAGECONFIG[ignore-lost-context] = ""
> +PACKAGECONFIG[component-build] = ""
> +PACKAGECONFIG[impl-side-painting] = ""
> +PACKAGECONFIG[disable-api-keys-info-bar] = ""
> +

The "component-build" PACKAGECONFIG is duplicated.

Maybe the list should be sorted too, unless there's a special
significance to the current order.


>  GYP_DEFINES += "${ARMFPABI} release_extra_cflags='-Wno-error=unused-local-typedefs' sysroot=''"
>
>  do_configure() {
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

