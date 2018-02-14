Return-Path: <krussell7711@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 553D760068
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Feb 2018 16:28:27 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id v71so23052961wmv.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Feb 2018 08:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=e3otO5aTzIZCHDeWJ2DXgnt2BFEXdTv8S9ipU2ML9VM=;
	b=LD8HEmWvtIwHydoc+CA38wxC5+7YTujvzY9Urmxy3wvqlWiUsP8ymamVDssq5bo1zu
	rxdmAM4pL/CVn1/M8S1lAUiJsuvEfhLN9MqGUmB0ucugvV5BpSHzRj+mk7bAjcb8wyA8
	X6uWttMvKZ/YKR7BFlNMZPoFaoX2sLZ69diOQVuLyfO80/3EazJHQ/oNk2JI7RfdU2Ee
	TX8TaYvCFhl61Khk3ZQYmkAragK3nj3A3QMb/oHt9TDPBKPx0FogRpqluV2ZYJQrexlo
	VFb1v4rXAXzLFW9opTlVOAea+LvoRxhJddWgYPDnwssAyPCEXXxEQ9oQRVjxwHKzuBNX
	LZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=e3otO5aTzIZCHDeWJ2DXgnt2BFEXdTv8S9ipU2ML9VM=;
	b=YhRu9K9CvGzy0OJl8zudQl4MmUWPLuj4lA8rg3FO2O9DO/n6OLk+VDa04mx+j2PSNE
	Vxz+ZDov/z53tEypbvEquiSWT2fJ1QYovx5+4pbbrZkYge6RyQNcnfvJTmLm1wrKhCQG
	T3BRvAn7XzOU1kN41yGktrRTSCYZ/hVh+BF/v5I/9qJKRIJEnNze5IxlkCD8km9KHKFR
	M1Dos9CXLNBtdTEDLZ3X7ecujxawzbBcbnCmf9905UcFzIrdGJ6yn7LbxzxwTa/4Dsgt
	v5llB5ZzUdjE/0NNRJcQF0UmuDT0S1tmqbdRsRxKW31HgyZCypa9BOYaFxWQSwEmifG7
	akgA==
X-Gm-Message-State: APf1xPCBW479q3AmOzS5lrWILi6VDxIKWreuCHmHLAZWFmpqyyd7DG6k
	2cNOcyUX6+yCDr3jTbCwf2wlyPihGrNG2bLsj/g=
X-Google-Smtp-Source: AH8x224Smk3GLbz2kl6y2/Pvav6DqOGdNJ5qCW78fP9AtkbWdoWkeQhm0bAVBUNlluBkxx1LSNF+xZxAihQ7zS6ubhw=
X-Received: by 10.80.166.212 with SMTP id f20mr7520663edc.266.1518625707858;
	Wed, 14 Feb 2018 08:28:27 -0800 (PST)
MIME-Version: 1.0
Sender: krussell7711@gmail.com
Received: by 10.80.173.171 with HTTP; Wed, 14 Feb 2018 08:28:07 -0800 (PST)
In-Reply-To: <20180212162041.25713-1-JPEWhacker@gmail.com>
References: <20180211215129.9564-1-JPEWhacker@gmail.com>
	<20180212162041.25713-1-JPEWhacker@gmail.com>
From: Kyle Russell <bkylerussell@gmail.com>
Date: Wed, 14 Feb 2018 11:28:07 -0500
X-Google-Sender-Auth: xd1-5wdhRHAR-9cB0di9u2Ss6Xs
Message-ID: <CAFrQVPMCc2acmGGfFeOx2hqoOQTzCyiNsLKXy9819jcDdSbjJg@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org,
	Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [meta-networking][PATCH v2] waf-samba.bbclass: No longer inherit waf.bbclass
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
X-List-Received-Date: Wed, 14 Feb 2018 16:28:27 -0000
Content-Type: text/plain; charset="UTF-8"

This works for me.

On Mon, Feb 12, 2018 at 11:20 AM, Joshua Watt <jpewhacker@gmail.com> wrote:

> waf-samba.bbclass uses waf in a very different way than the "standard"
> method that waf.bbclass targets and ends getting very little useful
> functionality from that class.
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta-networking/classes/waf-samba.bbclass | 28
> ++++++++++++++++++++++++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
>
> diff --git a/meta-networking/classes/waf-samba.bbclass
> b/meta-networking/classes/waf-samba.bbclass
> index e490176241..0ce51610f3 100644
> --- a/meta-networking/classes/waf-samba.bbclass
> +++ b/meta-networking/classes/waf-samba.bbclass
> @@ -1,7 +1,7 @@
>  # waf is a build system which is used by samba related project.
>  # Obtain details from https://wiki.samba.org/index.php/Waf
> -#
> -inherit qemu pythonnative waf
> +#
> +inherit qemu pythonnative
>
>  DEPENDS += "qemu-native libxslt-native docbook-xsl-stylesheets-native
> python"
>
> @@ -21,6 +21,29 @@ CONFIGUREOPTS = " --prefix=${prefix} \
>                    ${PACKAGECONFIG_CONFARGS} \
>                  "
>
> +# avoids build breaks when using no-static-libs.inc
> +DISABLE_STATIC = ""
> +
> +def get_waf_parallel_make(d):
> +    pm = d.getVar('PARALLEL_MAKE')
> +    if pm:
> +        # look for '-j' and throw other options (e.g. '-l') away
> +        # because they might have different meaning in bjam
> +        pm = pm.split()
> +        while pm:
> +            opt = pm.pop(0)
> +            if opt == '-j':
> +                v = pm.pop(0)
> +            elif opt.startswith('-j'):
> +                v = opt[2:].strip()
> +            else:
> +                continue
> +
> +            v = min(64, int(v))
> +            return '-j' + str(v)
> +
> +    return ""
> +
>  # Three methods for waf cross compile:
>  # 1. answers:
>  #    Only --cross-answers - try the cross-answers file, and if
> @@ -86,6 +109,7 @@ do_configure() {
>      fi
>  }
>
> +do_compile[progress] = "outof:^\[\s*(\d+)/\s*(\d+)\]\s+"
>  do_compile () {
>      python ./buildtools/bin/waf ${@get_waf_parallel_make(d)}
>  }
> --
> 2.14.3
>
>

