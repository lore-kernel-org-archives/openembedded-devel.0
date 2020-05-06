Received: from mail-io1-f68.google.com (mail-io1-f68.google.com [209.85.166.68])
 by mx.groups.io with SMTP id smtpd.web10.2177.1588751499366755640
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 May 2020 00:51:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ebxqGAqp;
 spf=pass (domain: gmail.com, ip: 209.85.166.68, mailfrom: schnitzeltony@gmail.com)
Received: by mail-io1-f68.google.com with SMTP id c2so1156521iow.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 May 2020 00:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=T0Z2FWni3HmwmuLlKPRw8GKmPJmFDG0TePcZHYDO3MU=;
        b=ebxqGAqprVhUUAbMI3Ij4K9vwlzcQCmLchPg5z3ba1baiGR2VsBuUTBuSoOwT/cr4F
         odhyLrNqu1GaQhKr8Uy6qgoy7CJclWXL3A/SA4qMw5JASvo162PVl+FZBodeaNu+pNwU
         9G9+xQCXsm2Hg97YbDIXmTjVGpxe34NwMt21tFEAvPjh+FMeMgpAthBT44p585rHDlV0
         FUpvKKJtPFSASCrsiN6YB9zD3N+niFzmnMkO2Me49Dhnh8r83TNeWYJKXBKpapftr7kH
         MVhYjaf2UHPgZRDCPN2JM4oBCkYfaApcLTVYtg2fWFfAbEkMA0kd8oNnqxqdtIYm4O6u
         5w2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=T0Z2FWni3HmwmuLlKPRw8GKmPJmFDG0TePcZHYDO3MU=;
        b=lMzd2IWlXiK7U0aEOkh0/Zp/G1WHpNjfWVN3QhNia2YaA2sNZqFezdfMofDNwYQNKI
         oDfvOYHmF24nxpw8IbNg1RQSqvLIKJJDfMkDjZiITLNz2kESg5zkIJ8gX2jVrziCnNn2
         na2JreVy58h3s0TW+fce+hWWHaF1fkGY3muAfX4VS9l8mG/WYTzFxySoRSTF528Q/9Dr
         eSJ2nf0RUZPZ01vCBUZCu62oGeFIoLv6h15MLSri2+GVj0USf+laNHg8AuiWErag9eRs
         dyOeUfxTS4orMBTQvjjOap1WD/JBI5M6tIJqkSNeJJyFnhhQktW77Igpy+wUHa5mSiiE
         Uhpg==
X-Gm-Message-State: AGi0PuYkRNWCEYB5ewILEi84SdIYFLzdtZB2EAUHult05p3EHBJr/NOd
	O1eIz4ALwH4LMcDVxYAyoMBd8o680RaEzY3EZdzHUQ==
X-Google-Smtp-Source: APiQypLsIH8Vu8a43WYAl4krPQ5bd9AwU7sq+CBNlV1yJCk9ppvDGOypXD9FSKpNCK/OGEvSQMP5REawM5xjvS4f3WM=
X-Received: by 2002:a5d:9c02:: with SMTP id 2mr7304515ioe.67.1588751498459;
 Wed, 06 May 2020 00:51:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200506073334.12115-1-bunk@stusta.de>
In-Reply-To: <20200506073334.12115-1-bunk@stusta.de>
From: "Andreas M?ller" <schnitzeltony@gmail.com>
Date: Wed, 6 May 2020 09:51:27 +0200
Message-ID: <CALbNGRS4obaqVviaJO-4ZNVtNHo6Z9TK5AKnUihe_1B_=ExffA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] uftrace: Fix PR
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 6, 2020 at 9:33 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> The latest update moved uftrace from a stable release
> to a git snapshot.
>
> Adjust PR accordingly.
Out of curiosity: Why not PN?

Andreas
>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb b/meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb
> index c33fa048c..732fe3b45 100644
> --- a/meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb
> +++ b/meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb
> @@ -10,12 +10,13 @@ DEPENDS_append_libc-musl = " argp-standalone"
>
>  inherit autotools
>
> -# v0.9.4
>  SRCREV = "d648bbffedef529220896283fb59e35531c13804"
>  SRC_URI = "git://github.com/namhyung/${BPN} \
>             "
>  S = "${WORKDIR}/git"
>
> +PR .= "+git${SRCPV}"
> +
>  LDFLAGS_append_libc-musl = " -largp"
>
>  def set_target_arch(d):
> --
> 2.17.1
>
> 
