Received: from mail-il1-f196.google.com (mail-il1-f196.google.com [209.85.166.196])
 by mx.groups.io with SMTP id smtpd.web11.189741.1598250178496590860
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Aug 2020 23:22:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=J0B543e9;
 spf=pass (domain: gmail.com, ip: 209.85.166.196, mailfrom: jonatan.p@gmail.com)
Received: by mail-il1-f196.google.com with SMTP id t13so6263378ile.9
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2020 23:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4XHw9E13HaYvGBe3F1GOvTHXLuqxyYlx4Oj5T5kIdpM=;
        b=J0B543e9sxlzqcxFno+pUf/xSTmpS2qB8u3tI+qGJ3ghvsjSbz0jeRtqYTN6s/Mv0d
         jy6DBeIzy/+2+SAxjWfyANsKv67J7gyMWEDysmSYyQe3x6r96NdJamcvFV9bDjGMhjR+
         08Er/Ok3+Eo53EGgTUKLJSeagMuGiaYj8eL7ENaCDOXFoD1cbCRovA6rdCMJYeDGvUMM
         ait9uAsdFEx0/vYfHyzLLaQQOTdYxhQkA31V2Sd7L5gvYKy1nlf0236bfEyqvpRYn4yA
         wUWDJqXVCvW+XV5tAk2wd5U5DZi3AK0Nc4noQ63BTGe5g7GcRDi6v0Q4J1+oWPBW2ebV
         mmxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4XHw9E13HaYvGBe3F1GOvTHXLuqxyYlx4Oj5T5kIdpM=;
        b=tJTDWSyl0MKLQnEtv28gjE6vVcispNW+0M+mVETivYKJ61T81QkYeCro8a6uH4N2Z+
         avB0J0zdbn5+IBinjh5bNFELkhrmfxHP56MAyz0GOKZ4A3mrmBiLD/GvNLtc7Ap7XvTL
         +tPxYoV0K13lyMMCaZANFLVT7ZvqmACLXhG4Ec9oRytkEN/b1Iwh8+T/sLJbgjI1fZzI
         zZ1VmU/pAoM7pGf23vuVvrEPhiYbs/b/bFikznz3hFoBF7gb7EUpUEt1hp5yBFWdc2pl
         R/waXX1cJCh9D+npq+DVhkw63bMCKAxW1PTmmgs/QXPU+MuU0eT/+koS3kwPVQvgbv11
         /l+Q==
X-Gm-Message-State: AOAM53042CvfChNFyNZQa1MugsjgSpr2KvUiQQavGFxzSV97DzeoQalO
	rmQ/R+Yn/wQuYb1OSXihphx+CV6+ClwU5fxcnEs=
X-Google-Smtp-Source: ABdhPJxsGO/jJ24hu4hs34STzV6jPS18TrwhtGEQGDyQQKrMufJmTZuDHxx4PEf3fdhAkexvaF50llE+RHn1FnUV8eA=
X-Received: by 2002:a92:c0c6:: with SMTP id t6mr3677152ilf.199.1598250177757;
 Sun, 23 Aug 2020 23:22:57 -0700 (PDT)
MIME-Version: 1.0
References: <16285DBF18FAF8F7.27500@lists.openembedded.org>
 <CAKm+giMq=wbHhLn4WDM0xfnv4J2GJEQYfUzKts3vJukgBm2cYw@mail.gmail.com>
 <20200820101218.GC51054@pcleri> <CAKm+giO7SSxDfhXR2-=VGe+O_gyH3Zwoar+FwdyZ_iMC4cZ7aQ@mail.gmail.com>
 <089cbef0-2017-d58f-94e4-55d2aae9a98c@gmail.com>
In-Reply-To: <089cbef0-2017-d58f-94e4-55d2aae9a98c@gmail.com>
From: =?UTF-8?B?Sm9uYXRhbiBQw6Vsc3Nvbg==?= <jonatan.p@gmail.com>
Date: Mon, 24 Aug 2020 08:22:46 +0200
Message-ID: <CAKm+giMcH+m_Xdxih0P6jYd_vb6LHNwxciJLEpvUmPboR2xUmw@mail.gmail.com>
Subject: Re: [oe] [PATCH] openjdk-8: Convert do_unpack postfunc to _append
To: "robert.berger.oe.devel" <robert.berger.oe.devel@gmail.com>
Cc: Richard Leitner <richard.leitner@skidata.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi Robert,

On Sun, Aug 23, 2020 at 9:48 PM robert.berger.oe.devel
<robert.berger.oe.devel@gmail.com> wrote:
>
> Hi Jonatan,
>
> I am the author of this patch[1] which I guess fixes your issue as well.
> I didn't check yet if it's happy with the new functionality of the
> archiver class in dunfell.
>
> [1]
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-java/commit/?h=master-next&id=b8e62679d99f57a5af4f2c59ac36bea5c7087d4f
>
> You use do_unpack_append() while I use do_patch_prepend(). Otherwise
> it's pretty much the same.
>
> Do you see any reason why do_unpack_append() might be preferable over
> do_patch_prepend()?

No, not really. I picked do_unpack_append since the original
functionality was a postfunc on do_unpack (which I suppose is quite
close to doing an _append). Latching on to do_patch as in your patch
should work as well I believe.

I've backported your patch to the system I am using, and it seems to
work well there aswell, so I am happy to continue with that track! :-)

Best regards,
Jonatan

>
> Regards,
>
> Robert
>
>
>
