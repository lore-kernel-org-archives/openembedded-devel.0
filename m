Return-Path: <hfranco@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 610A6CD484E
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 21:13:29 +0000 (UTC)
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61107.1778534007979930784
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 May 2026 14:13:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20251104.gappssmtp.com header.s=20251104 header.b=bHabdeH9;
 spf=pass (domain: baylibre.com, ip: 74.125.82.46, mailfrom: hfranco@baylibre.com)
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-130b2295ed0so12783682c88.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 11 May 2026 14:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778534007; x=1779138807; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WGFmRlZOH+If/6ZKY3ghMglCVy7vjsALmADb0ags5+4=;
        b=bHabdeH9JXkLwdc3Op7e8pd7pieJDJH5d1+1V1Iez3s6wgFJ6bXv3avAmIvFmFVQwv
         mWJo76SmWz0mQsA/n00J0sO87JTBR42OtB9ZdJzGYXGiHJ2ggJO9ohFP3S2mVU/oox+A
         2Y6S7TQZ5T4i3eqSCqdkAww60TkMzkOSkK2ovWjGIoEt4067p/r3ZEc3u6R2BgYcUqYP
         pVtEEO6LEsNfPJ0tXV1Y5ZNKsRHhLqOMqQvvfEnJ5yPVEVuFz7iGoDLoLXXKEcPiPyGU
         1EvcvGmwvCjYFSMNyhKiq3lVjpmuYNU4g9kFchkykd6fty8EJTYxzNBVrC+fsotFVgn+
         qI0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778534007; x=1779138807;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WGFmRlZOH+If/6ZKY3ghMglCVy7vjsALmADb0ags5+4=;
        b=eC7dkIMAMcJXWsNIMnyXyds+81h0w5YMOor5cEjHA11sSvmfbH1bNXnp03zX+VOnVE
         Xih2goaVJpjWQVyic8EfXrzrc4f5u/8HtGAL0WyylZfJ+3ZcFBaFGUFYHH2kRAkoOFTz
         y6ULYnfdKxBSfDT4nO7pj7cvxSNvv/n8Y4BQR/0CSZARMo7/s7K58UK5AI/xmUbhG9L7
         LvHcWeM1/1xod5UHUIocY4BjdBAk528L50IQ5KwO/UiQtZurfOxwIAMPDoGQFj4WMmpd
         4tfBY4EEP+7v4Q+Ty9KUMeeCd6+34ADuX/s6TL+weQ4Eek4amP1xj6gWg2j5f/zciWe1
         wqRA==
X-Gm-Message-State: AOJu0YxJu0XipFD0W/4CPyOkqkI8O1nLQpj1c2GfqYcpgyAVlMbEWZDM
	OuCyp8IP0Ec1cWGu1EShQ3Z3xxb9gsFkFKKgNAO6BUQxFDiasELNjlkrlvq29PUVYrAxX7np2zw
	H320Lh/A=
X-Gm-Gg: Acq92OHgdHbbu/5Y4GDGfOIVgsSF0hhWFXlzstxCDi6yA7SXH8DCBLj4fpCb3isEski
	Au0qQla5Ms07Zd283x74TPuGm8os7yKYxSot0pxK6Q3E7/UUUHqCwrPdT2BekJCp3iD8HmjgUBy
	YOKc9uEPwYlhUzRdzXAbfG0oWi5Ct2/P2J5xrBK57iTjVyXeQSpys/NtiF6a+fL5MaAwOq7BodQ
	4TziJEsiq+MsfPsd7uTJ/T+Mj4wI93iu2s6JROiZp1Xn7lWUEsKjwmEs+SqRmo+TnxYK7cZqfQc
	M8To0X1o7MAx36KyIPwxidHeVe9kuh7b4kAZ084rRKKuJUhGvJ0bu2eHAtwyMuMLThV2DmLdkst
	Zc7PBN39IJNV+7j3XgolOgzGDxCDqtVtQEW8MzLHUj+80kCr8CEWQfYNpqnZq4WF1Y/qgW58jiA
	tQOBvpzxyVD4FX102hQkUCbZOL+I+dNO1EihG8/7bppiwqraJv/BAn2H7I3w==
X-Received: by 2002:a05:7300:d50c:b0:2f1:496c:94bf with SMTP id 5a478bee46e88-2ffd71ff35fmr147428eec.16.1778534006217;
        Mon, 11 May 2026 14:13:26 -0700 (PDT)
Received: from hiagonb ([2804:14c:4c5:9534::8143])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e381c9sm14892990eec.26.2026.05.11.14.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 14:13:25 -0700 (PDT)
Date: Mon, 11 May 2026 18:13:22 -0300
From: Hiago De Franco <hfranco@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>, 
	Gyorgy Sarvari <skandigraun@gmail.com>, majortomtosourcecontrol@gmail.com, Khem Raj <raj.khem@gmail.com>
Subject: Re: [meta-oe][scarthgap][PATCH] uutils-coreutils: make selinux
 PACKAGECONFIG dependend on clang-layer
Message-ID: <noqnpec2aidzgou5enqzx4egjfhhqjeqytlhvwrwuyy3fkbkk4@nklckldetrul>
References: <20260417183946.574761-1-hfranco@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417183946.574761-1-hfranco@baylibre.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 May 2026 21:13:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126852

+CC Khem Raj <raj.khem@gmail.com>

On Fri, Apr 17, 2026 at 03:36:02PM -0300, Hiago De Franco wrote:
> SELinux layer build fails if 'meta-clang' is not present, which
> shouldn't happen, since 'meta-clang' isn't a dependency.
> 
> If 'selinux' is on DISTRO_FEATURES, PACKAGECONFIG calls 'clang-native'
> even if uutils-coreutils is not being used (this is enough to make the
> recipe fails on parsing time if meta-clang is not present).
> 
> Make 'selinux' PACKAGECONFIG dependend on clang-layer, and print a
> warning if the user wants selinux support on uutils-coreutils but
> haven't add clang-layer.
> 
> Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
> ---
> Hello,
> 
> This is the result of a dissussion from a patch I sent to the master branch [0].
> On master, this issue is actually already fixed, but not on Scarthgap.
> 
> This patch will behave like the same as before, however it now trigers a warning
> instead of forcing the user to have meta-clang layer added even if is not being
> used at all.
> 
> [0] https://lore.kernel.org/openembedded-devel/20260416191754.3910026-1-hfranco@baylibre.com/

Hi,

just a friendly ping about this patch.

Thanks,
Hiago.

> 
> Regards,
> Hiago.
> ---
>  .../uutils-coreutils/uutils-coreutils_0.0.28.bb        | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.28.bb b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.28.bb
> index 76cecac5a6..3d94d4c985 100644
> --- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.28.bb
> +++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.28.bb
> @@ -22,7 +22,15 @@ require ${BPN}-crates.inc
>  PROVIDES = "coreutils"
>  RPROVIDES:${PN} = "coreutils"
>  
> -PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}"
> +python __anonymous() {
> +    if bb.utils.contains('DISTRO_FEATURES', 'selinux', True, False, d):
> +        if bb.utils.contains('BBFILE_COLLECTIONS', 'clang-layer', True, False, d):
> +            d.appendVar('PACKAGECONFIG', ' selinux')
> +        else:
> +            bb.warn("selinux is enabled but clang-layer is not in BBFILE_COLLECTIONS, "
> +                    "selinux support will be disabled. Add meta-clang to your bblayers.conf "
> +                    "if selinux support on uutils-coreutils is required.")
> +}
>  
>  PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
>  
> -- 
> 2.47.3
> 
> 

