Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id AF06460620
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Aug 2017 03:48:18 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id m85so20854785wma.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Aug 2017 20:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=YZylzxS/sRWYJJXWt84Q8Ge7EhbGYaEjA5zPqD2sSPI=;
	b=Bbq0PQZ8/plktLynF7GRRn+S8Hts8fTfSumBZxI3gvdc6DrKrKP/R/ZbtKjpfErz2u
	zGPTN+kZSJ/80yHBugV32s4Hm624sPPOZdzptSPegTjEAWssY8errOL2ZlAchd9+8C6a
	9UdFceA0i0RwG23TmKe9D03r5xXKWWcD/2C/tPIFj7n/DvxxN3lwKo3SiLjRAVGincn6
	XyTjLDfGQvC847qEJ4+GDDSNKYoIJSKm/dD1J+zvQFGkCQsYbaaNsJ423JS/xfLZTnZw
	To8mbJOIDsKp2stDB5KJ3T9JcZzbf6jQ0UuEYp/VfqiC4OMibCopZRWAiGnbKTGVeWmB
	qLfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=YZylzxS/sRWYJJXWt84Q8Ge7EhbGYaEjA5zPqD2sSPI=;
	b=egaiOOSlndD1/JIl2Lw4V3w5518KkttQhGTyuIOzavqIrnwBfuAG/dF1wjYkCdPK1g
	800JjOU4ew3wVOOqp77srM8mhJjjc0d/BZt2ZyPqHDgcdiNpZ5Z0wH1uUUmXOlbG+9ah
	drCJlJlh11WRRlZvPWUkRSJu1ziwiufoSsgguKqvDpJ6HhNNhFAxyL8NAdD9UG8yIyXo
	06vKlkeglqPuixRFEpCFIQJ8L8sghUK8WUHhutLO6COtg5ovK6xqHz2ZFa2vqkXI6CJL
	jtt/f4emIkdOU5lcBrOF6virH13iS8NYa2iu5//vLzUsTglKHg6sMtA+7Zso4PXX5HuP
	NOXQ==
X-Gm-Message-State: AHYfb5jzwv3YIWKq1+XHUXx7Tjp02Ipa9vwpppmx25iMcBgMD/PsZkfS
	j/kQeQbncZLR8KD+HEnj2gPSfHJvpQ==
X-Received: by 10.80.145.38 with SMTP id e35mr3001479eda.8.1502164099690; Mon,
	07 Aug 2017 20:48:19 -0700 (PDT)
MIME-Version: 1.0
References: <1502153954-2796-1-git-send-email-mickey.happygolucky@gmail.com>
	<1502153954-2796-2-git-send-email-mickey.happygolucky@gmail.com>
In-Reply-To: <1502153954-2796-2-git-send-email-mickey.happygolucky@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 08 Aug 2017 03:48:08 +0000
Message-ID: <CAMKF1spheqXiBVN4b1oSLjr_EDkL0dcCSkZss-8K27XeF5Y_Cg@mail.gmail.com>
To: Yusuke Mitsuki <mickey.happygolucky@gmail.com>, 
	openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH 1/6] anthy: Added libanthy-dev to PROVIDES_class-terget uim: Added libanthy-dev to DEPENDS_class-target
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
X-List-Received-Date: Tue, 08 Aug 2017 03:48:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 7, 2017 at 6:00 PM Yusuke Mitsuki <mickey.happygolucky@gmail.com>
wrote:

> anthy.h could not found at confiugre of uim.
> Dependency broke since it began to use recipes-sysroot.
>
> Signed-off-by: Yusuke Mitsuki <mickey.happygolucky@gmail.com>
> ---
>  meta-oe/recipes-support/anthy/anthy_9100h.bb | 1 +
>  meta-oe/recipes-support/uim/uim_1.8.6.bb     | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/anthy/anthy_9100h.bb
> b/meta-oe/recipes-support/anthy/anthy_9100h.bb
> index a65d324..c507ad7 100644
> --- a/meta-oe/recipes-support/anthy/anthy_9100h.bb
> +++ b/meta-oe/recipes-support/anthy/anthy_9100h.bb
> @@ -18,6 +18,7 @@ SRC_URI[sha256sum] =
> "d256f075f018b4a3cb0d165ed6151fda4ba7db1621727e0eb54569b6e2
>
>  DEPENDS_class-target = "anthy-native"
>  RDEPENDS_${PN}_class-target = "libanthy0"
> +PROVIDES_class-target = "libanthy-dev"


This seems redundant


>
>  inherit autotools pkgconfig
>
> diff --git a/meta-oe/recipes-support/uim/uim_1.8.6.bb
> b/meta-oe/recipes-support/uim/uim_1.8.6.bb
> index ed846b9..4cb7b62 100644
> --- a/meta-oe/recipes-support/uim/uim_1.8.6.bb
> +++ b/meta-oe/recipes-support/uim/uim_1.8.6.bb
> @@ -14,7 +14,7 @@ SRC_URI[md5sum] = "ecea4c597bab1fd4ba98ea84edcece59"
>  SRC_URI[sha256sum] =
> "7b1ea803c73f3478917166f04f67cce6e45ad7ea5ab6df99b948c17eb1cb235f"
>
>  DEPENDS = "anthy fontconfig libxft libxt glib-2.0 ncurses intltool"
> -DEPENDS_class-target += "intltool-native gtk+ gtk+3 uim-native
> takao-fonts"
> +DEPENDS_class-target += "intltool-native gtk+ gtk+3 uim-native
> takao-fonts libanthy-dev"
>

It should say anthy not libanthy-dev

>
>  RDEPENDS_uim = "libuim0 libedit"
>  RDEPENDS_uim-anthy = "takao-fonts anthy libanthy0"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

