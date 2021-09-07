Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web12.30121.1630978602720074123
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Sep 2021 18:36:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Mze9F1kV;
 spf=pass (domain: gmail.com, ip: 209.85.219.180, mailfrom: whuang8933@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id c206so16641824ybb.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Sep 2021 18:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XbiU9r1r/PPOobQz3CJnsLfS62bzKXXBaS2oppVfIEc=;
        b=Mze9F1kVJ0Qi9Gi8g95sTz2pWF8d/1yB4mNxgIEzSTBdMNFsOZa9xKFfU+7UmgGTKa
         XNAEoi0C6xbW+ONKNsEMsP/m3hAp+PYQ8WZouyw3vRPUCuwySoEcmPCcJAHjakraib/G
         h22RMFbYHFwvOZGu+HTo0+b5WiPP5KNkTorlmsKZcpk+K+Lv7WC6Ojy4SSg47fP29SfR
         x3qtRNnI2hU6iMw8oHF1FhmN8BjYFBGdTHbeaOarAoxTCjsQqVKxuJ12nhuPyuI7GALG
         CDZITFawjRR21dUWw/zCIbCSTmbgXTrjJ92AhLt8s06HNUYi8hljLfSDid5aurDgqsOP
         UfRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XbiU9r1r/PPOobQz3CJnsLfS62bzKXXBaS2oppVfIEc=;
        b=SePwqFZNgnRie/ACh60OEHPXyRvPLHTYiRqZ12e/WTJzJO+EzfsG07YIsJIbOT//3C
         oNXnmoH0x/GkeZvr3LvXSuVoX9/hjAGyXXADV9sQPR5Iz8SUmt4k9x+zp2iaa+fpFgOQ
         ZjApXtzZOtZcrsW6jRsNgGMhoSsXMRnToL12FDj0ZGDLz/OZjUSxVBjs5OpsgwH/1K5n
         7UOZf95Pk7VtZyGpFFaE/X4Ip7PWhyi5rgTMEf4HooYQ+7mlaivlF3WsuDxKnu0ABNmO
         enYeo9Qx/zRcEBJIWrUTyBLBOmVLyP7m+XdJAN3gP6RL200csG4+XpHt4RnNdh3ZiwR2
         3dkw==
X-Gm-Message-State: AOAM532dPd0jkJD4iI1J5kDP5BGUeuzqc+R0NIthlNmADdfMtzEHCGLn
	Fz93bccN35GtwE/AkhtkbJLhIv/viDYyYtaYk5Y=
X-Google-Smtp-Source: ABdhPJyDVR09v/2qiW2uBDCsJGBZ1dRe8QfRLE+mwIgEV1yk5NOhtMe9DN4wOnoFCkyL4VpztUrToE0tvevvpZTxuL0=
X-Received: by 2002:a25:f50e:: with SMTP id a14mr18786698ybe.351.1630978601893;
 Mon, 06 Sep 2021 18:36:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210904174506.2263139-1-raj.khem@gmail.com> <20210904174506.2263139-3-raj.khem@gmail.com>
In-Reply-To: <20210904174506.2263139-3-raj.khem@gmail.com>
From: "William Huang" <whuang8933@gmail.com>
Date: Mon, 6 Sep 2021 21:36:31 -0400
Message-ID: <CADa-vC1YQFxhXsotB=AgucRP3_fSvWoargn-v3MnCJjdPs4cFQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 3/3] packagegroup-meta-python: Add python3-kivy
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"

Thanks for fixing up the recipe!

On Sat, Sep 4, 2021 at 1:45 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../recipes-core/packagegroups/packagegroup-meta-python.bb       | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> index b5a2f5d7d9..2d51b4e1a3 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -210,6 +210,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
>      python3-kconfiglib \
>      python3-keras-applications \
>      python3-keras-preprocessing \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "x11 opengl", "python3-kivy", "", d)} \
>      python3-kiwisolver \
>      python3-langtable \
>      python3-lazy-object-proxy \
> --
> 2.33.0
>
> 
>
