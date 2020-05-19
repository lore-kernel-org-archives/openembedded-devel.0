Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web12.1206.1589925951540765117
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2020 15:05:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AQFE9zX7;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id g185so1541870qke.7
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2020 15:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QJrt8oSLiXHl4rdDas2hygz68tBkeiXhdCF5a4Ermls=;
        b=AQFE9zX7rUXZz333tiQLKNHRVmhsQM+SzFAnD4iYe5WFRILybkLZ9L0UdTybNLblUY
         3ewa3w/5cCTLgio5unCzlEtDZg9v9pKBSTQiDRE+klEKeQq1/KGR4rvR560B5yGqzc3z
         XQPmNXOnnrd/lfIgfkkGXUCjS/8q7c63D/L+9oud8rpFrQiqrLU8/QYFFUtfbIjmXRtd
         EzyB5X5EsSmS9vee8vtN43rOXSmICYBTFpcXKsuhF4WTaVcxgyweWLYBhYa1HdM/628y
         JwIzr/UL9ZxwEgx1/T4elJKRo87SxNYUx5EADTRdFN4d/Ik7okhR85b+SvimvcRxOv62
         XUVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QJrt8oSLiXHl4rdDas2hygz68tBkeiXhdCF5a4Ermls=;
        b=FO9Lnd5LJY82L0eDNLXHoL6rX0Su+rvViCNe9hR0tC3Ax9KQaYxdypo1HyFIx3eJKh
         KVxNc04QEAL5B2vozt7XBdCA7Qr9CxuoUoJuBQnMDKABWFsxAiLRzqVfmBA8cyCChWnK
         lGJOYbD/MA5qDtTCJTL6hlZ/Q+gV6BSYhVFGLV0ZDYliRlqmrq0CrsVe0LMzhtToUMTQ
         6h4VlwrJiPndjIqNfWD8MBFT2da9lYzzyn+SrDN712f/cTluMscnTqSZYpWZ3HISyS8U
         AScVew7qNYyREEFJ577/tCAY60SxPLkISq7WaeCGnPHno82API2FaCK4oM8tyA64ByPH
         eWKA==
X-Gm-Message-State: AOAM5336SyNzS8mZf/wM/Ub3cnBAa33ZUStPw2WTnZ3Mv6RyallTjWto
	0t41N5nHatMXyCTZEY0CII0hzNZSDj7JQ9HHIozp2lDK
X-Google-Smtp-Source: ABdhPJz6ObfDigu3xP40SGqyE9EEWLFnMYjtUvhusmrbUx8tR7p83ThECOLIApaUEHBHTz4xidGIwgpEf/gzZs0MZK8=
X-Received: by 2002:a37:a5d0:: with SMTP id o199mr1621938qke.225.1589925950504;
 Tue, 19 May 2020 15:05:50 -0700 (PDT)
MIME-Version: 1.0
References: <16107FFC59C1A7DD.18971@lists.openembedded.org> <20200519220009.GA31915@localhost>
In-Reply-To: <20200519220009.GA31915@localhost>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 19 May 2020 15:05:24 -0700
Message-ID: <CAMKF1sqRNyoJzpPFicbTjjW8Vo4qsj16i2NaiF1LN51LeM54QQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] unicode-ucd: Stop broken license downloading
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, May 19, 2020 at 3:00 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> Hi Khem,
>
> it seems some kind of dos2unix was run when you applied my patch,
> which changed the license hash.

Thanks for noting, it is patchwork and git am, so I wonder what it
could be, I will take a look

>
> cu
> Adrian
