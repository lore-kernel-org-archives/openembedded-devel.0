Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web12.3161.1602695060214977348
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2020 10:04:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=K1Xmt7FW;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id e6so2681951qtw.10
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2020 10:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wIUwgiszk6VlNOmm1BYz1XWz7widF0mAZh0tdtGSIQg=;
        b=K1Xmt7FW5BKeDy9mNarimla15khKLsZZqtTJXyVH2c5qEifk8vNgMhzeU1j5IQnstn
         E3jlLwuVTlNpP479AymKFuDTtbu7p7nh9+T/eXPfRd0RDNNTuIxQsG3Fgpi3IM7vO5WP
         Z/47I1zm864vmRSONo9ZqVT6am8Dvl8FFs30gtPdDUS4Xbq+0Wk9gh7Zn0yhnA5HUWfU
         o+ErnN8cuyyOmDVI/zEqzDMoSIKyzr/UV2w/I6Y5Rx8mCBVIDFnru+7/VfF7viXoezYh
         1VzjimFyna/Z1A2fI8dgaRfNr4bnH385jgY0mC7G7Id/TpIhoDXgpkZfB3wDB8Tc4D9W
         1zYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wIUwgiszk6VlNOmm1BYz1XWz7widF0mAZh0tdtGSIQg=;
        b=cxclL4GIs8i5e+NAIGFWHkgkD1gI7b87NmY9BCmswbivaTrdxHGrr+MP9zQXVvqZ6F
         rxkbRe6QS76EIrdu6h/zvwXRrHKSIR8FNTpDDSRPAqD4fKm6mHKOV9tR5vm6534q6X4R
         y0Zd1wCYqIDGghMztATU6HaLLU5ZvLeQEuI1Vd/l/b5dmqCF1p4Fu9YP0oKn+lIj40ja
         RweCRe7QYrgBvjo31WHqE56R1KW0TzApQGCCkl8toNjTPDMgqBM0SWsSonKshptsAj/M
         rsc3wbPPMejpUqGo0P4ZfW4Sn3BTDjv4Zb8js8xSXW3okIYUM5KTvXl+S072nZBCxtRq
         Sw3w==
X-Gm-Message-State: AOAM533+232VbWinraNj28n8owzkpJ6QCyIRsBi2Kd02qQC16Bxvc7Hy
	SJJgvsCUq1L7CkIELMgyE9Ts1ePMPgvnr9/VHuY=
X-Google-Smtp-Source: ABdhPJxv8RQLSn461sdI1O/k3F/xOrsXzxqn9I71b5p6rVJvUZwpVU2ooR9IU2//cupnhjQBcHk99k8bLCB3c/4ZMJ0=
X-Received: by 2002:ac8:5a82:: with SMTP id c2mr113781qtc.378.1602695058999;
 Wed, 14 Oct 2020 10:04:18 -0700 (PDT)
MIME-Version: 1.0
References: <1602668024-124989-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <1602668024-124989-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 14 Oct 2020 10:03:53 -0700
Message-ID: <CAMKF1sqoED2tzAAF-ODD_Uy5yqjVfPfihU5i-TsupY9S5P5Weg@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] libeigen: upgrade 3.3.7 -> 3.3.8
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

this fails to build

https://errors.yoctoproject.org/Errors/Details/509319/

On Wed, Oct 14, 2020 at 2:33 AM zangrc <zangrc.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../libeigen/{libeigen_3.3.7.bb => libeigen_3.3.8.bb}           | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-support/libeigen/{libeigen_3.3.7.bb => libeigen_3.3.8.bb} (93%)
>
> diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb b/meta-oe/recipes-support/libeigen/libeigen_3.3.8.bb
> similarity index 93%
> rename from meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
> rename to meta-oe/recipes-support/libeigen/libeigen_3.3.8.bb
> index 6ce318d0b5..edbb9fee6f 100644
> --- a/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
> +++ b/meta-oe/recipes-support/libeigen/libeigen_3.3.8.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.MPL2;md5=815ca599c9df247a0c7f619bab123dad"
>
>  SRC_URI = "git://gitlab.com/libeigen/eigen.git;protocol=http;nobranch=1"
>
> -SRCREV = "21ae2afd4edaa1b69782c67a54182d34efe43f9c"
> +SRCREV = "dc252fbf00079ccab57948a164b1421703fe4361"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.25.1
>
>
>
>
> 
>
