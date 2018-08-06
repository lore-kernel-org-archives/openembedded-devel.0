Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5479F78AB6
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Aug 2018 17:31:35 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id m13-v6so14779539qth.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Aug 2018 10:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8Vl8Rzv7bWNwX2/YjbomVmoJ3aFQQ1IB9IqLSiA9HwE=;
	b=iTWpykzRizxnlJB/VI8nrB5icgQBzVp6o2AWNIr0aEono+DohHWw5UmJ2dtHL1w89W
	yHVYdLt51+cJK3M4v9jznpxnqLI9Froj72ypZEAaQpDtTrrOgiuln669Q7dmGDimtbTh
	53VoMzWsZaX5MfqoaXhInEAZwoIVq7CoDN4Q+XCWxiLziRjb+XwUJxXQn7OgRhLYK6U9
	sEP0cQBlyR8LoY4aaE6XG0KxIX5ZMXB7rbXdgHmtl9+A8Ldu4eHbo7SQgQWUIfquGX9x
	mycTR0vlI5Gs3lk57Et9Fm45Dxt16xUyHWcOkXU3sbSV5RmhLUWPMaRGvbKz9nCpip94
	vwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8Vl8Rzv7bWNwX2/YjbomVmoJ3aFQQ1IB9IqLSiA9HwE=;
	b=aSpCRiVnSq4NgMwDf/a0LDkMgS/cqOt6Tx8wdKIi/ITezQ3plyBedRmCJRh65gLuT3
	SIjL9BNQy6NK86VYOsCJmIGSBt5n/wlFWawg0Gmk5X+PcXjwyH62lSMu0AcWiOUcm1DA
	lT1l3e+mTCGocn8eU7Fzn3EQArd4MM0b7bzTTxd6BIGdvU/W8P1m6zEL+/x/gKp7EhAW
	HFqmKVFQqVspAbOD+1zISbdXZMKOiMpYkM5z+RmUWorDXSI7oY+4n/AOgwSy/s2fAlJz
	C8Z17R4x6e8xCw+Exdnyukwt/PX+wARNPSaEiEJztzuYlCNjocRbnWnmg687yZaM86MM
	tXZQ==
X-Gm-Message-State: AOUpUlEJKS0NsnadP7BZnnGJwWGVDika4Hjb9cuQPUXn+Gxzu4X5RY1Z
	u/HCQpy61Z5QWTvbBR4ch6eMEilXXTzkJCpOoLaCbw==
X-Google-Smtp-Source: AAOMgpeXc4gTS+C5RBw0+jEoS01UOK6JxTvv51NjMeScR/HsUSaePS1i9vToehyaFCn2O4satGIRjvBGxw/k9fqJb3g=
X-Received: by 2002:ac8:70c5:: with SMTP id
	g5-v6mr5644682qtp.376.1533576695986; 
	Mon, 06 Aug 2018 10:31:35 -0700 (PDT)
MIME-Version: 1.0
References: <20180806085408.44739-1-kai.kang@windriver.com>
	<20180806085408.44739-5-kai.kang@windriver.com>
In-Reply-To: <20180806085408.44739-5-kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 Aug 2018 10:31:09 -0700
Message-ID: <CAMKF1sr=0BRHHRTmWf0yXn46JvtJZZROhx2zARqCxX_onepBcg@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH 04/10] xfce4-embed-plugin: 1.0.0 -> 1.6.0
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
X-List-Received-Date: Mon, 06 Aug 2018 17:31:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 6, 2018 at 1:55 AM Kai Kang <kai.kang@windriver.com> wrote:
>
> Upgrade xfce4-embed-plugin from 1.0.0 to 1.6.0
> * update md5sum of license file that its text has been updated
>

Please summarise the change explicitly.

> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  .../{xfce4-embed-plugin_1.0.0.bb => xfce4-embed-plugin_1.6.0.bb}    | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-xfce/recipes-panel-plugins/embed/{xfce4-embed-plugin_1.0.0.bb => xfce4-embed-plugin_1.6.0.bb} (57%)
>
> diff --git a/meta-xfce/recipes-panel-plugins/embed/xfce4-embed-plugin_1.0.0.bb b/meta-xfce/recipes-panel-plugins/embed/xfce4-embed-plugin_1.6.0.bb
> similarity index 57%
> rename from meta-xfce/recipes-panel-plugins/embed/xfce4-embed-plugin_1.0.0.bb
> rename to meta-xfce/recipes-panel-plugins/embed/xfce4-embed-plugin_1.6.0.bb
> index cab3ea754..387b183f1 100644
> --- a/meta-xfce/recipes-panel-plugins/embed/xfce4-embed-plugin_1.0.0.bb
> +++ b/meta-xfce/recipes-panel-plugins/embed/xfce4-embed-plugin_1.6.0.bb
> @@ -2,11 +2,11 @@ DESCRIPTION = "A panel plugin that embeds arbitrary windows (or GtkPlug widgets)
>  HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-embed-plugin"
>  SECTION = "x11/application"
>  LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>
>  inherit xfce-panel-plugin
>
>  # DEPENDS += "xfconf xorgproto libxtst"
>
> -SRC_URI[md5sum] = "c5b86cbc1c54ee7c1d2e95a4502fed8e"
> -SRC_URI[sha256sum] = "35d4c6c56dd6468c0e5afe66f657c1526f2d830a577105a51da43657651832e3"
> +SRC_URI[md5sum] = "6870b116b85e4fa68d1b9ef76bd1d279"
> +SRC_URI[sha256sum] = "c767df6360e8194b32bc24823dd000975edba0cafe525c23d7854029359ee228"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

