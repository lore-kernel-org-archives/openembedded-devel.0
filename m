Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3D96A79B05
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 18:39:45 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id j46-v6so31267567qtc.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 11:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=D0I8A06bsxHrT2t5XV/n9+A/gWS61kbHsSLiJgwyW7g=;
	b=XWL6PoEAjVnEEdOjhXleuOH1uzmLwTFXRodWCt0Xh/hdEqtg6buOVlJphxY3B0W5BS
	w1E1Y5rUkM+VKqYbwzfl2n+JS/W6uXFuyHe3av8nCTJ7P1N7oS5hlsauqqrKm+cZPQSN
	naNhxp11X1prhdQYTOs2LkfRgC85OTRokqrYHsQGMDWgxbw0qxA8OSiVoybolAq7jYuj
	M6xMRs579B28u7edNU8hZWzIPrIOzjCjByHM5WwG6iKAvRNr0X2IAhvJ6M79k/hJePDU
	8wcMvEqRH2SYKo18y2QvvpumkORWQsMIolSjsqpB7gXO/rkZ69w0g7hN+Tdzxc6ex+JX
	y2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=D0I8A06bsxHrT2t5XV/n9+A/gWS61kbHsSLiJgwyW7g=;
	b=cWkV3nI/LRvkWoM3ISoxZvsRuiHCAfcR9DgImKcGBLeb4Dq1R6jp72ZbLNjexI3EXP
	5pl5gV5Rl/wvXr53JJwEYmIbVXKd8Ai7A4pwSP6JN5CV0UFBiMsvCqemHyLpuEwIprWH
	hitnbIupWLET6uz9a/F7BYytAYULJDCYKAa/TvLGxoPUWiNztau9bhKzyk2KL2BRbxfu
	GmbvNEsngXA4PzwVsirryE0bpIIMw2QsLKY01jBF6tsLegtQG2cm3ZJ4UxuPM0wyyOmD
	pPQEX8Te5ZK6z/Nn2HEytQ+kUPt3qBQFYvRkhS17P9WDXFr1iYZXNIbR+TyUj3Twwzs2
	MeRg==
X-Gm-Message-State: ABuFfoilfBH2rCEWQQNXEfz69OP8ifXRfKiN7YK74csPwKCw/N+4yjSf
	g6GJAl8AlUkPcNcYol9401SNjMLi+hMnjP+3xvE=
X-Google-Smtp-Source: ACcGV61Ab9KR5HA3ouMdwP9hih+RFaXnXLzL7YVhldPrEeTuhNgssUrwD4pOxPM4ztGgAaTCfYlm9JYtRsUu/+QMwgg=
X-Received: by 2002:a0c:98a6:: with SMTP id f35mr11663061qvd.224.1539801585960;
	Wed, 17 Oct 2018 11:39:45 -0700 (PDT)
MIME-Version: 1.0
References: <20181017154048.17231-1-yann@blade-group.com>
In-Reply-To: <20181017154048.17231-1-yann@blade-group.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Oct 2018 11:39:19 -0700
Message-ID: <CAMKF1soXq9u9GQMw4iemYLW5V9NpMLRQq1LABOGazJ3uTHBODA@mail.gmail.com>
To: yann.dirson@blade-group.com
Cc: yann@blade-group.com,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v2] packagegroup-tools-bluetooth: work as advertized on distro without bluez* support
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
X-List-Received-Date: Wed, 17 Oct 2018 18:39:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 17, 2018 at 8:41 AM <yann.dirson@blade-group.com> wrote:
>
> From: Yann Dirson <yann@blade-group.com>
>
> Otherwise the build fails with:
>
>   NOTE: Runtime target '${RDEPENDS_}' is unbuildable, removing...
>   Missing or unbuildable dependency chain was: ['${RDEPENDS_}']
>
> This restores some truth in the "Otherwise install nothing" comment in the recipe.
>
> Signed-off-by: Yann Dirson <yann@blade-group.com>
> ---
>  .../packagegroups/packagegroup-tools-bluetooth.bb               | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb b/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
> index 0ede5e57b..e81516fef 100644
> --- a/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
> +++ b/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
> @@ -32,6 +32,8 @@ RDEPENDS_bluez5 = " \
>          '', d)} \
>  "
>
> +RDEPENDS_ = ""
> +

this does not look right to me.

>  # Install bluez4 tools or bluez5 tools depending on what is specified in the distro.
>  # Otherwise install nothing.
>  RDEPENDS_${PN} = "${RDEPENDS_${BLUEZ}}"
> --
> 2.19.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

