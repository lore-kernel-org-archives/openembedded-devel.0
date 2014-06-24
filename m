Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3FAC260D8B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jun 2014 20:02:34 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id bs8so1284004wib.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jun 2014 13:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=OxFBoBev2RdARid1ZsvX+0tf10cjeDp36Kmr4QtcyUY=;
	b=tS7vts3aCJtoTUXO1OTkVCIN1Qencl+wylRv6AykIFHa+zZbc2t8ZLuwRtKhJpnKzb
	ah0gDQosGB7zSu4QTBwSflz2wlnHJcsOnszCF4VI/5pw6nQpK/E8cgHXiv1exobU3uJZ
	rWLHKWOtmGVATihHlWrPgQGasv3420qHV8lMdrILRrGVXI8QTTumkNS9x/Fczamnn3EJ
	w+ZeXSqyyaVV3RVb2ntcnjERxrxDhU/S4MHU4CMcPoJQeihDk8eJ1r5WRifpM5nBPX6N
	j92KBdzjyVBVn4k4vpV0Uvmi2R5MbmhbittaTe8s5jae0sRmnyBtiS23/rhpwbIuR/MH
	AfdQ==
MIME-Version: 1.0
X-Received: by 10.180.81.1 with SMTP id v1mr5337237wix.10.1403640153715; Tue,
	24 Jun 2014 13:02:33 -0700 (PDT)
Received: by 10.194.34.65 with HTTP; Tue, 24 Jun 2014 13:02:33 -0700 (PDT)
In-Reply-To: <1403634363-18032-1-git-send-email-trevor.woerner@linaro.org>
References: <1403634363-18032-1-git-send-email-trevor.woerner@linaro.org>
Date: Tue, 24 Jun 2014 13:02:33 -0700
Message-ID: <CAOLEWZXqQ_tnZEiVi5JxLbWGktAXNnTWexw_+C0WY+GbyW6V0w@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: Trevor Woerner <trevor.woerner@linaro.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][MASTER][PATCH] lxdm: add libpam DEPENDS
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
X-List-Received-Date: Tue, 24 Jun 2014 20:02:38 -0000
Content-Type: text/plain; charset=UTF-8

Hey Trevor:

I was just working on this one the other day (I have a bbappend for my xorg
image) and added some pam deps, but not as "hard" deps (since pam is an
optional feature).  One issue I just hit in my master branch build was
missing pam plugins for lxdm login, even with the pam feature enabled.

see this lxdm commit
<https://github.com/sarnold/meta-alt-desktop-extras/commit/05bc68e37e45a0d980b96e5fd93adeb5a9b9f33e>

Maybe it's helpful, maybe not...

Steve aka mr_science


On Tue, Jun 24, 2014 at 11:26 AM, Trevor Woerner <trevor.woerner@linaro.org>
wrote:

> Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
> ---
>  meta-oe/recipes-graphics/lxdm/lxdm_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
> b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
> index dc40fb2..d0eb516 100644
> --- a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
> +++ b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
> @@ -16,7 +16,7 @@ SRCREV = "07fb151a99ef99318b71f3de0afbba977b1e6267"
>  PV = "0.5.0+git${SRCPV}"
>  PE = "1"
>
> -DEPENDS = "virtual/libintl intltool-native cairo dbus gdk-pixbuf glib-2.0
> gtk+ virtual/libx11 libxcb pango iso-codes"
> +DEPENDS = "virtual/libintl intltool-native cairo dbus gdk-pixbuf glib-2.0
> gtk+ virtual/libx11 libxcb pango iso-codes libpam"
>  DEPENDS += "${@base_contains("DISTRO_FEATURES", "systemd", "",
> "consolekit", d)}"
>
>  # combine oe-core way with angstrom DISTRO_TYPE
> --
> 2.0.0.5.gbce14aa
>
>

